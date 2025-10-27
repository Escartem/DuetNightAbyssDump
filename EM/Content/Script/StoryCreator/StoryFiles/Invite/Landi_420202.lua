return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750059214084377",
      startPort = "StoryStart",
      endStory = "1750059217676430",
      endPort = "In"
    },
    {
      startStory = "1750059217676430",
      startPort = "Success",
      endStory = "1750059214084380",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750059214084377"] = {
      isStoryNode = true,
      key = "1750059214084377",
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
    ["1750059214084380"] = {
      isStoryNode = true,
      key = "1750059214084380",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1606, y = 298},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750059217676430"] = {
      isStoryNode = true,
      key = "1750059217676430",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1201.3333333333333, y = 298},
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
            startQuest = "1750059217676435",
            startPort = "QuestStart",
            endQuest = "1750059217676438",
            endPort = "In"
          },
          {
            startQuest = "1750059217676438",
            startPort = "Out",
            endQuest = "1750059217676436",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1750059217676435"] = {
            key = "1750059217676435",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["1750059217676436"] = {
            key = "1750059217676436",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1015.7352216748772, y = 294.1226053639847},
            propsData = {ModeType = 0}
          },
          ["1750059217676437"] = {
            key = "1750059217676437",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["1750059217676438"] = {
            key = "1750059217676438",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 689.7987012987002, y = 277.98051948051966},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80030201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Invite",
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
                  TalkActorType = "Npc",
                  TalkActorId = 94202,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 94202},
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
    }
  },
  commentData = {}
}
