return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17377051431209704553",
      startPort = "StoryStart",
      endStory = "17377051431219704555",
      endPort = "In"
    },
    {
      startStory = "17377051431219704555",
      startPort = "Success",
      endStory = "17377051431219704554",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17377051431209704553"] = {
      isStoryNode = true,
      key = "17377051431209704553",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1458, y = 322},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17377051431219704554"] = {
      isStoryNode = true,
      key = "17377051431219704554",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2076.086956521739, y = 314.3478260869565},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17377051431219704555"] = {
      isStoryNode = true,
      key = "17377051431219704555",
      type = "StoryNode",
      name = "\230\176\180\230\175\141\230\148\190\231\189\174",
      pos = {x = 1759.0434782608693, y = 309.5652173913043},
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
            startQuest = "17377051431219704556",
            startPort = "QuestStart",
            endQuest = "17377051431219704559",
            endPort = "In"
          },
          {
            startQuest = "17377051431219704559",
            startPort = "Out",
            endQuest = "17377051431219704557",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17377051431219704556"] = {
            key = "17377051431219704556",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17377051431219704557"] = {
            key = "17377051431219704557",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.1818181818182, y = 295.45454545454544},
            propsData = {ModeType = 0}
          },
          ["17377051431219704558"] = {
            key = "17377051431219704558",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17377051431219704559"] = {
            key = "17377051431219704559",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1105.6363636363635, y = 287.909090909091},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90040000,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
