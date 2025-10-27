return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324134546926186715",
      startPort = "Success",
      endStory = "175324134546926186714",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324134546926186713",
      startPort = "StoryStart",
      endStory = "175324134546926186715",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324134546926186713"] = {
      isStoryNode = true,
      key = "175324134546926186713",
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
    ["175324134546926186714"] = {
      isStoryNode = true,
      key = "175324134546926186714",
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
    ["175324134546926186715"] = {
      isStoryNode = true,
      key = "175324134546926186715",
      type = "StoryNode",
      name = "\231\144\179\230\129\169\229\133\176\232\191\170\228\186\146\229\138\168",
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
            startQuest = "175324134546926186716",
            startPort = "QuestStart",
            endQuest = "175324134546926186719",
            endPort = "In"
          },
          {
            startQuest = "175324134546926186719",
            startPort = "Out",
            endQuest = "175324134546926186717",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324134546926186716"] = {
            key = "175324134546926186716",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324134546926186717"] = {
            key = "175324134546926186717",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324134546926186718"] = {
            key = "175324134546926186718",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324134546926186719"] = {
            key = "175324134546926186719",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90130501,
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
