return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17375145159465187903",
      startPort = "StoryStart",
      endStory = "17375145224985188132",
      endPort = "In"
    },
    {
      startStory = "17375145224985188132",
      startPort = "Success",
      endStory = "17375145159465187906",
      endPort = "StoryEnd"
    },
    {
      startStory = "17375145224985188132",
      startPort = "Fail",
      endStory = "17375145159465187906",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17375145159465187903"] = {
      isStoryNode = true,
      key = "17375145159465187903",
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
    ["17375145159465187906"] = {
      isStoryNode = true,
      key = "17375145159465187906",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1730, y = 404},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17375145224985188132"] = {
      isStoryNode = true,
      key = "17375145224985188132",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1288, y = 382.3333333333333},
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
            startQuest = "17375145224995188133",
            startPort = "QuestStart",
            endQuest = "17375157665486663398",
            endPort = "In"
          },
          {
            startQuest = "17375157665486663398",
            startPort = "Out",
            endQuest = "17473132455671718807",
            endPort = "In"
          },
          {
            startQuest = "17473132455671718807",
            startPort = "Out",
            endQuest = "17375145225005188135",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17375145224995188133"] = {
            key = "17375145224995188133",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17375145225005188135"] = {
            key = "17375145225005188135",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1811.578947368421, y = 296.8421052631579},
            propsData = {ModeType = 0}
          },
          ["17375145225005188137"] = {
            key = "17375145225005188137",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1986.842105263158, y = 718.9473684210526},
            propsData = {}
          },
          ["17375157665486663398"] = {
            key = "17375157665486663398",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1159.032894736842, y = 317.47368421052636},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11018502,
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
              SwitchToMaster = "EXPlayer",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17473132455671718807"] = {
            key = "17473132455671718807",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1392.531308508425, y = 310.3400249635948},
            propsData = {
              VarName = "Weike110103",
              VarValue = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
