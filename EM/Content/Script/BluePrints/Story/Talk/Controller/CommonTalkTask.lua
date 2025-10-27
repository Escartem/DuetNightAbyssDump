local TalkTaskState = require("BluePrints.Story.Talk.Base.TalkTaskState")
local FHideGameUIComponent = require("BluePrints.Story.Components.HideGameUIComponent")
local FPauseGameComponent = require("BluePrints.Story.Components.PauseGameComponent")
local FSetSequenceActorsIgnorePauseComponent = require("BluePrints.Story.Components.SetSequenceActorsIgnorePauseComponent")
local FDisableNpcPerformanceOptimizationComponent = require("BluePrints.Story.Components.DisableNpcPerformanceOptimizationComponent")
local FHideAllEffectComponent = require("BluePrints.Story.Components.HideAllEffectComponent")
local FSoundEffectComponent = require("BluePrints.Story.Components.SoundEffectComponent")
local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local FDisablePlayerInputComponent = require("BluePrints.Story.Components.DisablePlayerInputComponent")
local FDisableCameraArmComponent = require("BluePrints.Story.Components.DisableCameraArmComponent")
local FSwitchEmoIdleComponent = require("BluePrints.Story.Components.SwitchEmoIdleComponent")
local FDisableInteractiveComponent = require("BluePrints.Story.Components.DisableInteractiveComponent")
local FDialogueIterationComponent = require("BluePrints.Story.Components.DialogueIterationComponent")
local FDialogueWikiComponent = require("BluePrints.Story.Components.DialogueWikiComponent")
local FHideAllBattleEntityComponent = require("BluePrints.Story.Components.HideAllBattleEntityComponent")
local FStopPlayerActionComponent = require("BluePrints.Story.Components.StopPlayerActionComponent")
local FEnableCharacterDitherComponent = require("BluePrints.Story.Components.EnableCharacterDitherComponent")
local FDisableCharacterDitherComponent = require("BluePrints.Story.Components.DisableCharacterDitherComponent")
local FFreezeWorldCompositionComponent = require("BluePrints.Story.Components.FreezeWorldCompositionComponent")
local FSwitchToMasterComponent = require("BluePrints.Story.Components.SwitchToMasterComponent")
local FSetPlayerInvincibleComponent = require("BluePrints.Story.Components.SetPlayerInvincibleComponent")
local SimpleDialogueData_C = require("BluePrints.Story.Talk.Model.DialogueData").SimpleDialogueData_C
local ExpressionComp_C = require("BluePrints.Story.Talk.Controller.ExpressionComp")
local TalkAudioComp_C = require("BluePrints.Story.Talk.Controller.TalkAudioComp")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local TalkOptionData_C = require("BluePrints.Story.Talk.Model.TalkOptionData").TalkOptionData_C
local ETalkDependency = require("BluePrints.Story.Talk.Base.ETalkDependency")
local ETalkOptionType = require("BluePrints.Story.Talk.Model.TalkOptionData").ETalkOptionType
local EDialogueNodeType = TalkUtils.EDialogueNodeType
local WaitQueueTag = {
  CameraBlend = "CameraBlend",
  DelayTime = "DelayTime",
  CreateActors = "CreateActors",
  NpcRotateToPlayer = "NpcRotateToPlayer",
  PlayerRotateToNpc = "PlayerRotateToNpc",
  PlayerMove = "PlayerMove"
}
local WaitItemUniqueTag = {
  UIPlayDialogue = "UIPlayDialogue",
  PlayAction = "PlayAction",
  RotateTo = "RotateTo",
  Lookat = "Lookat",
  CameraBlend = "DialogueCameraBlend",
  PlayAudio = "PlayAudio",
  PlayScript = "PlayScript",
  WaitFlowEnd = "WaitFlowEnd"
}
local CommonTalkTask = Class({
  "BluePrints.Story.Talk.Controller.TalkTaskBase"
})

function CommonTalkTask:Start(TalkTaskData, TaskFinishedCallback)
  CommonTalkTask.Super.Start(self, TalkTaskData, TaskFinishedCallback)
  self:InitData(TalkTaskData, TaskFinishedCallback)
  if not self.TalkContext:RequestRegisterTalkTask(self, TalkTaskData.TalkType, TalkTaskData.BasicTalkType) then
    self:End(ETalkNodeFinishType.Out)
    return
  end
  if TalkTaskData.TalkNodeId == "1708484399604207502" then
    UKismetSystemLibrary.ExecuteConsoleCommand(GWorld.GameInstance, "r.MobilePostProcessFogOrVertexFog 0")
  end
  UKismetSystemLibrary.ExecuteConsoleCommand(GWorld.GameInstance, "r.AllowOcclusionQueries 0")
  self:InitUI()
  if not self:CheckResource() then
    self:TryFireEndingCallback(0, 0)
    return
  end
  self:OnTalkStart(TalkTaskData)
  EventManager:FireEvent(EventID.StartTalk, not TalkTaskData.bDisableGameInput, TalkTaskData.bExitOnline, "Talk")
  self:SwitchEnableComponent(self.DialogueWikiComponent, true)
  self:SwitchEnableComponent(self.SetPlayerInvincibleComponent, true)
  self:SwitchEnableComponent(self.FreezeWorldCompositionComponent, true)
  self:SwitchEnableComponent(self.DisablePlayerInputComponent, true)
  self:SwitchEnableComponent(self.DisableInteractiveComponent, true)
  self:SwitchEnableComponent(self.SoundEffectComponent, true)
  self:SwitchEnableComponent(self.HideGameUIComponent, true)
  self:SwitchEnableComponent(self.SwitchToMasterComponent, true)
  self:SwitchEnableComponent(self.SetSequenceActorsIgnorePauseComponent, true)
  self:SwitchEnableComponent(self.DisableCharacterDitherComponent, true)
  self:SwitchEnableComponent(self.EnableCharacterDitherComponent, true)
  self:SwitchEnableComponent(self.DisableNpcPerformanceOptimizationComponent, true)
  self:SwitchEnableComponent(self.DisableCameraArmComponent, true)
  self:SwitchEnableComponent(self.SwitchEmoIdleComponent, true)
  self:OnCinematicBegin()
  self.Player:PreEnterStory()
  self.UI:PreEnterTalkTask(self, self.TalkTaskData)
  if self.TalkTaskData.BlendInType == "FadeIn" then
    self:ScreenFadeIn(self.TalkTaskData.BlendInTime, function()
      self:TravelPlayer(self.TalkTaskData.BeginTargetPoint, function()
        self:SetViewTargetToStage(function()
          self:PreStartPerformance()
        end)
      end)
    end)
  else
    self:TravelPlayer(self.TalkTaskData.BeginTargetPoint, function()
      if 0 == TalkTaskData.BlendInTime then
        self:SetViewTargetToStage(function()
          self:PreStartPerformance()
        end)
      else
        self:PreStartPerformance()
      end
    end)
  end
end

