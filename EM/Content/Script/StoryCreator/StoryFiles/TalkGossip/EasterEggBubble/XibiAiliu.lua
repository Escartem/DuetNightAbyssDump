return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324099884822293702",
      startPort = "Success",
      endStory = "175324099884822293701",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324099884822293700",
      startPort = "StoryStart",
      endStory = "175324099884822293702",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324099884822293700"] = {
      isStoryNode = true,
      key = "175324099884822293700",
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
    ["175324099884822293701"] = {
      isStoryNode = true,
      key = "175324099884822293701",
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
    ["175324099884822293702"] = {
      isStoryNode = true,
      key = "175324099884822293702",
      type = "StoryNode",
      name = "\232\165\191\230\175\148\229\176\148\232\137\190\231\144\137\228\186\146\229\138\168",
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
            startQuest = "175324099884822293703",
            startPort = "QuestStart",
            endQuest = "175324099884822293706",
            endPort = "In"
          },
          {
            startQuest = "175324099884822293706",
            startPort = "Out",
            endQuest = "175324099884822293704",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324099884822293703"] = {
            key = "175324099884822293703",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324099884822293704"] = {
            key = "175324099884822293704",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324099884822293705"] = {
            key = "175324099884822293705",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324099884822293706"] = {
            key = "175324099884822293706",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90090601,
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
