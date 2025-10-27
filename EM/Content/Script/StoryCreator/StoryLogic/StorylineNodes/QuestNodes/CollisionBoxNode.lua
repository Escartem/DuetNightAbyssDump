local EActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local QuestNodeUtils = require("StoryCreator.StoryLogic.QuestNodeUtils")
local CollisionBoxNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function CollisionBoxNode:Init()
  self.StaticCreatorId = 0
end

function CollisionBoxNode:Execute(Callback)
  self.Callback = Callback
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not IsValid(GameMode) then
    self.Callback()
    return
  end
  
  local function FinishWithBeginOverlap()
    DebugPrint("CollisionBoxNode BeginOverlap")
    self.Callback("BeginOverlap")
  end
  
  local function FinishWithEndOverlap()
    DebugPrint("CollisionBoxNode EndOverlap")
    self.Callback("EndOverlap")
  end
  
  local function LoadFinishCallback(_, Info)
    local TriggerBase = Info.TriggerBase
    local ActorEid = Info.ActorEid
    local TriggerType = Info.TriggerType
    if "BeginOverlap" == TriggerType then
      FinishWithBeginOverlap()
    elseif "EndOverlap" == TriggerType then
      FinishWithEndOverlap()
    end
  end
  
  local StaticCreator = GameMode.EMGameState.StaticCreatorMap:Find(self.StaticCreatorId)
  if not IsValid(StaticCreator) then
    self.Callback()
  elseif 0 == StaticCreator.ChildEids:Length() then
    GWorld.StoryMgr:BindStaticCreatorActorEvent(self.StaticCreatorId, EActorEventType.OnTriggerAOIBase, self, LoadFinishCallback)
    QuestNodeUtils.STLTriggerActiveStaticCreator(self, {
      self.StaticCreatorId
    })
  elseif StaticCreator.ChildEids:Length() > 0 then
    GWorld.StoryMgr:BindStaticCreatorActorEvent(self.StaticCreatorId, EActorEventType.OnTriggerAOIBase, self, LoadFinishCallback)
  end
end

function CollisionBoxNode:Clear()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not IsValid(GameMode) then
    return
  end
  local StaticCreatorArray = TArray(0)
  StaticCreatorArray:Add(self.StaticCreatorId)
  GWorld.StoryMgr:UnbindStaticCreatorActorEvent(self.StaticCreatorId)
  self.Callback = nil
end

return CollisionBoxNode
