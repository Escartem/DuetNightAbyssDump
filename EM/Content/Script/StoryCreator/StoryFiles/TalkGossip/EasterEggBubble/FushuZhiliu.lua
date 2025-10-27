return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324118477124239001",
      startPort = "Success",
      endStory = "175324118477124239000",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324118477124238999",
      startPort = "StoryStart",
      endStory = "175324118477124239001",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324118477124238999"] = {
      isStoryNode = true,
      key = "175324118477124238999",
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
    ["175324118477124239000"] = {
      isStoryNode = true,
      key = "175324118477124239000",
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
    ["175324118477124239001"] = {
      isStoryNode = true,
      key = "175324118477124239001",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\230\173\162\230\181\129\228\186\146\229\138\168",
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
            startQuest = "175324118477124239002",
            startPort = "QuestStart",
            endQuest = "175324118477124239005",
            endPort = "In"
          },
          {
            startQuest = "175324118477124239005",
            startPort = "Out",
            endQuest = "175324118477124239003",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324118477124239002"] = {
            key = "175324118477124239002",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324118477124239003"] = {
            key = "175324118477124239003",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324118477124239004"] = {
            key = "175324118477124239004",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324118477124239005"] = {
            key = "175324118477124239005",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90110601,
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