function CommonTalkTask:End(TalkNodeFinishType, OptionIndex)
  DebugPrint("CommonTalkTask:End", TalkNodeFinishType, OptionIndex)
  if self.TalkTaskData.TalkNodeId == "1708484399604207502" then
    UKismetSystemLibrary.ExecuteConsoleCommand(GWorld.GameInstance, "r.MobilePostProcessFogOrVertexFog 1")
  end
  UKismetSystemLibrary.ExecuteConsoleCommand(GWorld.GameInstance, "r.AllowOcclusionQueries 1")
  self.Player:PreExitStory()
  self:Clear()
  self:OnTalkEnd()
  self:SwitchEnableComponent(self.DisableNpcPerformanceOptimizationComponent, false)
  self:SwitchEnableComponent(self.DisableCharacterDitherComponent, false)
  self:SwitchEnableComponent(self.EnableCharacterDitherComponent, false)
  self:SwitchEnableComponent(self.FreezeWorldCompositionComponent, false)
  self:SwitchEnableComponent(self.SetPlayerInvincibleComponent, false)
  self:SwitchEnableComponent(self.SwitchToMasterComponent, false)
  self:SwitchEnableComponent(self.DialogueWikiComponent, false)
  self:SwitchEnableComponent(self.SetSequenceActorsIgnorePauseComponent, false)
  self:SwitchEnableComponent(self.HideGameUIComponent, false)
  self:SwitchEnableComponent(self.DisableCameraArmComponent, false)
  self:SwitchEnableComponent(self.SwitchEmoIdleComponent, false)
  self.TalkContext:UnRegisterTalkTask(self)
  EventManager:FireEvent(EventID.EndTalk, not self.TalkTaskData.bDisableGameInput, self.TalkTaskData.bExitOnline, "Talk")
  self:TryFireEndingCallback(TalkNodeFinishType, OptionIndex)
  if self.TalkTaskData.TalkType == "PanFixSimple" then
    EventManager:FireEvent(EventID.FirstPanFixTalk)
  end
  self:TryReleaseStoryPanelUI()
end

function CommonTalkTask:Clear()
  CommonTalkTask.Super.Clear(self)
  if IsValid(self.StageViewTarget) then
    self.StageViewTarget:K2_DestroyActor()
    self.StageViewTarget = nil
  end
end

function CommonTalkTask:PreStartPerformance()
  self.TalkContext:ConditionalSetupCharacterShadowSetting(self.TalkTaskData)
  local WaitQueue = self.WaitQueueManager:CreateWaitQueue(self, {
    {
      Tag = WaitQueueTag.DelayTime
    },
    {
      Tag = WaitQueueTag.CreateActors
    },
    {
      Tag = WaitQueueTag.CameraBlend
    }
  }, nil, function()
    self:StartPerformance()
  end)
  if self.TalkTaskData.BlendInType == "FadeIn" then
    self.TalkTimerManager:AddTimer(self, self.ScreenEffectDurationSeconds, false, nil, nil, function()
      WaitQueue:CompleteWaitItem(WaitQueueTag.DelayTime)
    end)
  else
    WaitQueue:CompleteWaitItem(WaitQueueTag.DelayTime)
  end
  local BlackHandle = UIManager(self.TalkContext):ShowCommonBlackScreen({})
  self.TalkContext:CreateTalkActors(self, self.TalkTaskData.CreateTalkActors, function()
    UIManager(self.TalkContext):HideCommonBlackScreen(BlackHandle)
    WaitQueue:CompleteWaitItem(WaitQueueTag.CreateActors)
    local AfterCreateTalkActorsFunc = self.DefaultAfterCreateTalkActors
    if type(self[self.TalkTaskData.CameraType .. "AfterCreateTalkActors"]) == "function" then
      AfterCreateTalkActorsFunc = self[self.TalkTaskData.CameraType .. "AfterCreateTalkActors"]
    end
    if self.DialogueFlowGraphComponent:IsUseEmptyCamera() then
      AfterCreateTalkActorsFunc = self.DefaultAfterCreateTalkActors
    end
    AfterCreateTalkActorsFunc(self, self, self.TalkTaskData, self.TalkTaskData.CameraBlendEaseExp, {
      Func = function()
        WaitQueue:CompleteWaitItem(WaitQueueTag.CameraBlend)
      end
    })
  end, self.TalkTaskData.TalkStage)
end

function CommonTalkTask:StartPerformance()
  if self.TalkTaskData.BlendInType == "FadeIn" then
    self:ScreenFadeOut(self.BeginFadeOutTime, function()
    end)
  end
  self.UI:PostEnterTalkTask(self, self.TalkTaskData)
  self:BindDelegate()
  self:SetCanResponseUIClick(true)
  self:SwitchEnableComponent(self.PauseGameComponent, true)
  self:ProcessShowHide(true, -1 == self.TalkTaskData.BlendInTime)
  self:TryPlaySequence()
  self:StartDialogueIteration()
end

function CommonTalkTask:Finish(TalkNodeFinishType, OptionIndex)
  DebugPrint("CommonTalkTask:Finish", TalkNodeFinishType, OptionIndex)
  self.FinishType = self.OverriddenFinishType or TalkNodeFinishType
  self.FinishOptionIndex = self.OverriddenFinishIndex or OptionIndex
  local TalkTaskData = self.TalkTaskData
  if self.FinishType == ETalkNodeFinishType.Fail and TalkTaskData.bOverrideFailBlend then
    TalkTaskData.BlendOutType = TalkTaskData.FailOutType
    TalkTaskData.BlendOutTime = TalkTaskData.FailOutTime
  end
  self.TalkTaskState = TalkTaskState.OnFinish
  if self.ExpressionComp then
    self.ExpressionComp:Clear()
  end
  self:UnbindDelegate()
  self:RemoveAutoPlayNextDialogueTimer()
  self:SwitchEnableComponent(self.SoundEffectComponent, false)
  self:SwitchEnableComponent(self.PauseGameComponent, false)
  self:BlendFadeOutNew()
end

function CommonTalkTask:ScreenFadeIn(FadeInSeconds, Callback)
  self.BlackUI:FadeIn(FadeInSeconds, {
    Obj = self,
    Func = Callback,
    Params = {}
  })
end

function CommonTalkTask:ScreenFadeOut(FadeOutSeconds, Callback)
  self.BlackUI:FadeOut(FadeOutSeconds, {
    Obj = self,
    Func = Callback,
    Params = {}
  })
end

function CommonTalkTask:BlendFadeOutNew()
  if self.TalkTaskData.BlendOutType == "BlendOut" then
    self:BlendOut()
  else
    self:TalkEndFadeIn()
  end
end

function CommonTalkTask:BlendOut()
  self:ClearAudio()
  self.UI:PreExitTalkTask(self, self.TalkTaskData)
  self.TalkActionManager:Clear(self)
  if self.TalkTaskData.BasicTalkType == "FixSimple" then
    self.TalkContext:NPCPlayDefaultAction(self, self.TalkTaskData.CreateTalkActors)
  end
  self.TalkContext:DestoryTalkActors(self, self.TalkTaskData.RemoveTalkActors)
  self:TryHideDialogueBlackUI()
  self:StopDSL()
  self:TryEndFlowGraph()
  if self.BlackUI then
    self.BlackUI:SetToTransparent()
  end
  local Callback = {
    Obj = self,
    Func = self.OnBlendOutFinished,
    Params = {}
  }
  local TalkTaskData = self.TalkTaskData
  if TalkTaskData.CameraType == "FreeCamera" then
    self:FreeSimpleBlendOutInternal(Callback)
  elseif TalkTaskData.CameraType == "SequenceCamera" then
    self:CinematicBlendOutInternal(Callback)
  else
    self:BlendOutFlow(Callback)
  end
end

