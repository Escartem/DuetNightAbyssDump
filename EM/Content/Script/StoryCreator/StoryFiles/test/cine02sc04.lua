return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739861639507504526",
      startPort = "StoryStart",
      endStory = "1739861639507504528",
      endPort = "In"
    },
    {
      startStory = "1739861639507504528",
      startPort = "Success",
      endStory = "1739861639507504527",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739861639507504526"] = {
      isStoryNode = true,
      key = "1739861639507504526",
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
    ["1739861639507504527"] = {
      isStoryNode = true,
      key = "1739861639507504527",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1541.6900584795326, y = 324.53508771929825},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1739861639507504528"] = {
      isStoryNode = true,
      key = "1739861639507504528",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1174.970337028758, y = 305.5508391605293},
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
            startQuest = "1739861639507504529",
            startPort = "QuestStart",
            endQuest = "17398617848583097814",
            endPort = "In"
          },
          {
            startQuest = "17398617848583097814",
            startPort = "Out",
            endQuest = "1739861639507504530",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739861639507504529"] = {
            key = "1739861639507504529",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1739861639507504530"] = {
            key = "1739861639507504530",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1584.3920595533502, y = 304.17866004962775},
            propsData = {ModeType = 0}
          },
          ["1739861639507504531"] = {
            key = "1739861639507504531",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1595.8461538461543, y = 513.2307692307693},
            propsData = {}
          },
          ["17398617848583097814"] = {
            key = "17398617848583097814",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1188, y = 286},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC004/SQ_OBT0103_SC004",
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
