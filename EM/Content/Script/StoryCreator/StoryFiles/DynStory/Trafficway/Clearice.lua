return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17351095366341",
      startPort = "StoryStart",
      endStory = "173510955551293",
      endPort = "In"
    },
    {
      startStory = "173510955551293",
      startPort = "Success",
      endStory = "17351095366345",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17351095366341"] = {
      isStoryNode = true,
      key = "17351095366341",
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
    ["17351095366345"] = {
      isStoryNode = true,
      key = "17351095366345",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1490, y = 278.57142857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173510955551293"] = {
      isStoryNode = true,
      key = "173510955551293",
      type = "StoryNode",
      name = "\230\184\133\231\144\134\229\134\176\233\148\165",
      pos = {x = 1182, y = 295.59999999999997},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_Clearice_Des",
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
            startQuest = "173510955551294",
            startPort = "QuestStart",
            endQuest = "1735109576243774",
            endPort = "In"
          },
          {
            startQuest = "173510955551294",
            startPort = "QuestStart",
            endQuest = "17351095892201084",
            endPort = "In"
          },
          {
            startQuest = "1735109576243774",
            startPort = "Out",
            endQuest = "17351096122601397",
            endPort = "In"
          },
          {
            startQuest = "17351096960902575",
            startPort = "Out",
            endQuest = "17351097431073148",
            endPort = "In"
          },
          {
            startQuest = "17351097431073148",
            startPort = "Out",
            endQuest = "17351097555033399",
            endPort = "Input_1"
          },
          {
            startQuest = "17351097555033399",
            startPort = "Out",
            endQuest = "17351098028014167",
            endPort = "In"
          },
          {
            startQuest = "17351098028014167",
            startPort = "Out",
            endQuest = "17351098187934517",
            endPort = "In"
          },
          {
            startQuest = "17351098187934517",
            startPort = "Out",
            endQuest = "1735109555513101",
            endPort = "Success"
          },
          {
            startQuest = "17351096589642293",
            startPort = "Out",
            endQuest = "1735109555513101",
            endPort = "Success"
          },
          {
            startQuest = "1735109576243774",
            startPort = "Out",
            endQuest = "1735111555773699624",
            endPort = "In"
          },
          {
            startQuest = "1735111828580702284",
            startPort = "Out",
            endQuest = "1735111828580702285",
            endPort = "In"
          },
          {
            startQuest = "1735111829866702342",
            startPort = "Out",
            endQuest = "1735111829866702343",
            endPort = "In"
          },
          {
            startQuest = "1735111828580702285",
            startPort = "Out",
            endQuest = "17351097555033399",
            endPort = "Input_2"
          },
          {
            startQuest = "1735111829866702343",
            startPort = "Out",
            endQuest = "17351097555033399",
            endPort = "Input_3"
          },
          {
            startQuest = "17351095892201084",
            startPort = "Out",
            endQuest = "17351097431073148",
            endPort = "In"
          },
          {
            startQuest = "17351095892201084",
            startPort = "Out",
            endQuest = "1735111828580702285",
            endPort = "In"
          },
          {
            startQuest = "17351095892201084",
            startPort = "Out",
            endQuest = "1735111829866702343",
            endPort = "In"
          },
          {
            startQuest = "17351096122601397",
            startPort = "Option_2",
            endQuest = "17351096589642293",
            endPort = "In"
          },
          {
            startQuest = "17351096122601397",
            startPort = "Option_1",
            endQuest = "17351096960902575",
            endPort = "In"
          },
          {
            startQuest = "17351096122601397",
            startPort = "Option_1",
            endQuest = "1735111828580702284",
            endPort = "In"
          },
          {
            startQuest = "17351096122601397",
            startPort = "Option_1",
            endQuest = "1735111829866702342",
            endPort = "In"
          },
          {
            startQuest = "17351097555033399",
            startPort = "Out",
            endQuest = "17351096122601397",
            endPort = "Stop"
          }
        },
        nodeData = {
          ["173510955551294"] = {
            key = "173510955551294",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1735109555513101"] = {
            key = "1735109555513101",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3545.6275303643724, y = 341.17408906882594},
            propsData = {ModeType = 0}
          },
          ["1735109555513108"] = {
            key = "1735109555513108",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3199.4736842105262, y = 775.7894736842105},
            propsData = {}
          },
          ["1735109576243774"] = {
            key = "1735109576243774",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/NPC",
            pos = {x = 1155, y = 299.2499999999999},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180533}
            }
          },
          ["17351095892201084"] = {
            key = "17351095892201084",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\134\176\233\148\165",
            pos = {x = 1155, y = -157.8152173913045},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180534,
                1180535,
                1180536
              }
            }
          },
          ["17351096122601397"] = {
            key = "17351096122601397",
            type = "TalkNode",
            name = "\230\184\133\231\144\134\229\175\185\232\175\157",
            pos = {x = 1501.25, y = 261.7499999999999},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818039,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180533",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71004802,
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
          ["17351096589642293"] = {
            key = "17351096589642293",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2090.5072463768115, y = 428.4189892233371},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["17351096960902575"] = {
            key = "17351096960902575",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2025.8152173913043, y = -170.64130434782618},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1180534,
              StateId = 3901802,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1180534"
            }
          },
          ["17351097431073148"] = {
            key = "17351097431073148",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2299.565217391304, y = -143.03260869565224},
            propsData = {StaticCreatorId = 1180534, DestroyReason = "Default"}
          },
          ["17351097555033399"] = {
            key = "17351097555033399",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2645.156882591093, y = 188.99190283400796},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17351098028014167"] = {
            key = "17351098028014167",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2953.891700404859, y = 233.5263157894737},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818039,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180533",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71004805,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
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
          ["17351098187934517"] = {
            key = "17351098187934517",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3271.1993927125513, y = 226.6032388663968},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1735111555773699624"] = {
            key = "1735111555773699624",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1394.6728757512515, y = 43.90217181750337},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004801,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1735111828580702284"] = {
            key = "1735111828580702284",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2031.7109192295131, y = -9.032610791192209},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1180535,
              StateId = 3901802,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1180535"
            }
          },
          ["1735111828580702285"] = {
            key = "1735111828580702285",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2300.852223577339, y = 1.010867469677379},
            propsData = {StaticCreatorId = 1180535, DestroyReason = "Default"}
          },
          ["1735111829866702342"] = {
            key = "1735111829866702342",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2038.2326583599477, y = 154.01086746967732},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1180536,
              StateId = 3901802,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1180536"
            }
          },
          ["1735111829866702343"] = {
            key = "1735111829866702343",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2314.591354012121, y = 182.3152152957643},
            propsData = {StaticCreatorId = 1180536, DestroyReason = "Default"}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
