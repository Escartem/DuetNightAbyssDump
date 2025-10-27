return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536892911589609",
      startPort = "StoryStart",
      endStory = "17181026917232105792",
      endPort = "In"
    },
    {
      startStory = "17181026917232105792",
      startPort = "Success",
      endStory = "171851536892911589610",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17181026917232105792"] = {
      isStoryNode = true,
      key = "17181026917232105792",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1026.7540882082649, y = 287.07811241139285},
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
            startQuest = "17181026917232105796",
            startPort = "QuestStart",
            endQuest = "17181026917232105799",
            endPort = "In"
          },
          {
            startQuest = "17181026917232105799",
            startPort = "Out",
            endQuest = "17181026917232105797",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17181026917232105796"] = {
            key = "17181026917232105796",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17181026917232105797"] = {
            key = "17181026917232105797",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1400.6764705882351, y = 303},
            propsData = {ModeType = 0}
          },
          ["17181026917232105798"] = {
            key = "17181026917232105798",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17181026917232105799"] = {
            key = "17181026917232105799",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1072.669189849695, y = 286.70652259979636},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510055071,
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
    },
    ["171851536892911589609"] = {
      isStoryNode = true,
      key = "171851536892911589609",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 725.5172413793103, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536892911589610"] = {
      isStoryNode = true,
      key = "171851536892911589610",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1326.6266866566718, y = 296.8986276092723},
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
