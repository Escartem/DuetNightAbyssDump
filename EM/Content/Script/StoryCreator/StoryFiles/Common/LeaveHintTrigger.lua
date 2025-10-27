return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17223492583492563981",
      startPort = "StoryStart",
      endStory = "17223492610122564026",
      endPort = "In"
    },
    {
      startStory = "17223492610122564026",
      startPort = "Success",
      endStory = "17223492583492563984",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17223492583492563981"] = {
      isStoryNode = true,
      key = "17223492583492563981",
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
    ["17223492583492563984"] = {
      isStoryNode = true,
      key = "17223492583492563984",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1808.8770053475935, y = 309.8663101604278},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17223492610122564026"] = {
      isStoryNode = true,
      key = "17223492610122564026",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1359.8320035240877, y = 290.06329788085304},
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
            startQuest = "17223492610122564027",
            startPort = "QuestStart",
            endQuest = "17223492814232564535",
            endPort = "In"
          },
          {
            startQuest = "17223492814232564535",
            startPort = "Out",
            endQuest = "17223492610122564030",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17223492610122564027"] = {
            key = "17223492610122564027",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1102.7272727272727, y = 308.1818181818182},
            propsData = {ModeType = 0}
          },
          ["17223492610122564030"] = {
            key = "17223492610122564030",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1835.9090909090908, y = 313.6363636363637},
            propsData = {ModeType = 0}
          },
          ["17223492610122564033"] = {
            key = "17223492610122564033",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17223492814232564535"] = {
            key = "17223492814232564535",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1464.6475115454782, y = 301.0526026936872},
            propsData = {
              ShowEnable = true,
              MessageId = 200031,
              MessageNote = "",
              LastTime = 5,
              Style = "Normal"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
