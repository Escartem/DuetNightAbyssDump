local ReviewUtils = require("BluePrints.UI.WBP.StoryReview.StoryReviewUtils")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local EDialogueNodeType = TalkUtils.EDialogueNodeType
local EDialogueIterType = TalkUtils.EDialogueIterType
local FDialogueNode = Class({
  "BluePrints.Story.StoryIteration.StoryIterationNode"
})
FDialogueNode.NodeType = EDialogueNodeType.Dialogue

function FDialogueNode:CreateNodeData(DialogueId)
  local Dialogue = self.Dialogues[DialogueId]
  self.Dialogue = Dialogue
  self.NextOptions = Dialogue.NextOptions
  self.NextDialogue = Dialogue.NextDialogue
  self.FinalDialogue = Dialogue.FinalDialogueId
  self.Content = TalkUtils:DialogueIdToContent(DialogueId)
  self.IterGraph.DialogueNodeMap[DialogueId] = self
  if Dialogue.RelatedWikiId then
    self.DialogueWikiComponent:AddListenWikiId(Dialogue.RelatedWikiId)
  end
end

function FDialogueNode:GenerateNextNodes()
  if self.NextDialogue and self.NextOptions then
    local DialogueId = self.Dialogue.DialogueId
    local NextNode = self.IterGraph:GetOrCreateNode("CheckOptionCondition", DialogueId)
    self:SetOutPort(EDialogueIterType.Out, NextNode)
    return
  end
  if self.NextDialogue then
    local DialogueId = self.NextDialogue
    local NextNode = self.IterGraph:GetOrCreateNode("Dialogue", DialogueId)
    self:SetOutPort(EDialogueIterType.Out, NextNode)
  elseif self.NextOptions then
    local DialogueId = self.Dialogue.DialogueId
    local NextOptionNode = self.IterGraph:GetOrCreateNode("Option", DialogueId)
    self:SetOutPort(EDialogueIterType.Out, NextOptionNode)
  elseif self.FinalDialogue then
    local NextNode = self.IterGraph:GetOrCreateNode("Dialogue", self.FinalDialogue)
    self:SetOutPort(EDialogueIterType.Final, NextNode)
  else
    local NextNode = self.IterGraph:GetOrCreateNode("End")
    self:SetOutPort(EDialogueIterType.Out, NextNode)
  end
end

function FDialogueNode:Enter(bSkip)
  FDialogueNode.Super.Enter(self, bSkip)
  self:Record()
end

function FDialogueNode:Execute(bSkip)
  self.TalkTask:PlayDialogue(nil, bSkip)
end

function FDialogueNode:Resume()
  self.TalkTask:PlayDialogue(true)
end

function FDialogueNode:RealSkip()
  self.TalkTask:SkipDialogue()
end

function FDialogueNode:Record()
  FDialogueNode.Super.Record(self)
  self.DialogueRecordComponent:OnDialogueRecord(self.Dialogue.DialogueId, self.Dialogue)
end

return FDialogueNode
