return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1748333355392309096",
      startPort = "StoryStart",
      endStory = "1748333355392309098",
      endPort = "In"
    },
    {
      startStory = "1748333355392309098",
      startPort = "Success",
      endStory = "1748333355392309097",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1748333355392309096"] = {
      isStoryNode = true,
      key = "1748333355392309096",
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
    ["1748333355392309097"] = {
      isStoryNode = true,
      key = "1748333355392309097",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1748333355392309098"] = {
      isStoryNode = true,
      key = "1748333355392309098",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1718.6666666666667, y = 293.99999999999994},
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
            startQuest = "1748333355392309102",
            startPort = "Out",
            endQuest = "1748333355392309100",
            endPort = "Success"
          },
          {
            startQuest = "1748333355392309099",
            startPort = "QuestStart",
            endQuest = "1755140430656608309",
            endPort = "In"
          },
          {
            startQuest = "1755140430656608309",
            startPort = "Branch_1",
            endQuest = "1748333355392309102",
            endPort = "In"
          }
        },
        nodeData = {
          ["1748333355392309099"] = {
            key = "1748333355392309099",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748333355392309100"] = {
            key = "1748333355392309100",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748333355392309101"] = {
            key = "1748333355392309101",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1748333355392309102"] = {
            key = "1748333355392309102",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1720, y = 280},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10037996,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1755140430656608309"] = {
            key = "1755140430656608309",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1264, y = 94},
            propsData = {
              Branches = {300107}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
