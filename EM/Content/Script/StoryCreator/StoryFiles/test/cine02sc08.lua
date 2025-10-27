return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739861639509504924",
      startPort = "StoryStart",
      endStory = "1739861639509504926",
      endPort = "In"
    },
    {
      startStory = "1739861639509504926",
      startPort = "Success",
      endStory = "1739861639509504925",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739861639509504924"] = {
      isStoryNode = true,
      key = "1739861639509504924",
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
    ["1739861639509504925"] = {
      isStoryNode = true,
      key = "1739861639509504925",
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
    ["1739861639509504926"] = {
      isStoryNode = true,
      key = "1739861639509504926",
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
            startQuest = "1739861639509504927",
            startPort = "QuestStart",
            endQuest = "17398618851305162545",
            endPort = "In"
          },
          {
            startQuest = "17398618851305162545",
            startPort = "Out",
            endQuest = "1739861639509504928",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739861639509504927"] = {
            key = "1739861639509504927",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1739861639509504928"] = {
            key = "1739861639509504928",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1896.585607940447, y = 315.2109181141439},
            propsData = {ModeType = 0}
          },
          ["1739861639509504929"] = {
            key = "1739861639509504929",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["17398618851305162545"] = {
            key = "17398618851305162545",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1346, y = 292},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC008/SQ_OBT0103_SC008",
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
