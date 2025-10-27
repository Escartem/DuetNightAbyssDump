return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1751350552592629657",
      startPort = "StoryStart",
      endStory = "1751350552592629659",
      endPort = "In"
    },
    {
      startStory = "1751350552592629659",
      startPort = "Success",
      endStory = "1751350552592629658",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1751350552592629657"] = {
      isStoryNode = true,
      key = "1751350552592629657",
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
    ["1751350552592629658"] = {
      isStoryNode = true,
      key = "1751350552592629658",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1911.6900584795326, y = 316.53508771929825},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1751350552592629659"] = {
      isStoryNode = true,
      key = "1751350552592629659",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1330.970337028758, y = 300.3616499713401},
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
            startQuest = "1751350552592629660",
            startPort = "QuestStart",
            endQuest = "1751350552592629663",
            endPort = "In"
          },
          {
            startQuest = "1751350552592629663",
            startPort = "Out",
            endQuest = "1751350552592629661",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1751350552592629660"] = {
            key = "1751350552592629660",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1751350552592629661"] = {
            key = "1751350552592629661",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1896.585607940447, y = 315.2109181141439},
            propsData = {ModeType = 0}
          },
          ["1751350552592629662"] = {
            key = "1751350552592629662",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["1751350552592629663"] = {
            key = "1751350552592629663",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1346, y = 292},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC009/SQ_OBT0103_SC009",
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
