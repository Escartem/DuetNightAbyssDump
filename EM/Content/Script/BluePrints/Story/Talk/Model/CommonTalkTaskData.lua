local TalkOptionData_C = require("BluePrints.Story.Talk.Model.TalkOptionData").TalkOptionData_C

local function GetSequence(SequencePath)
  local Sequence = UE4.LoadObject(SequencePath)
  if Sequence then
    return Sequence
  end
  local Avatar = GWorld:GetAvatar()
  local Gender = "F"
  if Avatar and 0 == Avatar.Sex then
    Gender = "M"
  end
  local GenderSequencePath = SequencePath .. "_" .. Gender
  local GenderSequence = UE4.LoadObject(GenderSequencePath)
  if GenderSequence then
    return GenderSequence
  end
  local EXGender = "EF"
  if Avatar and 0 == Avatar.WeitaSex then
    EXGender = "EM"
  end
  local EXGenderSequencePath = SequencePath .. "_" .. EXGender
  local EXGenderSequence = UE4.LoadObject(EXGenderSequencePath)
  if EXGenderSequence then
    return EXGenderSequence
  end
  local CombGenderSequencePath = SequencePath .. "_" .. Gender .. EXGender
  local CombGenderSequence = UE4.LoadObject(CombGenderSequencePath)
  if CombGenderSequence then
    return CombGenderSequence
  end
  return nil
end

local CommonTalkTaskData_C = {}

