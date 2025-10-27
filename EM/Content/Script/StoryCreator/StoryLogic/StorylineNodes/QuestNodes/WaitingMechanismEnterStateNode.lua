local WaitingMechanismEnterStateNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function WaitingMechanismEnterStateNode:Init()
  self.CreateType = "StaticCreator"
  self.CreateId = 0
  self.StateId = 0
  self.IsGuideEnable = false
  self.GuidePointName = 0
end

function WaitingMechanismEnterStateNode:Execute(Callback)
  DebugPrint("------------LXZ WaitingMechanismEnterStateNode ------------------", self.CreateId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local CurrentStateId
  if self.CreateType == "StaticCreator" then
    CurrentStateId = GameState.MechanismStateIdMap:Find(self.CreateId)
    DebugPrint("------------LXZ WaitingMechanismEnterStateNode ------------------", CurrentStateId)
  else
    CurrentStateId = GameState.ManualMechanismStateIdMap:Find(self.CreateId)
  end
  print(_G.LogTag, "LXZ WaitingMechanismEnterStateNode", self.CreateId, CurrentStateId, self.StateId)
  if CurrentStateId == self.StateId then
    Callback()
    return
  end
  
  local function FinishAction(_, CreateId, StateId)
    DebugPrint("------------LXZ WaitingMechanismEnterStateNode ------------------", CreateId, self.CreateId, StateId, self.StateId)
    if CreateId ~= self.CreateId or StateId ~= self.StateId then
      return
    end
    EventManager:RemoveEvent(EventID.OnMechanismEnterState, self)
    if self.IsGuideEnable then
      MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
    end
    Callback()
  end
  
  EventManager:AddEvent(EventID.OnMechanismEnterState, self, FinishAction)
  if self.IsGuideEnable then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
end

function WaitingMechanismEnterStateNode:Clear()
  if self.IsGuideEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  EventManager:RemoveEvent(EventID.OnMechanismEnterState, self)
end

return WaitingMechanismEnterStateNode
