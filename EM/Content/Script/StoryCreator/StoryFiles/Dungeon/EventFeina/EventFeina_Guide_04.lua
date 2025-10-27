return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1757157497280334930",
      startPort = "StoryStart",
      endStory = "1757157497280334932",
      endPort = "In"
    },
    {
      startStory = "1757157497280334932",
      startPort = "Success",
      endStory = "1757157497280334931",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1757157497280334930"] = {
      isStoryNode = true,
      key = "1757157497280334930",
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
    ["1757157497280334931"] = {
      isStoryNode = true,
      key = "1757157497280334931",
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
    ["1757157497280334932"] = {
      isStoryNode = true,
      key = "1757157497280334932",
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
            startQuest = "1757157497280334936",
            startPort = "Out",
            endQuest = "1757157497280334934",
            endPort = "Success"
          },
          {
            startQuest = "1757157497280334933",
            startPort = "QuestStart",
            endQuest = "1757157497280334937",
            endPort = "In"
          },
          {
            startQuest = "1757157497280334937",
            startPort = "Out",
            endQuest = "1757157497280334936",
            endPort = "In"
          }
        },
        nodeData = {
          ["1757157497280334933"] = {
            key = "1757157497280334933",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1757157497280334934"] = {
            key = "1757157497280334934",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2418, y = 304},
            propsData = {ModeType = 0}
          },
          ["1757157497280334935"] = {
            key = "1757157497280334935",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1757157497280334936"] = {
            key = "1757157497280334936",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1844, y = 298},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80003105,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1757157497280334937"] = {
            key = "1757157497280334937",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2004}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
