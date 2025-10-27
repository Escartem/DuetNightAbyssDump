return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754909552954505926",
      startPort = "StoryStart",
      endStory = "1754909552954505928",
      endPort = "In"
    },
    {
      startStory = "1754909552954505928",
      startPort = "Success",
      endStory = "1754909552954505927",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754909552954505926"] = {
      isStoryNode = true,
      key = "1754909552954505926",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 806.6666666666666, y = 297.77777777777777},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754909552954505927"] = {
      isStoryNode = true,
      key = "1754909552954505927",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1422.2222222222206, y = 306.94444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754909552954505928"] = {
      isStoryNode = true,
      key = "1754909552954505928",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1136.5870379748005, y = 300.6803917754489},
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
        bIsShowOnComplete = false,
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
            startQuest = "1754909552954505930",
            startPort = "QuestStart",
            endQuest = "1754909552954505929",
            endPort = "In"
          },
          {
            startQuest = "1754909552954505929",
            startPort = "Out",
            endQuest = "1754909552954505931",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754909552954505929"] = {
            key = "1754909552954505929",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1074.9389193027155, y = 310.9646212222572},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10118001,
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
                  TalkActorId = 200055,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 200055}
              },
              OverrideFailBlend = false
            }
          },
          ["1754909552954505930"] = {
            key = "1754909552954505930",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 814.516129032258, y = 303.8709677419355},
            propsData = {ModeType = 0}
          },
          ["1754909552954505931"] = {
            key = "1754909552954505931",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1341.7171215880878, y = 315.32307692307694},
            propsData = {ModeType = 0}
          },
          ["1754909552954505932"] = {
            key = "1754909552954505932",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1340.7106699751848, y = 459.8928039702231},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
