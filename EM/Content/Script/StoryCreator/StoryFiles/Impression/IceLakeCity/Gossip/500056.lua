return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210609494367",
      startPort = "StoryStart",
      endStory = "1732783210609494369",
      endPort = "In"
    },
    {
      startStory = "1732783210609494369",
      startPort = "Success",
      endStory = "1732783210609494368",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210609494367"] = {
      isStoryNode = true,
      key = "1732783210609494367",
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
    ["1732783210609494368"] = {
      isStoryNode = true,
      key = "1732783210609494368",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1348.5714285714284, y = 298.57142857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210609494369"] = {
      isStoryNode = true,
      key = "1732783210609494369",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1077.38980828627, y = 287.03104451672255},
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
        bIsNotifyGameMode = false,
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
            startQuest = "1732783210609494373",
            startPort = "Out",
            endQuest = "1732783210609494371",
            endPort = "Success"
          },
          {
            startQuest = "1732783210609494370",
            startPort = "QuestStart",
            endQuest = "1732783210609494373",
            endPort = "In"
          }
        },
        nodeData = {
          ["1732783210609494370"] = {
            key = "1732783210609494370",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 860, y = 310},
            propsData = {ModeType = 0}
          },
          ["1732783210609494371"] = {
            key = "1732783210609494371",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1461.142857142857, y = 312.2857142857143},
            propsData = {ModeType = 0}
          },
          ["1732783210609494372"] = {
            key = "1732783210609494372",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["1732783210609494373"] = {
            key = "1732783210609494373",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1163.388888888889, y = 298.8888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 50005601,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700143,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700143}
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
