return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17570689061841",
      startPort = "StoryStart",
      endStory = "175706891261593",
      endPort = "In"
    },
    {
      startStory = "175706891261593",
      startPort = "Success",
      endStory = "17570689061855",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17570689061841"] = {
      isStoryNode = true,
      key = "17570689061841",
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
    ["17570689061855"] = {
      isStoryNode = true,
      key = "17570689061855",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1860, y = 358},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175706891261593"] = {
      isStoryNode = true,
      key = "175706891261593",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1284, y = 304},
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
            startQuest = "175706891261594",
            startPort = "QuestStart",
            endQuest = "1757068923207439",
            endPort = "In"
          },
          {
            startQuest = "1757068923207439",
            startPort = "Out",
            endQuest = "1757068912615101",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175706891261594"] = {
            key = "175706891261594",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1757068912615101"] = {
            key = "1757068912615101",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1564, y = 320},
            propsData = {ModeType = 0}
          },
          ["1757068912615108"] = {
            key = "1757068912615108",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1757068923207439"] = {
            key = "1757068923207439",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1176, y = 292},
            propsData = {GuideId = 82}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
