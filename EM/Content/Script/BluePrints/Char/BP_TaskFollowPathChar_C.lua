require("UnLua")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local FollowingChar = Class()

function FollowingChar:Initialize(Initializer)
end

function FollowingChar:ReceiveBeginPlay()
  self:SetTargetPosition()
  self:OnCreate()
  TaskUtils.IsCanMakeTaskPathActor = false
end

function FollowingChar:SetTargetPosition()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIManager then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(Avatar.TrackingQuestChainId, "Task")
    if not IsEmptyTable(UIObjs) then
      for _, v in pairs(UIObjs) do
        self.TaskTargetPosition = v.TargetPointPos
        return
      end
    end
  else
    local GameInstance = GWorld.GameInstance
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    self:K2_SetActorLocation(PlayerCharacter:K2_GetActorLocation(), false, nil, false)
  end
end

function FollowingChar:ReceiveEndPlay()
  TaskUtils.IsCanMakeTaskPathActor = true
end

return FollowingChar
