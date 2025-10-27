return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17222592625531143052",
      startPort = "StoryStart",
      endStory = "17222592625531143051",
      endPort = "In"
    },
    {
      startStory = "17222592625531143051",
      startPort = "Success",
      endStory = "17222592625531143053",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17222592625531143051"] = {
      isStoryNode = true,
      key = "17222592625531143051",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1119.7088122605362, y = 289.34482758620686},
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
        bIsNotifyGameMode = false,
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
            startQuest = "17222592625531143057",
            startPort = "Out",
            endQuest = "17222592625531143055",
            endPort = "Success"
          },
          {
            startQuest = "17222592625531143054",
            startPort = "QuestStart",
            endQuest = "17222592625531143057",
            endPort = "In"
          }
        },
        nodeData = {
          ["17222592625531143054"] = {
            key = "17222592625531143054",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17222592625531143055"] = {
            key = "17222592625531143055",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1644, y = 328},
            propsData = {ModeType = 0}
          },
          ["17222592625531143056"] = {
            key = "17222592625531143056",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["17222592625531143057"] = {
            key = "17222592625531143057",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1163.388888888889, y = 298.8888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032801,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17222592625531143052"] = {
      isStoryNode = true,
      key = "17222592625531143052",
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
    ["17222592625531143053"] = {
      isStoryNode = true,
      key = "17222592625531143053",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1494.6666666666665, y = 313.1111111111111},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
