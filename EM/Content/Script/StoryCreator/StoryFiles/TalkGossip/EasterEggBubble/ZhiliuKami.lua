return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325407150655537776",
      startPort = "Success",
      endStory = "175325407150655537775",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325407150655537774",
      startPort = "StoryStart",
      endStory = "175325407150655537776",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325407150655537774"] = {
      isStoryNode = true,
      key = "175325407150655537774",
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
    ["175325407150655537775"] = {
      isStoryNode = true,
      key = "175325407150655537775",
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
    ["175325407150655537776"] = {
      isStoryNode = true,
      key = "175325407150655537776",
      type = "StoryNode",
      name = "\230\173\162\230\181\129\229\141\161\231\177\179\230\139\137\228\186\146\229\138\168",
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
            startQuest = "175325407150655537777",
            startPort = "QuestStart",
            endQuest = "175325407150655537780",
            endPort = "In"
          },
          {
            startQuest = "175325407150655537780",
            startPort = "Out",
            endQuest = "175325407150655537778",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325407150655537777"] = {
            key = "175325407150655537777",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325407150655537778"] = {
            key = "175325407150655537778",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325407150655537779"] = {
            key = "175325407150655537779",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325407150655537780"] = {
            key = "175325407150655537780",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90230701,
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