function CommonTalkTask:FreeSimpleBlendOutInternal(Callback)
  local TalkTaskData = self.TalkTaskData
  local TalkTask = self
  self.TalkActionManager:FreeTalkNpcRotateRecover(self.TalkContext.InteractiveActor, TalkTask, TalkTaskData)
  self.TalkContext:ConditionalRecoverCharacterShadowSetting(TalkTaskData)
  self:SetViewTargetToPlayer(function()
    self:TravelPlayer(self.TalkTaskData.EndTargetPoint, function()
      self.TalkCameraManager:FreeSimpleCameraBlendOutTo(Callback, TalkTaskData, self.Player, TalkTaskData.BlendOutTime, nil)
      if TalkTaskData.CameraLookAtTartgetPoint then
        UE4.UAsyncCameraLookToTargetAction.CameraLookToNewTargetPoint(self.TalkContext, TalkTaskData.CameraLookAtTartgetPoint, 0, nil, false)
      end
    end)
  end)
end

function CommonTalkTask:CinematicBlendOutInternal(Callback)
  DebugPrint("CommonTalkTask:CinematicBlendOutInternal")
  local TalkTaskData = self.TalkTaskData
  self.TalkContext:ConditionalRecoverCharacterShadowSetting(TalkTaskData)
  self:SetViewTargetToPlayer(function()
    self:TravelPlayer(self.TalkTaskData.EndTargetPoint)
  end)
  self.TalkCameraManager:SwitchCameraRole("Player")
  if TalkTaskData.CameraLookAtTartgetPoint then
    UE4.UAsyncCameraLookToTargetAction.CameraLookToNewTargetPoint(self, TalkTaskData.CameraLookAtTartgetPoint, 0, nil, false)
  end
  self.TalkCameraManager:ClearSequenceCamera()
  self.TalkContext:TryFireCallback(Callback)
end

function CommonTalkTask:BlendOutFlow(Callback)
  DebugPrint("CommonTalkTask:BlendOutFlow")
  local TalkTask = self
  local TalkTaskData = self.TalkTaskData
  local TalkPawnSwitch = "Player"
  local EaseExp = TalkTaskData.CameraBlendEaseExp
  self.TalkContext:ConditionalRecoverCharacterShadowSetting(TalkTaskData)
  self.TalkCameraManager:CameraBlendToNew(TalkTaskData.Key or TalkTask, self.Player, TalkTaskData.BlendOutTime, TalkPawnSwitch, {
    Func = function()
      self:SetViewTargetToPlayer(function()
        self:TravelPlayer(self.TalkTaskData.EndTargetPoint, function()
          if TalkTaskData.CameraLookAtTartgetPoint then
            UE4.UAsyncCameraLookToTargetAction.CameraLookToNewTargetPoint(self, TalkTaskData.CameraLookAtTartgetPoint, 0, nil, false)
          end
          self.TalkContext:TryFireCallback(Callback)
        end)
      end)
    end
  }, nil, EaseExp)
end

function CommonTalkTask:OnBlendOutFinished()
  DebugPrint("CommonTalkTask:OnBlendOutFinished")
  self:ProcessShowHide(false, -1 == self.TalkTaskData.BlendOutTime)
  self.UI:PostExitTalkTask(self, self.TalkTaskData)
  UIManager(GWorld.GameInstance):UnLoadUINew(self:GetUIName())
  self:SwitchEnableComponent(self.DisablePlayerInputComponent, false)
  self:SwitchEnableComponent(self.DisableInteractiveComponent, false)
  self:SwitchEnableComponent(self.HideAllEffectComponent, false)
  self.TalkContext:UnRegisterTalkTask(self)
  self:End(self.FinishType, self.FinishOptionIndex)
end

function CommonTalkTask:TalkEndFadeIn()
  DebugPrint("CommonTalkTask:TalkEndFadeIn")
  if -1 == self.TalkTaskData.BlendOutTime then
    self.FinishFadeInTime = 0
  end
  self.BlackUI:FadeIn(self.FinishFadeInTime, {
    Func = self.OnTalkEndFadeInFinished,
    Obj = self,
    Params = {}
  })
end

function CommonTalkTask:OnTalkEndFadeInFinished()
  DebugPrint("CommonTalkTask:OnTalkEndFadeInFinished")
  self:ClearAudio()
  self.UI:PreExitTalkTask(self, self.TalkTaskData)
  self.UI:PostExitTalkTask(self, self.TalkTaskData)
  self.TalkCameraManager:SwitchToPlayer()
  self:TryHideDialogueBlackUI()
  self.TalkActionManager:Clear(self)
  if self.TalkTaskData.BasicTalkType == "FixSimple" then
    self.TalkContext:NPCPlayDefaultAction(self, self.TalkTaskData.CreateTalkActors)
  end
  self.TalkContext:DestoryTalkActors(self, self.TalkTaskData.RemoveTalkActors)
  self:ProcessShowHide(false, -1 == self.TalkTaskData.BlendOutTime)
  self:StopDSL()
  self:TryEndFlowGraph()
  self:SetViewTargetToPlayer(function()
    self:TravelPlayer(self.TalkTaskData.EndTargetPoint, function()
      self:DoAndUnloadSth()
      self:TalkEndFadeOut()
    end)
  end)
end

function CommonTalkTask:DoAndUnloadSth()
  DebugPrint("UnloadSth")
  local TalkTaskData = self.TalkTaskData
  local TalkTask = self
  local TalkPawnSwitch
  if TalkTaskData.CameraType == "FreeCamera" then
    TalkPawnSwitch = "Player"
  end
  if TalkTaskData.CameraType == "FreeCamera" then
    self.TalkActionManager:FreeTalkNpcRotateRecover(self.TalkContext.InteractiveActor, TalkTask, TalkTaskData)
  end
  self.TalkContext:ConditionalRecoverCharacterShadowSetting(TalkTaskData)
  if TalkTaskData.CameraType ~= "SequenceCamera" then
    self.TalkCameraManager:CameraBlendToNew(TalkTaskData.Key or TalkTask, self.Player, 0, TalkPawnSwitch, nil)
  else
    self.TalkCameraManager:ClearSequenceCamera()
    self.TalkCameraManager:CameraBlendToNew(TalkTaskData.Key or TalkTask, self.Player, 0, "Player", nil)
  end
  if TalkTaskData.CameraLookAtTartgetPoint then
    UE4.UAsyncCameraLookToTargetAction.CameraLookToNewTargetPoint(self, TalkTaskData.CameraLookAtTartgetPoint, 0, nil, false)
  end
end

function CommonTalkTask:TalkEndFadeOut()
  self.BlackUI:FadeOut(self.TalkTaskData.BlendOutTime, {
    Func = function()
      if self.BlackUI then
        self.BlackUI:SetToTransparent()
      end
    end,
    Obj = self,
    Params = {}
  })
  self:OnTalkEndFadeOutFinished()
end

function CommonTalkTask:OnTalkEndFadeOutFinished()
  DebugPrint("CommonTalkTask:OnTalkEndFadeOutFinished")
  UIManager(GWorld.GameInstance):UnLoadUINew(self:GetUIName())
  self.TalkContext:UnRegisterTalkTask(self)
  self:SwitchEnableComponent(self.DisablePlayerInputComponent, false)
  self:SwitchEnableComponent(self.DisableInteractiveComponent, false)
  self:End(self.FinishType, self.FinishOptionIndex)
end

