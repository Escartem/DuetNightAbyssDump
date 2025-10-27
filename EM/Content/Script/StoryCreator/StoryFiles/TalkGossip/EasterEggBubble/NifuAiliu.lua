return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325367579750300169",
      startPort = "Success",
      endStory = "175325367579750300168",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325367579750300167",
      startPort = "StoryStart",
      endStory = "175325367579750300169",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325367579750300167"] = {
      isStoryNode = true,
      key = "175325367579750300167",
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
    ["175325367579750300168"] = {
      isStoryNode = true,
      key = "175325367579750300168",
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
    ["175325367579750300169"] = {
      isStoryNode = true,
      key = "175325367579750300169",
      type = "StoryNode",
      name = "\229\166\174\229\188\151\229\176\148\232\137\190\231\144\137\228\186\146\229\138\168",
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
            startQuest = "175325367579750300170",
            startPort = "QuestStart",
            endQuest = "175325367579750300173",
            endPort = "In"
          },
          {
            startQuest = "175325367579750300173",
            startPort = "Out",
            endQuest = "175325367579750300171",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325367579750300170"] = {
            key = "175325367579750300170",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325367579750300171"] = {
            key = "175325367579750300171",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325367579750300172"] = {
            key = "175325367579750300172",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325367579750300173"] = {
            key = "175325367579750300173",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90220701,
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
