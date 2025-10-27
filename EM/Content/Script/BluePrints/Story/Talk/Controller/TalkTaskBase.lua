local ETaskState = require("BluePrints.Story.Talk.Base.ETaskState")
local ETalkType = require("BluePrints.Story.Talk.Base.ETalkType")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local FHideAllMonstersComponent = require("BluePrints.Story.Components.HideAllMonstersComponent")
local FDialogueRecordComponent = require("BluePrints.Story.Components.DialogueRecordComponent")
local FDialogueFlowGraphComponent = require("BluePrints.Story.Components.DialogueFlowGraphComponent")
local FHideAllNpcsComponent = require("BluePrints.Story.Components.HideAllNpcsComponent")
local FExecutionFlowUtils = require("BluePrints.Story.ExecutionFlow.ExecutionFlowUtils")
local TalkTaskState = require("BluePrints.Story.Talk.Base.TalkTaskState")
local TalkTaskBase_C = Class()

function TalkTaskBase_C:New(TaskData, TalkType)
  local Obj = setmetatable({}, {__index = self})
  Obj.TaskData = TaskData
  Obj.TalkComps = {}
  Obj.ExecutedComps = {}
  Obj.State = ETaskState.Default
  Obj.TalkType = TalkType
  Obj.BasicTalkType = DataMgr.TalkType[TalkType].BasicType
  Obj.OnTalkEndEvents = {}
  Obj:CreateComponents()
  Obj.UnitKey = tostring(Obj)
  Obj.UnitKey = Obj.UnitKey:gsub("^table:%s*", "")
  return Obj
end

function TalkTaskBase_C:ExecuteProps()
  if self.TalkComps then
    for _, Comp in pairs(self.TalkComps) do
      if not Comp.bManualCall then
        Comp:Execute()
      end
    end
  end
end

function TalkTaskBase_C:ResumeProps()
  if self.TalkComps then
    for _, Comp in pairs(self.TalkComps) do
      Comp:Resume()
    end
  end
end

function TalkTaskBase_C:ExecuteComp(CompType)
  local Comp = self.TalkComps[CompType]
  if Comp then
    Comp:Execute()
  end
end

function TalkTaskBase_C:ResumeComp(CompType)
  local Comp = self.TalkComps[CompType]
  if Comp then
    Comp:Resume()
  end
end

function TalkTaskBase_C:StartWorking(TalkTaskData, TaskFinished_Callback)
  self:Start(TalkTaskData, TaskFinished_Callback)
end

function TalkTaskBase_C:GetDependencies()
  DebugPrint("@@@ error GetDependencies\230\156\170\229\174\158\231\142\176", self:GetTalkType())
  return {}
end

function TalkTaskBase_C:TryEndFlowGraph()
  self.DialogueFlowGraphComponent:OnTalkEnd()
end

function TalkTaskBase_C:IsGameUIHidden()
  return self.State == ETaskState.Working and self.HideGameUIComponent ~= nil
end

function TalkTaskBase_C:GetTalkComps()
  return self.TalkComps or {}
end

function TalkTaskBase_C:Start()
  self:PlaySnapShot()
end

function TalkTaskBase_C:PlaySnapShot()
  AudioManager(GWorld.GameInstance):StartTalkSnapShot(self.UnitKey)
end

function TalkTaskBase_C:Finish()
  self:RemoveDialogueEffectSound()
end

function TalkTaskBase_C:End()
  self:RemoveDialogueEffectSound()
end

function TalkTaskBase_C:RemoveDialogueEffectSound()
  AudioManager(GWorld.GameInstance):StopTalkSnapShot(self.UnitKey)
end

function TalkTaskBase_C:PauseSnapShot()
  AudioManager(GWorld.GameInstance):UpdateTalkSnapShotParam(0)
end

function TalkTaskBase_C:OnPlayingDialogue(DialogueData)
  local RawData = DataMgr.Dialogue[DialogueData.DialogueId]
  if RawData and RawData.SnapShot then
    AudioManager(GWorld.GameInstance):UpdateTalkSnapShotParam(Const.DialogueSnapShot[RawData.SnapShot])
  else
    AudioManager(GWorld.GameInstance):UpdateTalkSnapShotParam(0)
  end
