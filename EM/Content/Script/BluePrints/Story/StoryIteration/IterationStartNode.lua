local EDialogueNodeType = require("BluePrints.Story.Talk.View.TalkUtils").EDialogueNodeType
local EDialogueIterType = require("BluePrints.Story.Talk.View.TalkUtils").EDialogueIterType
local FIterationStartNode = Class({
  "BluePrints.Story.StoryIteration.StoryIterationNode"
})
FIterationStartNode.NodeType = EDialogueNodeType.Start

function FIterationStartNode:Init(Dialogues, InitialDialogueId, IterGraph)
  self.IterGraph = IterGraph
  self.Dialogues = Dialogues
  self.NextDialogueId = InitialDialogueId
  self.DialogueRecordComponent = IterGraph.TalkTask.DialogueRecordComponent
  self.NextNodeMap = {}
  self:GenerateNextNodes()
end

function FIterationStartNode:Execute()
  self:Record()
  self:Iterate()
end

function FIterationStartNode:RealSkip()
  self:Record()
end

function FIterationStartNode:Record(...)
  FIterationStartNode.Super.Record(self, ...)
  self.DialogueRecordComponent:OnTalkStart(self.NextDialogueId)
end

function FIterationStartNode:GenerateNextNodes()
  if self.NextDialogueId then
    local DialogueId = self.NextDialogueId
    local NextNode = self.IterGraph:GetOrCreateNode("Dialogue", DialogueId)
    self:SetOutPort(EDialogueIterType.Out, NextNode)
  end
end

return FIterationStartNode
