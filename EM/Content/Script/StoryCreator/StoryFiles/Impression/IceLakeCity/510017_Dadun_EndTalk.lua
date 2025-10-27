return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978885178435",
      startPort = "StoryStart",
      endStory = "171418274192124347",
      endPort = "In"
    },
    {
      startStory = "171418274192124347",
      startPort = "Success",
      endStory = "1704175978885178436",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175978885178435"] = {
      isStoryNode = true,
      key = "1704175978885178435",
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
    ["1704175978885178436"] = {
      isStoryNode = true,
      key = "1704175978885178436",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1370.8333333333335, y = 299.28571428571433},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978885178437"] = {
      isStoryNode = true,
      key = "1704175978885178437",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1100.1825581931419, y = 452.77875720770453},
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
            startQuest = "1704175978885178438",
            startPort = "QuestStart",
            endQuest = "169823533882369391",
            endPort = "In"
          },
          {
            startQuest = "169823533882369391",
            startPort = "Out",
            endQuest = "1704175978885178439",
            endPort = "Success"
          }
        },
        nodeData = {
          ["169823533882369391"] = {
            key = "169823533882369391",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1362.2523714731446, y = 353.03799837036445},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001719,
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
          },
          ["1704175978885178438"] = {
            key = "1704175978885178438",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978885178439"] = {
            key = "1704175978885178439",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1843.27731092437, y = 281.93277310924367},
            propsData = {ModeType = 0}
          },
          ["1704175978885178440"] = {
            key = "1704175978885178440",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2314.705882352941, y = 756.4705882352941},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["171418274192124347"] = {
      isStoryNode = true,
      key = "171418274192124347",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1070.9055751784672, y = 286.8856177545266},
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
            startQuest = "171418274192124348",
            startPort = "QuestStart",
            endQuest = "171418276311324989",
            endPort = "In"
          },
          {
            startQuest = "171418276311324989",
            startPort = "Out",
            endQuest = "171418274192124350",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171418274192124348"] = {
            key = "171418274192124348",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171418274192124350"] = {
            key = "171418274192124350",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1350.3571428571433, y = 306.42857142857144},
            propsData = {ModeType = 0}
          },
          ["171418274192124352"] = {
            key = "171418274192124352",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171418276311324989"] = {
            key = "171418276311324989",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1076.9770037498959, y = 289.0284748973836},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001719,
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
              SwitchToMaster = "Player",
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
