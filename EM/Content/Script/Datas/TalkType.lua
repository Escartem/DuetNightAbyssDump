local T = {}
T.RT_1 = {bComplexCameraBlend = true, bNeedStage = true}
T.RT_2 = {bBlendDialogueCamera = true, bNeedStage = true}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TalkType", {
  AudioOnly = {
    BasicType = "Audio",
    ShowInStoryReview = false,
    TalkType = "AudioOnly"
  },
  Black = {
    BasicType = "Black",
    CameraType = "EmptyCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "Black",
    UICanInteractive = false,
    UIName = "BlackTalkUI"
  },
  BlackISS = {
    BasicType = "Black",
    CameraType = "EmptyCamera",
    ExtraParams = {bBlackScreenSameScreen = true},
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "BlackISS",
    UICanInteractive = false,
    UIName = "BlackTalkUI"
  },
  Boss = {
    BasicType = "Boss",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = false,
    TalkType = "Boss",
    UICanInteractive = false
  },
  Bubble = {
    BasicType = "Bubble",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = false,
    TalkType = "Bubble",
    UICanInteractive = false
  },
  Cinematic = {
    BasicType = "Cinematic",
    CameraType = "SequenceCamera",
    ExtraParams = T.RT_1,
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "Cinematic",
    UICanInteractive = true,
    UIName = "CinematicUI"
  },
  FaultBlack = {
    BasicType = "Black",
    CameraType = "EmptyCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "FaultBlack",
    UICanInteractive = false,
    UIName = "FaultBlackTalkUI"
  },
  FixSimple = {
    BasicType = "FixSimple",
    CameraType = "FixedCamera",
    ExtraParams = T.RT_2,
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "FixSimple",
    UICanInteractive = true,
    UIName = "SimpleTalkUI"
  },
  ForgingGuide = {
    BasicType = "Guide",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = false,
    TalkType = "ForgingGuide",
    UICanInteractive = false,
    UIName = "TalkGuideUI"
  },
  FreeSimple = {
    BasicType = "FreeSimple",
    CameraType = "FreeCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "FreeSimple",
    UICanInteractive = true,
    UIName = "SimpleTalkUI"
  },
  Guide = {
    BasicType = "Guide",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = true,
    TalkType = "Guide",
    UICanInteractive = false,
    UIName = "TalkGuideUI"
  },
  HintGuide = {
    BasicType = "Guide",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = true,
    TalkType = "HintGuide",
    UICanInteractive = false,
    UIName = "TalkGuideUI"
  },
  Impression = {
    BasicType = "Impression",
    CameraType = "FreeCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "Impression",
    UICanInteractive = true,
    UIName = "ImpressionMainUI"
  },
  LevelSequence = {
    BasicType = "Cinematic",
    CameraType = "SequenceCamera",
    ExtraParams = T.RT_1,
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "LevelSequence",
    UICanInteractive = true,
    UIName = "CinematicUI"
  },
  NoIntFixSimple = {
    BasicType = "FixSimple",
    CameraType = "FixedCamera",
    ExtraParams = T.RT_2,
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "NoIntFixSimple",
    UICanInteractive = true,
    UIName = "SimpleTalkUI"
  },
  PanFixSimple = {
    BasicType = "FixSimple",
    CameraType = "FixedCamera",
    ExtraParams = T.RT_2,
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "PanFixSimple",
    UICanInteractive = true,
    UIName = "SimpleTalkUI"
  },
  QuestImpression = {
    BasicType = "FixSimple",
    CameraType = "FixedCamera",
    ExtraParams = T.RT_2,
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "QuestImpression",
    UICanInteractive = true,
    UIName = "ImpressionMainUI"
  },
  QueueGuide = {
    BasicType = "Guide",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = true,
    TalkType = "QueueGuide",
    UICanInteractive = false,
    UIName = "TalkGuideUI"
  },
  RougeLike = {
    BasicType = "RougeLike",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = false,
    TalkType = "RougeLike",
    UICanInteractive = false
  },
  SpecialQuestFail = {
    BasicType = "Black",
    CameraType = "EmptyCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "SpecialQuestFail",
    UICanInteractive = false,
    UIName = "BlackTalkUI"
  },
  UnimportGuide = {
    BasicType = "Guide",
    CameraType = "PlayerCamera",
    GameInput = true,
    ShowGameUI = true,
    ShowInStoryReview = true,
    TalkType = "UnimportGuide",
    UICanInteractive = false,
    UIName = "TalkGuideUI"
  },
  White = {
    BasicType = "Black",
    CameraType = "EmptyCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "White",
    UICanInteractive = false,
    UIName = "WhiteTalkUI"
  }
})
