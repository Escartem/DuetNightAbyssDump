return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536867911583358",
      startPort = "StoryStart",
      endStory = "17180944232872082716",
      endPort = "In"
    },
    {
      startStory = "17180944232872082716",
      startPort = "Success",
      endStory = "171851536867911583359",
      endPort = "StoryEnd"
    },
    {
      startStory = "17180944232872082716",
      startPort = "Fail",
      endStory = "171851536867911583359",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17180944232872082716"] = {
      isStoryNode = true,
      key = "17180944232872082716",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1851.6619634272554, y = 285.7883202927507},
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
            startQuest = "17180944232872082721",
            startPort = "QuestStart",
            endQuest = "17180944232872082724",
            endPort = "In"
          },
          {
            startQuest = "17180944232872082724",
            startPort = "Out",
            endQuest = "17180944232872082722",
            endPort = "Success"
          },
          {
            startQuest = "17180944232872082724",
            startPort = "Fail",
            endQuest = "17180944232872082723",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17180944232872082721"] = {
            key = "17180944232872082721",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1353.2608695652175, y = -165.8152173913045},
            propsData = {ModeType = 0}
          },
          ["17180944232872082722"] = {
            key = "17180944232872082722",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1900.3996983408747, y = -287.23856209150335},
            propsData = {ModeType = 0}
          },
          ["17180944232872082723"] = {
            key = "17180944232872082723",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1906.5359477124182, y = -64.37908496732037},
            propsData = {}
          },
          ["17180944232872082724"] = {
            key = "17180944232872082724",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1618.0163668860564, y = -166.9082296780713},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51002601,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 1.5,
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
              OptionType = "check",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              CheckOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["171851536867911583358"] = {
      isStoryNode = true,
      key = "171851536867911583358",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1574.7058823529412, y = 292.94117647058823},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536867911583359"] = {
      isStoryNode = true,
      key = "171851536867911583359",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2161.176470588235, y = 291.1764705882353},
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
