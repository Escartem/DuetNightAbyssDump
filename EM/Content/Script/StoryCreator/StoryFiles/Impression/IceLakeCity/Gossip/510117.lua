return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17510165449862300608",
      startPort = "StoryStart",
      endStory = "17510165522002300718",
      endPort = "In"
    },
    {
      startStory = "17510165522002300718",
      startPort = "Success",
      endStory = "17510165449862300611",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17510165449862300608"] = {
      isStoryNode = true,
      key = "17510165449862300608",
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
    ["17510165449862300611"] = {
      isStoryNode = true,
      key = "17510165449862300611",
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
    ["17510165522002300718"] = {
      isStoryNode = true,
      key = "17510165522002300718",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1920, y = 456},
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
            startQuest = "17510165522002300719",
            startPort = "QuestStart",
            endQuest = "17510165606602300987",
            endPort = "In"
          },
          {
            startQuest = "17510165606602300987",
            startPort = "Out",
            endQuest = "17510165522002300722",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17510165522002300719"] = {
            key = "17510165522002300719",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510165522002300722"] = {
            key = "17510165522002300722",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510165522002300725"] = {
            key = "17510165522002300725",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17510165606602300987"] = {
            key = "17510165606602300987",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1748, y = 580},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51011701,
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
                  TalkActorId = 700336,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700336}
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
