return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17571528991222865056",
      startPort = "StoryStart",
      endStory = "17571528991222865058",
      endPort = "In"
    },
    {
      startStory = "17571528991222865058",
      startPort = "Success",
      endStory = "17571528991222865057",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17571528991222865056"] = {
      isStoryNode = true,
      key = "17571528991222865056",
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
    ["17571528991222865057"] = {
      isStoryNode = true,
      key = "17571528991222865057",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1652, y = 334},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17571528991222865058"] = {
      isStoryNode = true,
      key = "17571528991222865058",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1220, y = 288},
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
            startQuest = "17571528991222865059",
            startPort = "QuestStart",
            endQuest = "17571528991222865063",
            endPort = "In"
          },
          {
            startQuest = "17571528991222865063",
            startPort = "Out",
            endQuest = "17571528991222865060",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17571528991222865059"] = {
            key = "17571528991222865059",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17571528991222865060"] = {
            key = "17571528991222865060",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1712, y = 332},
            propsData = {ModeType = 0}
          },
          ["17571528991222865061"] = {
            key = "17571528991222865061",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17571528991222865063"] = {
            key = "17571528991222865063",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2010}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
