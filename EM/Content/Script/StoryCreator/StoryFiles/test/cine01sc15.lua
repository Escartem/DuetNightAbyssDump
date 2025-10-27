return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1741144136964515306",
      startPort = "StoryStart",
      endStory = "1741144136964515308",
      endPort = "In"
    },
    {
      startStory = "1741144136964515308",
      startPort = "Success",
      endStory = "1741144136964515307",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1741144136964515306"] = {
      isStoryNode = true,
      key = "1741144136964515306",
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
    ["1741144136964515307"] = {
      isStoryNode = true,
      key = "1741144136964515307",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1810, y = 306.9230769230769},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1741144136964515308"] = {
      isStoryNode = true,
      key = "1741144136964515308",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1341.3273833654268, y = 357.5791210600993},
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
            startQuest = "1741144136964515309",
            startPort = "QuestStart",
            endQuest = "1741144136964515312",
            endPort = "In"
          },
          {
            startQuest = "1741144136964515312",
            startPort = "Out",
            endQuest = "1741144136964515310",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1741144136964515309"] = {
            key = "1741144136964515309",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1741144136964515310"] = {
            key = "1741144136964515310",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1328.585607940447, y = 305.2109181141439},
            propsData = {ModeType = 0}
          },
          ["1741144136964515311"] = {
            key = "1741144136964515311",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["1741144136964515312"] = {
            key = "1741144136964515312",
            type = "TalkNode",
            name = "\232\181\155\231\144\170\230\145\148\229\128\146",
            pos = {x = 1066.2100169147425, y = 296.08473465800654},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC015/SQ_OBT0101_SC015",
              InType = "BlendIn",
              OutType = "BlendOut",
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