function CommonTalkTask:TravelPlayer(TargetPoint, OnFinished)
  if not IsValid(TargetPoint) then
    if OnFinished then
      OnFinished()
    end
    return
  end
  local WorldCompositionSubSystem = USubsystemBlueprintLibrary.GetWorldSubsystem(self.TalkContext, UWorldCompositionSubSystem)
  if not IsValid(WorldCompositionSubSystem) then
    if OnFinished then
      OnFinished()
    end
    return
  end
  local BlackHandle = UIManager(self.TalkContext):ShowCommonBlackScreen({})
  WorldCompositionSubSystem:RequestAsyncTravel_Fast(self.Player, TargetPoint:GetTransform(), {
    self.TalkContext,
    function()
      UIManager(self.TalkContext):HideCommonBlackScreen(BlackHandle)
      if OnFinished then
        OnFinished()
      end
    end
  })
  EventManager:FireEvent(EventID.SetPlayerLocWithLoadLevel)
end

function CommonTalkTask:SetViewTargetToStage(OnFinished)
  local Stage = self.TalkTaskData.TalkStage
  if not IsValid(Stage) then
    if OnFinished then
      OnFinished()
    end
    return
  end
  self.StageViewTarget = GWorld.GameInstance:GetWorld():SpawnActor(ACameraActor, Stage:GetTransform())
  self:TravelViewTarget(self.StageViewTarget, self.TalkTaskData.bTravelFullLoadWorldComposition, OnFinished)
end

function CommonTalkTask:SetViewTargetToPlayer(OnFinished)
  local Stage = self.TalkTaskData.TalkStage
  if not IsValid(Stage) then
    if OnFinished then
      OnFinished()
    end
    return
  end
  self:TravelViewTarget(self.Player, self.TalkTaskData.bTravelFullLoadWorldComposition, OnFinished)
end

function CommonTalkTask:TravelViewTarget(ViewTarget, bIsFullLoad, OnFinished)
  if not IsValid(ViewTarget) then
    if OnFinished then
      OnFinished()
    end
    return
  end
  local WorldCompositionSubSystem = USubsystemBlueprintLibrary.GetWorldSubsystem(self.TalkContext, UWorldCompositionSubSystem)
  if not IsValid(WorldCompositionSubSystem) then
    if OnFinished then
      OnFinished()
    end
    return
  end
  local BlackHandle = UIManager(self.TalkContext):ShowCommonBlackScreen({})
  WorldCompositionSubSystem:SetViewTargetWithWC(ViewTarget, {
    self.TalkContext,
    function()
      UIManager(self.TalkContext):HideCommonBlackScreen(BlackHandle)
      if OnFinished then
        OnFinished()
      end
    end
  }, bIsFullLoad)
end

function CommonTalkTask:StartDialogueIteration()
  self.IgnoreActionMontageBlendInTime = true
  self.DialogueIterationComponent:Start()
  self.IgnoreActionMontageBlendInTime = false
end

function CommonTalkTask:SkipOption(DialogueId)
  local DialogueData = DataMgr.Dialogue[DialogueId]
  if not DialogueData then
    DebugPrint("lhr@Dialogue Iteration Error: \233\128\137\233\161\185\231\154\132DialogueData\228\184\186\231\169\186", DialogueId)
    return
  end
  DebugPrint("CommonTalkTask@Skipping Option", DialogueId)
  self:RunDSL(DialogueData)
  self:SkipDSL()
end

function CommonTalkTask:SkipDialogue()
  local NodeType = self.DialogueIterationComponent:GetCurrentNodeType()
  if NodeType ~= EDialogueNodeType.Dialogue then
    DebugPrint("lhr@Dialogue Iteration Error: NodeType 2", NodeType, "\228\184\141\229\144\136\230\179\149")
    return
  end
  local Dialogue = self.DialogueIterationComponent:GetDialogue()
  if not Dialogue then
    DebugPrint("lhr@Dialogue Iteration Error: Dialogue\228\184\186\231\169\186")
    return
  end
  if self.WaitQueue then
    self.WaitQueue:CloseWaitQueue()
  end
  self.DialogueIterationComponent:ForceToDialogueEnd(true)
  DebugPrint("CommonTalkTask@Skipping Dialogue", self.DialogueIterationComponent:GetDialogue())
  self:SkipDSL()
end

function CommonTalkTask:PlayDialogue(bPauseResume, bSkipping)
  if bPauseResume then
    return
  end
  local NodeType = self.DialogueIterationComponent:GetCurrentNodeType()
  if NodeType ~= EDialogueNodeType.Dialogue then
    DebugPrint("lhr@Dialogue Iteration Error: NodeType", NodeType, "\228\184\141\229\144\136\230\179\149")
    return
  end
  local Dialogue = self.DialogueIterationComponent:GetDialogue()
  if not Dialogue then
    DebugPrint("lhr@Dialogue Iteration Error: Dialogue\228\184\186\231\169\186")
    return
  end
  UIManager(GWorld.GameInstance):UnLoadUINew("ReasoningCollect")
  if Dialogue.DetectiveQuestionId then
    UIManager(GWorld.GameInstance):LoadUINew("ReasoningCollect", Dialogue.DetectiveQuestionId)
  end
  local CurrentDialogueId = Dialogue.DialogueId
  DebugPrint("CommonTalkTask:PlayDialogue:", CurrentDialogueId)
  local DialogueData = SimpleDialogueData_C.New(self, CurrentDialogueId, self.TalkContext)
  if bSkipping then
    self:RunDSL(DialogueData)
    self.UI:PlayDialogue(self, DialogueData, self.TalkTaskData)
    return
  end
  self:RemoveAutoPlayNextDialogueTimer()
  self:SetDialogueTypingFinished(false)
  self:SetPlayDialogueTaskFinished(false)
  if not DialogueData.Content then
    self:IterateDialogue()
    return
  end
  if DialogueData.ShowStoryContent then
    self:TryShowStoryPanelUI(DialogueData, function()
      self:IterateDialogue()
    end)
    return
  end
  self:OnPlayingDialogue(Dialogue)
  if DialogueData.bIsBlack then
    self:TryShowDialogueBlackUI()
  else
    self:TryHideDialogueBlackUI()
  end
  self.TalkTaskState = TalkTaskState.PlayingDialogue
  if self.WaitQueue then
    self.WaitQueue:CloseWaitQueue()
  end
  self.WaitQueue = self.WaitQueueManager:CreateWaitQueue(self, {
    {
      Tag = WaitItemUniqueTag.UIPlayDialogue
    },
    {
      Tag = WaitItemUniqueTag.PlayAudio
    },
    {
      Tag = WaitItemUniqueTag.PlayScript,
      Condition = function()
        return DialogueData.Scripts
      end
    },
    {
      Tag = WaitItemUniqueTag.WaitFlowEnd,
      Condition = function()
        return DialogueData.bWaitFlowEnd
      end
    }
  }, self, self.OnTaskPlayDialogueFinished)
  local WaitQueuePointer = self.WaitQueue
  self:SetCanResponseUIClick(false)
  if self.EnableClickTimer then
    self.TalkTimerManager:DestroyTimer(self, self.EnableClickTimer)
  end
  self.EnableClickTimer = self.TalkTimerManager:AddTimer(self, DialogueData.AllowClickTime, nil, nil, nil, function()
    DebugPrint("EnableClickDelayTime")
    self:SetCanResponseUIClick(true)
  end)
  self.TalkAudioComp:PlayDialogue(DialogueData, self.TalkTaskData, self, {
    Func = function()
      WaitQueuePointer:CompleteWaitItem(WaitItemUniqueTag.PlayAudio)
    end
  }, true)
  self.DialogueDuration = DialogueData.Duration
  self.bAutoToNext = DialogueData.bAutoToNext
  self.UI:PlayDialogue(self, DialogueData, self.TalkTaskData)
  self:RunDSL(DialogueData, function()
    WaitQueuePointer:CompleteWaitItem(WaitItemUniqueTag.PlayScript)
  end)
  self:RecordDialogueCompleted(DialogueData.DialogueId)
  self.DialogueWikiComponent:CompletePlayDialogue(Dialogue.RelatedWikiId)
