return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324134546926186787",
      startPort = "Success",
      endStory = "175324134546926186786",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324134546926186785",
      startPort = "StoryStart",
      endStory = "175324134546926186787",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324134546926186785"] = {
      isStoryNode = true,
      key = "175324134546926186785",
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
    ["175324134546926186786"] = {
      isStoryNode = true,
      key = "175324134546926186786",
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
    ["175324134546926186787"] = {
      isStoryNode = true,
      key = "175324134546926186787",
      type = "StoryNode",
      name = "\230\157\190\233\156\178\231\144\179\230\129\169\228\186\146\229\138\168",
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
            startQuest = "175324134546926186788",
            startPort = "QuestStart",
            endQuest = "175324134546926186791",
            endPort = "In"
          },
          {
            startQuest = "175324134546926186791",
            startPort = "Out",
            endQuest = "175324134546926186789",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324134546926186788"] = {
            key = "175324134546926186788",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324134546926186789"] = {
            key = "175324134546926186789",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324134546926186790"] = {
            key = "175324134546926186790",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324134546926186791"] = {
            key = "175324134546926186791",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90120701,
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
