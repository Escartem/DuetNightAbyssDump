return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1752840006485338",
      startPort = "Success",
      endStory = "17528399878385",
      endPort = "StoryEnd"
    },
    {
      startStory = "17528399878381",
      startPort = "StoryStart",
      endStory = "1752840006485338",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17528399878381"] = {
      isStoryNode = true,
      key = "17528399878381",
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
    ["17528399878385"] = {
      isStoryNode = true,
      key = "17528399878385",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1492, y = 306},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1752840006485338"] = {
      isStoryNode = true,
      key = "1752840006485338",
      type = "StoryNode",
      name = "\233\187\145\230\161\131\229\165\165\231\137\185\228\186\146\229\138\1681",
      pos = {x = 1126, y = 308},
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
            startQuest = "1752840006485339",
            startPort = "QuestStart",
            endQuest = "17528401221671853",
            endPort = "In"
          },
          {
            startQuest = "17528401221671853",
            startPort = "Out",
            endQuest = "1752840006485346",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1752840006485339"] = {
            key = "1752840006485339",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1752840006485346"] = {
            key = "1752840006485346",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["1752840006485353"] = {
            key = "1752840006485353",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["17528401221671853"] = {
            key = "17528401221671853",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90030901,
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