end

function TalkTaskBase_C:IterateDialogue(...)
  if self.DialogueIterationComponent then
    self.DialogueIterationComponent:Iterate(...)
  end
end

function TalkTaskBase_C:EndDialogue(...)
  self:FinishDialogue(...)
end

function TalkTaskBase_C:FinishDialogue(...)
end

function TalkTaskBase_C:SetUIName(Name)
  self.UIName = Name
end

function TalkTaskBase_C:GetUIName()
  return self.UIName
end

function TalkTaskBase_C:GetTalkType()
  return self.TalkType
end

function TalkTaskBase_C:GetTalkTaskData()
  return self.TalkTaskData
end

function TalkTaskBase_C:GetBasicTalkType()
  return self.BasicTalkType
end

function TalkTaskBase_C:GetState()
  return self.State
end

function TalkTaskBase_C:GetLastState()
  return self.LastState
end

function TalkTaskBase_C:SetState(State)
  self.LastState = self.State or ETaskState.Default
  self.State = State
end

function TalkTaskBase_C:IsWorking()
  return self.State == ETaskState.Working
end

function TalkTaskBase_C:OnInterrupted()
  DebugPrint("@@@ error OnInterrupted\230\156\170\229\174\158\231\142\176/\228\184\141\230\148\175\230\140\129\232\162\171\230\137\147\230\150\173", self:GetTalkType())
end

function TalkTaskBase_C:OnPaused()
  DebugPrint("@@@ error OnPaused\230\156\170\229\174\158\231\142\176/\228\184\141\230\148\175\230\140\129\232\162\171\230\154\130\229\129\156", self:GetTalkType())
end

function TalkTaskBase_C:OnPauseResumed()
  DebugPrint("@@@ error OnPauseResumed\230\156\170\229\174\158\231\142\176/\228\184\141\230\148\175\230\140\129\230\154\130\229\129\156\230\129\162\229\164\141", self:GetTalkType())
end

function TalkTaskBase_C:Clear()
  TalkUtils:RemovePlayerInvincible()
  local BasicType = self:GetBasicTalkType()
  if BasicType == ETalkType.FixSimple or BasicType == ETalkType.FreeSimple or BasicType == ETalkType.Black or BasicType == ETalkType.Cinematic or BasicType == ETalkType.Impression then
    self:ClearDefault()
  else
    DebugPrint("@@@ error Clear\229\135\189\230\149\176\230\156\170\229\174\158\231\142\176", self:GetTalkType())
  end
end

function TalkTaskBase_C:ClearWaitTag()
  if self.WaitQueue then
    self.WaitQueue:CloseWaitQueue()
    self.WaitQueue = nil
  end
end

function TalkTaskBase_C:ClearDefault()
  DebugPrint("TalkTaskBase_C:ClearDefault", self:GetBasicTalkType())
  if self.TalkContext then
    self.TalkContext.TalkTimerManager:ClearTimer(self)
    self.TalkContext.WaitQueueManager:ClearGroup(self)
    self.TalkContext.TalkDelegateManager:ClearGroup(self)
    self.TalkContext.TalkActionManager:StopAllLookAt(self)
    self.TalkContext.TalkActionManager:StopAllNpcMontage(self)
  end
  self:TryRemoveBlackUI()
  self:StopDSL()
  if self.UnbindDelegate then
    self:UnbindDelegate()
  end
  self:ClearDialogueGuideUI()
  if self.ExpressionComp then
    self.ExpressionComp:Clear()
  end
  if self.DisableCharacterDitherComponent then
    self.DisableCharacterDitherComponent:Resume()
  end
  if self.TalkTaskData.FlowAsset then
    local TS = TalkSubsystem()
    TS:UnRegisterFlowTalkTask(self.TalkTaskData.FlowAssetPath)
  end
  if self:GetUIName() then
    UIManager(GWorld.GameInstance):UnLoadUINew(self:GetUIName())
  end
