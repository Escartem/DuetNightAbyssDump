return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1753236758600955747",
      startPort = "Success",
      endStory = "1753236758600955746",
      endPort = "StoryEnd"
    },
    {
      startStory = "1753236758600955745",
      startPort = "StoryStart",
      endStory = "1753236758600955747",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1753236758600955745"] = {
      isStoryNode = true,
      key = "1753236758600955745",
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
    ["1753236758600955746"] = {
      isStoryNode = true,
      key = "1753236758600955746",
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
    ["1753236758600955747"] = {
      isStoryNode = true,
      key = "1753236758600955747",
      type = "StoryNode",
      name = "\233\187\145\230\161\131\230\157\190\233\156\178\228\186\146\229\138\1681",
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
            startQuest = "1753236758600955748",
            startPort = "QuestStart",
            endQuest = "1753236758600955751",
            endPort = "In"
          },
          {
            startQuest = "1753236758600955751",
            startPort = "Out",
            endQuest = "1753236758600955749",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1753236758600955748"] = {
            key = "1753236758600955748",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1753236758600955749"] = {
            key = "1753236758600955749",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1825.7297260237053, y = 301.8378380886214},
            propsData = {ModeType = 0}
          },
          ["1753236758600955750"] = {
            key = "1753236758600955750",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["1753236758600955751"] = {
            key = "1753236758600955751",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90031001,
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
