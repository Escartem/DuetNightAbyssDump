return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17557585880351",
      startPort = "StoryStart",
      endStory = "1755758646425110",
      endPort = "In"
    },
    {
      startStory = "1755758646425110",
      startPort = "Success",
      endStory = "17557585880365",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17557585880351"] = {
      isStoryNode = true,
      key = "17557585880351",
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
    ["17557585880365"] = {
      isStoryNode = true,
      key = "17557585880365",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1574, y = 296},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1755758646425110"] = {
      isStoryNode = true,
      key = "1755758646425110",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1190, y = 298},
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
            startQuest = "1755758646425111",
            startPort = "QuestStart",
            endQuest = "1755759128035211",
            endPort = "In"
          },
          {
            startQuest = "1755759128035211",
            startPort = "Out",
            endQuest = "1755758646425118",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1755758646425111"] = {
            key = "1755758646425111",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1755758646425118"] = {
            key = "1755758646425118",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1656, y = 262},
            propsData = {ModeType = 0}
          },
          ["1755758646425125"] = {
            key = "1755758646425125",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656, y = 662},
            propsData = {}
          },
          ["1755759128035211"] = {
            key = "1755759128035211",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1218.2105263157894, y = 309.36842105263156},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80004210,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_04_02_End",
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
