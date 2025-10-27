return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325367580050300313",
      startPort = "Success",
      endStory = "175325367580050300312",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325367580050300311",
      startPort = "StoryStart",
      endStory = "175325367580050300313",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325367580050300311"] = {
      isStoryNode = true,
      key = "175325367580050300311",
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
    ["175325367580050300312"] = {
      isStoryNode = true,
      key = "175325367580050300312",
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
    ["175325367580050300313"] = {
      isStoryNode = true,
      key = "175325367580050300313",
      type = "StoryNode",
      name = "\229\166\174\229\188\151\229\176\148\230\137\182\231\150\143\228\186\146\229\138\168",
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
            startQuest = "175325367580050300314",
            startPort = "QuestStart",
            endQuest = "175325367580050300317",
            endPort = "In"
          },
          {
            startQuest = "175325367580050300317",
            startPort = "Out",
            endQuest = "175325367580050300315",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325367580050300314"] = {
            key = "175325367580050300314",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325367580050300315"] = {
            key = "175325367580050300315",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325367580050300316"] = {
            key = "175325367580050300316",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325367580050300317"] = {
            key = "175325367580050300317",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90220601,
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
