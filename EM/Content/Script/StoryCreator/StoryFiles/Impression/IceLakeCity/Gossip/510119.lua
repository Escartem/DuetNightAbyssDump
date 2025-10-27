return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17510166865464272815",
      startPort = "StoryStart",
      endStory = "17510166920334272934",
      endPort = "In"
    },
    {
      startStory = "17510166920334272934",
      startPort = "Success",
      endStory = "17510166865474272818",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17510166865464272815"] = {
      isStoryNode = true,
      key = "17510166865464272815",
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
    ["17510166865474272818"] = {
      isStoryNode = true,
      key = "17510166865474272818",
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
    ["17510166920334272934"] = {
      isStoryNode = true,
      key = "17510166920334272934",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1972, y = 536},
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
            startQuest = "17510166920334272935",
            startPort = "QuestStart",
            endQuest = "17510167021954273285",
            endPort = "In"
          },
          {
            startQuest = "17510167021954273285",
            startPort = "Out",
            endQuest = "17510166920344272938",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17510166920334272935"] = {
            key = "17510166920334272935",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510166920344272938"] = {
            key = "17510166920344272938",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510166920344272941"] = {
            key = "17510166920344272941",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17510167021954273285"] = {
            key = "17510167021954273285",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1740, y = 516},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51011901,
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
                  TalkActorId = 700341,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700341}
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
