return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739861639505503944",
      startPort = "StoryStart",
      endStory = "1739861639505503946",
      endPort = "In"
    },
    {
      startStory = "1739861639505503946",
      startPort = "Success",
      endStory = "1739861639505503945",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739861639505503944"] = {
      isStoryNode = true,
      key = "1739861639505503944",
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
    ["1739861639505503945"] = {
      isStoryNode = true,
      key = "1739861639505503945",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 914, y = 168},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1739861639505503946"] = {
      isStoryNode = true,
      key = "1739861639505503946",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 512, y = 142},
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
            startQuest = "1739861639505503947",
            startPort = "QuestStart",
            endQuest = "17398616302861959",
            endPort = "In"
          },
          {
            startQuest = "17398616302861959",
            startPort = "Out",
            endQuest = "1739861639505503948",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17398616302861959"] = {
            key = "17398616302861959",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 616, y = 558},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC001/SQ_OBT0103_SC001",
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
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1739861639505503947"] = {
            key = "1739861639505503947",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 121.66666666666667, y = 458.33333333333337},
            propsData = {ModeType = 0}
          },
          ["1739861639505503948"] = {
            key = "1739861639505503948",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1188.3333333333333, y = 798.3333333333334},
            propsData = {ModeType = 0}
          },
          ["1739861639505503949"] = {
            key = "1739861639505503949",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1739861639505503950"] = {
            key = "1739861639505503950",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100191-\229\146\140\229\137\141\231\148\183\228\184\187\229\175\185\232\175\157-SC02",
            pos = {x = 238.57589223492673, y = -248.1747426497762},
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
