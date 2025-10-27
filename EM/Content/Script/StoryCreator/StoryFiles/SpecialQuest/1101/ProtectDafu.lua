return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102407394775",
      startPort = "StoryStart",
      endStory = "1721630102407394777",
      endPort = "In"
    },
    {
      startStory = "1721630102407394777",
      startPort = "Success",
      endStory = "17289891804571739007",
      endPort = "In"
    },
    {
      startStory = "17289891804571739007",
      startPort = "Success",
      endStory = "1721630102407394776",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102407394775"] = {
      isStoryNode = true,
      key = "1721630102407394775",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 781.0526315789474, y = 323.6842105263158},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102407394776"] = {
      isStoryNode = true,
      key = "1721630102407394776",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1730.8653846153848, y = 399.8076923076923},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102407394777"] = {
      isStoryNode = true,
      key = "1721630102407394777",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1093.3277422252913, y = 353.4452683639224},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110103_3_sp",
        QuestDeatil = "Content_110103_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1718864280999136822",
            startPort = "Out",
            endQuest = "1721630102407394783",
            endPort = "In"
          },
          {
            startQuest = "1718864280999136822",
            startPort = "Out",
            endQuest = "1718960339466678519",
            endPort = "In"
          },
          {
            startQuest = "1721630102407394784",
            startPort = "Out",
            endQuest = "1721630102407394782",
            endPort = "In"
          },
          {
            startQuest = "1720083035551562832",
            startPort = "Out",
            endQuest = "1721630102407394780",
            endPort = "Fail"
          },
          {
            startQuest = "1718960339466678519",
            startPort = "Out",
            endQuest = "17270748529641849",
            endPort = "In"
          },
          {
            startQuest = "17289936397901750217",
            startPort = "Out",
            endQuest = "17289936397901750215",
            endPort = "In"
          },
          {
            startQuest = "17289936397901750217",
            startPort = "Out",
            endQuest = "17289936397901750216",
            endPort = "In"
          },
          {
            startQuest = "17270748529641849",
            startPort = "Out",
            endQuest = "17289936397901750217",
            endPort = "In"
          },
          {
            startQuest = "17289936646361751071",
            startPort = "Out",
            endQuest = "1721630102407394779",
            endPort = "Success"
          },
          {
            startQuest = "1721630102407394783",
            startPort = "Out",
            endQuest = "17339856504271800544",
            endPort = "In"
          },
          {
            startQuest = "17339856504271800544",
            startPort = "Out",
            endQuest = "1720083035551562832",
            endPort = "In"
          },
          {
            startQuest = "17289936397901750216",
            startPort = "Out",
            endQuest = "17289936646361751071",
            endPort = "In"
          },
          {
            startQuest = "17289936397901750217",
            startPort = "Out",
            endQuest = "17357999326538837431",
            endPort = "In"
          },
          {
            startQuest = "1718864280999136822",
            startPort = "Out",
            endQuest = "1735873604319688",
            endPort = "In"
          },
          {
            startQuest = "1735873604319688",
            startPort = "Out",
            endQuest = "1718864280999136821",
            endPort = "In"
          },
          {
            startQuest = "1718864280999136821",
            startPort = "Out",
            endQuest = "1735873616911855",
            endPort = "In"
          },
          {
            startQuest = "1721630102407394778",
            startPort = "QuestStart",
            endQuest = "1718864280999136822",
            endPort = "In"
          },
          {
            startQuest = "1718864280999136822",
            startPort = "Out",
            endQuest = "1728390768716196045",
            endPort = "In"
          }
        },
        nodeData = {
          ["1718864280999136821"] = {
            key = "1718864280999136821",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\232\190\190\232\138\153\230\182\133\230\177\130\229\138\169",
            pos = {x = 550.3359555477936, y = 197.72087666525005},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["1718864280999136822"] = {
            key = "1718864280999136822",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-SC003-\231\167\189\229\133\189\229\140\133\229\155\180",
            pos = {x = -219.34832268462688, y = 537.4298992137968},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC003/SQ_OBT0102_SC003",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "BP_TargetPoint110104",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1718960339466678519"] = {
            key = "1718960339466678519",
            type = "SendMessageNode",
            name = "\231\172\172\228\184\128\230\179\162",
            pos = {x = 427.110256658657, y = 431.85190438104667},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ProtectDafuInit",
              UnitId = -1
            }
          },
          ["1720083035551562832"] = {
            key = "1720083035551562832",
            type = "SendMessageNode",
            name = "\229\164\177\232\180\165\230\184\133\231\144\134",
            pos = {x = 1319.721616878283, y = 685.0801089199986},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ProtectDafuStop",
              UnitId = -1
            }
          },
          ["1721630102407394778"] = {
            key = "1721630102407394778",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -561.7769138755971, y = 538.0568181818181},
            propsData = {ModeType = 0}
          },
          ["1721630102407394779"] = {
            key = "1721630102407394779",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1856.2478316575073, y = 423.2256890168654},
            propsData = {ModeType = 0}
          },
          ["1721630102407394780"] = {
            key = "1721630102407394780",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1757.2696825620199, y = 702.4047022636807},
            propsData = {}
          },
          ["1721630102407394782"] = {
            key = "1721630102407394782",
            type = "SpecialQuestFailNode",
            name = "\231\137\185\230\174\138\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 815.8437454580679, y = 1028.0898683295677},
            propsData = {}
          },
          ["1721630102407394783"] = {
            key = "1721630102407394783",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 649.4203312578513, y = 662.0651562567434},
            propsData = {}
          },
          ["1721630102407394784"] = {
            key = "1721630102407394784",
            type = "BossBattleFinishNode",
            name = "\229\164\177\232\180\165\229\155\158\232\176\131",
            pos = {x = 470.92193681111814, y = 1003.9205374050587},
            propsData = {
              SendMessage = "",
              FinishCondition = "ProtectDafuFail"
            }
          },
          ["17270748529641849"] = {
            key = "17270748529641849",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 672.2678318249253, y = 438.0278799004199},
            propsData = {
              SendMessage = "",
              FinishCondition = "ProtectDafu1Succ"
            }
          },
          ["1728390768716196045"] = {
            key = "1728390768716196045",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 35.68415481389195, y = 756.7934133438742},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0058_scene_ex01_action.0058_scene_ex01_action'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17289936397901750215"] = {
            key = "17289936397901750215",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\233\152\191\231\147\166\229\176\148\231\153\187\229\156\186",
            pos = {x = 1226.4318614375165, y = 70.76521303363187},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011011,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17289936397901750216"] = {
            key = "17289936397901750216",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164\233\152\191\231\147\166\229\176\148\233\173\133\229\189\177",
            pos = {x = 1247.3845563748312, y = 444.2922421962263},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1211010205}
            }
          },
          ["17289936397901750217"] = {
            key = "17289936397901750217",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 - SC004 - \233\152\191\231\147\166\229\176\148\231\153\187\229\156\186",
            pos = {x = 948.1050362577091, y = 425.64405983239647},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC004/SQ_OBT0102_SC004",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17289936646361751071"] = {
            key = "17289936646361751071",
            type = "BossBattleFinishNode",
            name = "\231\173\137\229\190\133\228\184\128\233\152\182\230\174\181\231\187\147\230\157\159",
            pos = {x = 1542.2710292297747, y = 431.8331958312752},
            propsData = {
              SendMessage = "",
              FinishCondition = "ProtectDafu2Succ"
            }
          },
          ["17339856504271800544"] = {
            key = "17339856504271800544",
            type = "CreatePhantomNode",
            name = "\233\148\128\230\175\129\233\152\191\231\147\166\229\176\148\233\173\133\229\189\177",
            pos = {x = 947.25, y = 669.625},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1211010205}
            }
          },
          ["17357999326538837431"] = {
            key = "17357999326538837431",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1234.4644287398241, y = 298.78349282296654},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0058_scene_ex01_action.0058_scene_ex01_action'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1735873604319688"] = {
            key = "1735873604319688",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 270.2734113712374, y = 212.2674461088782},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 2,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/snapshot/story/ex01_vo_behind_door.ex01_vo_behind_door'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1735873616911855"] = {
            key = "1735873616911855",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 832.3452685421994, y = 198.5306905370843},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 2
            }
          }
        },
        commentData = {}
      }
    },
    ["17289891804571739007"] = {
      isStoryNode = true,
      key = "17289891804571739007",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1403.2642715086774, y = 394.51487847860915},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110103_3_2",
        QuestDeatil = "Content_110103_3_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17289891817281739093",
            startPort = "Out",
            endQuest = "17289891817281739097",
            endPort = "In"
          },
          {
            startQuest = "17289891958661739732",
            startPort = "Out",
            endQuest = "17289891958661739731",
            endPort = "In"
          },
          {
            startQuest = "17289891804581739008",
            startPort = "QuestStart",
            endQuest = "17289891958661739733",
            endPort = "In"
          },
          {
            startQuest = "17289891958661739734",
            startPort = "Out",
            endQuest = "17289891804581739014",
            endPort = "Fail"
          },
          {
            startQuest = "17289891804581739008",
            startPort = "QuestStart",
            endQuest = "17289891817281739093",
            endPort = "In"
          },
          {
            startQuest = "17289891958661739733",
            startPort = "Out",
            endQuest = "17339856816122473395",
            endPort = "In"
          },
          {
            startQuest = "17339856816122473395",
            startPort = "Out",
            endQuest = "17289891958661739734",
            endPort = "In"
          },
          {
            startQuest = "17289891804581739008",
            startPort = "QuestStart",
            endQuest = "1741934289740776423",
            endPort = "In"
          }
        },
        nodeData = {
          ["17289891804581739008"] = {
            key = "17289891804581739008",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 332.00000000000006, y = 294},
            propsData = {ModeType = 0}
          },
          ["17289891804581739011"] = {
            key = "17289891804581739011",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1568.125, y = 350.8333333333333},
            propsData = {ModeType = 0}
          },
          ["17289891804581739014"] = {
            key = "17289891804581739014",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1583.0667562724013, y = 595.7504480286739},
            propsData = {}
          },
          ["17289891817281739093"] = {
            key = "17289891817281739093",
            type = "BossBattleFinishNode",
            name = "\228\186\140\233\152\182\230\174\181\230\136\144\229\138\159\229\155\158\232\176\131",
            pos = {x = 690.9828594362218, y = 337.75776917040224},
            propsData = {
              SendMessage = "",
              FinishCondition = "ProtectDafuEnd"
            }
          },
          ["17289891817281739097"] = {
            key = "17289891817281739097",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 988.7651922176252, y = 348.15402306510623},
            propsData = {}
          },
          ["17289891958661739731"] = {
            key = "17289891958661739731",
            type = "SpecialQuestFailNode",
            name = "\231\137\185\230\174\138\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 990.1175797277799, y = 964.8138713034407},
            propsData = {}
          },
          ["17289891958661739732"] = {
            key = "17289891958661739732",
            type = "BossBattleFinishNode",
            name = "\229\164\177\232\180\165\229\155\158\232\176\131",
            pos = {x = 751.2516850593247, y = 980.6283217409389},
            propsData = {
              SendMessage = "",
              FinishCondition = "ProtectDafuFail"
            }
          },
          ["17289891958661739733"] = {
            key = "17289891958661739733",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 681.218179864481, y = 560.4175642485375},
            propsData = {}
          },
          ["17289891958661739734"] = {
            key = "17289891958661739734",
            type = "SendMessageNode",
            name = "\229\164\177\232\180\165\230\184\133\231\144\134",
            pos = {x = 1277.2302629759522, y = 600.599721212868},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ProtectDafuStop",
              UnitId = -1
            }
          },
          ["17339856816122473395"] = {
            key = "17339856816122473395",
            type = "CreatePhantomNode",
            name = "\233\148\128\230\175\129\233\152\191\231\147\166\229\176\148\233\173\133\229\189\177",
            pos = {x = 991.2061699948798, y = 584.5321786111552},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1211010205}
            }
          },
          ["1741934289740776423"] = {
            key = "1741934289740776423",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 664.25, y = 112.17105263157899},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
