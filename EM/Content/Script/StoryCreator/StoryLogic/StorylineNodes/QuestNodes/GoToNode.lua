local QuestNodeUtils = require("StoryCreator.StoryLogic.QuestNodeUtils")
local EActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local GoToNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function GoToNode:Init()
  self.GuideUIEnable = false
  self.StaticCreatorId = nil
  self.GuideType = nil
  self.GuidePointName = nil
end

function GoToNode:Execute(Callback)
  self:CheckResurgencePoint()
  local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if IsValid(PlayerCharacter) == false then
    local Message = string.format("Go to node execute failed, PlayerCharacter is nil, StoryNodeKey:%s", self.Key)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "GoToNode\230\137\167\232\161\140\229\164\177\232\180\165", Message)
  end
  local PlayerCharacterEid = PlayerCharacter:GetEid()
  
  local function StaticCreatorActorEvent(_, Info)
    if Info.ActorEid == PlayerCharacterEid and Info.TriggerType == "BeginOverlap" then
      Callback()
    end
  end
  
  print(_G.LogTag, "LXZ AOITriggerBox, GoToNode:Execute", self.StaticCreatorId)
  GWorld.StoryMgr:BindStaticCreatorActorEvent(self.StaticCreatorId, EActorEventType.OnTriggerAOIBase, self, StaticCreatorActorEvent)
  QuestNodeUtils.STLTriggerActiveStaticCreator(self, {
    self.StaticCreatorId
  })
  if self.GuideUIEnable then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
end

function GoToNode:Clear()
  GWorld.StoryMgr:UnbindStaticCreatorActorEvent(self.StaticCreatorId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if IsValid(GameMode) then
    GameMode:TriggerInactiveStaticCreator({
      self.StaticCreatorId
    }, false, EDestroyReason.StoryLine)
  end
  if self.GuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
end

function GoToNode:CheckResurgencePoint()
  local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
  if self.Context.QuestData.bUseQuestCoordinate and self.Context.QuestData.ResurgencePoint == "" then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local QuestChain = Avatar.QuestChains[self.Context.QuestChainId]
    local QuestCoordinate = QuestChain.QuestCoordinate
    if not QuestCoordinate then
      return
    end
    if not self.GuidePointName then
      return
    end
    local PointInfo = GuidePointLocData[self.GuidePointName]
    if not PointInfo then
      return
    end
    if not PointInfo.SubRegionId or PointInfo.SubRegionId <= 0 then
      return
    end
    if PointInfo.SubRegionId ~= QuestCoordinate.SubRegionId then
      local Message = "GoToNode\230\137\128\229\156\168\228\187\187\229\138\161\233\147\190\231\154\132StoryNode\233\156\128\232\166\129\233\133\141\231\189\174ResurgencePoint" .. [[

FileName:]] .. self.Context.FileName .. [[

QuestChainId:]] .. self.Context.QuestChainId .. [[

QuestId:]] .. self.Context.QuestId .. [[

StoryNodeKey:]] .. self.Context.Data.key
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "GoToNode\230\137\128\229\156\168\228\187\187\229\138\161\233\147\190\231\154\132StoryNode\233\156\128\232\166\129\233\133\141\231\189\174ResurgencePoint", Message)
      return
    end
  end
end

return GoToNode