function CommonTalkTaskData_C.New(TalkNodeData)
  local Obj = setmetatable({}, {__index = TalkNodeData})
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local TalkTypeData = DataMgr.TalkType[TalkNodeData.TalkType]
  Obj.SetPlayerInvincible = TalkTypeData.SetPlayerInvincible
  Obj.bDisableGameInput = not TalkTypeData.GameInput
  Obj.bExitOnline = TalkNodeData.TalkType == "FixSimple" or TalkNodeData.TalkType == "QuestImpression" or TalkNodeData.TalkType == "Cinematic" or TalkNodeData.TalkType == "Show"
  Obj.bPopMouse = TalkTypeData.UICanInteractive
  Obj.bShowGameUI = TalkTypeData.ShowGameUI
  Obj.bShowInStoryReview = TalkTypeData.ShowInStoryReview
  Obj.UIName = TalkTypeData.UIName
  Obj.BasicTalkType = TalkTypeData.BasicType
  Obj.bTaskDefaultAutoPlay = not TalkTypeData.UICanInteractive
  Obj.CameraType = TalkTypeData.CameraType
  Obj.ExtraParams = TalkTypeData.ExtraParams or {}
  local GameInstance = GWorld.GameInstance
  Obj.TalkContext = GameInstance:GetTalkContext()
  Obj.bNeedStage = Obj.ExtraParams.bNeedStage
  if Obj.bNeedStage then
    Obj.TalkStage = Obj.TalkContext:GetStage(TalkNodeData.TalkStageName)
  end
  Obj.bHideNpcs = TalkNodeData.HideNpcs
  Obj.bHideMonsters = TalkNodeData.HideMonsters
  Obj.bDisableNpcOptimization = TalkNodeData.DisableNpcOptimization
  Obj.bForceAutoPlay = TalkNodeData.ForceAutoPlay
  Obj.bShowAutoPlayButton = TalkNodeData.ShowAutoPlayButton
  Obj.bShowSkipButton = TalkNodeData.ShowSkipButton
  Obj.bShowReviewButton = TalkNodeData.ShowReviewButton
  Obj.bShowWikiButton = TalkNodeData.ShowWikiButton
  Obj.bPauseGameGlobal = TalkNodeData.PauseGameGlobal
  Obj.bDisableMonsterAI = TalkNodeData.DisableMonsterAI
  Obj.bDisableNPCAI = TalkNodeData.DisableNPCAI
  Obj.bHideAllBattleEntity = TalkNodeData.HideAllBattleEntity
  Obj.bDisableMonsterAIForSimpleTalk = TalkNodeData.DisableMonsterAIForSimpleTalk
  Obj.bFreezeWorldComposition = TalkNodeData.FreezeWorldComposition
  Obj.bTravelFullLoadWorldComposition = TalkNodeData.bTravelFullLoadWorldComposition
  Obj.SwitchToMasterType = TalkNodeData.SwitchToMaster
  Obj.bHideElseCharacter = TalkNodeData.HideElseCharacter
  Obj.BeginTargetPoint = GameState:GetTargetPoint(TalkNodeData.BeginNewTargetPointName)
  Obj.EndTargetPoint = GameState:GetTargetPoint(TalkNodeData.EndNewTargetPointName)
  if TalkNodeData.CameraLookAtTartgetPoint and TalkNodeData.CameraLookAtTartgetPoint ~= "" then
    Obj.CameraLookAtTartgetPoint = TalkNodeData.CameraLookAtTartgetPoint
  end
  Obj.CreateTalkActors = TalkNodeData.TalkActors
  Obj.Player = UE.UGameplayStatics.GetPlayerCharacter(Obj.TalkContext, 0)
  Obj.PlayerController = UE.UGameplayStatics.GetPlayerController(Obj.TalkContext, 0)
  Obj.ChapterId = 1001
  Obj.bEnableRandomOption = TalkNodeData.EnableRandomOption
  Obj.OptionData = TalkOptionData_C.New(TalkNodeData.OptionType, TalkNodeData)
  Obj.bUseProceduralCamera = TalkNodeData.UseProceduralCamera
  Obj.CameraBlendEaseExp = TalkNodeData.CameraBlendEaseExp or 2
  Obj.bHideEffectCreature = TalkNodeData.HideEffectCreature
  Obj.bBlendDialogueCamera = Obj.ExtraParams.bBlendDialogueCamera
  Obj.bSkipToOption = TalkNodeData.SkipToOption
  Obj.bIsPlayerTurnToNPC = TalkNodeData.IsPlayerTurnToNPC
  Obj.bIsNPCTurnToPlayer = TalkNodeData.IsNPCTurnToPlayer
  Obj.bShowInteractiveActor = true
  Obj.GuideTalkStyle = TalkNodeData.GuideTalkStyle
  Obj.BubblePlayType = TalkNodeData.BubblePlayType
  Obj.BubbleDelayLoopSeconds = TalkNodeData.BubbleDelayLoopSeconds
  Obj.bBubblePlayCDEnable = TalkNodeData.bBubblePlayCDEnable
  Obj.BubblePlayCD = TalkNodeData.BubblePlayCD
  Obj.AudioAttachActor = TalkNodeData.AudioAttachActor
  Obj.bUseOldTalkPawn = -1 == TalkNodeData.BlendInTime
  Obj.PlayDialogueCallBack = TalkNodeData.PlayDialogueCallBack
  Obj.bPauseNpcBT = TalkNodeData.PauseNpcBT
  Obj.QuestChainId = TalkNodeData.QuestChainId
  Obj.PlayerSwitchEmoIdle = TalkNodeData.PlayerSwitchEmoIdle
  Obj.SequencePath = TalkNodeData.ShowFilePath
  if Obj.SequencePath and "" ~= Obj.SequencePath then
    local World = Obj.TalkContext:GetWorld()
    local LevelSequenceActorClass = Obj.TalkContext.LevelSequenceActorClass or UE4.LoadClass(Const.Talk_LevelSequenceActorPath)
    local DefaultTrans = UE4.UKismetMathLibrary.MakeTransform(UE4.FVector(0, 0, 0), UE4.FRotator(0, 0, 0), UE4.FVector(1, 1, 1))
    local SequenceActor = World:SpawnActor(LevelSequenceActorClass, DefaultTrans, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    SequenceActor.CameraSettings.bOverrideAspectRatioAxisConstraint = false
    local Sequence = GetSequence(Obj.SequencePath)
    if not Sequence then
      local Message = "\230\137\190\228\184\141\229\136\176Sequence\232\181\132\230\186\144" .. "\nSequence\232\183\175\229\190\132:" .. Obj.SequencePath .. "\n\229\175\185\232\175\157\232\138\130\231\130\185:" .. tostring(TalkNodeData.Name)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Seqeuence\232\181\132\230\186\144\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
    else
      SequenceActor:SetSequence(Sequence)
      Obj.Sequence = Sequence
    end
    Obj.SequenceActor = SequenceActor
    Obj.SequencePlayer = Obj.SequenceActor.SequencePlayer
  end
  if TalkNodeData.FlowAssetPath and "" ~= TalkNodeData.FlowAssetPath then
    local TS = TalkSubsystem()
    local FlowAsset = UE4.LoadObject(TalkNodeData.FlowAssetPath)
    if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(TS) then
      local FlowEditorSubSystem = UEditorSubsystemBlueprintLibrary.GetEditorSubsystem(UFlowEditorSubSystem)
      FlowEditorSubSystem:CheckFlowAsset(FlowAsset)
    end
    if not FlowAsset then
      local Message = "\230\137\190\228\184\141\229\136\176DialogueAsset\232\181\132\230\186\144" .. "\nSequence\232\183\175\229\190\132:" .. TalkNodeData.FlowAssetPath .. "\n\229\175\185\232\175\157\232\138\130\231\130\185:" .. tostring(TalkNodeData.Name)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "DialogueAsset\232\181\132\230\186\144\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
    elseif TS then
      Obj.FlowAsset = TS:CreateFlowTalkTask(TalkNodeData.FlowAssetPath, UE4.LoadObject(TalkNodeData.FlowAssetPath))
      Obj.FirstDialogueId = Obj.FlowAsset:GetFirstDialogueId()
    end
  end
  if Obj.BasicTalkType == "Black" then
    Obj.BlendInType = "FadeIn"
    Obj.BlendOutType = "FadeOut"
  end
  if TalkNodeData.TalkType == "White" then
    Obj.ScreenEffectDurationSeconds = 0
    Obj.FinishFadeInTime = 0
    Obj.BeginFadeOutTime = 0
  else
    Obj.ScreenEffectDurationSeconds = 1
    Obj.FinishFadeInTime = 1
    Obj.BeginFadeOutTime = 0.5
  end
  if TalkNodeData.ShowFadeDetail then
    Obj.BeginFadeOutTime = TalkNodeData.StartFadeOutTime
    Obj.ScreenEffectDurationSeconds = TalkNodeData.StartScreenEffectDuration
    Obj.FinishFadeInTime = TalkNodeData.FinishFadeInTime
  end
  return Obj
end

return CommonTalkTaskData_C
