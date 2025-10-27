return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17568813318741",
      startPort = "StoryStart",
      endStory = "1756881426573185",
      endPort = "In"
    },
    {
      startStory = "1756881426573185",
      startPort = "Success",
      endStory = "17568813318755",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17568813318741"] = {
      isStoryNode = true,
      key = "17568813318741",
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
    ["17568813318755"] = {
      isStoryNode = true,
      key = "17568813318755",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1598, y = 316},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1756881426573185"] = {
      isStoryNode = true,
      key = "1756881426573185",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1248, y = 300},
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
            startQuest = "1756881426573186",
            startPort = "QuestStart",
            endQuest = "1756881437728585",
            endPort = "In"
          },
          {
            startQuest = "1756881437728585",
            startPort = "Out",
            endQuest = "1756881426573193",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1756881426573186"] = {
            key = "1756881426573186",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1756881426573193"] = {
            key = "1756881426573193",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1630, y = 298},
            propsData = {ModeType = 0}
          },
          ["1756881426574200"] = {
            key = "1756881426574200",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1756881437728585"] = {
            key = "1756881437728585",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1216, y = 300},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_03_2/LS_Feina032_04_Camera",
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = false,
              HideNpcs = false,
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
