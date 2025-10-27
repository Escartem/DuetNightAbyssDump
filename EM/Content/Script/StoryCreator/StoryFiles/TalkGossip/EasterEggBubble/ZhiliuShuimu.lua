return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325392780652919316",
      startPort = "Success",
      endStory = "175325392780652919315",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325392780652919314",
      startPort = "StoryStart",
      endStory = "175325392780652919316",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325392780652919314"] = {
      isStoryNode = true,
      key = "175325392780652919314",
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
    ["175325392780652919315"] = {
      isStoryNode = true,
      key = "175325392780652919315",
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
    ["175325392780652919316"] = {
      isStoryNode = true,
      key = "175325392780652919316",
      type = "StoryNode",
      name = "\230\173\162\230\181\129\230\176\180\230\175\141\228\186\146\229\138\168",
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
            startQuest = "175325392780652919317",
            startPort = "QuestStart",
            endQuest = "175325392780652919320",
            endPort = "In"
          },
          {
            startQuest = "175325392780652919320",
            startPort = "Out",
            endQuest = "175325392780652919318",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325392780652919317"] = {
            key = "175325392780652919317",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325392780652919318"] = {
            key = "175325392780652919318",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325392780652919319"] = {
            key = "175325392780652919319",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325392780652919320"] = {
            key = "175325392780652919320",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90230501,
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
