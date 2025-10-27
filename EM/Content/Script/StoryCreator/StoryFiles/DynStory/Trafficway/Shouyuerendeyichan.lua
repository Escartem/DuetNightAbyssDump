return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17217246185361",
      startPort = "StoryStart",
      endStory = "1721724626739230",
      endPort = "In"
    },
    {
      startStory = "1721724626739230",
      startPort = "Success",
      endStory = "17217246185365",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17217246185361"] = {
      isStoryNode = true,
      key = "17217246185361",
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
    ["17217246185365"] = {
      isStoryNode = true,
      key = "17217246185365",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1825.6521739130435, y = 269.04347826086956},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721724626739230"] = {
      isStoryNode = true,
      key = "1721724626739230",
      type = "StoryNode",
      name = "\233\129\135\229\136\176\231\139\169\230\156\136\228\186\186NPC",
      pos = {x = 1125.1825396825395, y = 274.95238095238096},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_TrafficwayYichan_Des",
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
            startQuest = "1721724626739231",
            startPort = "QuestStart",
            endQuest = "17217247905461002",
            endPort = "In"
          },
          {
            startQuest = "1721724626739231",
            startPort = "QuestStart",
            endQuest = "17217248991461516",
            endPort = "In"
          },
          {
            startQuest = "17217247905461002",
            startPort = "Out",
            endQuest = "17217249478352306",
            endPort = "In"
          },
          {
            startQuest = "17220635389484737",
            startPort = "Out",
            endQuest = "17220635389484738",
            endPort = "In"
          },
          {
            startQuest = "17220635389484737",
            startPort = "Out",
            endQuest = "17220635389484739",
            endPort = "In"
          },
          {
            startQuest = "17220635389484738",
            startPort = "Out",
            endQuest = "17220635389484740",
            endPort = "In"
          },
          {
            startQuest = "17220635389484741",
            startPort = "Out",
            endQuest = "17220635389484742",
            endPort = "In"
          },
          {
            startQuest = "17220635389484743",
            startPort = "Out",
            endQuest = "17220635389484742",
            endPort = "In"
          },
          {
            startQuest = "17220635389494747",
            startPort = "Out",
            endQuest = "17220635389484746",
            endPort = "In"
          },
          {
            startQuest = "17220635389484741",
            startPort = "Out",
            endQuest = "17220635389484746",
            endPort = "In"
          },
          {
            startQuest = "17220635389494748",
            startPort = "Out",
            endQuest = "17220635389494749",
            endPort = "In"
          },
          {
            startQuest = "17220635389484744",
            startPort = "Out",
            endQuest = "17220635389484745",
            endPort = "In"
          },
          {
            startQuest = "17220635389484740",
            startPort = "Out",
            endQuest = "17220635389484741",
            endPort = "In"
          },
          {
            startQuest = "17217249478352306",
            startPort = "Out",
            endQuest = "17220635389484737",
            endPort = "In"
          },
          {
            startQuest = "17220635389484745",
            startPort = "Out",
            endQuest = "1721724626739237",
            endPort = "Success"
          },
          {
            startQuest = "17220635389494749",
            startPort = "Out",
            endQuest = "1721724626739237",
            endPort = "Success"
          },
          {
            startQuest = "17220635389484742",
            startPort = "Option_1",
            endQuest = "17220635389484745",
            endPort = "In"
          },
          {
            startQuest = "17220635389484746",
            startPort = "Option_1",
            endQuest = "17220635389494749",
            endPort = "In"
          },
          {
            startQuest = "17220635389484742",
            startPort = "Fail",
            endQuest = "17220635389484743",
            endPort = "In"
          },
          {
            startQuest = "17220635389484746",
            startPort = "Fail",
            endQuest = "17220635389494747",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721724626739231"] = {
            key = "1721724626739231",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721724626739237"] = {
            key = "1721724626739237",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4168.095238095238, y = 229.50549450549454},
            propsData = {ModeType = 0}
          },
          ["1721724626739243"] = {
            key = "1721724626739243",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17217247905461002"] = {
            key = "17217247905461002",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\139\169\230\156\136\228\186\186NPC",
            pos = {x = 1102.8015873015875, y = 373.2857142857142},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180422}
            }
          },
          ["17217248991461516"] = {
            key = "17217248991461516",
            type = "TalkNode",
            name = "\231\139\169\230\156\136\228\186\186\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1100.3968253968253, y = 172.65079365079356},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001601,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17217249478352306"] = {
            key = "17217249478352306",
            type = "TalkNode",
            name = "\228\184\142\231\139\169\230\156\136\228\186\186\228\186\164\230\181\129",
            pos = {x = 1362.3650793650797, y = 355.5079365079366},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180422",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001602,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17220635389484737"] = {
            key = "17220635389484737",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1658.0048114865692, y = 347.0751502983809},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180424,
                1180425,
                1180426,
                1180427,
                1180429
              }
            }
          },
          ["17220635389484738"] = {
            key = "17220635389484738",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2044.790525772283, y = 359.8953473427159},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180424,
                1180425,
                1180426,
                1180427,
                1180429
              }
            }
          },
          ["17220635389484739"] = {
            key = "17220635389484739",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2053.3619543437117, y = 135.96677591414448},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001607,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17220635389484740"] = {
            key = "17220635389484740",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2388.825667400603, y = 363.70224887740426},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1180428},
              QuestPickupId = -1,
              UnitId = 80014,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17220635389484741"] = {
            key = "17220635389484741",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\155\229\187\186\229\149\134\228\186\186",
            pos = {x = 2689.0780320248523, y = 362.04924469057903},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180423}
            }
          },
          ["17220635389484742"] = {
            key = "17220635389484742",
            type = "TalkNode",
            name = "\228\184\142\231\139\169\230\156\136\228\186\186\229\175\185\232\175\157",
            pos = {x = 3180.888376852439, y = 94.45072252309134},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180422",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001608,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["17220635389484743"] = {
            key = "17220635389484743",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3174.745519709581, y = 309.0221510945199},
            propsData = {WaitTime = 0.5}
          },
          ["17220635389484744"] = {
            key = "17220635389484744",
            type = "TalkNode",
            name = "\231\139\169\230\156\136\228\186\186\230\132\159\232\176\162",
            pos = {x = 3528.131134095197, y = -90.56925749688867},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001609,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17220635389484745"] = {
            key = "17220635389484745",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3815.1740911381535, y = 68.23643680880562},
            propsData = {
              DialogueId = 71001609,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["17220635389484746"] = {
            key = "17220635389484746",
            type = "TalkNode",
            name = "\228\184\142\229\149\134\228\186\186\229\175\185\232\175\157",
            pos = {x = 3176.245519709583, y = 421.7721510945199},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818005,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180423",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001610,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["17220635389494747"] = {
            key = "17220635389494747",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3174.102662566725, y = 684.3435796659485},
            propsData = {WaitTime = 0.5}
          },
          ["17220635389494748"] = {
            key = "17220635389494748",
            type = "TalkNode",
            name = "\229\149\134\228\186\186\230\132\159\232\176\162",
            pos = {x = 3733.4882769523406, y = 783.9782783006472},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001611,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17220635389494749"] = {
            key = "17220635389494749",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3818.031233995297, y = 409.9864368088057},
            propsData = {
              DialogueId = 71001611,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
