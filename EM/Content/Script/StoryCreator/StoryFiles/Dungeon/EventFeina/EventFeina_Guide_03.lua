return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175716243328033296214",
      startPort = "StoryStart",
      endStory = "175716243328033296216",
      endPort = "In"
    },
    {
      startStory = "175716243328033296216",
      startPort = "Success",
      endStory = "175716243328033296215",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175716243328033296214"] = {
      isStoryNode = true,
      key = "175716243328033296214",
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
    ["175716243328033296215"] = {
      isStoryNode = true,
      key = "175716243328033296215",
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
    ["175716243328033296216"] = {
      isStoryNode = true,
      key = "175716243328033296216",
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
            startQuest = "175716243328033296217",
            startPort = "QuestStart",
            endQuest = "175716243328033296221",
            endPort = "In"
          },
          {
            startQuest = "175716243328033296221",
            startPort = "Out",
            endQuest = "175716243328033296218",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175716243328033296217"] = {
            key = "175716243328033296217",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175716243328033296218"] = {
            key = "175716243328033296218",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2418, y = 304},
            propsData = {ModeType = 0}
          },
          ["175716243328033296219"] = {
            key = "175716243328033296219",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["175716243328033296221"] = {
            key = "175716243328033296221",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1633, y = 324.5},
            propsData = {GuideId = 2003}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
