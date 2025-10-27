return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325281936142458602",
      startPort = "Success",
      endStory = "175325281936142458601",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325281936142458600",
      startPort = "StoryStart",
      endStory = "175325281936142458602",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325281936142458600"] = {
      isStoryNode = true,
      key = "175325281936142458600",
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
    ["175325281936142458601"] = {
      isStoryNode = true,
      key = "175325281936142458601",
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
    ["175325281936142458602"] = {
      isStoryNode = true,
      key = "175325281936142458602",
      type = "StoryNode",
      name = "\232\190\190\232\138\153\230\182\133\232\165\191\230\175\148\229\176\148\228\186\146\229\138\168",
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
            startQuest = "175325281936142458603",
            startPort = "QuestStart",
            endQuest = "175325281936142458606",
            endPort = "In"
          },
          {
            startQuest = "175325281936142458606",
            startPort = "Out",
            endQuest = "175325281936142458604",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325281936142458603"] = {
            key = "175325281936142458603",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325281936142458604"] = {
            key = "175325281936142458604",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325281936142458605"] = {
            key = "175325281936142458605",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325281936142458606"] = {
            key = "175325281936142458606",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90190801,
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
