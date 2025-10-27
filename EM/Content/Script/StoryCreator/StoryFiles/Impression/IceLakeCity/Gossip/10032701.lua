return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17222592625481142982",
      startPort = "StoryStart",
      endStory = "17222592625481142981",
      endPort = "In"
    },
    {
      startStory = "17222592625481142981",
      startPort = "Success",
      endStory = "17222592625481142983",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17222592625481142981"] = {
      isStoryNode = true,
      key = "17222592625481142981",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1119.7088122605362, y = 290.6781609195402},
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
            startQuest = "17222592625481142987",
            startPort = "Out",
            endQuest = "17222592625481142985",
            endPort = "Success"
          },
          {
            startQuest = "17222592625481142984",
            startPort = "QuestStart",
            endQuest = "17222592625481142987",
            endPort = "In"
          }
        },
        nodeData = {
          ["17222592625481142984"] = {
            key = "17222592625481142984",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17222592625481142985"] = {
            key = "17222592625481142985",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1644, y = 328},
            propsData = {ModeType = 0}
          },
          ["17222592625481142986"] = {
            key = "17222592625481142986",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["17222592625481142987"] = {
            key = "17222592625481142987",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1167.388888888889, y = 298.8888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032701,
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
    ["17222592625481142982"] = {
      isStoryNode = true,
      key = "17222592625481142982",
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
    ["17222592625481142983"] = {
      isStoryNode = true,
      key = "17222592625481142983",
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
