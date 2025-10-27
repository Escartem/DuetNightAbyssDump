return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739861639507504653",
      startPort = "StoryStart",
      endStory = "1739861639507504655",
      endPort = "In"
    },
    {
      startStory = "1739861639507504655",
      startPort = "Success",
      endStory = "1739861639507504654",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739861639507504653"] = {
      isStoryNode = true,
      key = "1739861639507504653",
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
    ["1739861639507504654"] = {
      isStoryNode = true,
      key = "1739861639507504654",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1659.6900584795326, y = 330.53508771929825},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1739861639507504655"] = {
      isStoryNode = true,
      key = "1739861639507504655",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1215.6067006651217, y = 301.47929703016365},
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
            startQuest = "1739861639507504656",
            startPort = "QuestStart",
            endQuest = "17398618089643613846",
            endPort = "In"
          },
          {
            startQuest = "17398618089643613846",
            startPort = "Out",
            endQuest = "1739861639507504657",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739861639507504656"] = {
            key = "1739861639507504656",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1739861639507504657"] = {
            key = "1739861639507504657",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1652.585607940447, y = 307.2109181141439},
            propsData = {ModeType = 0}
          },
          ["1739861639507504658"] = {
            key = "1739861639507504658",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["17398618089643613846"] = {
            key = "17398618089643613846",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1228, y = 274},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC005/SQ_OBT0103_SC005",
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
