return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1757152675382965070",
      startPort = "StoryStart",
      endStory = "1757152675382965072",
      endPort = "In"
    },
    {
      startStory = "1757152675382965072",
      startPort = "Success",
      endStory = "1757152675382965071",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1757152675382965070"] = {
      isStoryNode = true,
      key = "1757152675382965070",
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
    ["1757152675382965071"] = {
      isStoryNode = true,
      key = "1757152675382965071",
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
    ["1757152675382965072"] = {
      isStoryNode = true,
      key = "1757152675382965072",
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
            startQuest = "1757152675382965076",
            startPort = "Out",
            endQuest = "1757152675382965074",
            endPort = "Success"
          },
          {
            startQuest = "1757152675382965073",
            startPort = "QuestStart",
            endQuest = "1757152675382965077",
            endPort = "In"
          },
          {
            startQuest = "1757152675382965077",
            startPort = "Out",
            endQuest = "1757152675382965076",
            endPort = "In"
          }
        },
        nodeData = {
          ["1757152675382965073"] = {
            key = "1757152675382965073",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1757152675382965074"] = {
            key = "1757152675382965074",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2418, y = 304},
            propsData = {ModeType = 0}
          },
          ["1757152675382965075"] = {
            key = "1757152675382965075",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1757152675382965076"] = {
            key = "1757152675382965076",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1844, y = 298},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80004103,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1757152675382965077"] = {
            key = "1757152675382965077",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2007}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
