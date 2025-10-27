return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17345137365301364703",
      startPort = "StoryStart",
      endStory = "17345137371971364724",
      endPort = "In"
    },
    {
      startStory = "17345137371971364724",
      startPort = "Success",
      endStory = "17345137365301364706",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17345137365301364703"] = {
      isStoryNode = true,
      key = "17345137365301364703",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1296, y = 216},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17345137365301364706"] = {
      isStoryNode = true,
      key = "17345137365301364706",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2064, y = 210},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17345137371971364724"] = {
      isStoryNode = true,
      key = "17345137371971364724",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1618, y = 190.23529411764704},
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
            startQuest = "17345137371971364728",
            startPort = "QuestStart",
            endQuest = "17345137371971364731",
            endPort = "In"
          },
          {
            startQuest = "17345137371971364731",
            startPort = "Out",
            endQuest = "17345137371971364729",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17345137371971364728"] = {
            key = "17345137371971364728",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17345137371971364729"] = {
            key = "17345137371971364729",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1566.842105263158, y = 302.82894736842104},
            propsData = {ModeType = 0}
          },
          ["17345137371971364730"] = {
            key = "17345137371971364730",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17345137371971364731"] = {
            key = "17345137371971364731",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 1254.5609448529651, y = 268.15314156857113},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010624,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = true,
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
