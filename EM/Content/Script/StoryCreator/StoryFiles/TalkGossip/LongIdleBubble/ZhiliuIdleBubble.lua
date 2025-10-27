return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1756125463702938360",
      startPort = "StoryStart",
      endStory = "1756125463702938362",
      endPort = "In"
    },
    {
      startStory = "1756125463702938362",
      startPort = "Success",
      endStory = "1756125463702938361",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1756125463702938360"] = {
      isStoryNode = true,
      key = "1756125463702938360",
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
    ["1756125463702938361"] = {
      isStoryNode = true,
      key = "1756125463702938361",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1405.6521739130435, y = 289.5652173913043},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1756125463702938362"] = {
      isStoryNode = true,
      key = "1756125463702938362",
      type = "StoryNode",
      name = "\230\173\162\230\181\129\230\148\190\231\189\174",
      pos = {x = 1091.6521739130435, y = 287.7391304347827},
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
            startQuest = "1756125463703938363",
            startPort = "QuestStart",
            endQuest = "1756125463703938366",
            endPort = "In"
          },
          {
            startQuest = "1756125463703938366",
            startPort = "Out",
            endQuest = "1756125463703938364",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1756125463703938363"] = {
            key = "1756125463703938363",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1756125463703938364"] = {
            key = "1756125463703938364",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.1818181818182, y = 295.45454545454544},
            propsData = {ModeType = 0}
          },
          ["1756125463703938365"] = {
            key = "1756125463703938365",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1756125463703938366"] = {
            key = "1756125463703938366",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1104.2727272727273, y = 286.5454545454546},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90230000,
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
