return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17569775526573833959",
      startPort = "StoryStart",
      endStory = "17569775526573833961",
      endPort = "In"
    },
    {
      startStory = "17569775526573833961",
      startPort = "Success",
      endStory = "17569775526573833960",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17569775526573833959"] = {
      isStoryNode = true,
      key = "17569775526573833959",
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
    ["17569775526573833960"] = {
      isStoryNode = true,
      key = "17569775526573833960",
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
    ["17569775526573833961"] = {
      isStoryNode = true,
      key = "17569775526573833961",
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
            startQuest = "17569775526573833962",
            startPort = "QuestStart",
            endQuest = "17569775526573833965",
            endPort = "In"
          },
          {
            startQuest = "17569775526573833965",
            startPort = "Out",
            endQuest = "17569775526573833963",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17569775526573833962"] = {
            key = "17569775526573833962",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17569775526573833963"] = {
            key = "17569775526573833963",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1656, y = 262},
            propsData = {ModeType = 0}
          },
          ["17569775526573833964"] = {
            key = "17569775526573833964",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656, y = 662},
            propsData = {}
          },
          ["17569775526573833965"] = {
            key = "17569775526573833965",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1218.2105263157894, y = 309.36842105263156},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80003210,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_03_02_End",
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
