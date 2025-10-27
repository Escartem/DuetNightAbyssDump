return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "170893333260253443",
      startPort = "StoryStart",
      endStory = "170893333260253445",
      endPort = "In"
    },
    {
      startStory = "170893333260253445",
      startPort = "Success",
      endStory = "170893333260253444",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170893333260253443"] = {
      isStoryNode = true,
      key = "170893333260253443",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170893333260253444"] = {
      isStoryNode = true,
      key = "170893333260253444",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 400, y = 140},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170893333260253445"] = {
      isStoryNode = true,
      key = "170893333260253445",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 300, y = 140},
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
            startQuest = "170893333260253446",
            startPort = "QuestStart",
            endQuest = "17217912338318444",
            endPort = "In"
          },
          {
            startQuest = "17217912338318444",
            startPort = "Out",
            endQuest = "170893333260253447",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170893333260253446"] = {
            key = "170893333260253446",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 258, y = 550},
            propsData = {ModeType = 0}
          },
          ["170893333260253447"] = {
            key = "170893333260253447",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 946, y = 538},
            propsData = {ModeType = 0}
          },
          ["170893333260253448"] = {
            key = "170893333260253448",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17217912338318444"] = {
            key = "17217912338318444",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100191-\229\146\140\229\137\141\231\148\183\228\184\187\229\175\185\232\175\157-SC02",
            pos = {x = 632, y = 546},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC002/SQ_OBT0100_SC002",
              BlendInTime = 1,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
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
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001}
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
