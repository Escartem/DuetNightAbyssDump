return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630103292423734",
      startPort = "StoryStart",
      endStory = "1721630103292423736",
      endPort = "In"
    },
    {
      startStory = "1721630103292423736",
      startPort = "Success",
      endStory = "1721630103292423735",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630103292423734"] = {
      isStoryNode = true,
      key = "1721630103292423734",
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
    ["1721630103292423735"] = {
      isStoryNode = true,
      key = "1721630103292423735",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1583.3333333333333, y = 301.6666666666667},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630103292423736"] = {
      isStoryNode = true,
      key = "1721630103292423736",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1218.0478192493704, y = 289.0876656393516},
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
            startQuest = "1721630103292423737",
            startPort = "QuestStart",
            endQuest = "1722522512835161679",
            endPort = "In"
          },
          {
            startQuest = "1722522512835161679",
            startPort = "Out",
            endQuest = "1721630103292423738",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630103292423737"] = {
            key = "1721630103292423737",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 940.6324110671936, y = 382.5296442687747},
            propsData = {ModeType = 0}
          },
          ["1721630103292423738"] = {
            key = "1721630103292423738",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1767.1605717385767, y = 345.7121452006362},
            propsData = {ModeType = 0}
          },
          ["1721630103292423739"] = {
            key = "1721630103292423739",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1766.7032030203388, y = 462.9561969715422},
            propsData = {}
          },
          ["1722522512835161679"] = {
            key = "1722522512835161679",
            type = "SendMessageNode",
            name = "\229\143\145\230\182\136\230\129\175\229\188\128\230\137\128\230\156\137\229\134\176\230\185\150\229\159\142\229\140\186\229\159\159",
            pos = {x = 1354.238222304012, y = 383.30631210894364},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LetMeIn",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
