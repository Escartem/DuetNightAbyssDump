return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325221076334637428",
      startPort = "Success",
      endStory = "175325221076334637427",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325221076334637426",
      startPort = "StoryStart",
      endStory = "175325221076334637428",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325221076334637426"] = {
      isStoryNode = true,
      key = "175325221076334637426",
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
    ["175325221076334637427"] = {
      isStoryNode = true,
      key = "175325221076334637427",
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
    ["175325221076334637428"] = {
      isStoryNode = true,
      key = "175325221076334637428",
      type = "StoryNode",
      name = "\229\165\165\231\137\185\232\181\155\229\190\183\232\143\178\229\168\156\228\186\146\229\138\168",
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
            startQuest = "175325221076334637429",
            startPort = "QuestStart",
            endQuest = "175325221076334637432",
            endPort = "In"
          },
          {
            startQuest = "175325221076334637432",
            startPort = "Out",
            endQuest = "175325221076334637430",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325221076334637429"] = {
            key = "175325221076334637429",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325221076334637430"] = {
            key = "175325221076334637430",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325221076334637431"] = {
            key = "175325221076334637431",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325221076334637432"] = {
            key = "175325221076334637432",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 288},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90160601,
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
