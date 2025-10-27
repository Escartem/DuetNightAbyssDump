return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102849412859",
      startPort = "StoryStart",
      endStory = "1721630102849412861",
      endPort = "In"
    },
    {
      startStory = "1721630102849412861",
      startPort = "Success",
      endStory = "1721630102849412860",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102849412859"] = {
      isStoryNode = true,
      key = "1721630102849412859",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102849412860"] = {
      isStoryNode = true,
      key = "1721630102849412860",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 640, y = 146},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102849412861"] = {
      isStoryNode = true,
      key = "1721630102849412861",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 300, y = 140},
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
        bIsNotifyGameMode = false,
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
            startQuest = "1721630102849412862",
            startPort = "QuestStart",
            endQuest = "1721630102849412865",
            endPort = "In"
          },
          {
            startQuest = "1721630102849412865",
            startPort = "Out",
            endQuest = "1721630102849412863",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630102849412862"] = {
            key = "1721630102849412862",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1721630102849412863"] = {
            key = "1721630102849412863",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1721630102849412864"] = {
            key = "1721630102849412864",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1721630102849412865"] = {
            key = "1721630102849412865",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 684.6074239218049, y = 131.71087515550323},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001335,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1.5,
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
