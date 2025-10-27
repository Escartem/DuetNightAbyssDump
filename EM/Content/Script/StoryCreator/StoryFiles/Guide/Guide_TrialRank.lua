return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17570758803432279725",
      startPort = "StoryStart",
      endStory = "17570758803432279727",
      endPort = "In"
    },
    {
      startStory = "17570758803432279727",
      startPort = "Success",
      endStory = "17570758803432279726",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17570758803432279725"] = {
      isStoryNode = true,
      key = "17570758803432279725",
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
    ["17570758803432279726"] = {
      isStoryNode = true,
      key = "17570758803432279726",
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
    ["17570758803432279727"] = {
      isStoryNode = true,
      key = "17570758803432279727",
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
            startQuest = "17570758803432279728",
            startPort = "QuestStart",
            endQuest = "17570758803432279731",
            endPort = "In"
          },
          {
            startQuest = "17570758803432279731",
            startPort = "Out",
            endQuest = "17570758803432279729",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17570758803432279728"] = {
            key = "17570758803432279728",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17570758803432279729"] = {
            key = "17570758803432279729",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1488, y = 336},
            propsData = {ModeType = 0}
          },
          ["17570758803432279730"] = {
            key = "17570758803432279730",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17570758803432279731"] = {
            key = "17570758803432279731",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1150, y = 296},
            propsData = {GuideId = 85}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
