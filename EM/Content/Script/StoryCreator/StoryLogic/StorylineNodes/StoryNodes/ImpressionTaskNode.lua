local Questline = require("StoryCreator.StoryLogic.StorylineNodes.Questline.Questline")
local FImpressionTaskNode = Class("StoryCreator.StoryLogic.StorylineNodes.Storyline.StoryNode")

function FImpressionTaskNode:Start(Context, NodeId)
  self.Questline = Questline(self.Data, Context, self)
  self.Questline:StartQuest(NodeId)
end

function FImpressionTaskNode:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  if self.Type == NodeType then
    table.insert(OutRunningNodeTable, self)
  end
  if self.Questline then
    self.Questline:GetRunningNodeTableByType(NodeType, OutRunningNodeTable)
  end
end

return FImpressionTaskNode
