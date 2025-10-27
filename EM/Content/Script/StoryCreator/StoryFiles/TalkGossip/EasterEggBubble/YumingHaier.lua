return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324014554915168466",
      startPort = "Success",
      endStory = "175324014554915168465",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324014554815168464",
      startPort = "StoryStart",
      endStory = "175324014554915168466",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324014554815168464"] = {
      isStoryNode = true,
      key = "175324014554815168464",
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
    ["175324014554915168465"] = {
      isStoryNode = true,
      key = "175324014554915168465",
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
    ["175324014554915168466"] = {
      isStoryNode = true,
      key = "175324014554915168466",
      type = "StoryNode",
      name = "\231\133\156\230\152\142\230\181\183\229\176\148\230\179\149\228\186\146\229\138\168",
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
            startQuest = "175324014554915168467",
            startPort = "QuestStart",
            endQuest = "175324014554915168470",
            endPort = "In"
          },
          {
            startQuest = "175324014554915168470",
            startPort = "Out",
            endQuest = "175324014554915168468",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324014554915168467"] = {
            key = "175324014554915168467",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324014554915168468"] = {
            key = "175324014554915168468",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324014554915168469"] = {
            key = "175324014554915168469",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324014554915168470"] = {
            key = "175324014554915168470",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90070701,
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
