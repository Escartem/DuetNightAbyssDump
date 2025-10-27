return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17510166303863615087",
      startPort = "StoryStart",
      endStory = "17510166324563615148",
      endPort = "In"
    },
    {
      startStory = "17510166324563615148",
      startPort = "Success",
      endStory = "17510166303863615090",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17510166303863615087"] = {
      isStoryNode = true,
      key = "17510166303863615087",
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
    ["17510166303863615090"] = {
      isStoryNode = true,
      key = "17510166303863615090",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17510166324563615148"] = {
      isStoryNode = true,
      key = "17510166324563615148",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1758, y = 540},
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
            startQuest = "17510166324563615149",
            startPort = "QuestStart",
            endQuest = "17510166420303615444",
            endPort = "In"
          },
          {
            startQuest = "17510166420303615444",
            startPort = "Out",
            endQuest = "17510166324563615152",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17510166324563615149"] = {
            key = "17510166324563615149",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510166324563615152"] = {
            key = "17510166324563615152",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510166324563615155"] = {
            key = "17510166324563615155",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17510166420303615444"] = {
            key = "17510166420303615444",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1622, y = 474},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51011801,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = true,
              BubblePlayCD = 15,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700339,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700339}
              },
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
