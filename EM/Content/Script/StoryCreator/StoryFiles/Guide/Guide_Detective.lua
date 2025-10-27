return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17570749762301",
      startPort = "StoryStart",
      endStory = "1757075001065153",
      endPort = "In"
    },
    {
      startStory = "1757075001065153",
      startPort = "Success",
      endStory = "17570749762305",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17570749762301"] = {
      isStoryNode = true,
      key = "17570749762301",
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
    ["17570749762305"] = {
      isStoryNode = true,
      key = "17570749762305",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1634, y = 276},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1757075001065153"] = {
      isStoryNode = true,
      key = "1757075001065153",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1184, y = 294},
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
            startQuest = "1757075001065154",
            startPort = "QuestStart",
            endQuest = "1757075138404633718",
            endPort = "In"
          },
          {
            startQuest = "1757075138404633718",
            startPort = "Out",
            endQuest = "1757075001065161",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1757075001065154"] = {
            key = "1757075001065154",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1757075001065161"] = {
            key = "1757075001065161",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1488, y = 336},
            propsData = {ModeType = 0}
          },
          ["1757075001065168"] = {
            key = "1757075001065168",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1757075138404633718"] = {
            key = "1757075138404633718",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1150, y = 296},
            propsData = {GuideId = 86}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
