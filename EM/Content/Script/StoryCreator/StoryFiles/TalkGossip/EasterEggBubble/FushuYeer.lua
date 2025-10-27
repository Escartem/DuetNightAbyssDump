return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324118477124238929",
      startPort = "Success",
      endStory = "175324118477124238928",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324118477124238927",
      startPort = "StoryStart",
      endStory = "175324118477124238929",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324118477124238927"] = {
      isStoryNode = true,
      key = "175324118477124238927",
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
    ["175324118477124238928"] = {
      isStoryNode = true,
      key = "175324118477124238928",
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
    ["175324118477124238929"] = {
      isStoryNode = true,
      key = "175324118477124238929",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\232\128\182\229\176\148\228\186\146\229\138\168",
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
            startQuest = "175324118477124238930",
            startPort = "QuestStart",
            endQuest = "175324118477124238933",
            endPort = "In"
          },
          {
            startQuest = "175324118477124238933",
            startPort = "Out",
            endQuest = "175324118477124238931",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324118477124238930"] = {
            key = "175324118477124238930",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324118477124238931"] = {
            key = "175324118477124238931",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324118477124238932"] = {
            key = "175324118477124238932",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324118477124238933"] = {
            key = "175324118477124238933",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90110701,
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