end

function CommonTalkTask:ForceCompleteDialogue()
  self.UI:SetTextBorderHidden(true)
end

function CommonTalkTask:InitData(TalkTaskData, TaskFinishedCallback)
  self.ExecutedComps = {}
  self.NodeFinished_Callback = TaskFinishedCallback
  self.TalkTaskData = TalkTaskData
  self.TalkContext = TalkTaskData.TalkContext
  self.TalkTimerManager = self.TalkContext.TalkTimerManager
  self.TalkCameraManager = self.TalkContext.TalkCameraManager
  self.WaitQueueManager = self.TalkContext.WaitQueueManager
  self.TalkActionManager = self.TalkContext.TalkActionManager
  self.bForceAutoPlay = false
  self.bResponseUIClick = false
  self.bTaskPlayDialogueFinished = false
  self.ScreenEffectDurationSeconds = self.TalkTaskData.ScreenEffectDurationSeconds
  self.FinishFadeInTime = self.TalkTaskData.FinishFadeInTime
  self.BeginFadeOutTime = self.TalkTaskData.BeginFadeOutTime
  self.Player = TalkTaskData.Player
  self.TalkDelegateManager = self.TalkContext.TalkDelegateManager
  self.IgnoreActionMontageBlendInTime = false
end

function CommonTalkTask:InitUI()
  self:SetUIName(self.TalkTaskData.UIName)
  self.UI = UIManager(GWorld.GameInstance):LoadUINew(self.TalkTaskData.UIName)
  self.UI:SetUpTalkTask(self)
  self.TalkTaskData.UI = self.UI
  self:TryCreateTalkCommonBlackUI()
end

function CommonTalkTask:HideUI(bHidden, HideTag)
  if IsValid(self.UI) then
    if bHidden then
      self.UI:Hide(HideTag)
    else
      self.UI:Show(HideTag)
    end
  end
end

function CommonTalkTask:TryCreateDialogueBlackUI()
  self.DialogueBlackUI = self.DialogueBlackUI or self.TalkContext:GetDialogueBlackUI()
end

function CommonTalkTask:TryCreateTalkCommonBlackUI()
  self.BlackUI = self.BlackUI or self.TalkContext:GetSimpleBlackUI()
end

function CommonTalkTask:TryHideDialogueBlackUI()
  if self.DialogueBlackUI then
    self.DialogueBlackUI:SetToTransparent()
  end
end

function CommonTalkTask:TryShowDialogueBlackUI()
  self:TryCreateDialogueBlackUI()
  if self.DialogueBlackUI then
    self.DialogueBlackUI:SetToBlack()
  end
end

function CommonTalkTask:CreateDialogueIteratorComponent()
  self.DialogueIterationComponent = FDialogueIterationComponent:New(DataMgr.Dialogue, self.TalkTaskData.FirstDialogueId, self)
end

function CommonTalkTask:CreateDialogueWikiComponent()
  self.DialogueWikiComponent = FDialogueWikiComponent:New(self)
end

function CommonTalkTask:CreateCharacterDitherComponent()
  if self.TalkTaskData.CameraType == "FreeCamera" then
    self.EnableCharacterDitherComponent = FEnableCharacterDitherComponent:New(self.TalkContext)
  elseif self.TalkTaskData.CameraType == "FixedCamera" or self.TalkTaskData.CameraType == "SequenceCamera" then
    self.DisableCharacterDitherComponent = FDisableCharacterDitherComponent:New(self.TalkContext)
  end
end

function CommonTalkTask:CreateDisablePlayerInputComponent()
  if self.TalkTaskData.bDisableGameInput then
    self.DisablePlayerInputComponent = FDisablePlayerInputComponent:New(self.TalkTaskData.Player, self.TalkTaskData)
  end
end

function CommonTalkTask:CreateDisableCameraArmComponent()
  if self.TalkTaskData.CameraType == "SequenceCamera" then
    self.DisableCameraArmComponent = FDisableCameraArmComponent:New(self.TalkTaskData.Player)
  end
end

function CommonTalkTask:CreateSwitchEmoIdleComponent()
  if self.TalkTaskData.PlayerSwitchEmoIdle then
    self.SwitchEmoIdleComponent = FSwitchEmoIdleComponent:New(self.TalkTaskData.Player)
  end
end

function CommonTalkTask:CreateStopPlayerActionComponent()
  DebugPrint("TTT:CreateStopPlayerActionComponent", self.TalkTaskData.bDisableGameInput, self.TalkTaskData.bPlayerMove)
  if self.TalkTaskData.bDisableGameInput and self.TalkTaskData.bPlayerMove then
    self.StopPlayerActionComponent = FStopPlayerActionComponent:New(self.TalkTaskData.Player)
  end
end

function CommonTalkTask:CreateHideAllBattleEntityComponent()
  if self.TalkTaskData.bHideAllBattleEntity then
    self.HideAllBattleEntityComponent = FHideAllBattleEntityComponent:New(self.TalkContext)
  end
end

function CommonTalkTask:CreateSetSequenceActorsIgnorePauseComponent()
  if self.TalkTaskData.bPauseGameGlobal and Utils.IsStandAlone(GWorld.GameInstance) then
    self.SetSequenceActorsIgnorePauseComponent = FSetSequenceActorsIgnorePauseComponent:New(self.TalkContext, self.TalkTaskData)
  end
end

function CommonTalkTask:CreateDisableNpcPerformanceOptimizationComponent()
  if self.TalkTaskData.bDisableNpcOptimization then
    self.DisableNpcPerformanceOptimizationComponent = FDisableNpcPerformanceOptimizationComponent:New()
  end
end

function CommonTalkTask:CreateHideGameUIComponent()
  if self.TalkTaskData.bDisableGameInput then
    self.HideGameUIComponent = FHideGameUIComponent:New()
  end
end

function CommonTalkTask:CreateSoundEffectComponent()
  if self.TalkTaskData.bDisableGameInput then
    self.SoundEffectComponent = FSoundEffectComponent:New()
  end
end

function CommonTalkTask:CreateFreezeWCComponent()
  if self.TalkTaskData.bFreezeWorldComposition then
    self.FreezeWorldCompositionComponent = FFreezeWorldCompositionComponent:New()
  end
end

function CommonTalkTask:CreateSwitchToMasterComponent()
  if self.TalkTaskData.SwitchToMasterType then
    self.SwitchToMasterComponent = FSwitchToMasterComponent:New(self.TalkTaskData.SwitchToMasterType, self.TalkTaskData)
  end
end

function CommonTalkTask:CreateSetPlayerInvincibleComponent()
  if self.TalkTaskData.SetPlayerInvincible then
    self.SetPlayerInvincibleComponent = FSetPlayerInvincibleComponent:New()
  end
