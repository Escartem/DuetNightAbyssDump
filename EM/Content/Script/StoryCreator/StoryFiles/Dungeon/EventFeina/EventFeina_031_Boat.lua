return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754978623894302548",
      startPort = "StoryStart",
      endStory = "1754978625320302619",
      endPort = "In"
    },
    {
      startStory = "1754978625320302619",
      startPort = "Success",
      endStory = "1754978623894302551",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754978623894302548"] = {
      isStoryNode = true,
      key = "1754978623894302548",
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
    ["1754978623894302551"] = {
      isStoryNode = true,
      key = "1754978623894302551",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1742, y = 284},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754978625320302619"] = {
      isStoryNode = true,
      key = "1754978625320302619",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1318, y = 288},
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
        bIsPlayBlackScreenOnComplete = true,
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
            startQuest = "1754978625320302620",
            startPort = "QuestStart",
            endQuest = "1754978664238905039",
            endPort = "In"
          },
          {
            startQuest = "1754978664238905039",
            startPort = "Out",
            endQuest = "1754978625320302623",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754978625320302620"] = {
            key = "1754978625320302620",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754978625320302623"] = {
            key = "1754978625320302623",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1523.5, y = 291},
            propsData = {ModeType = 0}
          },
          ["1754978625320302626"] = {
            key = "1754978625320302626",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754978664238905039"] = {
            key = "1754978664238905039",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1150.362745098039, y = 295.7352941176471},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_03_1/LS_Feina031_09_Mechanism",
              InType = "BlendIn",
              OutType = "BlendOut",
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
