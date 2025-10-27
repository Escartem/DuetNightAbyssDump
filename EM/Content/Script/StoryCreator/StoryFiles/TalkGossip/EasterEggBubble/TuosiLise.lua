return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325308836845071999",
      startPort = "Success",
      endStory = "175325308836845071998",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325308836845071997",
      startPort = "StoryStart",
      endStory = "175325308836845071999",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325308836845071997"] = {
      isStoryNode = true,
      key = "175325308836845071997",
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
    ["175325308836845071998"] = {
      isStoryNode = true,
      key = "175325308836845071998",
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
    ["175325308836845071999"] = {
      isStoryNode = true,
      key = "175325308836845071999",
      type = "StoryNode",
      name = "\229\185\187\230\153\175\233\187\142\231\145\159\228\186\146\229\138\168",
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
            startQuest = "175325308836845072000",
            startPort = "QuestStart",
            endQuest = "175325308836845072003",
            endPort = "In"
          },
          {
            startQuest = "175325308836845072003",
            startPort = "Out",
            endQuest = "175325308836845072001",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325308836845072000"] = {
            key = "175325308836845072000",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325308836845072001"] = {
            key = "175325308836845072001",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325308836845072002"] = {
            key = "175325308836845072002",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325308836845072003"] = {
            key = "175325308836845072003",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90200601,
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
