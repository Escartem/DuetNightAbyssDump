return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17220758422872167158",
      startPort = "StoryStart",
      endStory = "17220758450122167191",
      endPort = "In"
    },
    {
      startStory = "17220758450122167191",
      startPort = "Success",
      endStory = "17220758422872167161",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17220758422872167158"] = {
      isStoryNode = true,
      key = "17220758422872167158",
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
    ["17220758422872167161"] = {
      isStoryNode = true,
      key = "17220758422872167161",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2103.333333333333, y = 313.3333333333333},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17220758450122167191"] = {
      isStoryNode = true,
      key = "17220758450122167191",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1325.8215336625644, y = 287.09802885266294},
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
            startQuest = "17220758450122167192",
            startPort = "QuestStart",
            endQuest = "17220758450122167195",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17220758450122167192"] = {
            key = "17220758450122167192",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17220758450122167195"] = {
            key = "17220758450122167195",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1832, y = 336},
            propsData = {ModeType = 0}
          },
          ["17220758450122167198"] = {
            key = "17220758450122167198",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1800, y = 808},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
