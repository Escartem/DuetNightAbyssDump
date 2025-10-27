return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17231194759524076536",
      startPort = "StoryStart",
      endStory = "17231194785794076561",
      endPort = "In"
    },
    {
      startStory = "17231194785794076561",
      startPort = "Success",
      endStory = "17231194759534076539",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17231194759524076536"] = {
      isStoryNode = true,
      key = "17231194759524076536",
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
    ["17231194759534076539"] = {
      isStoryNode = true,
      key = "17231194759534076539",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1481.153846153846, y = 259.61538461538464},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17231194785794076561"] = {
      isStoryNode = true,
      key = "17231194785794076561",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1116.3958296763722, y = 255.72045852610927},
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
            startQuest = "17231194785904076562",
            startPort = "QuestStart",
            endQuest = "17231194844924076899",
            endPort = "In"
          },
          {
            startQuest = "17231194844924076899",
            startPort = "Out",
            endQuest = "17231194785904076564",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17231194785904076562"] = {
            key = "17231194785904076562",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17231194785904076564"] = {
            key = "17231194785904076564",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1523.5, y = 289.5},
            propsData = {ModeType = 0}
          },
          ["17231194785904076566"] = {
            key = "17231194785904076566",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1484.5, y = 677.5},
            propsData = {}
          },
          ["17231194844924076899"] = {
            key = "17231194844924076899",
            type = "TalkNode",
            name = "\228\184\142\229\141\161\231\177\179\230\139\137\229\175\185\232\175\157",
            pos = {x = 1102.8189065994488, y = 282.4172262507023},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10104001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101040",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200006,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200065,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006},
                {TalkActorType = "Npc", TalkActorId = 200065},
                {TalkActorType = "Npc", TalkActorId = 200003},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
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
