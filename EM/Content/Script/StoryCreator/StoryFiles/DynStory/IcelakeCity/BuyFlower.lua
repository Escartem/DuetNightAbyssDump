return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1736149297799837",
      startPort = "StoryStart",
      endStory = "1736149301902980",
      endPort = "In"
    },
    {
      startStory = "1736149301902980",
      startPort = "Success",
      endStory = "1736149297799840",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1736149297799837"] = {
      isStoryNode = true,
      key = "1736149297799837",
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
    ["1736149297799840"] = {
      isStoryNode = true,
      key = "1736149297799840",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1634.3803056027164, y = 296.02716468590836},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1736149301902980"] = {
      isStoryNode = true,
      key = "1736149301902980",
      type = "StoryNode",
      name = "\228\185\176\232\138\177",
      pos = {x = 1202.5263157894738, y = 287.05263157894734},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeBuyFlower_Des",
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
            startQuest = "1736149301902981",
            startPort = "QuestStart",
            endQuest = "17361493830831603",
            endPort = "In"
          },
          {
            startQuest = "17361493830831603",
            startPort = "Out",
            endQuest = "17361494124551805",
            endPort = "In"
          },
          {
            startQuest = "17361493830831603",
            startPort = "Out",
            endQuest = "17361495322822663",
            endPort = "In"
          },
          {
            startQuest = "17361495322822663",
            startPort = "Out",
            endQuest = "17361495496112997",
            endPort = "In"
          },
          {
            startQuest = "17361495322822663",
            startPort = "Out",
            endQuest = "17361495563663188",
            endPort = "In"
          },
          {
            startQuest = "17361495496112997",
            startPort = "Out",
            endQuest = "17361495665373451",
            endPort = "Input_1"
          },
          {
            startQuest = "17361495563663188",
            startPort = "Out",
            endQuest = "17361495665373451",
            endPort = "Input_2"
          },
          {
            startQuest = "17361495665373451",
            startPort = "Out",
            endQuest = "17361494209071982",
            endPort = "In"
          },
          {
            startQuest = "17361494209071982",
            startPort = "Option_1",
            endQuest = "17361496084264314",
            endPort = "In"
          },
          {
            startQuest = "17361494209071982",
            startPort = "Option_2",
            endQuest = "17361496134204460",
            endPort = "In"
          },
          {
            startQuest = "17361496084264314",
            startPort = "Out",
            endQuest = "17361496218864722",
            endPort = "In"
          },
          {
            startQuest = "17361496134204460",
            startPort = "Out",
            endQuest = "17361496276484890",
            endPort = "In"
          },
          {
            startQuest = "17361496218864722",
            startPort = "Out",
            endQuest = "1736149301902984",
            endPort = "Success"
          },
          {
            startQuest = "17361496276484890",
            startPort = "Out",
            endQuest = "1736149301902984",
            endPort = "Success"
          },
          {
            startQuest = "17361495322822663",
            startPort = "Out",
            endQuest = "17361520142521408411",
            endPort = "In"
          }
        },
        nodeData = {
          ["1736149301902981"] = {
            key = "1736149301902981",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1736149301902984"] = {
            key = "1736149301902984",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3752.5252525252527, y = 276.7676767676768},
            propsData = {ModeType = 0}
          },
          ["1736149301902987"] = {
            key = "1736149301902987",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3323.6363636363635, y = 724.5454545454545},
            propsData = {}
          },
          ["17361493830831603"] = {
            key = "17361493830831603",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\229\173\169npc",
            pos = {x = 1114.1024844720498, y = 299.751552795031},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190989}
            }
          },
          ["17361494124551805"] = {
            key = "17361494124551805",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1505.1739130434785, y = 75.8229813664596},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005201,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17361494209071982"] = {
            key = "17361494209071982",
            type = "TalkNode",
            name = "\228\185\176\232\138\177",
            pos = {x = 2714.9610703306353, y = 234.3691574126358},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818046,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190989",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005214,
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
              NormalOptions = {
                {
                  OptionText = "710052141",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = -1
                },
                {
                  OptionText = "710052142",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17361495322822663"] = {
            key = "17361495322822663",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1505.1739130434783, y = 284.75155279503116},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818046,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190989",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005202,
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
          ["17361495496112997"] = {
            key = "17361495496112997",
            type = "TalkNode",
            name = "\228\185\158\232\174\168\232\128\133",
            pos = {x = 1949.8167701863356, y = 110.1086956521739},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818047,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190990",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005206,
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
          ["17361495563663188"] = {
            key = "17361495563663188",
            type = "TalkNode",
            name = "\229\176\143\231\148\183\229\173\169",
            pos = {x = 1953.0310559006214, y = 417.96583850931677},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818048,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190991",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005209,
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
          ["17361495665373451"] = {
            key = "17361495665373451",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2405.173913043478, y = 246.18012422360255},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["17361496084264314"] = {
            key = "17361496084264314",
            type = "TalkNode",
            name = "\228\191\161\228\187\187",
            pos = {x = 3037.4450718363764, y = 187.84318338666162},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005215,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
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
          ["17361496134204460"] = {
            key = "17361496134204460",
            type = "TalkNode",
            name = "\228\184\141\228\191\161\228\187\187",
            pos = {x = 3068.5561829474873, y = 441.17651671999505},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005216,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
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
          ["17361496218864722"] = {
            key = "17361496218864722",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3383.0006273919316, y = 183.39873894221722},
            propsData = {
              DialogueId = 71005215,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17361496276484890"] = {
            key = "17361496276484890",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3372.722849614154, y = 431.4542944977728},
            propsData = {
              DialogueId = 71005216,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17361520142521408411"] = {
            key = "17361520142521408411",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/Npc",
            pos = {x = 1942.8022146935195, y = 707.0098500533284},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190990, 1190991}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
