return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17413419832812416085",
      startPort = "StoryStart",
      endStory = "17413419832812416087",
      endPort = "In"
    },
    {
      startStory = "17413419832812416087",
      startPort = "Success",
      endStory = "17413419832812416086",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17413419832812416085"] = {
      isStoryNode = true,
      key = "17413419832812416085",
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
    ["17413419832812416086"] = {
      isStoryNode = true,
      key = "17413419832812416086",
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
    ["17413419832812416087"] = {
      isStoryNode = true,
      key = "17413419832812416087",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1522, y = 318},
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
            startQuest = "17413419832812416092",
            startPort = "Branch_1",
            endQuest = "17413419832812416091",
            endPort = "In"
          },
          {
            startQuest = "17413419832812416091",
            startPort = "Out",
            endQuest = "17413419832812416089",
            endPort = "Success"
          },
          {
            startQuest = "17413419832812416092",
            startPort = "Branch_3",
            endQuest = "17550710526961820940",
            endPort = "In"
          },
          {
            startQuest = "17550710306851820597",
            startPort = "Out",
            endQuest = "17413419832812416089",
            endPort = "Success"
          },
          {
            startQuest = "17550710526961820940",
            startPort = "Out",
            endQuest = "17413419832812416089",
            endPort = "Success"
          },
          {
            startQuest = "17550710616101821079",
            startPort = "Out",
            endQuest = "17413419832812416089",
            endPort = "Success"
          },
          {
            startQuest = "17413419832812416088",
            startPort = "QuestStart",
            endQuest = "17413419832812416092",
            endPort = "In"
          },
          {
            startQuest = "17557691301502207",
            startPort = "Out",
            endQuest = "17550710616101821079",
            endPort = "In"
          },
          {
            startQuest = "17413419832812416092",
            startPort = "Branch_4",
            endQuest = "17557691301502207",
            endPort = "In"
          },
          {
            startQuest = "17413419832812416092",
            startPort = "Branch_2",
            endQuest = "17550710306851820597",
            endPort = "In"
          }
        },
        nodeData = {
          ["17413419832812416088"] = {
            key = "17413419832812416088",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 521.5959595959596, y = 342.12121212121224},
            propsData = {ModeType = 0}
          },
          ["17413419832812416089"] = {
            key = "17413419832812416089",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3126.138785699426, y = 648.8755931330301},
            propsData = {ModeType = 0}
          },
          ["17413419832812416090"] = {
            key = "17413419832812416090",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3138.909090909091, y = 145.63636363636363},
            propsData = {}
          },
          ["17413419832812416091"] = {
            key = "17413419832812416091",
            type = "TalkNode",
            name = "\228\190\139\229\173\144\239\188\140\228\189\160\228\184\141\232\175\165\229\156\168\230\184\184\230\136\143\229\134\133\231\156\139\229\136\176\232\191\153\228\184\170\231\154\132",
            pos = {x = 1461.3923444976078, y = 284.42344497607655},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000001,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_71000001",
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
          ["17413419832812416092"] = {
            key = "17413419832812416092",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1076, y = 318},
            propsData = {
              Branches = {
                720000,
                720040,
                720041,
                720042
              }
            }
          },
          ["17550710306851820597"] = {
            key = "17550710306851820597",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1465, y = 504.25},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004001,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720040",
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
          ["17550710526961820940"] = {
            key = "17550710526961820940",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1473.75, y = 744.75},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004101,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720041",
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
          ["17550710616101821079"] = {
            key = "17550710616101821079",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1790.25, y = 994.2500000000001},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004201,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720042",
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
          ["17557691301502207"] = {
            key = "17557691301502207",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1474.3157894736842, y = 990.9956140350879},
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
