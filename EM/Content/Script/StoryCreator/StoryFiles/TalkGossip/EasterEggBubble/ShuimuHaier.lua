return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17532393188366765667",
      startPort = "Success",
      endStory = "17532393188366765666",
      endPort = "StoryEnd"
    },
    {
      startStory = "17532393188366765665",
      startPort = "StoryStart",
      endStory = "17532393188366765667",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17532393188366765665"] = {
      isStoryNode = true,
      key = "17532393188366765665",
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
    ["17532393188366765666"] = {
      isStoryNode = true,
      key = "17532393188366765666",
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
    ["17532393188366765667"] = {
      isStoryNode = true,
      key = "17532393188366765667",
      type = "StoryNode",
      name = "\230\176\180\230\175\141\230\181\183\229\176\148\230\179\149\228\186\146\229\138\168",
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
            startQuest = "17532393188366765668",
            startPort = "QuestStart",
            endQuest = "17532393188366765671",
            endPort = "In"
          },
          {
            startQuest = "17532393188366765671",
            startPort = "Out",
            endQuest = "17532393188366765669",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17532393188366765668"] = {
            key = "17532393188366765668",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17532393188366765669"] = {
            key = "17532393188366765669",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["17532393188366765670"] = {
            key = "17532393188366765670",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["17532393188366765671"] = {
            key = "17532393188366765671",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90040601,
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
