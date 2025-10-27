return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17389266461091011919",
      startPort = "StoryStart",
      endStory = "17389266480941012000",
      endPort = "In"
    },
    {
      startStory = "17389266480941012000",
      startPort = "Success",
      endStory = "17389266461091011922",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17389266461091011919"] = {
      isStoryNode = true,
      key = "17389266461091011919",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1004, y = 328},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17389266461091011922"] = {
      isStoryNode = true,
      key = "17389266461091011922",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1676, y = 342},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17389266480941012000"] = {
      isStoryNode = true,
      key = "17389266480941012000",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1354, y = 324},
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
            startQuest = "17389266480941012001",
            startPort = "QuestStart",
            endQuest = "17389269455801770523",
            endPort = "In"
          },
          {
            startQuest = "17389269455801770523",
            startPort = "Out",
            endQuest = "17389266480941012004",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17389266480941012001"] = {
            key = "17389266480941012001",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1815.2631578947369, y = 241.57894736842104},
            propsData = {ModeType = 0}
          },
          ["17389266480941012004"] = {
            key = "17389266480941012004",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2541.0526315789475, y = 224.21052631578948},
            propsData = {ModeType = 0}
          },
          ["17389266480941012007"] = {
            key = "17389266480941012007",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2514.2105263157896, y = 486.8421052631579},
            propsData = {}
          },
          ["17389269455801770523"] = {
            key = "17389269455801770523",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2116.842105263158, y = 269.57894736842104},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007583,
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
