local TalkOptionData_C = require("BluePrints.Story.Talk.Model.TalkOptionData").TalkOptionData_C
local TalkTaskDataBase_C = {}

function TalkTaskDataBase_C.New(TalkNodeData)
  local TalkTypeData = DataMgr.TalkType[TalkNodeData.TalkType]
  local GameInstance = GWorld.GameInstance
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local Obj = {}
  Obj.ExtraParams = TalkTypeData.ExtraParams or {}
  Obj.TalkContext = GameInstance:GetTalkContext()
  Obj.FilePath = TalkNodeData.FilePath
  Obj.TalkNodeId = TalkNodeData.TalkNodeId
  Obj.TalkId = TalkNodeData.TalkId
  Obj.FirstDialogueId = TalkNodeData.FirstDialogueId
  Obj.TalkType = TalkNodeData.TalkType
  Obj.bNeedStage = Obj.ExtraParams.bNeedStage
  if Obj.bNeedStage then
    Obj.TalkStage = Obj.TalkContext:GetStage(TalkNodeData.TalkStageName)
  end
  Obj.bHideNpcs = TalkNodeData.HideNpcs
  Obj.bHideMonsters = TalkNodeData.HideMonsters
  Obj.bDisableNpcOptimization = TalkNodeData.DisableNpcOptimization
  Obj.DoNotReceiveCharacterShadow = TalkNodeData.DoNotReceiveCharacterShadow
  Obj.SequencePath = TalkNodeData.ShowFilePath
  Obj.BlendInTime = TalkNodeData.BlendInTime
  Obj.BlendOutTime = TalkNodeData.BlendOutTime
  Obj.BlendInType = TalkNodeData.BlendInType
  Obj.BlendOutType = TalkNodeData.BlendOutType
  Obj.bShowAutoPlayButton = TalkNodeData.ShowAutoPlayButton
  Obj.bShowSkipButton = TalkNodeData.ShowSkipButton
  Obj.bShowReviewButton = TalkNodeData.ShowReviewButton
  Obj.bPauseGameGlobal = TalkNodeData.PauseGameGlobal
  Obj.bDisableMonsterAI = TalkNodeData.DisableMonsterAI
  Obj.bDisableNPCAI = TalkNodeData.DisableNPCAI
  Obj.bHideAllBattleEntity = TalkNodeData.HideAllBattleEntity
  Obj.bDisableMonsterAIForSimpleTalk = TalkNodeData.DisableMonsterAIForSimpleTalk
  Obj.bHideElseCharacter = TalkNodeData.HideElseCharacter
  Obj.BeginTargetPoint = GameState:GetTargetPoint(TalkNodeData.BeginNewTargetPointName)
  Obj.EndTargetPoint = GameState:GetTargetPoint(TalkNodeData.EndNewTargetPointName)
  Obj.CameraLookAtTartgetPoint = TalkNodeData.CameraLookAtTartgetPoint
  if TalkNodeData.CameraLookAtTartgetPoint == "" then
    Obj.CameraLookAtTartgetPoint = nil
  end
  Obj.RestoreStand = TalkNodeData.RestoreStand
  Obj.CreateTalkActors = TalkNodeData.TalkActors
  Obj.RemoveTalkActors = TalkNodeData.RemoveTalkActors
  Obj.Options = TalkNodeData.Options
  Obj.Player = UE.UGameplayStatics.GetPlayerCharacter(Obj.TalkContext, 0)
  Obj.PlayerController = UE.UGameplayStatics.GetPlayerController(Obj.TalkContext, 0)
  Obj.bDisableGameInput = not TalkTypeData.GameInput
  Obj.bPopMouse = TalkTypeData.UICanInteractive
  Obj.bShowGameUI = TalkTypeData.ShowGameUI
  Obj.bShowInStoryReview = TalkTypeData.ShowInStoryReview
  Obj.UIName = TalkTypeData.UIName
  Obj.BasicTalkType = TalkTypeData.BasicType
  Obj.bTaskDefaultAutoPlay = not TalkTypeData.UICanInteractive
  Obj.CameraType = TalkTypeData.CameraType
  Obj.UI = nil
  Obj.GuideMeshIndexList = TalkNodeData.GuideMeshIndexList
  Obj.ChapterId = 1001
  Obj.bEnableRandomOption = TalkNodeData.EnableRandomOption
  Obj.RandomOptionNum = TalkNodeData.RandomOptionNum
  Obj.SaveToServer = TalkNodeData.SaveToServer
  Obj.OptionData = TalkOptionData_C.New(TalkNodeData.OptionType, TalkNodeData)
  Obj.bUseProceduralCamera = TalkNodeData.UseProceduralCamera
  Obj.ProceduralCameraId = TalkNodeData.ProceduralCameraId
  Obj.IsPlayStartSound = TalkNodeData.IsPlayStartSound
  Obj.CameraBlendEaseExp = TalkNodeData.CameraBlendEaseExp or 2
  Obj.bHideEffectCreature = TalkNodeData.HideEffectCreature
  Obj.bOverrideFailBlend = TalkNodeData.bOverrideFailBlend
  Obj.FailOutType = TalkNodeData.FailOutType
  Obj.FailOutTime = TalkNodeData.FailOutTime
  Obj.bPauseNpcBT = TalkNodeData.PauseNpcBT
  Obj.FinishFadeInTime = 1
  Obj.BeginFadeOutTime = 0.5
  return Obj
end

return TalkTaskDataBase_C
