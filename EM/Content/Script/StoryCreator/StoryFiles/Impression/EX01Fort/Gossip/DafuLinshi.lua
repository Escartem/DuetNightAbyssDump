return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17568940216802854760",
      startPort = "StoryStart",
      endStory = "17568940240702854852",
      endPort = "In"
    },
    {
      startStory = "17568940240702854852",
      startPort = "Success",
      endStory = "17568940216802854763",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17568940216802854760"] = {
      isStoryNode = true,
      key = "17568940216802854760",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1050, y = 370},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17568940216802854763"] = {
      isStoryNode = true,
      key = "17568940216802854763",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1712, y = 370},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17568940240702854852"] = {
      isStoryNode = true,
      key = "17568940240702854852",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1404, y = 378},
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
            startQuest = "17568940317382855167",
            startPort = "Out",
            endQuest = "17568940240702854856",
            endPort = "Success"
          },
          {
            startQuest = "17568940240702854853",
            startPort = "QuestStart",
            endQuest = "17568940317382855167",
            endPort = "In"
          }
        },
        nodeData = {
          ["17568940240702854853"] = {
            key = "17568940240702854853",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17568940240702854856"] = {
            key = "17568940240702854856",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1848, y = 392},
            propsData = {ModeType = 0}
          },
          ["17568940240702854859"] = {
            key = "17568940240702854859",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17568940317382855167"] = {
            key = "17568940317382855167",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1318, y = 402},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011133,
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
