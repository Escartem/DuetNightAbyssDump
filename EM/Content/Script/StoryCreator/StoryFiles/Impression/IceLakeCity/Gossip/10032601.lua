return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101503341160",
      startPort = "StoryStart",
      endStory = "1721630052519142613",
      endPort = "In"
    },
    {
      startStory = "1721630052519142613",
      startPort = "Success",
      endStory = "1721630101503341161",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630052519142613"] = {
      isStoryNode = true,
      key = "1721630052519142613",
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
            startQuest = "1721630052519142620",
            startPort = "Out",
            endQuest = "1721630052519142618",
            endPort = "Success"
          },
          {
            startQuest = "1721630052519142617",
            startPort = "QuestStart",
            endQuest = "1721630052519142620",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630052519142617"] = {
            key = "1721630052519142617",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721630052519142618"] = {
            key = "1721630052519142618",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1644, y = 328},
            propsData = {ModeType = 0}
          },
          ["1721630052519142619"] = {
            key = "1721630052519142619",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["1721630052519142620"] = {
            key = "1721630052519142620",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1163.388888888889, y = 298.8888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032601,
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
    ["1721630101503341160"] = {
      isStoryNode = true,
      key = "1721630101503341160",
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
    ["1721630101503341161"] = {
      isStoryNode = true,
      key = "1721630101503341161",
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
