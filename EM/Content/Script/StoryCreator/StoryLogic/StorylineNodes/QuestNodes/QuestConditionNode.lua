local M = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestSuccessNode")
M.bIsConditionNode = true

function M:GetPortName()
  return self.PortName
end

return M
