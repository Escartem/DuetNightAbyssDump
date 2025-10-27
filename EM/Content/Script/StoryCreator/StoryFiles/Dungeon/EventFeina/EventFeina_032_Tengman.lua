return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17549840959701",
      startPort = "StoryStart",
      endStory = "175498410008955",
      endPort = "In"
    },
    {
      startStory = "175498410008955",
      startPort = "Success",
      endStory = "17549840959715",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17549840959701"] = {
      isStoryNode = true,
      key = "17549840959701",
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
    ["17549840959715"] = {
      isStoryNode = true,
      key = "17549840959715",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1614, y = 318},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175498410008955"] = {
      isStoryNode = true,
      key = "175498410008955",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1230, y = 314},
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
            startQuest = "175498410008956",
            startPort = "QuestStart",
            endQuest = "1754984156141605627",
            endPort = "In"
          },
          {
            startQuest = "1754984156141605627",
            startPort = "Out",
            endQuest = "175498410008963",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175498410008956"] = {
            key = "175498410008956",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175498410008963"] = {
            key = "175498410008963",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1744, y = 290},
            propsData = {ModeType = 0}
          },
          ["175498410008970"] = {
            key = "175498410008970",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754984156141605627"] = {
            key = "1754984156141605627",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1358, y = 284},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_03_2/LS_Feina032_03_5_Camera",
              InType = "BlendIn",
              OutType = "BlendOut",
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
