return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1751270516292762492",
      startPort = "StoryStart",
      endStory = "1751270516292762494",
      endPort = "In"
    },
    {
      startStory = "1751270516292762494",
      startPort = "Success",
      endStory = "1751270516292762493",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1751270516292762492"] = {
      isStoryNode = true,
      key = "1751270516292762492",
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
    ["1751270516292762493"] = {
      isStoryNode = true,
      key = "1751270516292762493",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1502, y = 336},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1751270516292762494"] = {
      isStoryNode = true,
      key = "1751270516292762494",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1168.75996372049, y = 263.7554945054944},
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
            startQuest = "1751270516292762498",
            startPort = "Out",
            endQuest = "1751270516292762496",
            endPort = "Success"
          },
          {
            startQuest = "1751270516292762495",
            startPort = "QuestStart",
            endQuest = "1751270516292762498",
            endPort = "In"
          }
        },
        nodeData = {
          ["1751270516292762495"] = {
            key = "1751270516292762495",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1751270516292762496"] = {
            key = "1751270516292762496",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1702.5, y = 317.5},
            propsData = {ModeType = 0}
          },
          ["1751270516292762497"] = {
            key = "1751270516292762497",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1751270516292762498"] = {
            key = "1751270516292762498",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1369.5291944897208, y = 291.4478021978021},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51010330,
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
