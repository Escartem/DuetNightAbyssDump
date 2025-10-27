local StoryEndNode = Class("StoryCreator.StoryLogic.StorylineNodes.Node")
StoryEndNode.IsEndNode = true

function StoryEndNode:Start(Context)
  self:Finish()
end

return StoryEndNode
