return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17224811146075759",
      startPort = "StoryStart",
      endStory = "17224811247736566",
      endPort = "In"
    },
    {
      startStory = "17224811247736566",
      startPort = "Success",
      endStory = "17224811146075762",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17224811146075759"] = {
      isStoryNode = true,
      key = "17224811146075759",
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
    ["17224811146075762"] = {
      isStoryNode = true,
      key = "17224811146075762",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1518.1176470588232, y = 292.9411764705883},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17224811247736566"] = {
      isStoryNode = true,
      key = "17224811247736566",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1159.6425770308124, y = 289.71421767087384},
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
            startQuest = "17224811247736567",
            startPort = "QuestStart",
            endQuest = "17252599337031708",
            endPort = "In"
          },
          {
            startQuest = "17252599337031708",
            startPort = "Out",
            endQuest = "17252599359261915",
            endPort = "In"
          },
          {
            startQuest = "17252599359261915",
            startPort = "Out",
            endQuest = "17224811247736570",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17224811247736567"] = {
            key = "17224811247736567",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -236.23529411764733, y = 482.1176470588236},
            propsData = {ModeType = 0}
          },
          ["17224811247736570"] = {
            key = "17224811247736570",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 517.4901960784309, y = 481.80392156862746},
            propsData = {ModeType = 0}
          },
          ["17224811247736573"] = {
            key = "17224811247736573",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1190.5882352941173, y = -279.76470588235304},
            propsData = {}
          },
          ["17252599337031708"] = {
            key = "17252599337031708",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 0.4149967679380211, y = 659.6522301228185},
            propsData = {GuideId = 45}
          },
          ["17252599359261915"] = {
            key = "17252599359261915",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 271.709114414997, y = 552.005171299289},
            propsData = {GuideId = 46}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