end

function CommonTalkTask:CreateDisableInteractiveComponent()
  if self.TalkTaskData.bDisableGameInput then
    self.DisableInteractiveComponent = FDisableInteractiveComponent:New(self.TalkTaskData.Player)
  end
end

function CommonTalkTask:CreateExpressionComponent()
  self.ExpressionComp = ExpressionComp_C.New()
end

function CommonTalkTask:CreateTalkAudioComponent()
  self.TalkAudioComp = TalkAudioComp_C.New()
end

function CommonTalkTask:CreatePauseGameComponent()
  if self.TalkTaskData.bPauseGameGlobal and Utils.IsStandAlone(GWorld.GameInstance) then
    self.PauseGameComponent = FPauseGameComponent:New(self.TalkContext)
  end
end

function CommonTalkTask:CreateHideEffectComponent()
  if self.TalkTaskData.bHideEffectCreature then
    self.HideAllEffectComponent = FHideAllEffectComponent:New()
  end
end

function CommonTalkTask:FinishDialogue()
  UIManager(GWorld.GameInstance):UnLoadUINew("ReasoningCollect")
  self:RemoveAutoPlayNextDialogueTimer()
  local OptionData = self.TalkTaskData.OptionData
  if OptionData:IsShow() and #OptionData.Options > 0 then
    self:ShowTalkOptions(OptionData)
  else
    self:Finish(ETalkNodeFinishType.Out)
  end
end

function CommonTalkTask:BindDelegate()
  if self.UI then
    self.UI:AddDelegate_DialoguePanelClicked(self, self.OnUIDialoguePanelClicked)
    self.UI:AddDelegate_WholeDialogueTypingFinished(self, self.OnUIWholeDialogueTypingFinished)
    self.UI:AddDelegate_AutoPlayChanged(self, self.OnAutoPlayChanged)
    self.UI:AddDelegate_SkipButtonClicked(self, self.OnSkipButtonClicked)
    self.UI:AddDelegate_StopStoryline(self, self.StopStoryline)
  end
end

function CommonTalkTask:UnbindDelegate()
  if self.UI then
    self.UI:RemoveDelegate_DialoguePanelClicked(self, self.OnUIDialoguePanelClicked)
    self.UI:RemoveDelegate_WholeDialogueTypingFinished(self, self.OnUIWholeDialogueTypingFinished)
    self.UI:RemoveDelegate_AutoPlayChanged(self, self.OnAutoPlayChanged)
    self.UI:RemoveDelegate_SkipButtonClicked(self, self.OnSkipButtonClicked)
    self.UI:RemoveDelegate_StopStoryline(self, self.StopStoryline)
  end
end

