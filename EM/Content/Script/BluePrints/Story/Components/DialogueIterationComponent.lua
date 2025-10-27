local EDialogueNodeType = require("BluePrints.Story.Talk.View.TalkUtils").EDialogueNodeType
local EDialogueIterType = require("BluePrints.Story.Talk.View.TalkUtils").EDialogueIterType
local FStoryIterationGraph = require("BluePrints.Story.StoryIteration.StoryIterationGraph")
local ReviewUtils = require("BluePrints.UI.WBP.StoryReview.StoryReviewUtils")
local FDialogueIterationComponent = {}

function FDialogueIterationComponent:New(Dialogues, InitialDialogueId, TalkTask)
  local DialogueIterationComponent = setmetatable({}, {__index = FDialogueIterationComponent})
  DialogueIterationComponent.TalkTask = TalkTask
  DialogueIterationComponent.TalkTaskData = TalkTask.TalkTaskData
  DialogueIterationComponent.DialogueRecordComponent = TalkTask.DialogueRecordComponent
  DialogueIterationComponent.FlowCompoent = TalkTask.DialogueFlowGraphComponent
  DialogueIterationComponent.bUseFlow = IsValid(TalkTask.TalkTaskData.FlowAsset)
  DialogueIterationComponent.bShowInStoryReview = TalkTask.TalkTaskData.bShowInStoryReview
  DialogueIterationComponent:Initialize(Dialogues, InitialDialogueId)
  return DialogueIterationComponent
end

function FDialogueIterationComponent:Initialize(Dialogues, InitialDialogueId)
  if nil == Dialogues then
    DebugPrint("Error: Dialogues is nil")
    return
  end
  self.Dialogues = Dialogues
  self.InitialDialogueId = InitialDialogueId
  self.StoryIterGraph = FStoryIterationGraph:New(Dialogues, InitialDialogueId, self.TalkTask)
end

function FDialogueIterationComponent:Start()
  if self.bUseFlow then
    self.FlowCompoent:Execute()
    return
  end
  if self:IsStart() and self.StoryIterGraph:GetRestartTag() then
    self:SkipToRestartTag()
  else
    local CurrentNode = self.StoryIterGraph:GetCurrentNode()
    if CurrentNode then
      CurrentNode:Execute()
    else
      DebugPrint("lhr@FDialogueIterationComponent:Start(),CurrentNode is nil")
    end
  end
end

function FDialogueIterationComponent:Pause()
  if self.bUseFlow then
    self.FlowCompoent:Pause()
    return
  end
end

function FDialogueIterationComponent:Resume()
  if self.bUseFlow then
    self.FlowCompoent:Resume()
    return
  end
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  if CurrentNode then
    CurrentNode:Resume()
  else
    DebugPrint("lhr@FDialogueIterationComponent:Start(),CurrentNode is nil")
  end
end

function FDialogueIterationComponent:Iterate(...)
  if self.bUseFlow then
    self.FlowCompoent:Iterate(...)
    return
  end
  self.StoryIterGraph:Iterate(...)
end

function FDialogueIterationComponent:Skip()
  return self.StoryIterGraph:Skip()
end

function FDialogueIterationComponent:GetDialogue()
  if self.bUseFlow then
    return self.FlowCompoent:GetDialogue()
  end
  if self:IsInText() == false then
    return nil
  end
  return self.StoryIterGraph:GetCurrentNode().Dialogue
end

function FDialogueIterationComponent:GetSavedOptions()
  if self.bUseFlow then
    return self.FlowCompoent:GetSavedOptions()
  end
  if self:IsInOption() == false then
    return nil
  end
  local Node = self.StoryIterGraph:GetCurrentNode()
  if Node then
    return Node.LastSelectedId
  end
  return nil
end

function FDialogueIterationComponent:GetOptions()
  if self.bUseFlow then
    return self.FlowCompoent:GetOptions()
  end
  if self:IsInOption() == false then
    return nil
  end
  local Node = self.StoryIterGraph:GetCurrentNode()
  if Node then
    return Node:GetOptions()
  end
  return nil
end

