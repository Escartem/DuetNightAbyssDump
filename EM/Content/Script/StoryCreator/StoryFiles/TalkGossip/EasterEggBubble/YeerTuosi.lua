return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325262658840504121",
      startPort = "Success",
      endStory = "175325262658840504120",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325262658840504119",
      startPort = "StoryStart",
      endStory = "175325262658840504121",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325262658840504119"] = {
      isStoryNode = true,
      key = "175325262658840504119",
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
    ["175325262658840504120"] = {
      isStoryNode = true,
      key = "175325262658840504120",
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
    ["175325262658840504121"] = {
      isStoryNode = true,
      key = "175325262658840504121",
      type = "StoryNode",
      name = "\232\128\182\229\176\148\230\137\152\230\150\175\228\186\146\229\138\1681",
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
            startQuest = "175325262658840504122",
            startPort = "QuestStart",
            endQuest = "175325262658840504125",
            endPort = "In"
          },
          {
            startQuest = "175325262658840504125",
            startPort = "Out",
            endQuest = "175325262658840504123",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325262658840504122"] = {
            key = "175325262658840504122",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325262658840504123"] = {
            key = "175325262658840504123",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325262658840504124"] = {
            key = "175325262658840504124",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325262658840504125"] = {
            key = "175325262658840504125",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90180501,
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
