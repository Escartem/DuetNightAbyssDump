return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978873178185",
      startPort = "StoryStart",
      endStory = "1704175978873178187",
      endPort = "In"
    },
    {
      startStory = "1704175978873178187",
      startPort = "Success",
      endStory = "1704175978873178186",
      endPort = "StoryEnd"
    },
    {
      startStory = "1704175978873178187",
      startPort = "Fail",
      endStory = "1704175978873178186",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175978873178185"] = {
      isStoryNode = true,
      key = "1704175978873178185",
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
    ["1704175978873178186"] = {
      isStoryNode = true,
      key = "1704175978873178186",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1661.764705882353, y = 294.70588235294116},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978873178187"] = {
      isStoryNode = true,
      key = "1704175978873178187",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1243.7523714731446, y = 320.0379983703644},
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
            startQuest = "1704175978873178188",
            startPort = "QuestStart",
            endQuest = "169823462909354889",
            endPort = "In"
          },
          {
            startQuest = "169823462909354889",
            startPort = "Out",
            endQuest = "1704175978873178189",
            endPort = "Success"
          },
          {
            startQuest = "169823462909354889",
            startPort = "Fail",
            endQuest = "1704175978873178190",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["169823462909354889"] = {
            key = "169823462909354889",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1116.8971083152499, y = 296.9327352124697},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001601,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175978873178188"] = {
            key = "1704175978873178188",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978873178189"] = {
            key = "1704175978873178189",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1491.764285714286, y = 158.93571428571425},
            propsData = {ModeType = 0}
          },
          ["1704175978873178190"] = {
            key = "1704175978873178190",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1475.1428571428569, y = 437.6071428571429},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
