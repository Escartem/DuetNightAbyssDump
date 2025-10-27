return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325281936142458458",
      startPort = "Success",
      endStory = "175325281936142458457",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325281936142458456",
      startPort = "StoryStart",
      endStory = "175325281936142458458",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325281936142458456"] = {
      isStoryNode = true,
      key = "175325281936142458456",
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
    ["175325281936142458457"] = {
      isStoryNode = true,
      key = "175325281936142458457",
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
    ["175325281936142458458"] = {
      isStoryNode = true,
      key = "175325281936142458458",
      type = "StoryNode",
      name = "\232\190\190\232\138\153\230\182\133\230\181\183\229\176\148\230\179\149\228\186\146\229\138\168",
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
            startQuest = "175325281936142458459",
            startPort = "QuestStart",
            endQuest = "175325281936142458462",
            endPort = "In"
          },
          {
            startQuest = "175325281936142458462",
            startPort = "Out",
            endQuest = "175325281936142458460",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325281936142458459"] = {
            key = "175325281936142458459",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325281936142458460"] = {
            key = "175325281936142458460",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325281936142458461"] = {
            key = "175325281936142458461",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325281936142458462"] = {
            key = "175325281936142458462",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90190701,
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
