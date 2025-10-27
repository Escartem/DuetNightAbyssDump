return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17413419832892418961",
      startPort = "StoryStart",
      endStory = "17413419832892418963",
      endPort = "In"
    },
    {
      startStory = "17413419832892418963",
      startPort = "Success",
      endStory = "17413419832892418962",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17413419832892418961"] = {
      isStoryNode = true,
      key = "17413419832892418961",
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
    ["17413419832892418962"] = {
      isStoryNode = true,
      key = "17413419832892418962",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17413419832892418963"] = {
      isStoryNode = true,
      key = "17413419832892418963",
      type = "StoryNode",
      name = "\229\186\143\231\171\160\230\189\152\231\165\158\229\175\185\232\175\157",
      pos = {x = 1522, y = 320},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17413419832892418968",
            startPort = "Branch_1",
            endQuest = "17413419832892418967",
            endPort = "In"
          },
          {
            startQuest = "17413419832892418967",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418969",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418970",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418971",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418972",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418968",
            startPort = "Branch_6",
            endQuest = "1744372699364628",
            endPort = "In"
          },
          {
            startQuest = "1744372699364628",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418968",
            startPort = "Branch_7",
            endQuest = "1755070557728694",
            endPort = "In"
          },
          {
            startQuest = "1755070557728694",
            startPort = "Out",
            endQuest = "17413419832892418965",
            endPort = "Success"
          },
          {
            startQuest = "17413419832892418964",
            startPort = "QuestStart",
            endQuest = "17413419832892418968",
            endPort = "In"
          },
          {
            startQuest = "17413419832892418968",
            startPort = "Branch_2",
            endQuest = "17556088475021949",
            endPort = "In"
          },
          {
            startQuest = "17556088475021949",
            startPort = "Out",
            endQuest = "17413419832892418969",
            endPort = "In"
          },
          {
            startQuest = "17413419832892418968",
            startPort = "Branch_4",
            endQuest = "17556807448342780100",
            endPort = "In"
          },
          {
            startQuest = "17556807448342780100",
            startPort = "Out",
            endQuest = "17413419832892418971",
            endPort = "In"
          },
          {
            startQuest = "17413419832892418968",
            startPort = "Branch_3",
            endQuest = "17413419832892418970",
            endPort = "In"
          },
          {
            startQuest = "17413419832892418968",
            startPort = "Branch_5",
            endQuest = "17413419832892418972",
            endPort = "In"
          }
        },
        nodeData = {
          ["17413419832892418964"] = {
            key = "17413419832892418964",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 391.5959595959596, y = 456.12121212121224},
            propsData = {ModeType = 0}
          },
          ["17413419832892418965"] = {
            key = "17413419832892418965",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3135.513785699426, y = 757.6255931330301},
            propsData = {ModeType = 0}
          },
          ["17413419832892418966"] = {
            key = "17413419832892418966",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3138.909090909091, y = 145.63636363636363},
            propsData = {}
          },
          ["17413419832892418967"] = {
            key = "17413419832892418967",
            type = "TalkNode",
            name = "\228\190\139\229\173\144\239\188\140\228\189\160\228\184\141\232\175\165\229\156\168\230\184\184\230\136\143\229\134\133\231\156\139\229\136\176\232\191\153\228\184\170\231\154\132",
            pos = {x = 1468.329464173064, y = -285.5765550239235},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000001,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720000",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17413419832892418968"] = {
            key = "17413419832892418968",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1079.3333333333333, y = 321.3333333333333},
            propsData = {
              Branches = {
                720000,
                720002,
                720003,
                720004,
                720005,
                720038,
                720039
              }
            }
          },
          ["17413419832892418969"] = {
            key = "17413419832892418969",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1737.713496122752, y = -108.53308034977726},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000201,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720002",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17413419832892418970"] = {
            key = "17413419832892418970",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1459.0984941831625, y = 67.28440042032729},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000301,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720003",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17413419832892418971"] = {
            key = "17413419832892418971",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1751.0456129682675, y = 276.2872296277332},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000401,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720004",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17413419832892418972"] = {
            key = "17413419832892418972",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1484.710384581094, y = 446.8750806782844},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000501,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720005",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1744372699364628"] = {
            key = "1744372699364628",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1481.671052631579, y = 641.9078947368422},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003801,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720038",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1755070557728694"] = {
            key = "1755070557728694",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1493.0175438596489, y = 909.3157894736844},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003901,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720039",
              BlendInTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17556088475021949"] = {
            key = "17556088475021949",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1462.7865123165973, y = -89.8580730919369},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 72999999,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          ["17556807448342780100"] = {
            key = "17556807448342780100",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1453.7927415227568, y = 264.90384191069694},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 72999999,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
