local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")
local FFlowDialogue = {}

function FFlowDialogue.New(DialogueData, DialogueSetting, DialogueSection)
  local function GetRawData(Key)
    if DialogueSection and nil ~= DialogueSection[Key] then
      return DialogueSection[Key]
    end
    if DialogueData and nil ~= DialogueData[Key] then
      return DialogueData[Key]
    end
    if DialogueSetting and nil ~= DialogueSetting[Key] then
      return DialogueSetting[Key]
    end
    return FFlowDialogue[Key]
  end
  
  local M = setmetatable({}, {
    __index = function(t, Key)
      local Value = GetRawData(Key)
      if Value then
        rawset(t, Key, Value)
      end
      return Value
    end
  })
  M.bForbiddenDSL = false
  M.bWaitAsyncTag = false
  return M
end

function FFlowDialogue:BindOnDialogueFinish(Func)
  self.OnDialogueFinish = Func
end

function FFlowDialogue:ExecuteOnDialogueFinish(...)
  if self.OnDialogueFinish then
    self.OnDialogueFinish(...)
  end
end

function FFlowDialogue:BindOnForceCompleteDialogue(Func)
  self.OnForceCompleteDialogue = Func
end

function FFlowDialogue:ExecuteOnForceCompleteDialogue(...)
  if self.OnForceCompleteDialogue then
    self.OnForceCompleteDialogue(...)
  end
end

function FFlowDialogue:IsForbiddenDSL()
  return self.bForbiddenDSL
end

function FFlowDialogue:SetForbiddenDSL(bValue)
  self.bForbiddenDSL = bValue
end

function FFlowDialogue:IsWaitAsyncTag()
  return self.bWaitAsyncTag
end

function FFlowDialogue:SetWaitAsyncTag(bValue)
  self.bWaitAsyncTag = bValue
end

function FFlowDialogue:SetAutoToNext()
  self.bAutoToNext = true
end

function FFlowDialogue:NeedAutoToNext()
  return self.bAutoToNext
end

function FFlowDialogue:SetEnableSkip(bValue)
  self.EnableSkip = bValue
end

function M:ReceiveBeginPlay()
end

function M:TryGetCurrentDialogueData()
  local DialogueData = self.DialogueTables[self.Index]
  return DialogueData
end

