local StoryStartNode = Class("StoryCreator.StoryLogic.StorylineNodes.Node")
StoryStartNode.IsStartNode = true

function StoryStartNode:Start(Context)
  self:Finish("StoryStart")
end

return StoryStartNode