function FDialogueIterationComponent:SkipToFinalOrOption()
  if self:IsEnd() then
    self:Initialize(self.Dialogues, self.InitialDialogueId)
    self:Skip()
  end
  while self:IsInText() and (self.StoryIterGraph:GetCurrentNode().NextDialogueId or self.StoryIterGraph:GetCurrentNode().FinalDialogue) do
    self:Skip()
  end
end

function FDialogueIterationComponent:SkipToEndOrOption()
  DebugPrint("lhr@SkipToEndOrOption")
  if self.bUseFlow then
    return self.FlowCompoent:SkipToEndOrOption()
  end
  local LastDialogue
  while self:IsInText() do
    self:Skip()
  end
  self.TalkTask.UI:ToPageEnd()
  self:Start()
end

function FDialogueIterationComponent:SkipToEnd()
  DebugPrint("lhr@SkipToEnd")
  if self.bUseFlow then
    return self.FlowCompoent:SkipToEnd()
  end
  while not self:IsEnd() and self:Skip() do
  end
  self.TalkTask.UI:ToPageEnd()
  self:Start()
end

function FDialogueIterationComponent:SkipToRestartTag()
  local RestartTag = self.StoryIterGraph:GetRestartTag()
  local CurrentDialogue
  while not self:IsEnd() do
    CurrentDialogue = self:GetDialogue()
    if not ((not CurrentDialogue or CurrentDialogue.DialogueId ~= RestartTag) and self:Skip()) then
      break
    end
  end
  self.TalkTask.UI:ToPageEnd()
  self:Start()
end

function FDialogueIterationComponent:IsInImpression()
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  return CurrentNode and CurrentNode.IsImpression
end

function FDialogueIterationComponent:IsInText()
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  return CurrentNode and CurrentNode:GetType() == EDialogueNodeType.Dialogue
end

function FDialogueIterationComponent:IsInOption()
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  return CurrentNode and CurrentNode:GetType() == EDialogueNodeType.Option
end

function FDialogueIterationComponent:IsStart()
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  return CurrentNode and CurrentNode:GetType() == EDialogueNodeType.Start
end

function FDialogueIterationComponent:IsLastText()
  if not self:IsInText() then
    return false
  end
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  local NextNode = CurrentNode:GetOutPort(EDialogueIterType.Out)
  if not NextNode then
    return false
  end
  return NextNode:GetType() == EDialogueNodeType.End
end

function FDialogueIterationComponent:IsLastAndOnlyOption()
  if not self:IsInOption() then
    return false
  end
  local Options = self:GetOptions()
  if not Options or 1 ~= #self:GetOptions() then
    return false
  end
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  local NextNode = CurrentNode:GetOutPort(EDialogueIterType.Option .. 1)
  if not NextNode then
    return false
  end
  return NextNode:GetType() == EDialogueNodeType.End
end

function FDialogueIterationComponent:IsEnd()
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  return CurrentNode and CurrentNode:GetType() == EDialogueNodeType.End
end

function FDialogueIterationComponent:IsSelectedOption(OptionId)
  if self.bUseFlow then
    return self.FlowCompoent:IsSelectedOption(OptionId)
  end
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  if not CurrentNode or CurrentNode:GetType() ~= EDialogueNodeType.Option then
    return false
  end
  return CurrentNode.VisitedOptions[OptionId]
end

function FDialogueIterationComponent:HasFinalDialogue()
  if self.bUseFlow then
    return self.FlowCompoent:HasFinalDialogue()
  end
  local CurrentNode = self.StoryIterGraph:GetCurrentNode()
  if not CurrentNode or CurrentNode:GetType() ~= EDialogueNodeType.Option then
    return false
  end
  return CurrentNode:HasFinalDialogue()
end

function FDialogueIterationComponent:GetCurrentNodeType()
  if self.bUseFlow then
    return self.FlowCompoent:GetCurrentNodeType()
  end
  return self.StoryIterGraph:GetCurrentNode().NodeType
end

function FDialogueIterationComponent:ForceToDialogueEnd(bSkip)
  if self.bUseFlow then
    return self.FlowCompoent:ForceToDialogueEnd(bSkip)
  end
end

return FDialogueIterationComponent
