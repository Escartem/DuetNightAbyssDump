require("UnLua")
local EMCache = require("EMCache.EMCache")
local HeadMissionWidgetMgr = Class("BluePrints.Common.TimerMgr")

function HeadMissionWidgetMgr.New(HeadWidgetComponent, OwnerNpc)
  local Obj = setmetatable({}, {__index = HeadMissionWidgetMgr})
  Obj.HeadWidgetComponent = HeadWidgetComponent
  Obj.Owner = OwnerNpc
  Obj:InitMissionData()
  return Obj
end

function HeadMissionWidgetMgr:InitMissionData()
  self:RefreshMissionWidget()
end

function HeadMissionWidgetMgr:OnQuestTrackingChanged()
  self:RefreshMissionWidget()
end

function HeadMissionWidgetMgr:RefreshMissionWidget()
  local Avatar = GWorld:GetAvatar()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not (Avatar and Player) or not self.Owner then
    return
  end
  local Id = self:TryGetTrackedId()
  if Id == self.Owner.UnitId then
    self.HeadWidgetComponent:EnableWidget("Mission")
  else
    self.HeadWidgetComponent:DisableWidget("Mission")
  end
end

function HeadMissionWidgetMgr:TryGetTrackedId()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChainId = Avatar.TrackingQuestChainId
  local GameState = UE4.UGameplayStatics.GetGameState(self.HeadWidgetComponent)
  local GuideInfoCache = EMCache:Get("GuideInfoCache", true) or {}
  local Info = GuideInfoCache[QuestChainId]
  local TargetStaticCreator
  if not Info then
    return
  end
  local TargetPointName = Info.PointName
  local CreatorMap = GameState.StaticCreatorMap:ToTable()
  for _, v in pairs(CreatorMap) do
    if v:GetDisplayName() == TargetPointName then
      TargetStaticCreator = v
      break
    end
  end
  if TargetStaticCreator then
    return TargetStaticCreator.UnitId
  end
end

return HeadMissionWidgetMgr
