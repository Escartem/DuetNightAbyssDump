return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "170893333262754209",
      startPort = "StoryStart",
      endStory = "17289905293091127744",
      endPort = "In"
    },
    {
      startStory = "17289905293091127744",
      startPort = "Success",
      endStory = "170893333262754210",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170893333262754209"] = {
      isStoryNode = true,
      key = "170893333262754209",
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
    ["170893333262754210"] = {
      isStoryNode = true,
      key = "170893333262754210",
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
    ["17289905293091127744"] = {
      isStoryNode = true,
      key = "17289905293091127744",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 300.29526513442624, y = 168.1405298721561},
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
            startQuest = "17289905293091127749",
            startPort = "QuestStart",
            endQuest = "17289905293091127748",
            endPort = "In"
          },
          {
            startQuest = "17289905293091127748",
            startPort = "Out",
            endQuest = "17289905293091127750",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17289905293091127748"] = {
            key = "17289905293091127748",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100111-SC05-\229\165\179\231\165\158\229\131\143",
            pos = {x = 613.4004536384355, y = 517.7901696309258},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC005/SQ_OBT0100_SC005",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "QuestPoint_Dx",
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
          },
          ["17289905293091127749"] = {
            key = "17289905293091127749",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 121.66666666666667, y = 458.33333333333337},
            propsData = {ModeType = 0}
          },
          ["17289905293091127750"] = {
            key = "17289905293091127750",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["17289905293091127751"] = {
            key = "17289905293091127751",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
