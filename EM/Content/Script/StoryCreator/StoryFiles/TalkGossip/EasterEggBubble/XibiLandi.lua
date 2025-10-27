return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324080417019053399",
      startPort = "Success",
      endStory = "175324080417019053398",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324080417019053397",
      startPort = "StoryStart",
      endStory = "175324080417019053399",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324080417019053397"] = {
      isStoryNode = true,
      key = "175324080417019053397",
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
    ["175324080417019053398"] = {
      isStoryNode = true,
      key = "175324080417019053398",
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
    ["175324080417019053399"] = {
      isStoryNode = true,
      key = "175324080417019053399",
      type = "StoryNode",
      name = "\232\165\191\230\175\148\229\176\148\229\133\176\232\191\170\228\186\146\229\138\168",
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
            startQuest = "175324080417019053400",
            startPort = "QuestStart",
            endQuest = "175324080417019053403",
            endPort = "In"
          },
          {
            startQuest = "175324080417019053403",
            startPort = "Out",
            endQuest = "175324080417019053401",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324080417019053400"] = {
            key = "175324080417019053400",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324080417019053401"] = {
            key = "175324080417019053401",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324080417019053402"] = {
            key = "175324080417019053402",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324080417019053403"] = {
            key = "175324080417019053403",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90091001,
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
