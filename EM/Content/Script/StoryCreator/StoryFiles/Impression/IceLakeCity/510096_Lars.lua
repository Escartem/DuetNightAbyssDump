return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17489334066421",
      startPort = "StoryStart",
      endStory = "1748933417560150",
      endPort = "In"
    },
    {
      startStory = "1748933417560150",
      startPort = "Success",
      endStory = "17489334066425",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17489334066421"] = {
      isStoryNode = true,
      key = "17489334066421",
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
    ["17489334066425"] = {
      isStoryNode = true,
      key = "17489334066425",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1630, y = 298},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1748933417560150"] = {
      isStoryNode = true,
      key = "1748933417560150",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1148, y = 294},
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
            startQuest = "1748933417560151",
            startPort = "QuestStart",
            endQuest = "17489334928971446",
            endPort = "In"
          },
          {
            startQuest = "17489334928971446",
            startPort = "Out",
            endQuest = "1748933417560158",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1748933417560151"] = {
            key = "1748933417560151",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748933417560158"] = {
            key = "1748933417560158",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1808, y = 272},
            propsData = {ModeType = 0}
          },
          ["1748933417560165"] = {
            key = "1748933417560165",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1884, y = 540},
            propsData = {}
          },
          ["17489334928971446"] = {
            key = "17489334928971446",
            type = "TalkNode",
            name = "\229\175\185\232\175\157",
            pos = {x = 1248, y = 261.297297353027},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009601,
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
                  TalkActorId = 700303,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700303}
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
