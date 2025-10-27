return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17218282243864673360",
      startPort = "StoryStart",
      endStory = "17218282243864673362",
      endPort = "In"
    },
    {
      startStory = "17218282243864673362",
      startPort = "Success",
      endStory = "17218282243864673361",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17218282243864673360"] = {
      isStoryNode = true,
      key = "17218282243864673360",
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
    ["17218282243864673361"] = {
      isStoryNode = true,
      key = "17218282243864673361",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1398.9583333333335, y = 299.6875},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17218282243864673362"] = {
      isStoryNode = true,
      key = "17218282243864673362",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1101.810909233207, y = 286.7847203497242},
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
            startQuest = "17218282243864673363",
            startPort = "QuestStart",
            endQuest = "17218282243864673366",
            endPort = "In"
          },
          {
            startQuest = "17218282243864673366",
            startPort = "Out",
            endQuest = "17218282243864673364",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17218282243864673363"] = {
            key = "17218282243864673363",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17218282243864673364"] = {
            key = "17218282243864673364",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1397.6201372997723, y = 301.37299771167045},
            propsData = {ModeType = 0}
          },
          ["17218282243864673365"] = {
            key = "17218282243864673365",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17218282243864673366"] = {
            key = "17218282243864673366",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1066.7377413589384, y = 292.74265827612516},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007182,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700021}
              },
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
