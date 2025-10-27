return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1722567292454173925",
      startPort = "StoryStart",
      endStory = "1722567335895176071",
      endPort = "In"
    },
    {
      startStory = "1722567335895176071",
      startPort = "Success",
      endStory = "1722567292454173928",
      endPort = "StoryEnd"
    },
    {
      startStory = "1722567335895176071",
      startPort = "Fail",
      endStory = "1722567292454173928",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1722567292454173925"] = {
      isStoryNode = true,
      key = "1722567292454173925",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 804.6875, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722567292454173928"] = {
      isStoryNode = true,
      key = "1722567292454173928",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1366.9696969696981, y = 265.00000000000006},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722567335895176071"] = {
      isStoryNode = true,
      key = "1722567335895176071",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1091.4794911271392, y = 289.13405580881135},
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
            startQuest = "1722567335895176072",
            startPort = "QuestStart",
            endQuest = "1740489491490270304",
            endPort = "In"
          },
          {
            startQuest = "1740489491490270304",
            startPort = "Out",
            endQuest = "1722567335895176074",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1722567335895176072"] = {
            key = "1722567335895176072",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1149.4999999999995, y = 205.5000000000001},
            propsData = {ModeType = 0}
          },
          ["1722567335895176074"] = {
            key = "1722567335895176074",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2239.0000000000005, y = 37.500000000000284},
            propsData = {ModeType = 0}
          },
          ["1722567335895176076"] = {
            key = "1722567335895176076",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2188.000000000001, y = 455.5000000000002},
            propsData = {}
          },
          ["1722567342682176474"] = {
            key = "1722567342682176474",
            type = "TalkNode",
            name = "\232\183\159\228\188\164\229\145\152B\229\175\185\232\175\157",
            pos = {x = 1446.226638362733, y = 195.4145063829051},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_04_1",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
              SwitchToMaster = "EXPlayer",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1740489491490270304"] = {
            key = "1740489491490270304",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1576, y = 390},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 11010501,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "EXPlayer",
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
