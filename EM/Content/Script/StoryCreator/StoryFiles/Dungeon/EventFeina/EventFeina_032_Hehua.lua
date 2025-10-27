return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17549809609853614072",
      startPort = "StoryStart",
      endStory = "17549809628533614147",
      endPort = "In"
    },
    {
      startStory = "17549809628533614147",
      startPort = "Success",
      endStory = "17549809609853614075",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17549809609853614072"] = {
      isStoryNode = true,
      key = "17549809609853614072",
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
    ["17549809609853614075"] = {
      isStoryNode = true,
      key = "17549809609853614075",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1924, y = 290},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17549809628533614147"] = {
      isStoryNode = true,
      key = "17549809628533614147",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1256, y = 266},
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
            startQuest = "17549809628533614148",
            startPort = "QuestStart",
            endQuest = "17549809884754216685",
            endPort = "In"
          },
          {
            startQuest = "17549809884754216685",
            startPort = "Out",
            endQuest = "17549809628533614151",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17549809628533614148"] = {
            key = "17549809628533614148",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17549809628533614151"] = {
            key = "17549809628533614151",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1598, y = 316},
            propsData = {ModeType = 0}
          },
          ["17549809628533614154"] = {
            key = "17549809628533614154",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17549809884754216685"] = {
            key = "17549809884754216685",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1174, y = 294},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_03_2/LS_Feina032_01_Camera",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
