return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17283890479821",
      startPort = "StoryStart",
      endStory = "1728389124300190",
      endPort = "In"
    },
    {
      startStory = "1728389124300190",
      startPort = "Success",
      endStory = "17283890479835",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17283890479821"] = {
      isStoryNode = true,
      key = "17283890479821",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17283890479835"] = {
      isStoryNode = true,
      key = "17283890479835",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1511.1842105263158, y = 299.3233082706767},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1728389124300190"] = {
      isStoryNode = true,
      key = "1728389124300190",
      type = "StoryNode",
      name = "\230\184\133\231\144\134\231\162\142\231\159\179",
      pos = {x = 1167.1032967032968, y = 289.7},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_CloudCleanstone_Des",
        QuestDeatil = "",
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
        bIsDynamicEvent = true,
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
            startQuest = "1728389124300191",
            startPort = "QuestStart",
            endQuest = "17283891898101208",
            endPort = "In"
          },
          {
            startQuest = "17283892812423071",
            startPort = "Out",
            endQuest = "1728389124301198",
            endPort = "Success"
          },
          {
            startQuest = "1728389124300191",
            startPort = "QuestStart",
            endQuest = "17295669042731138",
            endPort = "In"
          },
          {
            startQuest = "17295669042731138",
            startPort = "Out",
            endQuest = "17295672716932860",
            endPort = "In"
          },
          {
            startQuest = "17300106621911432",
            startPort = "WeightBranch_1",
            endQuest = "1728464074203182288",
            endPort = "In"
          },
          {
            startQuest = "17300106621911432",
            startPort = "WeightBranch_2",
            endQuest = "17300108900982474",
            endPort = "In"
          },
          {
            startQuest = "17300106621911432",
            startPort = "WeightBranch_2",
            endQuest = "17300109218992799",
            endPort = "In"
          },
          {
            startQuest = "1728464074203182288",
            startPort = "Out",
            endQuest = "17300111812364484",
            endPort = "In"
          },
          {
            startQuest = "17300111812364484",
            startPort = "Out",
            endQuest = "17283892812423071",
            endPort = "In"
          },
          {
            startQuest = "17300106621911432",
            startPort = "WeightBranch_2",
            endQuest = "1730011198441196943",
            endPort = "In"
          },
          {
            startQuest = "17300108900982474",
            startPort = "Out",
            endQuest = "1730011241578197645",
            endPort = "In"
          },
          {
            startQuest = "1730011241578197645",
            startPort = "Out",
            endQuest = "1730011276550198239",
            endPort = "In"
          },
          {
            startQuest = "1730011289957198560",
            startPort = "Out",
            endQuest = "1730011289957198559",
            endPort = "In"
          },
          {
            startQuest = "1730011276550198239",
            startPort = "Out",
            endQuest = "1730011289957198560",
            endPort = "In"
          },
          {
            startQuest = "1730011289957198559",
            startPort = "Out",
            endQuest = "1728389124301198",
            endPort = "Success"
          },
          {
            startQuest = "17295669155171470",
            startPort = "Out",
            endQuest = "17300106621911432",
            endPort = "In"
          },
          {
            startQuest = "17295672716932860",
            startPort = "Out",
            endQuest = "17403814798331333",
            endPort = "In"
          },
          {
            startQuest = "17403814798331333",
            startPort = "Out",
            endQuest = "17295669155171470",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728389124300191"] = {
            key = "1728389124300191",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728389124301198"] = {
            key = "1728389124301198",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4060, y = 153.3928571428571},
            propsData = {ModeType = 0}
          },
          ["1728389124301205"] = {
            key = "1728389124301205",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3063.75, y = 1037.5},
            propsData = {}
          },
          ["17283891898101208"] = {
            key = "17283891898101208",
            type = "TalkNode",
            name = "\228\184\187\232\167\146\229\188\128\232\189\166",
            pos = {x = 1186.4901572112099, y = 81.13044733044717},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002801,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17283892812423071"] = {
            key = "17283892812423071",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3197.9187286397823, y = 128.4518759018759},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1728464074203182288"] = {
            key = "1728464074203182288",
            type = "TalkNode",
            name = "\228\184\187\232\167\146\229\188\128\232\189\166",
            pos = {x = 2639.7575187969924, y = 140.74999999999994},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002802,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17295669042731138"] = {
            key = "17295669042731138",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\160\181\232\183\175\232\144\189\231\159\179",
            pos = {x = 1214.5923076923077, y = 427.7558704453439},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580080}
            }
          },
          ["17295669155171470"] = {
            key = "17295669155171470",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2070.4576923076925, y = 413.3871413483539},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1580080,
              StateId = 492062,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1580080"
            }
          },
          ["17295672716932860"] = {
            key = "17295672716932860",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1502.669230769231, y = 430.92894736842084},
            propsData = {WaitTime = 1}
          },
          ["17300106621911432"] = {
            key = "17300106621911432",
            type = "WeightBranchNode",
            name = "\230\157\131\233\135\141\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 2352.969906223359, y = 396.994427244582},
            propsData = {
              RandomTriggerBranchCount = 1,
              WeightBranchArray = {1, 1}
            }
          },
          ["17300108900982474"] = {
            key = "17300108900982474",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 2638.569906223359, y = 545.3444272445821},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1580081,
                1580082,
                1580083,
                1580084,
                1580085
              }
            }
          },
          ["17300109218992799"] = {
            key = "17300109218992799",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\144\189\231\159\179",
            pos = {x = 2647.319906223359, y = 789.0944272445821},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1580086,
                1580087,
                1580088,
                1580089,
                1580090,
                1580091
              }
            }
          },
          ["17300111812364484"] = {
            key = "17300111812364484",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2913.569906223359, y = 141.59442724458205},
            propsData = {WaitTime = 1}
          },
          ["1730011198441196943"] = {
            key = "1730011198441196943",
            type = "TalkNode",
            name = "\231\167\189\229\133\189\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 2649.819906223359, y = 385.344427244582},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002803,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730011241578197645"] = {
            key = "1730011241578197645",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2938.569906223359, y = 539.094427244582},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1580081,
                1580082,
                1580083,
                1580084,
                1580085
              }
            }
          },
          ["1730011276550198239"] = {
            key = "1730011276550198239",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\231\167\189\229\133\189\229\188\128\232\189\166",
            pos = {x = 3232.319906223359, y = 529.094427244582},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002804,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730011289957198559"] = {
            key = "1730011289957198559",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3788.244317431571, y = 522.5231515732289},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1730011289957198560"] = {
            key = "1730011289957198560",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3503.8954950151474, y = 535.6657029159351},
            propsData = {WaitTime = 1}
          },
          ["17403814798331333"] = {
            key = "17403814798331333",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\229\136\157\229\167\139\229\140\150",
            pos = {x = 1792.5217391304348, y = 422.69565217391306},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1580080,
              StateId = 492061,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1580080"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
