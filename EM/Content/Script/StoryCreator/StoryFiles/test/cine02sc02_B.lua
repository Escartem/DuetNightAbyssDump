return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739861639506504235",
      startPort = "StoryStart",
      endStory = "1739861639506504237",
      endPort = "In"
    },
    {
      startStory = "1739861639506504237",
      startPort = "Success",
      endStory = "1739861639506504236",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739861639506504235"] = {
      isStoryNode = true,
      key = "1739861639506504235",
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
    ["1739861639506504236"] = {
      isStoryNode = true,
      key = "1739861639506504236",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1505.6900584795326, y = 342.53508771929825},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1739861639506504237"] = {
      isStoryNode = true,
      key = "1739861639506504237",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1164.970337028758, y = 333.47929703016365},
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
            startQuest = "1739861639506504238",
            startPort = "QuestStart",
            endQuest = "17398616955941549927",
            endPort = "In"
          },
          {
            startQuest = "17398616955941549927",
            startPort = "Out",
            endQuest = "1739861639506504239",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739861639506504238"] = {
            key = "1739861639506504238",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1739861639506504239"] = {
            key = "1739861639506504239",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1546.585607940447, y = 321.2109181141439},
            propsData = {ModeType = 0}
          },
          ["1739861639506504240"] = {
            key = "1739861639506504240",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["17398616955941549927"] = {
            key = "17398616955941549927",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1166, y = 290},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC002/SQ_OBT0103_SC002_B",
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
