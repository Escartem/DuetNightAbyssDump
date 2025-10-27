return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17571527505141598449",
      startPort = "StoryStart",
      endStory = "17571527505141598451",
      endPort = "In"
    },
    {
      startStory = "17571527505141598451",
      startPort = "Success",
      endStory = "17571527505141598450",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17571527505141598449"] = {
      isStoryNode = true,
      key = "17571527505141598449",
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
    ["17571527505141598450"] = {
      isStoryNode = true,
      key = "17571527505141598450",
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
    ["17571527505141598451"] = {
      isStoryNode = true,
      key = "17571527505141598451",
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
            startQuest = "17571527505141598455",
            startPort = "Out",
            endQuest = "17571527505141598453",
            endPort = "Success"
          },
          {
            startQuest = "17571527505141598452",
            startPort = "QuestStart",
            endQuest = "17571527505141598456",
            endPort = "In"
          },
          {
            startQuest = "17571527505141598456",
            startPort = "Out",
            endQuest = "17571527505141598455",
            endPort = "In"
          }
        },
        nodeData = {
          ["17571527505141598452"] = {
            key = "17571527505141598452",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17571527505141598453"] = {
            key = "17571527505141598453",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2418, y = 304},
            propsData = {ModeType = 0}
          },
          ["17571527505141598454"] = {
            key = "17571527505141598454",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17571527505141598455"] = {
            key = "17571527505141598455",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1844, y = 298},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80004109,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17571527505141598456"] = {
            key = "17571527505141598456",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2008}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
