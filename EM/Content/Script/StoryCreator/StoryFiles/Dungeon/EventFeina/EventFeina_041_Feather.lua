return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17569775670094470751",
      startPort = "StoryStart",
      endStory = "17569775670094470753",
      endPort = "In"
    },
    {
      startStory = "17569775670094470753",
      startPort = "Success",
      endStory = "17569775670094470752",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17569775670094470751"] = {
      isStoryNode = true,
      key = "17569775670094470751",
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
    ["17569775670094470752"] = {
      isStoryNode = true,
      key = "17569775670094470752",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2098.75, y = 320},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17569775670094470753"] = {
      isStoryNode = true,
      key = "17569775670094470753",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1294.4431112365896, y = 303.5000000000001},
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
            startQuest = "17569775670094470754",
            startPort = "QuestStart",
            endQuest = "17569775670094470757",
            endPort = "In"
          },
          {
            startQuest = "17569775670094470757",
            startPort = "Out",
            endQuest = "17569775670094470755",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17569775670094470754"] = {
            key = "17569775670094470754",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17569775670094470755"] = {
            key = "17569775670094470755",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1656, y = 262},
            propsData = {ModeType = 0}
          },
          ["17569775670094470756"] = {
            key = "17569775670094470756",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656, y = 662},
            propsData = {}
          },
          ["17569775670094470757"] = {
            key = "17569775670094470757",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1218.2105263157894, y = 309.36842105263156},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80004110,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_04_01_End",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
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
