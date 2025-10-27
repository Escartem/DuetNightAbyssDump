return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17223307893811980559",
      startPort = "StoryStart",
      endStory = "17223307893821980561",
      endPort = "In"
    },
    {
      startStory = "17223307893821980561",
      startPort = "Success",
      endStory = "17223307893821980560",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17223307893811980559"] = {
      isStoryNode = true,
      key = "17223307893811980559",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1032.8, y = 294},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17223307893821980560"] = {
      isStoryNode = true,
      key = "17223307893821980560",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1580.133333333333, y = 298.9333333333333},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17223307893821980561"] = {
      isStoryNode = true,
      key = "17223307893821980561",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1293.4215336625643, y = 283.4980288526629},
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
            startQuest = "17223307893821980562",
            startPort = "QuestStart",
            endQuest = "17223307893821980565",
            endPort = "In"
          },
          {
            startQuest = "17223307893821980565",
            startPort = "Out",
            endQuest = "17223307893821980563",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17223307893821980562"] = {
            key = "17223307893821980562",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17223307893821980563"] = {
            key = "17223307893821980563",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1386.3999999999999, y = 301.2},
            propsData = {ModeType = 0}
          },
          ["17223307893821980564"] = {
            key = "17223307893821980564",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17223307893821980565"] = {
            key = "17223307893821980565",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1086.6522943363634, y = 301.79050201417635},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
