return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991238303239609",
      startPort = "StoryStart",
      endStory = "17141991238303239611",
      endPort = "In"
    },
    {
      startStory = "17141991238303239611",
      startPort = "Success",
      endStory = "17141991238303239610",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991238303239609"] = {
      isStoryNode = true,
      key = "17141991238303239609",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991238303239610"] = {
      isStoryNode = true,
      key = "17141991238303239610",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 400, y = 140},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991238303239611"] = {
      isStoryNode = true,
      key = "17141991238303239611",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 300, y = 140},
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
        bIsNotifyGameMode = false,
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
            startQuest = "17141991238303239612",
            startPort = "QuestStart",
            endQuest = "17141991238303239615",
            endPort = "In"
          },
          {
            startQuest = "17141991238303239615",
            startPort = "Out",
            endQuest = "17141991238303239613",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991238303239612"] = {
            key = "17141991238303239612",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["17141991238303239613"] = {
            key = "17141991238303239613",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["17141991238303239614"] = {
            key = "17141991238303239614",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17141991238303239615"] = {
            key = "17141991238303239615",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 300, y = 140},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90020101,
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
