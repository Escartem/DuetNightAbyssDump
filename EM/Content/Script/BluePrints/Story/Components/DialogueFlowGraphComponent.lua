local TalkDelegateManager_C = require("BluePrints.Story.Talk.Controller.TalkDelegate").TalkDelegateManager_C
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local EDialogueNodeType = TalkUtils.EDialogueNodeType
local FDialogueFlowGraphComponent = {}

function FDialogueFlowGraphComponent:New(TalkTask, TaslData)
  local DialogueFlowGraphComponent = setmetatable({}, {__index = FDialogueFlowGraphComponent})
  DialogueFlowGraphComponent:Initialize(TalkTask, TaslData)
  return DialogueFlowGraphComponent
end

function FDialogueFlowGraphComponent:Initialize(TalkTask, TaskData)
  self.TalkTask = TalkTask
  self.TaskData = TaskData
  if not TaskData.FlowAsset then
    return
  end
  self.FlowAsset = TaskData.FlowAsset
  self:CreateDelegate(TalkTask, TaskData)
  self.DialogueRecordComponent = TalkTask.DialogueRecordComponent
  TaskData.FlowAsset:InitializeLua(TalkTask)
end

function FDialogueFlowGraphComponent:CreateDelegate(TalkTask, TaskData)
end

function FDialogueFlowGraphComponent:OnTalkEnd()
  if self.EndCallback then
    self.EndCallback()
  end
end

function FDialogueFlowGraphComponent:Execute()
  local TS = TalkSubsystem()
  self.bStartDialogue = false
  TS:StartFlowTalkTask(self.FlowAsset)
end

function FDialogueFlowGraphComponent:Pause()
  self.FlowAsset:Pause()
end

function FDialogueFlowGraphComponent:Resume()
  self.FlowAsset:Resume()
end

function FDialogueFlowGraphComponent:SkipToEndOrOption()
  DebugPrint("FDialogueFlowGraphComponent:SkipToEndOrOption")
  assert(not self.bSkipping, "FDialogueFlowGraphComponent Skip Is In Running")
  local FlowAsset = self.FlowAsset
  self.bSkipping = true
  FlowAsset:SkipToEndOrOption()
  self.bSkipping = false
  self.TalkTask.UI:ToPageEnd()
  if self.Options then
    self:PlayOptions(self.Options, self.SelectOptions, self.OptionCallback, self.OptionNode)
  end
  DebugPrint("FDialogueFlowGraphComponent:SkipToEndOrOption Fin.")
end

function FDialogueFlowGraphComponent:SkipToEnd()
  DebugPrint("FDialogueFlowGraphComponent:SkipToEnd")
  assert(not self.bSkipping, "FDialogueFlowGraphComponent Skip Is In Running")
  local FlowAsset = self.FlowAsset
  self.bSkipping = true
  FlowAsset:SkipToEnd()
  self.bSkipping = false
  self.TalkTask.UI:ToPageEnd()
  if self.Options then
    self:PlayOptions(self.Options, self.SelectOptions, self.OptionCallback, self.OptionNode)
  end
  DebugPrint("FDialogueFlowGraphComponent:SkipToEnd Fin.")
end

function FDialogueFlowGraphComponent:Iterate(...)
  if self.FlowDialogueData then
    local FlowDialogueData = self.FlowDialogueData
    self.FlowDialogueData = nil
    if FlowDialogueData then
      FlowDialogueData:ExecuteOnDialogueFinish(FlowDialogueData.DialogueId)
    end
    return
  end
  if self.Options then
    local OptionId, FinishType = ...
    self:SelectOption(OptionId, FinishType)
    return
  end
end

function FDialogueFlowGraphComponent:GetDialogue()
  if not self.FlowDialogueData then
    DebugPrint("FDialogueFlowGraphComponent:GetDialogue NowDialogueId is nil", self.Options)
    return nil
  end
  local Dialogue = DataMgr.Dialogue[self.FlowDialogueData.DialogueId]
  return Dialogue
end

function FDialogueFlowGraphComponent:GetOptions()
  if not self.Options then
    DebugPrint("FDialogueFlowGraphComponent:GetDialogue Options is nil", self.FlowDialogueData and self.FlowDialogueData.DialogueId, self.Options)
    return nil
  end
  return self.Options
end

function FDialogueFlowGraphComponent:GetCurrentNodeType()
  if self.bFinish then
    return EDialogueNodeType.End
  end
  if self.FlowDialogueData then
    return EDialogueNodeType.Dialogue
  end
  if self.Options then
    return EDialogueNodeType.Option
  end
end

