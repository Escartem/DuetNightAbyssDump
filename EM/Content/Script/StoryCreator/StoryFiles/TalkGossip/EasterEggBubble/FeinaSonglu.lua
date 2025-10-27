return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325169633832033662",
      startPort = "Success",
      endStory = "175325169633832033661",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325169633832033660",
      startPort = "StoryStart",
      endStory = "175325169633832033662",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325169633832033660"] = {
      isStoryNode = true,
      key = "175325169633832033660",
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
    ["175325169633832033661"] = {
      isStoryNode = true,
      key = "175325169633832033661",
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
    ["175325169633832033662"] = {
      isStoryNode = true,
      key = "175325169633832033662",
      type = "StoryNode",
      name = "\232\143\178\229\168\156\230\157\190\233\156\178\228\186\146\229\138\168",
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
            startQuest = "175325169633832033663",
            startPort = "QuestStart",
            endQuest = "175325169633832033666",
            endPort = "In"
          },
          {
            startQuest = "175325169633832033666",
            startPort = "Out",
            endQuest = "175325169633832033664",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325169633832033663"] = {
            key = "175325169633832033663",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325169633832033664"] = {
            key = "175325169633832033664",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325169633832033665"] = {
            key = "175325169633832033665",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325169633832033666"] = {
            key = "175325169633832033666",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90150701,
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
