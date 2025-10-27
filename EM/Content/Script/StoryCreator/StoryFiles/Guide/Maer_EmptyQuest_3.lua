return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17223307893941980603",
      startPort = "StoryStart",
      endStory = "17223307893941980605",
      endPort = "In"
    },
    {
      startStory = "17223307893941980605",
      startPort = "Success",
      endStory = "17223307893941980604",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17223307893941980603"] = {
      isStoryNode = true,
      key = "17223307893941980603",
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
    ["17223307893941980604"] = {
      isStoryNode = true,
      key = "17223307893941980604",
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
    ["17223307893941980605"] = {
      isStoryNode = true,
      key = "17223307893941980605",
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
            startQuest = "17223307893941980606",
            startPort = "QuestStart",
            endQuest = "17223307893941980609",
            endPort = "In"
          },
          {
            startQuest = "17223307893941980609",
            startPort = "Out",
            endQuest = "17223307893941980607",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17223307893941980606"] = {
            key = "17223307893941980606",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17223307893941980607"] = {
            key = "17223307893941980607",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1386.3999999999999, y = 301.2},
            propsData = {ModeType = 0}
          },
          ["17223307893941980608"] = {
            key = "17223307893941980608",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17223307893941980609"] = {
            key = "17223307893941980609",
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
