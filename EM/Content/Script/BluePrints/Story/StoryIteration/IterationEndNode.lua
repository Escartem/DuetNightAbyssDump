local EDialogueNodeType = require("BluePrints.Story.Talk.View.TalkUtils").EDialogueNodeType
local FIterationEndNode = Class({
  "BluePrints.Story.StoryIteration.StoryIterationNode"
})
FIterationEndNode.NodeType = EDialogueNodeType.End

function FIterationEndNode:Init(IterGraph)
  self.IterGraph = IterGraph
  self.TalkTask = IterGraph.TalkTask
end

function FIterationEndNode:Execute(bSkip)
  if bSkip then
    return
  end
  self.TalkTask:EndDialogue()
end

return FIterationEndNode
