return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17340036230006076197",
      startPort = "StoryStart",
      endStory = "17340036230006076199",
      endPort = "In"
    },
    {
      startStory = "17340036230006076199",
      startPort = "Success",
      endStory = "17340036230006076198",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17340036230006076197"] = {
      isStoryNode = true,
      key = "17340036230006076197",
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
    ["17340036230006076198"] = {
      isStoryNode = true,
      key = "17340036230006076198",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1400.156739811912, y = 293.4639498432602},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17340036230006076199"] = {
      isStoryNode = true,
      key = "17340036230006076199",
      type = "StoryNode",
      name = "\229\185\187\230\153\175\231\156\139\230\157\191\229\168\1523\232\175\157\233\162\152",
      pos = {x = 1090.0689655172414, y = 284.62068965517244},
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
            startQuest = "17340036230006076201",
            startPort = "Out",
            endQuest = "17340036230006076209",
            endPort = "Success"
          },
          {
            startQuest = "17340036230006076208",
            startPort = "QuestStart",
            endQuest = "17340036230006076200",
            endPort = "In"
          },
          {
            startQuest = "17340036230006076200",
            startPort = "Out",
            endQuest = "17340036230006076202",
            endPort = "In"
          },
          {
            startQuest = "17340036230006076202",
            startPort = "Out",
            endQuest = "17340036230006076201",
            endPort = "In"
          }
        },
        nodeData = {
          ["17340036230006076200"] = {
            key = "17340036230006076200",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 163.17001858730487, y = 941.5792131953443},
            propsData = {
              NpcInfos = {
                {NpcId = 81103, NpcPose = "Idle"}
              }
            }
          },
          ["17340036230006076201"] = {
            key = "17340036230006076201",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 820.139458167824, y = 936.7345820030375},
            propsData = {
              NpcInfos = {
                {NpcId = 81103, NpcPose = "Seating"}
              }
            }
          },
          ["17340036230006076202"] = {
            key = "17340036230006076202",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 471.5784558702703, y = 934.1158464395573},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90200001,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 81103,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 81103}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17340036230006076208"] = {
            key = "17340036230006076208",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -108.54712798441847, y = 940.2337455587602},
            propsData = {ModeType = 0}
          },
          ["17340036230006076209"] = {
            key = "17340036230006076209",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1141.904761904762, y = 950.7142857142857},
            propsData = {ModeType = 0}
          },
          ["17340036230006076210"] = {
            key = "17340036230006076210",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1036.904761904762, y = 1275},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
