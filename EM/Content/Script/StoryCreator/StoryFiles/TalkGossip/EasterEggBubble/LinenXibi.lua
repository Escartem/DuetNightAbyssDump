return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325072426828134484",
      startPort = "Success",
      endStory = "175325072426828134483",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325072426828134482",
      startPort = "StoryStart",
      endStory = "175325072426828134484",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325072426828134482"] = {
      isStoryNode = true,
      key = "175325072426828134482",
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
    ["175325072426828134483"] = {
      isStoryNode = true,
      key = "175325072426828134483",
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
    ["175325072426828134484"] = {
      isStoryNode = true,
      key = "175325072426828134484",
      type = "StoryNode",
      name = "\231\144\179\230\129\169\232\165\191\230\175\148\229\176\148\228\186\146\229\138\168",
      pos = {x = 1128, y = 308},
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
            startQuest = "175325072426828134485",
            startPort = "QuestStart",
            endQuest = "175325072426828134488",
            endPort = "In"
          },
          {
            startQuest = "175325072426828134488",
            startPort = "Out",
            endQuest = "175325072426828134486",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325072426828134485"] = {
            key = "175325072426828134485",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325072426828134486"] = {
            key = "175325072426828134486",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325072426828134487"] = {
            key = "175325072426828134487",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325072426828134488"] = {
            key = "175325072426828134488",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90130601,
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
