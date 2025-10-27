return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1744963521346341734",
      startPort = "StoryStart",
      endStory = "1744963521346341736",
      endPort = "In"
    },
    {
      startStory = "1744963521346341736",
      startPort = "Success",
      endStory = "1744963521346341735",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1744963521346341734"] = {
      isStoryNode = true,
      key = "1744963521346341734",
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
    ["1744963521346341735"] = {
      isStoryNode = true,
      key = "1744963521346341735",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1744963521346341736"] = {
      isStoryNode = true,
      key = "1744963521346341736",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1674.3076923076924, y = 376.76923076923083},
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
            startQuest = "1744963521346341737",
            startPort = "QuestStart",
            endQuest = "1744963521346341740",
            endPort = "In"
          },
          {
            startQuest = "1744963521346341740",
            startPort = "Out",
            endQuest = "1744963521346341738",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1744963521346341737"] = {
            key = "1744963521346341737",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1744963521346341738"] = {
            key = "1744963521346341738",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1744963521346341739"] = {
            key = "1744963521346341739",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1744963521346341740"] = {
            key = "1744963521346341740",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1637.3846153846155, y = 402.923076923077},
            propsData = {GuideId = 71}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
