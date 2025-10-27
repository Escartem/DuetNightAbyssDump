return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17331354378674873808",
      startPort = "StoryStart",
      endStory = "17331353950713786259",
      endPort = "In"
    },
    {
      startStory = "17331353950713786259",
      startPort = "Success",
      endStory = "17331354378674873809",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17331353950713786259"] = {
      isStoryNode = true,
      key = "17331353950713786259",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1105.5714285714287, y = 296.92857142857144},
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
            startQuest = "17331353950713786264",
            startPort = "QuestStart",
            endQuest = "17331353950713786267",
            endPort = "In"
          },
          {
            startQuest = "17331353950713786267",
            startPort = "Out",
            endQuest = "17331353950713786265",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17331353950713786264"] = {
            key = "17331353950713786264",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17331353950713786265"] = {
            key = "17331353950713786265",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17331353950713786266"] = {
            key = "17331353950713786266",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17331353950713786267"] = {
            key = "17331353950713786267",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1181.034923538793, y = 290.7121212121212},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 741147701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Kawaii23",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorType = "Npc",
                  TalkActorId = 74114745,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 74114745},
                {TalkActorType = "Player", TalkActorId = 0}
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
    },
    ["17331354378674873808"] = {
      isStoryNode = true,
      key = "17331354378674873808",
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
    ["17331354378674873809"] = {
      isStoryNode = true,
      key = "17331354378674873809",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1417.5714285714287, y = 291.57142857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