end

function TalkTaskBase_C:TryRemoveBlackUI()
  if not self.TalkContext then
    return
  end
  self.TalkContext:RemoveDialogueBlackUI()
end

function TalkTaskBase_C:OnExceptionInterruptedBySTL()
  TalkUtils:RemovePlayerInvincible()
  local BasicType = self:GetBasicTalkType()
  if BasicType == ETalkType.FixSimple or BasicType == ETalkType.FreeSimple or BasicType == ETalkType.Black or BasicType == ETalkType.Cinematic or BasicType == ETalkType.Impression or BasicType == ETalkType.RougeLike then
    self:OnExceptionInterruptedBySTLDefault()
  else
    DebugPrint("@@@ error OnExceptionInterruptedBySTL\229\135\189\230\149\176\230\156\170\229\174\158\231\142\176", self:GetTalkType())
  end
end

function TalkTaskBase_C:OnExceptionInterruptedBySTLDefault()
  DebugPrint("TalkTaskBase_C:OnExceptionInterruptedBySTLDefault", self:GetBasicTalkType())
  self.NodeFinished_Callback = nil
  if self.TalkContext and self.TalkContext.TalkCameraManager then
    self.TalkContext.TalkCameraManager:OnExceptionInterrupted()
  end
  self:ResumeProps()
  self:Clear()
  if self.TalkTaskData and self.TalkTaskData.SequencePlayer then
    self.TalkTaskData.SequencePlayer:Stop()
  end
end

function TalkTaskBase_C:PauseTaskExternal(bPause, Pauser)
  local TS = TalkSubsystem()
  if bPause then
    TS:ForcePauseTalk(self, Pauser)
  else
    TS:TryResumePauseTalk(Pauser)
  end
end

function TalkTaskBase_C:PauseAllTimers(bPause)
  if self.TalkTimerManager then
    if bPause then
      self.TalkTimerManager:PauseTimer(self)
      if IsValid(self.DSLFlow) then
        self.DSLFlow:Pause()
      end
    else
      self.TalkTimerManager:UnPauseTimer(self)
      if IsValid(self.DSLFlow) then
        self.DSLFlow:Resume()
      end
    end
  end
end

function TalkTaskBase_C:PauseAudio()
  self:PauseSnapShot()
  if self.TalkAudioComp then
    self.TalkAudioComp:OnPaused(self)
  end
end

function TalkTaskBase_C:PauseCamera(bPause)
  local PlayerController = UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if not PlayerController then
    return
  end
  if bPause then
    self.CacheControllerPausedParam = PlayerController.bShouldPerformFullTickWhenPaused
    PlayerController.bShouldPerformFullTickWhenPaused = false
    UGameplayStatics.SetGamePaused(GWorld.GameInstance, true)
    if self.TalkContext and self.TalkContext.TalkCameraManager then
      self.TalkContext.TalkCameraManager:PauseCameraBreathe(true)
    end
  else
    PlayerController.bShouldPerformFullTickWhenPaused = self.CacheControllerPausedParam
    UGameplayStatics.SetGamePaused(GWorld.GameInstance, false)
    if self.TalkContext and self.TalkContext.TalkCameraManager then
      self.TalkContext.TalkCameraManager:PauseCameraBreathe(false)
    end
  end
end

function TalkTaskBase_C:HideUI()
end

function TalkTaskBase_C:ResumePauseAudio()
  if self.TalkAudioComp then
    self.TalkAudioComp:OnPauseResumed(self)
  end
end

function TalkTaskBase_C:ClearAudio()
  if self.TalkAudioComp then
    self.TalkAudioComp:Clear(self)
  end
  self:RemoveDialogueEffectSound()
end

function TalkTaskBase_C:SkipDialogue()
end

function TalkTaskBase_C:SkipOption(DialogueId)
end

function TalkTaskBase_C:StopDSL()
  if IsValid(self.DSLFlow) then
    self.DSLFlow:Stop()
  end
end

function TalkTaskBase_C:SkipDSL()
  if IsValid(self.DSLFlow) then
    self.DSLFlow:Skip()
  end