function M:OnDialogueFinish(DialogueId)
  local DialogueData = self:TryGetCurrentDialogueData()
  if DialogueData and DialogueData.DialogueId == DialogueId then
    self:IterForward()
  else
    local Message = string.format("\229\189\147\229\137\141Dialogue\232\138\130\231\130\185OnDialogueFinish\230\151\182 DialogueId %d \228\184\142\229\155\158\232\176\131 %d\228\184\141\229\144\140\239\188\140\232\175\183\230\163\128\230\159\165 self.Index: %d, Dialogue Num: %d", DialogueData and DialogueData.DialogueId or 0, DialogueId or 0, self.Index, self.DialogueTables and #self.DialogueTables or -1)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
  end
end

function M:OnDialogueForceToEnd(DialogueId)
  local DialogueData = self:TryGetCurrentDialogueData()
  DebugPrint("DialogueFlowNode: OnDialogueForceToEnd", DialogueId)
  if DialogueData and DialogueData.DialogueId == DialogueId then
    if self.SequencePlayer then
      self.SequencePlayer:SkipToDialogueEnd(DialogueId)
      self.SequencePlayer:Pause()
    end
  else
    local Message = string.format("\229\189\147\229\137\141Dialogue\232\138\130\231\130\185OnDialogueFinish\230\151\182 DialogueId %d \228\184\142\229\155\158\232\176\131 %d\228\184\141\229\144\140\239\188\140\232\175\183\230\163\128\230\159\165 self.Index: %d, Dialogue Num: %d", DialogueData and DialogueData.DialogueId or 0, DialogueId or 0, self.Index, self.DialogueTables and #self.DialogueTables or -1)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
  end
end

function M:PlayDialogue(FlowDialogueData)
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  local DialogueRecordComponent = self:TryGetRecordComponent()
  local DialogueId = FlowDialogueData.DialogueId
  FlowDialogueData:BindOnForceCompleteDialogue(function(DialogueId)
    self:OnDialogueForceToEnd(DialogueId)
  end)
  FlowDialogueData:BindOnDialogueFinish(function(DialogueId)
    self:OnDialogueFinish(DialogueId)
  end)
  DialogueFlowGraphComponent:PlayDialogue(FlowDialogueData)
  DialogueRecordComponent:OnDialogueRecord(DialogueId, DataMgr.Dialogue[DialogueId])
  self:TriggerNormalOutput(DialogueId)
end

function M:IsDialogueNodeFinish()
  local DialogueData = self:TryGetCurrentDialogueData()
  if not DialogueData then
    return true
  end
  if self.RuntimeProxy and self.Index == #self.DialogueTables then
    return self.SequencePlayer:CheckTimeOverDialogueEndFrame(DialogueData.DialogueId)
  end
end

function M:IterForward()
  self.Index = self.Index + 1
  local DialogueData = self:TryGetCurrentDialogueData()
  if not DialogueData then
    self:FinishDialogue()
    return
  end
  if self.SequencePlayer then
    if not self.SequencePlayer:TryPlayToDialogueId(DialogueData.DialogueId) then
      self:IterForward()
    end
  else
    local FlowDialogueData = FFlowDialogue.New(DialogueData, self.DialogueSettingsTable[DialogueData.DialogueId])
    self:PlayDialogue(FlowDialogueData)
  end
end

function M:Start()
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  if not DialogueFlowGraphComponent then
    local Message = string.format("\229\189\147\229\137\141Dialogue\232\138\130\231\130\185\239\188\140\230\179\168\229\134\140\231\154\132Task\228\184\141\229\173\152\229\156\168 DialogueFlowGraphComponent\239\188\140\232\175\183\230\179\168\229\134\140")
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
    return
  end
  local DialogueRecordComponent = self:TryGetRecordComponent()
  if not DialogueRecordComponent then
    local Message = string.format("\229\189\147\229\137\141Dialogue\232\138\130\231\130\185\239\188\140\230\179\168\229\134\140\231\154\132Task\228\184\141\229\173\152\229\156\168 DialogueRecordComponent\239\188\140\232\175\183\230\179\168\229\134\140")
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
    return
  end
  self.DialogueSettingsTable = self.DialogueSetting:ToTable()
  local DialogueIds = self.DialogueData:ToTable()
  self.DialogueTables = DialogueIds
  self.Index = 0
  self:TryStartSequence()
  self:IterForward()
end

function M:BindSequenceActors()
  local DialogueAssets = self:GetFlowAsset()
  local BindNpcs = DialogueAssets.SpeakNpcIds:ToTable()
  local LevelSequenceActor = DialogueAssets.LevelSequenceActor
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local TalkTask = self:TryGetTalkTask()
  local LevelSequence = self.LevelSequence
  for _, NpcId in pairs(BindNpcs) do
    local TalkActorData = TalkContext:GetTalkActorData(TalkTask, NpcId)
    if TalkActorData and TalkActorData.TalkActor then
      local NpcIdTag = tostring(NpcId)
      if UTalkFunctionLibrary.IsSequenceOwnTag(LevelSequence, NpcIdTag) then
        LevelSequenceActor:AddBindingByTag(NpcIdTag, TalkActorData.TalkActor, false)
      end
    end
  end
end

function M:TryStartSequence()
  if not IsValid(self.LevelSequence) then
    return false
  end
  self:PlaySequence()
  if not IsValid(self.SequencePlayer) or not IsValid(self.RuntimeProxy) then
    return
  end
  local RuntimeProxy = self.RuntimeProxy
  RuntimeProxy.OnSpecialDialoguePlay:Add(self, self.SequenceIterForward)
  RuntimeProxy.OnSpecialDialogueEnd:Add(self, self.SequenceIterEnd)
  self.SequencePlayer.OnFinished:Add(self, self.OnSequenceFinish)
  self.SequencePlayer.OnPause:Add(self, self.OnSequencePause)
  self:BindSequenceActors()
  RuntimeProxy:SetUpLua(self:TryGetTalkTask())
  return true
end

function M:SequenceIterForward(Section)
  if self.IterSection then
    local Message = string.format("\229\189\147\229\137\141Dialogue\232\138\130\231\130\185\239\188\140Sequence \228\184\138\229\143\165\229\143\176\230\156\172\229\176\154\230\156\170\231\187\147\230\157\159 %d\239\188\140\229\176\177\232\166\129\230\146\173\230\148\190\228\184\139\228\184\128\229\143\165\229\143\176\230\156\172 %d", self.IterSection.DialogueId, Section.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
  end
  DebugPrint("SequenceIterForward", Section.DialogueId)
  self.IterSection = Section
  local DialogueData = self:TryGetCurrentDialogueData()
  local FlowDialogueData = FFlowDialogue.New(DialogueData, self.DialogueSettingsTable[DialogueData.DialogueId], Section)
  local Dialogue = DataMgr.Dialogue[DialogueData.DialogueId]
  if Dialogue and string.isempty(Dialogue.Content) then
    FlowDialogueData:SetAutoToNext()
    FlowDialogueData:SetEnableSkip(false)
  end
  FlowDialogueData:SetForbiddenDSL(true)
  FlowDialogueData:SetWaitAsyncTag(true)
  self:PlayDialogue(FlowDialogueData)
end

function M:SequenceIterEnd(DialogueId)
  self.IterSection = nil
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  DialogueFlowGraphComponent:ForceCompleteDialogue(DialogueId)
end

function M:OnSequenceFinish()
  if self.SequenceFinish then
    return
  end
  self.RuntimeProxy.OnPlayDialogue:Clear()
  self.RuntimeProxy.OnEndPlayDialogue:Clear()
  self.SequencePlayer.OnFinished:Clear()
  self.SequenceFinish = true
  self:FinishDialogue()
end

function M:OnSequencePause()
  if self.SequenceFinish then
    return
  end
  if self.SequencePlayer then
    local DialogueData = self:TryGetCurrentDialogueData()
    if self.SequencePlayer:CheckTimeOverDialogueEndFrame(DialogueData.DialogueId) then
      local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
      DialogueFlowGraphComponent:CompleteWaitSequence()
    end
  end
end

function M:SkipCurrentDialogue()
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  DialogueFlowGraphComponent:SkipDialogue()
end

function M:TrySkipToDialogueStart()
  if self.SequencePlayer then
    local DialogueData = self:TryGetCurrentDialogueData()
    self.SequencePlayer:TrySkipToDialogueId(DialogueData.DialogueId)
  end
end

function M:Skip()
  repeat
    self:TrySkipToDialogueStart()
    self:SkipCurrentDialogue()
    self:IterForward()
  until self:IsDialogueNodeFinish()
end

function M:CanSkip()
  return true
end

function M:Pause()
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  DialogueFlowGraphComponent:PauseDialogue()
  if self.SequencePlayer then
    self.SequencePlayer:Pause()
  end
end

function M:Resume()
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  DialogueFlowGraphComponent:ResumeDialogue()
  if self.SequencePlayer then
    local DialogueData = self:TryGetCurrentDialogueData()
    if not DialogueData then
      return
    end
    self.SequencePlayer:TryPlayToDialogueId(DialogueData.DialogueId)
  end
end

function M:K2_Cleanup()
  if not self.RuntimeProxy then
    return
  end
  self.RuntimeProxy.OnPlayDialogue:Clear()
  self.RuntimeProxy.OnEndPlayDialogue:Clear()
  self.SequencePlayer.OnFinished:Clear()
end

return M
