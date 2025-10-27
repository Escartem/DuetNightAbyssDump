return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17223355762802776400",
      startPort = "StoryStart",
      endStory = "17223355783152776466",
      endPort = "In"
    },
    {
      startStory = "17223355783152776466",
      startPort = "Success",
      endStory = "17223355762802776403",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17223355762802776400"] = {
      isStoryNode = true,
      key = "17223355762802776400",
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
    ["17223355762802776403"] = {
      isStoryNode = true,
      key = "17223355762802776403",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1348.5714285714284, y = 298.57142857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17223355783152776466"] = {
      isStoryNode = true,
      key = "17223355783152776466",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1077.38980828627, y = 287.03104451672255},
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
            startQuest = "17223355783162776473",
            startPort = "Out",
            endQuest = "17223355783162776471",
            endPort = "Success"
          },
          {
            startQuest = "17223355783162776470",
            startPort = "QuestStart",
            endQuest = "17223355783162776473",
            endPort = "In"
          }
        },
        nodeData = {
          ["17223355783162776470"] = {
            key = "17223355783162776470",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 860, y = 310},
            propsData = {ModeType = 0}
          },
          ["17223355783162776471"] = {
            key = "17223355783162776471",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1461.142857142857, y = 312.2857142857143},
            propsData = {ModeType = 0}
          },
          ["17223355783162776472"] = {
            key = "17223355783162776472",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["17223355783162776473"] = {
            key = "17223355783162776473",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1163.388888888889, y = 298.8888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032901,
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
