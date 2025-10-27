return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325407149355534519",
      startPort = "Success",
      endStory = "175325407149355534518",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325407149355534517",
      startPort = "StoryStart",
      endStory = "175325407149355534519",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325407149355534517"] = {
      isStoryNode = true,
      key = "175325407149355534517",
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
    ["175325407149355534518"] = {
      isStoryNode = true,
      key = "175325407149355534518",
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
    ["175325407149355534519"] = {
      isStoryNode = true,
      key = "175325407149355534519",
      type = "StoryNode",
      name = "\229\136\187\232\136\159\231\133\156\230\152\142\228\186\146\229\138\168",
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
            startQuest = "175325407149355534520",
            startPort = "QuestStart",
            endQuest = "175325407149355534523",
            endPort = "In"
          },
          {
            startQuest = "175325407149355534523",
            startPort = "Out",
            endQuest = "175325407149355534521",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325407149355534520"] = {
            key = "175325407149355534520",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325407149355534521"] = {
            key = "175325407149355534521",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325407149355534522"] = {
            key = "175325407149355534522",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325407149355534523"] = {
            key = "175325407149355534523",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90240601,
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
