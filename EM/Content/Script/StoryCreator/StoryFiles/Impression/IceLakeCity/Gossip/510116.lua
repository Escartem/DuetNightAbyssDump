return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17510164648361643211",
      startPort = "StoryStart",
      endStory = "17510164671321643299",
      endPort = "In"
    },
    {
      startStory = "17510164671321643299",
      startPort = "Success",
      endStory = "17510164648361643214",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17510164648361643211"] = {
      isStoryNode = true,
      key = "17510164648361643211",
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
    ["17510164648361643214"] = {
      isStoryNode = true,
      key = "17510164648361643214",
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
    ["17510164671321643299"] = {
      isStoryNode = true,
      key = "17510164671321643299",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1434, y = 462},
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
            startQuest = "17510164671321643300",
            startPort = "QuestStart",
            endQuest = "17510164774261643589",
            endPort = "In"
          },
          {
            startQuest = "17510164774261643589",
            startPort = "Out",
            endQuest = "17510164671321643303",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17510164671321643300"] = {
            key = "17510164671321643300",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510164671321643303"] = {
            key = "17510164671321643303",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510164671321643306"] = {
            key = "17510164671321643306",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17510164774261643589"] = {
            key = "17510164774261643589",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1848, y = 558},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51011601,
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
                  TalkActorId = 700337,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700337}
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
