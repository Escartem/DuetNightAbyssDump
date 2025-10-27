local AuConditionNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function AuConditionNode:Init()
  self.ActionType = 0
  self.Condition = ""
  self.SaveToServer = false
end

function AuConditionNode:Start(Context)
  DebugPrint("-----------------------------------AuConditionNode-----------------------------------")
  DebugPrint("ActionType is", self.ActionType, "Condiion is", self.Condition, "SaveToServer is", self.SaveToServer)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  if 0 == self.ActionType then
    AudioManager(GameInstance):SetCondition(self.Condition, self.SaveToServer)
  elseif 1 == self.ActionType then
    AudioManager(GameInstance):RemoveCondition(self.Condition)
  end
  self:FinishAction()
end

function AuConditionNode:FinishAction()
  self:Finish()
end

return AuConditionNode
