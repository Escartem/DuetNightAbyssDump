return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17571519141091",
      startPort = "StoryStart",
      endStory = "175715192584377",
      endPort = "In"
    },
    {
      startStory = "175715192584377",
      startPort = "Success",
      endStory = "17571519141095",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17571519141091"] = {
      isStoryNode = true,
      key = "17571519141091",
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
    ["17571519141095"] = {
      isStoryNode = true,
      key = "17571519141095",
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
    ["175715192584377"] = {
      isStoryNode = true,
      key = "175715192584377",
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
            startQuest = "1757151970858633257",
            startPort = "Out",
            endQuest = "175715192584485",
            endPort = "Success"
          },
          {
            startQuest = "175715192584378",
            startPort = "QuestStart",
            endQuest = "1757152042838633789",
            endPort = "In"
          },
          {
            startQuest = "1757152042838633789",
            startPort = "Out",
            endQuest = "1757151970858633257",
            endPort = "In"
          }
        },
        nodeData = {
          ["175715192584378"] = {
            key = "175715192584378",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175715192584485"] = {
            key = "175715192584485",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2418, y = 304},
            propsData = {ModeType = 0}
          },
          ["175715192584492"] = {
            key = "175715192584492",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1757151970858633257"] = {
            key = "1757151970858633257",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1844, y = 298},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80001005,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1757152042838633789"] = {
            key = "1757152042838633789",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2001}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
