local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local FDialogueIterationComponent = require("BluePrints.Story.Components.DialogueIterationComponent")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local EDialogueNodeType = TalkUtils.EDialogueNodeType
local FRougeLikeTalkTask = Class({
  "BluePrints.Story.Talk.Controller.TalkTaskBase"
})

function FRougeLikeTalkTask:Start(TalkTaskData, TaskFinished_Callback)
  self.TalkTaskData = TalkTaskData
  self.TaskFinished_Callback = TaskFinished_Callback
  self.TalkContext = TalkTaskData.TalkContext
  self.DialogueIterationComponent = FDialogueIterationComponent:New(DataMgr.Dialogue, TalkTaskData.FirstDialogueId, self)
  EventManager:AddEvent(EventID.OnRougeIteratorDialogue, self, self.IterateDialogue)
  EventManager:AddEvent(EventID.OnRougeChooseOption, self, self.ChooseOption)
  EventManager:AddEvent(EventID.CloseFromRougeArchive, self, self.CloseFromRougeArchive)
  self.DialogueIterationComponent:Start()
end

function FRougeLikeTalkTask:Finish(TalkNodeFinishType, OptionIndex)
  EventManager:RemoveEvent(EventID.OnRougeIteratorDialogue, self)
  EventManager:RemoveEvent(EventID.OnRougeChooseOption, self)
  EventManager:RemoveEvent(EventID.CloseFromRougeArchive, self)
  if self.TaskFinished_Callback then
    local NodeFinished_Obj = self.TaskFinished_Callback[1]
    local NodeFinished_Func = self.TaskFinished_Callback[2]
    NodeFinished_Func(NodeFinished_Obj, self, TalkNodeFinishType, OptionIndex)
  end
end

function FRougeLikeTalkTask:Clear()
  FRougeLikeTalkTask.Super.Clear(self)
  EventManager:RemoveEvent(EventID.OnRougeIteratorDialogue, self)
  EventManager:RemoveEvent(EventID.OnRougeChooseOption, self)
  EventManager:RemoveEvent(EventID.CloseFromRougeArchive, self)
end

function FRougeLikeTalkTask:PlayDialogue()
  local NodeType = self.DialogueIterationComponent:GetCurrentNodeType()
  if NodeType == EDialogueNodeType.Dialogue then
    local Dialogue = self.DialogueIterationComponent:GetDialogue()
    if Dialogue then
      self:DisplayDialogue(Dialogue)
      return
    end
  else
    DebugPrint("lhr@Dialogue Iteration Error: NodeType", NodeType, "\228\184\141\229\144\136\230\179\149")
    return
  end
end

function FRougeLikeTalkTask:ChooseOption(Index)
  if nil == Index then
    self:Error("Index is nil.")
    return
  end
  local CurrentNodeType = self.DialogueIterationComponent:GetCurrentNodeType()
  if CurrentNodeType == EDialogueNodeType.Option then
    self:IterateDialogue(Index)
  elseif CurrentNodeType == EDialogueNodeType.End then
    self:Finish(ETalkNodeFinishType.Option, Index)
  end
end

function FRougeLikeTalkTask:DisplayCurrentDialogue()
  local Dialogue = self.DialogueIterationComponent:GetDialogue()
  self:DisplayDialogue(Dialogue)
end

function FRougeLikeTalkTask:DisplayDialogue(Dialogue)
  local DialogueData = self:GetDialogueDataWithCheck(Dialogue)
  DialogueData.IsLastText = self.DialogueIterationComponent:IsLastText()
  EventManager:FireEvent(EventID.OnRougeDisplayDialogue, DialogueData)
end

function FRougeLikeTalkTask:ShowDialogueOptions(OptionIds)
  DebugPrint("FRougeLikeTalkTask@ShowDialogueOptions")
  local OptionTexts = {}
  for i, OptionId in ipairs(OptionIds) do
    table.insert(OptionTexts, {
      Index = i,
      Text = TalkUtils:OptionIdToContent(OptionId),
      IsKeyOption = TalkUtils:IsKeyOption(OptionId),
      IsLastOption = self.DialogueIterationComponent:IsLastAndOnlyOption(),
      DialogueId = OptionId
    })
  end
  EventManager:FireEvent(EventID.OnRougeDisplayOptions, OptionTexts)
end

function FRougeLikeTalkTask:ShowTalkOptions(OptionData)
  DebugPrint("FRougeLikeTalkTask@ShowTalkOptions")
  local OptionTexts = {}
  for i, Option in ipairs(OptionData.Options) do
    local OptionId = tonumber(Option.OptionText)
    table.insert(OptionTexts, {
      Index = Option.Index,
      Text = TalkUtils:OptionIdToContent(Option.OptionText),
      IsKeyOption = TalkUtils:IsKeyOption(Option.OptionText),
      DialogueId = OptionId
    })
  end
  EventManager:FireEvent(EventID.OnRougeDisplayOptions, OptionTexts)
end

function FRougeLikeTalkTask:FinishDialogue()
  local OptionData = self.TalkTaskData.OptionData
  if OptionData and OptionData.Options and #OptionData.Options > 0 then
    self:ShowTalkOptions(OptionData)
    return
  end
  self:Finish(ETalkNodeFinishType.Out)
end

function FRougeLikeTalkTask:GetDependencies()
  return {}
end

function FRougeLikeTalkTask:OnInterrupted()
end

function FRougeLikeTalkTask:OnPaused()
end

function FRougeLikeTalkTask:OnPauseResumed()
end

function FRougeLikeTalkTask:Error(Text)
  DebugPrint("Error:", Text)
end

function FRougeLikeTalkTask:CloseFromRougeArchive()
  self:Finish(ETalkNodeFinishType.Out)
end

return FRougeLikeTalkTask
