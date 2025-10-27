return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "172665004020415643528",
      startPort = "StoryStart",
      endStory = "172665004676115643743",
      endPort = "In"
    },
    {
      startStory = "172665004676115643743",
      startPort = "Success",
      endStory = "172665004020415643531",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["172665004020415643528"] = {
      isStoryNode = true,
      key = "172665004020415643528",
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
    ["172665004020415643531"] = {
      isStoryNode = true,
      key = "172665004020415643531",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2450.909090909091, y = 302.72727272727275},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172665004676115643743"] = {
      isStoryNode = true,
      key = "172665004676115643743",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1585.804687243444, y = 317.49224924807476},
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
            startQuest = "172665004676115643744",
            startPort = "QuestStart",
            endQuest = "172665027816416009592",
            endPort = "In"
          },
          {
            startQuest = "172665027816416009592",
            startPort = "Out",
            endQuest = "172665004676115643747",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172665004676115643744"] = {
            key = "172665004676115643744",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172665004676115643747"] = {
            key = "172665004676115643747",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1930, y = 330},
            propsData = {ModeType = 0}
          },
          ["172665004676115643750"] = {
            key = "172665004676115643750",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172665027816416009592"] = {
            key = "172665027816416009592",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1402.3898667698002, y = 310.7481697981125},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11017902,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
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
