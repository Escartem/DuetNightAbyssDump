return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17571535053954765364",
      startPort = "StoryStart",
      endStory = "17571535053954765366",
      endPort = "In"
    },
    {
      startStory = "17571535053954765366",
      startPort = "Success",
      endStory = "17571535053954765365",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17571535053954765364"] = {
      isStoryNode = true,
      key = "17571535053954765364",
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
    ["17571535053954765365"] = {
      isStoryNode = true,
      key = "17571535053954765365",
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
    ["17571535053954765366"] = {
      isStoryNode = true,
      key = "17571535053954765366",
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
            startQuest = "17571535053954765367",
            startPort = "QuestStart",
            endQuest = "17571535053954765371",
            endPort = "In"
          },
          {
            startQuest = "17571535053954765371",
            startPort = "Out",
            endQuest = "17571535053954765368",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17571535053954765367"] = {
            key = "17571535053954765367",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17571535053954765368"] = {
            key = "17571535053954765368",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2418, y = 304},
            propsData = {ModeType = 0}
          },
          ["17571535053954765369"] = {
            key = "17571535053954765369",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17571535053954765371"] = {
            key = "17571535053954765371",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2012}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
