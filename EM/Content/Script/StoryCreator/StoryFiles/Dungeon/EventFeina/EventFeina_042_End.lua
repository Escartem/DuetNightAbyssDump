return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17549855018091",
      startPort = "StoryStart",
      endStory = "175498550530844",
      endPort = "In"
    },
    {
      startStory = "175498550530844",
      startPort = "Success",
      endStory = "17549855018105",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17549855018091"] = {
      isStoryNode = true,
      key = "17549855018091",
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
    ["17549855018105"] = {
      isStoryNode = true,
      key = "17549855018105",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1884, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175498550530844"] = {
      isStoryNode = true,
      key = "175498550530844",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1348, y = 276},
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
            startQuest = "175498550530845",
            startPort = "QuestStart",
            endQuest = "1754985528989605817",
            endPort = "In"
          },
          {
            startQuest = "1754985528989605817",
            startPort = "Out",
            endQuest = "175498550530852",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175498550530845"] = {
            key = "175498550530845",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175498550530852"] = {
            key = "175498550530852",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1506.25, y = 303.75},
            propsData = {ModeType = 0}
          },
          ["175498550530859"] = {
            key = "175498550530859",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754985528989605817"] = {
            key = "1754985528989605817",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1188.1299019607843, y = 311.0099329205367},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_04_2/LS_Feina_042_9_Mechanism",
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = true,
              FinishFadeInTime = 2,
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
