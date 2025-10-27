return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17567278003811",
      startPort = "StoryStart",
      endStory = "175672782164088",
      endPort = "In"
    },
    {
      startStory = "175672782164088",
      startPort = "Success",
      endStory = "17567278003815",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17567278003811"] = {
      isStoryNode = true,
      key = "17567278003811",
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
    ["17567278003815"] = {
      isStoryNode = true,
      key = "17567278003815",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1784, y = 316},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175672782164088"] = {
      isStoryNode = true,
      key = "175672782164088",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1294, y = 308},
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
            startQuest = "175672782164089",
            startPort = "QuestStart",
            endQuest = "1756727833981444",
            endPort = "In"
          },
          {
            startQuest = "1756727833981444",
            startPort = "Out",
            endQuest = "175672782164096",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175672782164089"] = {
            key = "175672782164089",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175672782164096"] = {
            key = "175672782164096",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1800, y = 310},
            propsData = {ModeType = 0}
          },
          ["1756727821640103"] = {
            key = "1756727821640103",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1756727833981444"] = {
            key = "1756727833981444",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1222, y = 306},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_03_2/LS_Feina032_InitBoat",
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