end

function TalkTaskBase_C:TrySkipDSL()
  if IsValid(self.DSLFlow) and self.DSLFlow.bAllowClick then
    self.DSLFlow:Skip()
    return true
  end
  return false
end

function TalkTaskBase_C:TryCompleteDSLTag()
  if IsValid(self.DSLFlow) and self.DSLFlow.bAllowClick and self.WaitQueue then
    self.WaitQueue:CompleteWaitItem("PlayScript")
  end
end

function TalkTaskBase_C:GetDialogueDataWithCheck(DialogueIterator)
  if not self.DialogueDataDecorator_C then
    self.DialogueDataDecorator_C = require("BluePrints.Story.Talk.Model.DialogueData." .. self.BasicTalkType .. "DialogueData")
  end
  local CurrentDialogueId = DialogueIterator.DialogueId
  local DialogueData = self.DialogueDataDecorator_C.New(self, CurrentDialogueId)
  if not DialogueData.Content then
    error("@@@ DialogueId\230\151\160\230\149\136", CurrentDialogueId)
    return
  end
  return DialogueData
end

function TalkTaskBase_C:RunDSL(DialogueData, OnFinished)
  if not self.DialogueFlowGraphComponent:CanUseDSLFlow() then
    DebugPrint("DialogueFlowGraphComponent Use LevelSequence, Forbidden DSLFlow", DialogueData.DialogueId)
    return OnFinished and OnFinished()
  end
  if IsValid(self.DSLFlow) then
    self.DSLFlow:Skip()
  end
  local DSLFlow = FExecutionFlowUtils:CreateFlow(DialogueData.DialogueId, self, function()
    self.DSLFlow = nil
    if OnFinished then
      OnFinished()
    end
  end)
  if DSLFlow then
    self.DSLFlow = DSLFlow
    DSLFlow:Start()
  end
end

function TalkTaskBase_C:CompositeExtraParams()
end

function TalkTaskBase_C:AddGuideUIForDialogue()
  DebugPrint("TalkTaskBase_C:AddGuideUIForDialogue", self)
  if self.DialogueGuideUI then
    return
  end
  if self.UI.Pos_Drive then
    local GuideUI = UIManager(GWorld.GameInstance):LoadUINew("TalkGuideUI")
    self.DialogueGuideUI = GuideUI
    self.UI.Pos_Drive:AddChild(GuideUI)
  else
    Utils.ScreenPrint("Error \229\175\185\232\175\157UI\228\184\173Pos_Drive\228\184\186\231\169\186\239\188\140\232\175\183\230\163\128\230\159\165\230\152\175\229\144\166\229\175\185\232\175\157\231\177\187\229\158\139\230\152\175\229\144\166\230\148\175\230\140\129\229\136\135\230\141\162\229\175\185\232\175\157UI\230\160\183\229\188\143" .. self:GetTalkType())
  end
end

function TalkTaskBase_C:ClearDialogueGuideUI()
  DebugPrint("TalkTaskBase_C:ClearDialogueGuideUI", self)
  if self.DialogueGuideUI then
    self.DialogueGuideUI = nil
    UIManager(GWorld.GameInstance):UnLoadUINew("TalkGuideUI")
    if self.UI and self.UI.Pos_Drive then
      self.UI.Pos_Drive:ClearChildren()
    else
      Utils.ScreenPrint("Error \229\175\185\232\175\157UI\228\184\173Pos_Drive\228\184\186\231\169\186\239\188\140\232\175\183\230\163\128\230\159\165\230\152\175\229\144\166\229\175\185\232\175\157\231\177\187\229\158\139\230\152\175\229\144\166\230\148\175\230\140\129\229\136\135\230\141\162\229\175\185\232\175\157UI\230\160\183\229\188\143" .. self:GetTalkType())
    end
  end
end

