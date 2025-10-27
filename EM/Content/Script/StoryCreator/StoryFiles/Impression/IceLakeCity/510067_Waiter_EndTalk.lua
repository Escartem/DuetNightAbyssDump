return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17223351270822775113",
      startPort = "StoryStart",
      endStory = "17223351293822775184",
      endPort = "In"
    },
    {
      startStory = "17223351293822775184",
      startPort = "Success",
      endStory = "17223351270822775116",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17223351270822775113"] = {
      isStoryNode = true,
      key = "17223351270822775113",
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
    ["17223351270822775116"] = {
      isStoryNode = true,
      key = "17223351270822775116",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1368.5714285714284, y = 295.71428571428567},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17223351293822775184"] = {
      isStoryNode = true,
      key = "17223351293822775184",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1091.6755225719844, y = 289.88818737386526},
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
            startQuest = "17223351293822775189",
            startPort = "QuestStart",
            endQuest = "17223364419153084680",
            endPort = "In"
          },
          {
            startQuest = "17223364419153084680",
            startPort = "Out",
            endQuest = "17223351293822775190",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17223351293822775189"] = {
            key = "17223351293822775189",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 774.2857142857143, y = 130},
            propsData = {ModeType = 0}
          },
          ["17223351293822775190"] = {
            key = "17223351293822775190",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1331.9058515854867, y = 119.944426283099},
            propsData = {ModeType = 0}
          },
          ["17223351293822775191"] = {
            key = "17223351293822775191",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17223364419153084680"] = {
            key = "17223364419153084680",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1075.9612368576986, y = 111.31675880243687},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51006734,
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
              SwitchToMaster = "Player",
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
