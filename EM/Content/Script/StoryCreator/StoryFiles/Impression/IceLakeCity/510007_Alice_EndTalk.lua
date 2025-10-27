return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978775175799",
      startPort = "StoryStart",
      endStory = "171418234551713078",
      endPort = "In"
    },
    {
      startStory = "171418234551713078",
      startPort = "Success",
      endStory = "1704175978775175800",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175978775175799"] = {
      isStoryNode = true,
      key = "1704175978775175799",
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
    ["1704175978775175800"] = {
      isStoryNode = true,
      key = "1704175978775175800",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1511.1904761904766, y = 306.7857142857143},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978775175801"] = {
      isStoryNode = true,
      key = "1704175978775175801",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1154.2885154061626, y = 493.2857142857141},
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
            startQuest = "1704175978775175802",
            startPort = "QuestStart",
            endQuest = "1704175978775175805",
            endPort = "In"
          },
          {
            startQuest = "1704175978775175805",
            startPort = "Out",
            endQuest = "1704175978775175803",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978775175802"] = {
            key = "1704175978775175802",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978775175803"] = {
            key = "1704175978775175803",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1654.7058823529414, y = 317.6470588235294},
            propsData = {ModeType = 0}
          },
          ["1704175978775175804"] = {
            key = "1704175978775175804",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2314.705882352941, y = 756.4705882352941},
            propsData = {}
          },
          ["1704175978775175805"] = {
            key = "1704175978775175805",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1146.7647058823532, y = 286.66666666666663},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000707,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
          }
        },
        commentData = {}
      }
    },
    ["171418234551713078"] = {
      isStoryNode = true,
      key = "171418234551713078",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1145.852150475239, y = 284.3891550668876},
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
            startQuest = "171418234551713079",
            startPort = "QuestStart",
            endQuest = "171418235936613606",
            endPort = "In"
          },
          {
            startQuest = "171418235936613606",
            startPort = "Out",
            endQuest = "171418234551713081",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171418234551713079"] = {
            key = "171418234551713079",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171418234551713081"] = {
            key = "171418234551713081",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1320.0000000000023, y = 306},
            propsData = {ModeType = 0}
          },
          ["171418234551713083"] = {
            key = "171418234551713083",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171418235936613606"] = {
            key = "171418235936613606",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1050.3521504752391, y = 292.5320122097447},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000707,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
