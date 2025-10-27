return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324118477424239853",
      startPort = "Success",
      endStory = "175324118477424239852",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324118477424239851",
      startPort = "StoryStart",
      endStory = "175324118477424239853",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324118477424239851"] = {
      isStoryNode = true,
      key = "175324118477424239851",
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
    ["175324118477424239852"] = {
      isStoryNode = true,
      key = "175324118477424239852",
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
    ["175324118477424239853"] = {
      isStoryNode = true,
      key = "175324118477424239853",
      type = "StoryNode",
      name = "\232\181\155\231\144\170\230\157\190\233\156\178\228\186\146\229\138\168",
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
            startQuest = "175324118477424239854",
            startPort = "QuestStart",
            endQuest = "175324118477424239857",
            endPort = "In"
          },
          {
            startQuest = "175324118477424239857",
            startPort = "Out",
            endQuest = "175324118477424239855",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324118477424239854"] = {
            key = "175324118477424239854",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324118477424239855"] = {
            key = "175324118477424239855",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324118477424239856"] = {
            key = "175324118477424239856",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324118477424239857"] = {
            key = "175324118477424239857",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90100801,
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