function TalkTaskBase_C:TryShowStoryPanelUI(DialogueData, Callback)
  if not DialogueData then
    Callback()
    return
  end
  DebugPrint("TryShowStoryPanelUI", DialogueData.DialoguePanelType)
  if not DialogueData.ShowStoryContent then
    Callback()
    return
  end
  local DialoguePanelType = DialogueData.DialoguePanelType
  local ShowStoryContent = DialogueData.ShowStoryContent
  local Type = ShowStoryContent.Type
  local Topic = ShowStoryContent.Topic
  local Content = ShowStoryContent.Content
  local AnimationName = ShowStoryContent.AnimationName
  if not Topic or not Content then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\228\184\173\229\188\185\229\135\186\233\152\133\232\175\187\233\148\153\232\175\175", string.format("\230\160\188\229\188\143\233\148\153\232\175\175\230\136\150\232\128\133content\227\128\129tpoic\228\184\186\231\169\186 DialogueId: \n            %d DialoguePanelType: %s", DialogueData.DialogueId, DialoguePanelType))
    Callback()
    return
  end
  self.StoryPanelUI = UIManager(GWorld.GameInstance):LoadUINew("NpcBiography", GText(Topic), GText(Content), AnimationName)
  if self.StoryPanelUI then
    self.StoryPanelUI:BindOnRealClose(function()
      self:TryReleaseStoryPanelUI()
      Callback()
    end)
    return
  end
  Callback()
  return
end

function TalkTaskBase_C:TryReleaseStoryPanelUI()
  local StoryPanelUI = self.StoryPanelUI
  self.StoryPanelUI = nil
  if IsValid(StoryPanelUI) then
    StoryPanelUI:UnBindOnRealClose()
    UIManager(GWorld.GameInstance):UnLoadUINew("NpcBiography")
  end
end

function TalkTaskBase_C:SwitchHideDialoguePanel(bHide)
  if self.UI.SwitchHideDialoguePanel then
    self.UI:SwitchHideDialoguePanel(bHide)
  end
end

function TalkTaskBase_C:CreateDialogueRecordComponent()
  self.DialogueRecordComponent = FDialogueRecordComponent:New(self, self.TaskData)
end

function TalkTaskBase_C:CreateDialogueFlowGraphComponent()
  self.DialogueFlowGraphComponent = FDialogueFlowGraphComponent:New(self, self.TaskData)
end

function TalkTaskBase_C:CreateComponents()
  self:CreateDialogueRecordComponent()
  self:CreateDialogueFlowGraphComponent()
end

function TalkTaskBase_C:OnTalkStart(TalkTaskData)
  self.TalkContext:OnTalkStart(self)
  if TalkTaskData.bHideMonsters then
    self.HideAllMonstersComponent = FHideAllMonstersComponent:New()
  end
  if TalkTaskData.bHideNpcs then
    self.HideAllNpcsComponent = FHideAllNpcsComponent:New()
  end
end

function TalkTaskBase_C:SwitchEnableComponent(Comp, bEnable)
  if not Comp then
    return
  end
  if bEnable then
    if not self.ExecutedComps[Comp] then
      Comp:Execute()
      self:RecordExecutedComp(Comp)
    end
  else
    Comp:Resume()
    Comp = nil
  end
end

function TalkTaskBase_C:RecordExecutedComp(Comp)
  if Comp then
    self.ExecutedComps[Comp] = true
  end
end

function TalkTaskBase_C:SetOutport()
end

function TalkTaskBase_C:OnTalkEnd()
  self.TalkContext:OnTalkEnd()
end

function TalkTaskBase_C:ProcessShowHide(bIsBegin, bIsConnect)
  self:SwitchEnableComponent(self.HideAllBattleEntityComponent, bIsBegin)
  self:SwitchEnableComponent(self.HideAllEffectComponent, bIsBegin)
  if bIsBegin then
    if self.HideEffectComponent then
      self.HideEffectComponent:HideEffect(true)
    end
    if self.HideAllMonstersComponent then
      self.HideAllMonstersComponent:DoHide()
    end
    if self.HideAllNpcsComponent and false == bIsConnect then
      self.HideAllNpcsComponent:DoHide()
    end
    if self.TalkTaskData.bShowInteractiveActor then
      self.TalkContext:ShowInteractiveActor(true)
    end
    self.TalkContext:ShowHideInTalkActors()
  else
    if self.HideAllMonstersComponent then
      self.HideAllMonstersComponent:ResumeHide()
    end
    if self.HideAllNpcsComponent and false == bIsConnect then
      self.HideAllNpcsComponent:ResumeHide()
    end
    if self.HideEffectComponent then
      self.HideEffectComponent:HideEffect(false)
    end
  end
