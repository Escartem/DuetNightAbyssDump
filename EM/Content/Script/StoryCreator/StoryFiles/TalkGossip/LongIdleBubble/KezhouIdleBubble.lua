return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17424785010781",
      startPort = "StoryStart",
      endStory = "174247850519547",
      endPort = "In"
    },
    {
      startStory = "174247850519547",
      startPort = "Success",
      endStory = "17424785010795",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17424785010781"] = {
      isStoryNode = true,
      key = "17424785010781",
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
    ["17424785010795"] = {
      isStoryNode = true,
      key = "17424785010795",
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
    ["174247850519547"] = {
      isStoryNode = true,
      key = "174247850519547",
      type = "StoryNode",
      name = "\229\136\187\232\136\159\230\148\190\231\189\174",
      pos = {x = 1093.3188405797102, y = 288.572463768116},
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
            startQuest = "174247850519552",
            startPort = "QuestStart",
            endQuest = "174247850519555",
            endPort = "In"
          },
          {
            startQuest = "174247850519555",
            startPort = "Out",
            endQuest = "174247850519553",
            endPort = "Success"
          }
        },
        nodeData = {
          ["174247850519552"] = {
            key = "174247850519552",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["174247850519553"] = {
            key = "174247850519553",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.1818181818182, y = 295.45454545454544},
            propsData = {ModeType = 0}
          },
          ["174247850519554"] = {
            key = "174247850519554",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["174247850519555"] = {
            key = "174247850519555",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1104.2727272727273, y = 286.5454545454546},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90240000,
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
