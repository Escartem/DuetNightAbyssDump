return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17569775820855107485",
      startPort = "StoryStart",
      endStory = "17569775820855107487",
      endPort = "In"
    },
    {
      startStory = "17569775820855107487",
      startPort = "Success",
      endStory = "17569775820855107486",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17569775820855107485"] = {
      isStoryNode = true,
      key = "17569775820855107485",
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
    ["17569775820855107486"] = {
      isStoryNode = true,
      key = "17569775820855107486",
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
    ["17569775820855107487"] = {
      isStoryNode = true,
      key = "17569775820855107487",
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
            startQuest = "17569775820855107488",
            startPort = "QuestStart",
            endQuest = "17569775820855107491",
            endPort = "In"
          },
          {
            startQuest = "17569775820855107491",
            startPort = "Out",
            endQuest = "17569775820855107489",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17569775820855107488"] = {
            key = "17569775820855107488",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17569775820855107489"] = {
            key = "17569775820855107489",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1546.8, y = 337.99999999999994},
            propsData = {ModeType = 0}
          },
          ["17569775820855107490"] = {
            key = "17569775820855107490",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656, y = 662},
            propsData = {}
          },
          ["17569775820855107491"] = {
            key = "17569775820855107491",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1169.0105263157893, y = 311.76842105263154},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80004254,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_04_02_EndFeather",
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
