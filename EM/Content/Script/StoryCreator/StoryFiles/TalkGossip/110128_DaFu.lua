return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17325127083881631865",
      startPort = "StoryStart",
      endStory = "17325127325321631952",
      endPort = "In"
    },
    {
      startStory = "17325127325321631952",
      startPort = "Success",
      endStory = "17325127083881631868",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17325127083881631865"] = {
      isStoryNode = true,
      key = "17325127083881631865",
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
    ["17325127083881631868"] = {
      isStoryNode = true,
      key = "17325127083881631868",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1666, y = 340},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17325127325321631952"] = {
      isStoryNode = true,
      key = "17325127325321631952",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1246, y = 340},
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
            startQuest = "17325127325331631953",
            startPort = "QuestStart",
            endQuest = "17325127464491632399",
            endPort = "In"
          },
          {
            startQuest = "17325127464491632399",
            startPort = "Out",
            endQuest = "17325127325331631956",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17325127325331631953"] = {
            key = "17325127325331631953",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17325127325331631956"] = {
            key = "17325127325331631956",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1828, y = 310},
            propsData = {ModeType = 0}
          },
          ["17325127325331631959"] = {
            key = "17325127325331631959",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17325127464491632399"] = {
            key = "17325127464491632399",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1404, y = 284},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11010416,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
