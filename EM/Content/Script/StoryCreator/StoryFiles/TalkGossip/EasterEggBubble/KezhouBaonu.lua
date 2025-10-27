return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325392780552919172",
      startPort = "Success",
      endStory = "175325392780552919171",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325392780552919170",
      startPort = "StoryStart",
      endStory = "175325392780552919172",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325392780552919170"] = {
      isStoryNode = true,
      key = "175325392780552919170",
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
    ["175325392780552919171"] = {
      isStoryNode = true,
      key = "175325392780552919171",
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
    ["175325392780552919172"] = {
      isStoryNode = true,
      key = "175325392780552919172",
      type = "StoryNode",
      name = "\229\136\187\232\136\159\229\136\169\229\133\185\232\180\157\229\176\148\228\186\146\229\138\168",
      pos = {x = 1124, y = 308},
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
            startQuest = "175325392780552919173",
            startPort = "QuestStart",
            endQuest = "175325392780552919176",
            endPort = "In"
          },
          {
            startQuest = "175325392780552919176",
            startPort = "Out",
            endQuest = "175325392780552919174",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325392780552919173"] = {
            key = "175325392780552919173",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325392780552919174"] = {
            key = "175325392780552919174",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325392780552919175"] = {
            key = "175325392780552919175",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325392780552919176"] = {
            key = "175325392780552919176",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90240701,
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
