return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851537086311669737",
      startPort = "StoryStart",
      endStory = "171851537086311669739",
      endPort = "In"
    },
    {
      startStory = "171851537086311669739",
      startPort = "Success",
      endStory = "171851537086311669738",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851537086311669737"] = {
      isStoryNode = true,
      key = "171851537086311669737",
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
    ["171851537086311669738"] = {
      isStoryNode = true,
      key = "171851537086311669738",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1707.246376811594, y = 292.536231884058},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851537086311669739"] = {
      isStoryNode = true,
      key = "171851537086311669739",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1218.0478192493704, y = 290.2677898629541},
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
            startQuest = "171851537086311669740",
            startPort = "QuestStart",
            endQuest = "17346057550251528",
            endPort = "In"
          },
          {
            startQuest = "17346057550251528",
            startPort = "Out",
            endQuest = "171851537086311669741",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851537086311669740"] = {
            key = "171851537086311669740",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 999.4356187290972, y = 1208.320711896799},
            propsData = {ModeType = 0}
          },
          ["171851537086311669741"] = {
            key = "171851537086311669741",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1553.984696888789, y = 1191.0465487198219},
            propsData = {ModeType = 0}
          },
          ["171851537086311669742"] = {
            key = "171851537086311669742",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2055.0675922542932, y = 565.3651527500634},
            propsData = {}
          },
          ["17346057550251528"] = {
            key = "17346057550251528",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1254.2142857142853, y = 1197.785714285714},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 75000001,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003101,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