function CommonTalkTask:ShowTalkOptions(OptionData)
  self:SetCanResponseUIClick(false)
  self:TryHideDialogueBlackUI()
  self.TalkTaskState = TalkTaskState.ShowingOption
  local CopiedOptionTexts = {}
  for i, Option in ipairs(OptionData.Options) do
    table.insert(CopiedOptionTexts, {
      Index = Option.Index,
      Text = Option.OptionText
    })
  end
  local FinalOptionTexts = {}
  if OptionData.OptionType == "random" and OptionData.RandomOptionNum > 0 then
    local FinialOptionNum = math.min(#CopiedOptionTexts, self.TalkTaskData.RandomOptionNum)
    for i = 1, FinialOptionNum do
      local RandomIndex = math.random(1, #CopiedOptionTexts)
      local RandOption = CopiedOptionTexts[RandomIndex]
      table.insert(FinalOptionTexts, {
        Index = RandOption.Index,
        Text = RandOption.Text
      })
      table.remove(CopiedOptionTexts, RandomIndex)
    end
  else
    FinalOptionTexts = CopiedOptionTexts
  end
  OptionData.bTalkOptions = true
  self.UI:ShowOptions(self, FinalOptionTexts, OptionData, function(ItemIdx, SpecifyFinishType)
    self.UI:ClearOptions()
    local Option = OptionData.Options[ItemIdx]
    if Option.OverrideBlend then
      self.TalkTaskData.BlendOutType = Option.OverrideOutype
      self.TalkTaskData.BlendOutTime = Option.OverrideOutTime
    end
    local OptionDialogueData = DataMgr.Dialogue[Option.OptionId]
    self:RunDSL(OptionDialogueData, function()
      self:SetCanResponseUIClick(true)
      if SpecifyFinishType then
        self:Finish(SpecifyFinishType)
      else
        local Options = {}
        for i, Option in ipairs(OptionData.Options) do
          table.insert(Options, Option.OptionId)
        end
        local OptionType = OptionData.OptionType
        local bImpression = false
        if OptionType == ETalkOptionType.Check then
          OptionType = "Check"
          bImpression = true
        elseif OptionType == ETalkOptionType.Plus then
          OptionType = "Plus"
          bImpression = true
        end
        self.DialogueRecordComponent:OnOptionRecord(Options[ItemIdx], {
          bImpression = bImpression,
          OptionType = OptionType,
          Options = Options,
          VisitedOptions = {},
          SelectedOption = Options[ItemIdx]
        })
        self:Finish(ETalkNodeFinishType.Option, ItemIdx)
      end
    end)
  end)
end

function CommonTalkTask:ShowDialogueOptions(OptionIds)
  DebugPrint("CommonTalkTask:ShowDialogueOptions", self, OptionIds)
  self:RemoveAutoPlayNextDialogueTimer()
  self:SetDialogueTypingFinished(false)
  self:SetPlayDialogueTaskFinished(false)
  self:SetCanResponseUIClick(false)
  self:TryHideDialogueBlackUI()
  self.TalkTaskState = TalkTaskState.ShowingOption
  local OptionTexts = {}
  for i, OptionId in ipairs(OptionIds) do
    table.insert(OptionTexts, {
      Index = i,
      Text = TalkUtils:OptionIdToContent(OptionId),
      bIsSelected = self.DialogueIterationComponent:IsSelectedOption(OptionId)
    })
  end
  local DialougeType = "null"
  for i, OptionId in ipairs(OptionIds) do
    local DialogueData = DataMgr.Dialogue[OptionId]
    local Type = "dialogue"
    if DialogueData.ImprCheckId then
      Type = "check"
    end
    if DialogueData.ImprPlusId then
      Type = "plus"
    end
    if "null" ~= DialougeType and Type ~= DialougeType then
      local Message = "Dialogue\229\144\132\233\128\137\233\161\185\228\185\139\233\151\180\231\177\187\229\158\139\228\184\141\229\144\140\nDialogueId: " .. OptionId
      local Title = "\229\141\176\232\177\161\231\179\187\231\187\159\233\148\153\232\175\175"
      UStoryLogUtils.PrintToFeiShu(self, Title, Message)
      DebugPrint("lhr@Dialogue\229\144\132\233\128\137\233\161\185\228\185\139\233\151\180\231\177\187\229\158\139\228\184\141\229\144\140\nDialogueId:", OptionId)
      return
    end
    DialougeType = Type
  end
  local NewOptionData = TalkOptionData_C.New(DialougeType, nil, OptionIds, self.DialogueIterationComponent)
  self.UI:ShowOptions(self, OptionTexts, NewOptionData, function(ItemIdx, SpecifyFinishType)
    self.UI:ClearOptions()
    local OptionId = OptionIds[ItemIdx]
    local OptionDialogueData = DataMgr.Dialogue[OptionId]
    if SpecifyFinishType == ETalkNodeFinishType.Fail then
      self:SetOutport(SpecifyFinishType)
    end
    self:RunDSL(OptionDialogueData, function()
      self:SetCanResponseUIClick(true)
      self:StopDSL()
      self:IterateDialogue(OptionId, SpecifyFinishType)
    end)
  end)
end

function CommonTalkTask:SetOutport(OutportName, OptionIndex)
  self.OverriddenFinishType = OutportName
  self.OverriddenFinishIndex = OptionIndex
end

function CommonTalkTask:OnTaskPlayDialogueFinished()
  DebugPrint("CommonTalkTask:OnTaskPlayDialogueFinished", self.bForceAutoPlay, self.TalkTaskState)
  self:SetPlayDialogueTaskFinished(true)
  self.UI:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if self.bAutoToNext then
    self.bAutoToNext = nil
    self:IterateDialogue()
    return
  end
  if self:IsAutoPlay() then
    self.bForceAutoPlay = false
    self:AddAutoPlayNextDialogueTimer()
  end
end

function CommonTalkTask:OnUIWholeDialogueTypingFinished(FinishOrPageEnd, bForceAutoPlay)
  DebugPrint("OnUIWholeDialogueTypingFinished", FinishOrPageEnd, bForceAutoPlay)
  if FinishOrPageEnd then
    self:SetDialogueTypingFinished(true)
    self.bForceAutoPlay = bForceAutoPlay
    if self.WaitQueue then
      self.WaitQueue:CompleteWaitItem(WaitItemUniqueTag.UIPlayDialogue)
    end
  end
end

function CommonTalkTask:OnUIDialoguePanelClicked()
  if not self:IsDialogueTypingFinished() then
    self.UI:SkipDialogueTyping()
    return
  end
  if not self:CanResponseUIClick() then
    return
  end
  DebugPrint("CommonTalkTask:OnUIDialoguePanelClicked", self:IsPlayDialogueTaskFinished())
  self:TrySkipDSL()
  self.DialogueIterationComponent:ForceToDialogueEnd()
  if self.WaitQueue:IsTagOnlyUncompleted(WaitItemUniqueTag.PlayAudio) then
    AudioManager(self.TalkContext):PlayUISound(self.TalkContext, "event:/ui/common/click_dialog_next", "", nil)
    self:ForcePlayNextDialogue()
  elseif self:IsPlayDialogueTaskFinished() then
    AudioManager(self.TalkContext):PlayUISound(self.TalkContext, "event:/ui/common/click_dialog_next", "", nil)
    self:ForcePlayNextDialogue()
  end
end

function CommonTalkTask:OnAutoPlayChanged()
  if self.TalkTaskState == TalkTaskState.OnFinish or self.TalkTaskState == TalkTaskState.ShowingOption then
    return
  end
  if self:IsAutoPlay() then
    if self:IsPlayDialogueTaskFinished() then
      self:ForcePlayNextDialogue()
    end
  else
    self:RemoveAutoPlayNextDialogueTimer()
  end
end

function CommonTalkTask:OnSkipButtonClicked()
  DebugPrint("OnSkipButtonClicked")
  if self.TalkTaskState == TalkTaskState.OnFinish or self.TalkTaskState == TalkTaskState.ShowingOption then
    return
  end
  self:RemoveAutoPlayNextDialogueTimer()
  self.IgnoreActionMontageBlendInTime = true
  if self.TalkTaskData.bSkipToOption then
    self.DialogueIterationComponent:SkipToEndOrOption()
  else
    self.DialogueIterationComponent:SkipToEnd()
  end
  self.IgnoreActionMontageBlendInTime = false
  self.TalkCameraManager:SkipCameraBreathe()
  local Player = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if IsValid(Player) and Player.TrackSkipTalkInfo then
    Player:TrackSkipTalkInfo(self.TalkTaskData)
  end
end

function CommonTalkTask:StopStoryline()
  self.TalkTaskData.BlendOutTime = 0.5
  self:Finish(ETalkNodeFinishType.Stop)
end

function CommonTalkTask:GetDependencies()
  return {
    ETalkDependency.GameUnpaused
  }
end

function CommonTalkTask:CreateComponents()
  CommonTalkTask.Super.CreateComponents(self)
  if not self.TaskData then
    return
  end
  self.TalkTaskData = self.TaskData
  self.TalkContext = self.TaskData.TalkContext
  self:CreateFreezeWCComponent()
  self:CreateTalkAudioComponent()
  self:CreatePauseGameComponent()
  self:CreateHideEffectComponent()
  self:CreateExpressionComponent()
  self:CreateHideGameUIComponent()
  self:CreateSoundEffectComponent()
  self:CreateDialogueWikiComponent()
  self:CreateSwitchToMasterComponent()
  self:CreateCharacterDitherComponent()
  self:CreateDialogueIteratorComponent()
  self:CreateStopPlayerActionComponent()
  self:CreateDisablePlayerInputComponent()
  self:CreateDisableInteractiveComponent()
  self:CreateHideAllBattleEntityComponent()
  self:CreateSetPlayerInvincibleComponent()
  self:CreateSetSequenceActorsIgnorePauseComponent()
  self:CreateDisableNpcPerformanceOptimizationComponent()
  self:CreateDisableCameraArmComponent()
  self:CreateSwitchEmoIdleComponent()
end

function CommonTalkTask:OnCinematicBegin()
  if self.TalkTaskData.SequenceActor then
    self.TalkTaskData.SequenceActor:InitializeLua(self, self.TalkTaskData)
  end
end

function CommonTalkTask:TryPlaySequence()
  if self.TalkTaskData.SequencePlayer then
    self.TalkTaskData.SequencePlayer:Play()
  end
end

function CommonTalkTask:SequenceDrivePlayDialogue(DialogueId)
end

function CommonTalkTask:SequenceEndPlayDialogue(DialogueId)
end

function CommonTalkTask:IsAutoPlay()
  if self.UI then
    return self.UI:IsAutoPlay() or self.bForceAutoPlay
  else
    return self.bForceAutoPlay
  end
end

function CommonTalkTask:AddAutoPlayNextDialogueTimer()
  local Duration = self.UI:GetOverridenAutoPlayDurationTimer() or self.DialogueDuration
  self.AutoPlayTimer = self.TalkTimerManager:AddTimer(self, Duration, nil, nil, self, self.IterateDialogue)
end

function CommonTalkTask:RemoveAutoPlayNextDialogueTimer()
  if self.AutoPlayTimer then
    self.TalkTimerManager:DestroyTimer(self, self.AutoPlayTimer)
    self.AutoPlayTimer = nil
  end
end

function CommonTalkTask:CanResponseUIClick()
  return self.bResponseUIClick
end

function CommonTalkTask:SetCanResponseUIClick(bResponseUIClick)
  DebugPrint("CommonTalkTask:SetCanResponseUIClick", bResponseUIClick)
  self.bResponseUIClick = bResponseUIClick
  self.UI:SwitchWaitState(self.bResponseUIClick)
end

function CommonTalkTask:SetDialogueTypingFinished(bSet)
  self.bDialogueTypingFinished = bSet
end

function CommonTalkTask:IsDialogueTypingFinished()
  return self.bDialogueTypingFinished
end

function CommonTalkTask:SetPlayDialogueTaskFinished(bFinished)
  self.bTaskPlayDialogueFinished = bFinished
end

function CommonTalkTask:IsPlayDialogueTaskFinished()
  return self.bTaskPlayDialogueFinished
end

function CommonTalkTask:ForcePlayNextDialogue()
  DebugPrint("CommonTalkTask:ForcePlayNextDialogue")
  self:StopDSL()
  self:RemoveAutoPlayNextDialogueTimer()
  self.WaitQueue:CloseWaitQueue()
  self.IgnoreActionMontageBlendInTime = true
  self:IterateDialogue()
  self.IgnoreActionMontageBlendInTime = false
  return true
end

function CommonTalkTask:OnInterrupted(TalkNodeFinishType)
  DebugPrint("CommonTalkTask:OnInterrupted")
  if self.TalkContext and self.TalkContext.TalkCameraManager then
    self.TalkContext.TalkCameraManager:OnExceptionInterrupted()
  end
  self:ResumeAllExecutedComps()
  self.TalkContext:RemoveSimpleBlackUI()
  self:End(TalkNodeFinishType)
end

function CommonTalkTask:OnExceptionInterruptedBySTL()
  DebugPrint("CommonTalkTask:OnExceptionInterruptedBySTL")
  TalkUtils:RemovePlayerInvincible()
  self.NodeFinished_Callback = nil
  if self.TalkContext and self.TalkContext.TalkCameraManager then
    self.TalkContext.TalkCameraManager:OnExceptionInterrupted()
  end
  if self.TalkTaskData.SequencePlayer then
    self.TalkTaskData.SequencePlayer:Stop()
  end
  self:ResumeAllExecutedComps()
  self:Clear()
end

function CommonTalkTask:ResumeAllExecutedComps()
  for Comp, _ in pairs(self.ExecutedComps or {}) do
    Comp:Resume()
  end
end

function CommonTalkTask:TryFireEndingCallback(TalkNodeFinishType, OptionIndex)
  if self.NodeFinished_Callback and self.NodeFinished_Callback[2] then
    local NodeFinished_Obj = self.NodeFinished_Callback[1]
    local NodeFinished_Func = self.NodeFinished_Callback[2]
    NodeFinished_Func(NodeFinished_Obj, self, TalkNodeFinishType, OptionIndex)
  end
end

function CommonTalkTask:CheckResource()
  return true
end

function CommonTalkTask:DefaultAfterCreateTalkActors(TalkTask, TalkTaskData, EaseExp, Callback)
  self.TalkContext:TryFireCallback(Callback)
end

function CommonTalkTask:FixedCameraAfterCreateTalkActors(TalkTask, TalkTaskData, EaseExp, Callback)
  local FirstDialogueData = SimpleDialogueData_C.New(self, TalkTaskData.FirstDialogueId, TalkTaskData.TalkContext)
  local TargetCamera = self.TalkCameraManager:GetFixedCamera(FirstDialogueData.CameraInfo, TalkTaskData.TalkStage, true)
  DebugPrint("CommonTalkTask:FixedCameraAfterCreateTalkActors", TalkTask, TalkTaskData, EaseExp, Callback, TargetCamera:K2_GetActorLocation())
  local BlendSeconds = 0
  if TalkTaskData.BlendInType == "BlendIn" then
    BlendSeconds = TalkTaskData.BlendInTime
  end
  self.TalkCameraManager:CameraBlendToNew(TalkTaskData.Key or TalkTask, TargetCamera, BlendSeconds, nil, Callback, nil, EaseExp)
end

function CommonTalkTask:FreeCameraAfterCreateTalkActors(TalkTask, TalkTaskData, EaseExp, Callback)
  DebugPrint("CommonTalkTask:FreeCameraAfterCreateTalkActors", TalkTask, TalkTaskData, EaseExp, Callback)
  local TargetCamera = self.TalkCameraManager:GetTalkPawnNew(true, TalkTaskData.bUseOldTalkPawn, TalkTaskData.bUseProceduralCamera, TalkTaskData.ProceduralCameraId)
  self.TalkCameraManager:SetTalkPawnEnableChangeView(true)
  local WaitQueue = self.WaitQueueManager:CreateWaitQueue(TalkTask, {
    {
      Tag = WaitQueueTag.CameraBlend
    },
    {
      Tag = WaitQueueTag.NpcRotateToPlayer
    },
    {
      Tag = WaitQueueTag.PlayerRotateToNpc
    }
  }, Callback.Obj, Callback.Func)
  self.TalkActionManager:FreeTalkNpcRotateToPlayer(self, self.TalkContext.InteractiveActor, {
    Func = function()
      WaitQueue:CompleteWaitItem(WaitQueueTag.NpcRotateToPlayer)
    end
  })
  self.TalkActionManager:FreeTalkPlayerRotateToNpc(self, self.TalkContext.InteractiveActor, {
    Func = function()
      WaitQueue:CompleteWaitItem(WaitQueueTag.PlayerRotateToNpc)
    end
  })
  local TalkPawnSwitch = "TalkPawn"
  if TalkTaskData.bUseOldTalkPawn then
    TalkPawnSwitch = nil
  end
  local BlendSeconds = 0
  if TalkTaskData.BlendInType == "BlendIn" then
    BlendSeconds = TalkTaskData.BlendInTime
  end
  self.TalkCameraManager:CameraBlendToNew(TalkTaskData.Key or TalkTask, TargetCamera, BlendSeconds, TalkPawnSwitch, {
    Func = function()
      WaitQueue:CompleteWaitItem(WaitQueueTag.CameraBlend)
    end
  }, nil, EaseExp)
end

function CommonTalkTask:SequenceCameraAfterCreateTalkActors(TalkTask, TalkTaskData, EaseExp, Callback)
  DebugPrint("CommonTalkTask:SequenceCameraAfterCreateTalkActors", TalkTask, TalkTaskData, EaseExp, Callback)
  if UTalkSequenceFunctionLibrary.HasSequenceTrack(self.TalkTaskData.Sequence, UMoveSequencerTrack) then
    self.TalkCameraManager:GetTalkPawn()
    local PlayerController = UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    self.TalkCameraManager:SwitchCameraRole("TalkPawn")
    self.TalkCameraManager:SetTalkPawnEnableChangeView(false)
    self.TalkCameraManager:MakeSequenceCamera()
    USequenceFunctionLibrary.SetViewTarget(PlayerController, self.TalkCameraManager.SequenceCamera)
  end
  self.TalkContext:BindActors(self)
  if Callback and Callback.Func then
    Callback.Func(Callback.Obj)
  end
end

function CommonTalkTask:RecordDialogueCompleted(DialogueId)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if nil == DataMgr.DialogueId2WikiTextIds[DialogueId] then
    return
  end
  Avatar:CompletedDialogue(DialogueId)
end

function CommonTalkTask:OnPaused()
  DebugPrint("CommonTalkTask:OnPaused")
  self:PauseAllTimers(true)
  self:PauseAudio()
  self:PauseCamera(true)
  AudioManager(self.TalkContext):PauseCineSound(true)
  self.DialogueIterationComponent:Pause()
end

function CommonTalkTask:OnPauseResumed()
  DebugPrint("CommonTalkTask:OnPauseResumed")
  self:PauseAllTimers(false)
  self:ResumePauseAudio()
  self:PauseCamera(false)
  AudioManager(self.TalkContext):PauseCineSound(false)
  self.DialogueIterationComponent:Resume()
end

return CommonTalkTask