end

function TalkTaskBase_C:ResolveDialoguePanelType(DialoguePanelType)
  if DialoguePanelType then
    DialoguePanelType = string.lower(DialoguePanelType)
    local Type = TalkUtils:FindTargetString(DialoguePanelType, "type")
    local Style = TalkUtils:FindTargetString(DialoguePanelType, "style")
    Type = TalkUtils:FirstToUpper(Type)
    Style = TalkUtils:FirstToUpper(Style)
    DebugPrint("TalkTaskBase_C:ResolveDialoguePanelType", Type, Style)
    return {Type = Type, Style = Style}
  end
end

function TalkTaskBase_C:GetDebugMetaInfo()
  if self.DebugMetaInfo then
    return self.DebugMetaInfo
  end
  self.DebugMetaInfo = {}
  if not self.TalkTaskData then
    self.DebugMetaInfo["\228\187\187\229\138\161\230\149\176\230\141\174\228\184\186\231\169\186"] = self
    return self.DebugMetaInfo
  end
  local Data = self.TalkTaskData
  if Data.TalkNodeName then
    table.insert(self.DebugMetaInfo, {
      "\229\175\185\232\175\157\232\138\130\231\130\185\229\144\141\229\173\151",
      Data.TalkNodeName
    })
  end
  if Data.TalkTriggerId then
    table.insert(self.DebugMetaInfo, {
      "TalkTriggerId",
      Data.TalkTriggerId
    })
  end
  table.insert(self.DebugMetaInfo, {
    "\229\175\185\232\175\157\231\177\187\229\158\139",
    Data.TalkType
  })
  if Data.Key then
    table.insert(self.DebugMetaInfo, {
      "Key",
      Data.Key
    })
  end
  table.insert(self.DebugMetaInfo, {
    "\233\166\150\229\143\165\229\143\176\232\175\141ID",
    Data.FirstDialogueId
  })
  if Data.FlowAssetPath then
    table.insert(self.DebugMetaInfo, {
      "\229\175\185\232\175\157Flow Path",
      Data.FlowAssetPath
    })
  end
  return self.DebugMetaInfo
end

function TalkTaskBase_C:GetUINameByTalkType()
  if self.TalkType == "FreeSimple" then
    return "SimpleTalkUI"
  elseif self.TalkType == "FixSimple" then
    return "SimpleTalkUI"
  elseif self.TalkType == "Black" then
    return "BlackTalkUI"
  elseif self.TalkType == "BlackISS" then
    return "BlackTalkUI"
  elseif self.TalkType == "FaultBlack" then
    return "FaultBlackTalkUI"
  elseif self.TalkType == "White" then
    return "WhiteTalkUI"
  elseif self.TalkType == "Cinematic" then
    return "CinematicUI"
  elseif self.TalkType == "Impression" then
    return "ImpressionMainUI"
  elseif self.TalkType == "QuestImpression" then
    return "ImpressionMainUI"
  elseif "FixSimple" == self.BasicTalkType then
    return "SimpleTalkUI"
  elseif "Black" == self.BasicTalkType then
    return "BlackTalkUI"
  else
    local Title = "\232\142\183\229\143\150\229\175\185\232\175\157UI\229\144\141\229\173\151\233\148\153\232\175\175"
    local Message = "GetUINameByTalkType\230\142\165\229\143\163\228\184\141\230\148\175\230\140\129\230\173\164\229\175\185\232\175\157\231\177\187\229\158\139\239\188\154" .. self.TalkType
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, Title, Message)
    return "SimpleTalkUI"
  end
end

return TalkTaskBase_C
