local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local ElevatorNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function ElevatorNode:Init()
  self.bGuideUIEnable = true
  self.GuideType = "P"
  self.GuideStaticCreatorId = 0
  self.GuideDisplayName = ""
  self.ElevatorId = -1
  self.ElevatorState = "StartUp"
end

function ElevatorNode:Execute(Callback)
  self:RegisterEvent(Callback)
end

function ElevatorNode:RegisterEvent(Callback)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if -1 == self.ElevatorId then
    return
  end
  
  function ElevatorNodeCallback()
    local SelectElevator = GameState.ManualActiveCombat:Find(self.ElevatorId)
    SelectElevator:RemoveStoryNodeCallback(self.ElevatorState)
    self:FinishAction(Callback)
  end
  
  if self.bGuideUIEnable then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
  local SelectElevator = GameState.ManualActiveCombat:Find(self.ElevatorId)
  SelectElevator:AddStoryNodeCallback(self.ElevatorState, ElevatorNodeCallback)
end

function ElevatorNode:FinishAction(Callback)
  if self.bGuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  Callback()
end

function ElevatorNode:Clear()
  if self.bGuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local SelectElevator = GameState.ManualActiveCombat:Find(self.ElevatorId)
  SelectElevator:RemoveStoryNodeCallback(self.ElevatorState)
end

return ElevatorNode
