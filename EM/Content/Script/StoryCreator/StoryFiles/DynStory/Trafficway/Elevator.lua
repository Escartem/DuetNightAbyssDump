return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "172415184581355961",
      startPort = "StoryStart",
      endStory = "172415187538156206",
      endPort = "In"
    },
    {
      startStory = "172415187538156206",
      startPort = "Success",
      endStory = "172415184581355964",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["172415184581355961"] = {
      isStoryNode = true,
      key = "172415184581355961",
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
    ["172415184581355964"] = {
      isStoryNode = true,
      key = "172415184581355964",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1442.5000000000066, y = 296.25},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172415187538156206"] = {
      isStoryNode = true,
      key = "172415187538156206",
      type = "StoryNode",
      name = "\232\176\131\230\149\180\231\148\181\230\162\175",
      pos = {x = 1115.3411191119078, y = 294.29405374925716},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_TrafficElevator_Des",
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
            startQuest = "172415187538156207",
            startPort = "QuestStart",
            endQuest = "172415203295057256",
            endPort = "In"
          },
          {
            startQuest = "172415187538156207",
            startPort = "QuestStart",
            endQuest = "172415205349357723",
            endPort = "In"
          },
          {
            startQuest = "172415205349357723",
            startPort = "Out",
            endQuest = "172415208014258112",
            endPort = "In"
          },
          {
            startQuest = "172415208014258112",
            startPort = "Option_2",
            endQuest = "17255127708575675",
            endPort = "In"
          },
          {
            startQuest = "172415208014258112",
            startPort = "Option_1",
            endQuest = "17255128547857769",
            endPort = "In"
          },
          {
            startQuest = "17255128547857769",
            startPort = "Out",
            endQuest = "17255124122003758",
            endPort = "In"
          },
          {
            startQuest = "172551304133810406",
            startPort = "Out",
            endQuest = "172551306049710698",
            endPort = "In"
          },
          {
            startQuest = "172551303112910139",
            startPort = "Out",
            endQuest = "172551306413010881",
            endPort = "In"
          },
          {
            startQuest = "172551306049710698",
            startPort = "Out",
            endQuest = "172415187538156210",
            endPort = "Success"
          },
          {
            startQuest = "172551306413010881",
            startPort = "Out",
            endQuest = "172415187538156210",
            endPort = "Success"
          },
          {
            startQuest = "172415208014258112",
            startPort = "Option_1",
            endQuest = "1725536300645165605",
            endPort = "In"
          },
          {
            startQuest = "17255124122003758",
            startPort = "Out",
            endQuest = "1725536300645165605",
            endPort = "Stop"
          },
          {
            startQuest = "1725536300645165605",
            startPort = "TimerRange_2",
            endQuest = "172551303112910139",
            endPort = "In"
          },
          {
            startQuest = "1725536300645165605",
            startPort = "TimerRange_1",
            endQuest = "172551304133810406",
            endPort = "In"
          },
          {
            startQuest = "172415208014258112",
            startPort = "Option_1",
            endQuest = "17255129038748707",
            endPort = "In"
          }
        },
        nodeData = {
          ["172415187538156207"] = {
            key = "172415187538156207",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172415187538156210"] = {
            key = "172415187538156210",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4285.49773755656, y = -49.15966386554618},
            propsData = {ModeType = 0}
          },
          ["172415187538156213"] = {
            key = "172415187538156213",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172415203295057256"] = {
            key = "172415203295057256",
            type = "TalkNode",
            name = "NPC\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1134.0629166126544, y = 74.89223188690929},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001901,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172415205349357723"] = {
            key = "172415205349357723",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\148\181\230\162\175\232\180\168\230\163\128\229\145\152NPC",
            pos = {x = 1149.6629166126545, y = 296.89223188690903},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180509}
            }
          },
          ["172415208014258112"] = {
            key = "172415208014258112",
            type = "TalkNode",
            name = "NPC\228\186\164\228\186\146\229\175\185\232\175\157",
            pos = {x = 1445.612916612654, y = 253.29223188690884},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818016,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180509",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001902,
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
                  OptionText = "710019021",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                },
                {
                  OptionText = "710019022",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17255124122003758"] = {
            key = "17255124122003758",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2061.944989198273, y = 273.8651931691544},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180511,
              GuideType = "M",
              GuidePointName = "Mechanism_DynTrigger_1180511"
            }
          },
          ["17255127708575675"] = {
            key = "17255127708575675",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1990.6360239699538, y = 594.3780200007666},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["17255128547857769"] = {
            key = "17255128547857769",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129npc",
            pos = {x = 1794.3315623025896, y = 267.97615573599904},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180509}
            }
          },
          ["17255129038748707"] = {
            key = "17255129038748707",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\186\149\233\131\168npc",
            pos = {x = 1790.256886977913, y = 70.39748440732765},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180510}
            }
          },
          ["172551303112910139"] = {
            key = "172551303112910139",
            type = "TalkNode",
            name = "\228\184\142npc\229\175\185\232\175\157",
            pos = {x = 3043.7902014894894, y = 88.90006877947724},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818016,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180510",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001904,
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
          ["172551304133810406"] = {
            key = "172551304133810406",
            type = "TalkNode",
            name = "\228\184\142npc\229\175\185\232\175\157\229\165\150\229\138\177",
            pos = {x = 3041.852302432025, y = -41.50164906789283},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818016,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180510",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001903,
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
          ["172551306049710698"] = {
            key = "172551306049710698",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3463.7570281410985, y = -17.069016483086266},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["172551306413010881"] = {
            key = "172551306413010881",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3466.885910128676, y = 120.51779887546816},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1725536300645165605"] = {
            key = "1725536300645165605",
            type = "TimerBranchNode",
            name = "\232\174\161\230\151\182\229\153\168",
            pos = {x = 2381.8461538461543, y = 38.7692307692307},
            propsData = {
              TimerRange = {
                {StartTime = 0, EndTime = 15},
                {StartTime = 15, EndTime = -1}
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
