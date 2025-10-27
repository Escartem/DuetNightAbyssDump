return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754637038935298778",
      startPort = "StoryStart",
      endStory = "1754637109257299010",
      endPort = "In"
    },
    {
      startStory = "1754637109257299010",
      startPort = "Success",
      endStory = "1754637038935298781",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754637038935298778"] = {
      isStoryNode = true,
      key = "1754637038935298778",
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
    ["1754637038935298781"] = {
      isStoryNode = true,
      key = "1754637038935298781",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1521.6, y = 280.4},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754637109257299010"] = {
      isStoryNode = true,
      key = "1754637109257299010",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1130.8041958041958, y = 287.5827505827507},
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
            startQuest = "1754637109257299011",
            startPort = "QuestStart",
            endQuest = "1754637134437299565",
            endPort = "In"
          },
          {
            startQuest = "175729891414533598586",
            startPort = "Out",
            endQuest = "175729891414533598585",
            endPort = "In"
          },
          {
            startQuest = "1754637134437299565",
            startPort = "Out",
            endQuest = "175729892419333598783",
            endPort = "In"
          },
          {
            startQuest = "175729892419333598783",
            startPort = "Out",
            endQuest = "175729891414533598586",
            endPort = "In"
          },
          {
            startQuest = "175729891414533598585",
            startPort = "Out",
            endQuest = "1754637109257299014",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754637109257299011"] = {
            key = "1754637109257299011",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754637109257299014"] = {
            key = "1754637109257299014",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754637109257299017"] = {
            key = "1754637109257299017",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754637134437299565"] = {
            key = "1754637134437299565",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1192.3684210526317, y = 291.13157894736844},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Special/Event/Feina/Feina_01/LS_Feina_01_00",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = true,
              StartFadeOutTime = 0.5,
              StartScreenEffectDuration = 1,
              FinishFadeInTime = 0,
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
          },
          ["175729891414533598585"] = {
            key = "175729891414533598585",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2440, y = 273},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80001005,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175729891414533598586"] = {
            key = "175729891414533598586",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1880, y = 295},
            propsData = {GuideId = 2001}
          },
          ["175729892419333598783"] = {
            key = "175729892419333598783",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1568, y = 316},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
