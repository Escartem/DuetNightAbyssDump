return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17549843021631815374",
      startPort = "Success",
      endStory = "17549842968971815196",
      endPort = "StoryEnd"
    },
    {
      startStory = "17549842968971815193",
      startPort = "StoryStart",
      endStory = "17549843021631815374",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17549842968971815193"] = {
      isStoryNode = true,
      key = "17549842968971815193",
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
    ["17549842968971815196"] = {
      isStoryNode = true,
      key = "17549842968971815196",
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
    ["17549843021631815374"] = {
      isStoryNode = true,
      key = "17549843021631815374",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1512, y = 272},
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
            startQuest = "17549843021631815375",
            startPort = "QuestStart",
            endQuest = "1754984512592318",
            endPort = "In"
          },
          {
            startQuest = "1754984512592318",
            startPort = "Out",
            endQuest = "17549843021631815378",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17549843021631815375"] = {
            key = "17549843021631815375",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17549843021631815378"] = {
            key = "17549843021631815378",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2416, y = 282},
            propsData = {ModeType = 0}
          },
          ["17549843021631815381"] = {
            key = "17549843021631815381",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754984512592318"] = {
            key = "1754984512592318",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1390, y = 298},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_03_2/LS_Feina032_03_4_Mechanism",
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = false,
              HideNpcs = true,
              HideMonsters = false,
              HideAllBattleEntity = false,
              HideEffectCreature = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
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