function FDialogueFlowGraphComponent:HasFinalDialogue()
  if self.OptionNode then
    return self.OptionNode:IsFinalConnected()
  end
  return false
end

function FDialogueFlowGraphComponent:IsSelectedOption(OptionId)
  if not self.SelectOptions then
    DebugPrint("FDialogueFlowGraphComponent:IsSelectedOption SelectedOptions is nil", self.FlowDialogueData and self.FlowDialogueData.DialogueId, self.Options, self.SelectOptions)
    return false
  end
  return self.SelectOptions[OptionId]
end

function FDialogueFlowGraphComponent:InitSimpleDialogueData(DialogueData)
  if not self.FlowAsset then
    return
  end
  if not self.FlowDialogueData then
    return
  end
  if self.FlowDialogueData.DialogueId ~= DialogueData.DialogueId then
    return
  end
  local FlowDialogueData = self.FlowDialogueData
  if FlowDialogueData.bUseWaitClickTime then
    DialogueData.AllowClickTime = FlowDialogueData.WaitClickTime
  end
  if FlowDialogueData:IsWaitAsyncTag() then
    DialogueData.bWaitFlowEnd = true
  end
  DialogueData.bAutoToNext = FlowDialogueData.bAutoToNext
end

function FDialogueFlowGraphComponent:ForceToDialogueEnd(bForceSkip)
  if not self.FlowAsset then
    return
  end
  if not self.FlowDialogueData then
    return
  end
  if self.FlowDialogueData.EnableSkip or bForceSkip then
    self.FlowDialogueData:ExecuteOnForceCompleteDialogue(self.FlowDialogueData.DialogueId)
  end
end

function FDialogueFlowGraphComponent:PlayDialogue(FlowDialogueData)
  if not self.bStartDialogue then
    self.bStartDialogue = true
    self.DialogueRecordComponent:OnTalkStart(FlowDialogueData.DialogueId)
    self.TaskData.FirstDialogueId = FlowDialogueData.DialogueId
  end
  self.FlowDialogueData = FlowDialogueData
  self.TalkTask:PlayDialogue(false, self.bSkipping)
end

function FDialogueFlowGraphComponent:CompleteWaitSequence()
  local WaitQueue = self.TalkTask.WaitQueue
  if not WaitQueue then
    DebugPrint("FDialogueFlowGraphComponent:ForceWaitSequence WaitQueue is Nil")
    return
  end
  WaitQueue:CompleteWaitItem("WaitFlowEnd")
end

function FDialogueFlowGraphComponent:ForceCompleteDialogue()
  local TalkTask = self.TalkTask
  if TalkTask.ForceCompleteDialogue then
    TalkTask:ForceCompleteDialogue()
  else
    DebugPrint("FDialogueFlowGraphComponent:ForceCompleteDialogue TalkTask.ForceCompleteDialogue is Nil")
  end
end

function FDialogueFlowGraphComponent:SkipDialogue()
  self.TalkTask:SkipDialogue()
  self.FlowDialogueData = nil
end

function FDialogueFlowGraphComponent:PauseDialogue()
end

function FDialogueFlowGraphComponent:ResumeDialogue()
  self.TalkTask:PlayDialogue(true)
end

function FDialogueFlowGraphComponent:PlayOptions(Options, SelectOptions, OptionCallback, OptionNode)
  self.OptionCallback = OptionCallback
  self.Options = Options
  self.SelectOptions = SelectOptions
  self.OptionNode = OptionNode
  if self.bSkipping then
    return
  end
  self.TalkTask:ShowDialogueOptions(Options)
end

function FDialogueFlowGraphComponent:SelectOption(OptionId, FinishType)
  self.Options = nil
  self.SelectOptions = nil
  local OptionCallback = self.OptionCallback
  self.OptionCallback = nil
  self.OptionNode = nil
  if OptionCallback then
    OptionCallback(OptionId, FinishType)
  end
end

function FDialogueFlowGraphComponent:TryEndTalk(Callback)
  self.bFinish = true
  self.EndCallback = Callback
  self.TalkTask:EndDialogue()
end

function FDialogueFlowGraphComponent:CanUseDSLFlow()
  if not self.FlowDialogueData then
    return true
  end
  return not self.FlowDialogueData:IsForbiddenDSL()
end

function FDialogueFlowGraphComponent:IsUseEmptyCamera()
  if not self.FlowAsset then
    return false
  end
  return self.FlowAsset:IsFirstDialogueNodeSequence()
end

function FDialogueFlowGraphComponent:GetSavedOptions()
  if self.OptionNode then
    return self.OptionNode:GetSavedOptions()
  end
  return
end

return FDialogueFlowGraphComponent
