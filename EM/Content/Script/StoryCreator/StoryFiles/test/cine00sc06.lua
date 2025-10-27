return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "170893333263854634",
      startPort = "StoryStart",
      endStory = "170893333263854636",
      endPort = "In"
    },
    {
      startStory = "170893333263854636",
      startPort = "Success",
      endStory = "170893333263854635",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170893333263854634"] = {
      isStoryNode = true,
      key = "170893333263854634",
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
    ["170893333263854635"] = {
      isStoryNode = true,
      key = "170893333263854635",
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
    ["170893333263854636"] = {
      isStoryNode = true,
      key = "170893333263854636",
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
            startQuest = "170893333263854637",
            startPort = "QuestStart",
            endQuest = "17217908335112258",
            endPort = "In"
          },
          {
            startQuest = "17217908335112258",
            startPort = "Out",
            endQuest = "170893333263854638",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170893333263854637"] = {
            key = "170893333263854637",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 203.66666666666669, y = 682.3333333333334},
            propsData = {ModeType = 0}
          },
          ["170893333263854638"] = {
            key = "170893333263854638",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 972, y = 776},
            propsData = {ModeType = 0}
          },
          ["170893333263854639"] = {
            key = "170893333263854639",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17217908335112258"] = {
            key = "17217908335112258",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100179-\232\128\129\229\164\180\231\142\175-SC06",
            pos = {x = 584.0541881950394, y = 748},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC006/SQ_OBT0100_SC006",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
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
              EndNewTargetPointName = "QuestPoint_Balcony2",
              CameraLookAtTartgetPoint = "QuestPoint_Balcony1",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100003},
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
