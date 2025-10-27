return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17340601455408115693",
      startPort = "StoryStart",
      endStory = "17340601455408115695",
      endPort = "In"
    },
    {
      startStory = "17340601455408115695",
      startPort = "Success",
      endStory = "17340601455408115694",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17340601455408115693"] = {
      isStoryNode = true,
      key = "17340601455408115693",
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
    ["17340601455408115694"] = {
      isStoryNode = true,
      key = "17340601455408115694",
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
    ["17340601455408115695"] = {
      isStoryNode = true,
      key = "17340601455408115695",
      type = "StoryNode",
      name = "\233\187\142\231\145\159\231\156\139\230\157\191\229\168\152\231\172\172\228\186\140\231\171\160\229\144\142",
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
            startQuest = "17340601455408115697",
            startPort = "Out",
            endQuest = "17340601455408115705",
            endPort = "Success"
          },
          {
            startQuest = "17340601455408115704",
            startPort = "QuestStart",
            endQuest = "17340601455408115696",
            endPort = "In"
          },
          {
            startQuest = "17340601455408115696",
            startPort = "Out",
            endQuest = "17340601455408115698",
            endPort = "In"
          },
          {
            startQuest = "17340601455408115698",
            startPort = "Out",
            endQuest = "17340601455408115697",
            endPort = "In"
          }
        },
        nodeData = {
          ["17340601455408115696"] = {
            key = "17340601455408115696",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 163.17001858730487, y = 941.5792131953443},
            propsData = {
              NpcInfos = {
                {NpcId = 84101, NpcPose = "Idle"}
              }
            }
          },
          ["17340601455408115697"] = {
            key = "17340601455408115697",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 801.4251724535384, y = 949.5917248601804},
            propsData = {
              NpcInfos = {
                {NpcId = 84101, NpcPose = "Seating"}
              }
            }
          },
          ["17340601455408115698"] = {
            key = "17340601455408115698",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 481.1498844416989, y = 928.0444178681288},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90210001,
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
                  TalkActorId = 84101,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 84101}
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
          ["17340601455408115704"] = {
            key = "17340601455408115704",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -108.54712798441847, y = 940.2337455587602},
            propsData = {ModeType = 0}
          },
          ["17340601455408115705"] = {
            key = "17340601455408115705",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1111.3333333333333, y = 952},
            propsData = {ModeType = 0}
          },
          ["17340601455408115706"] = {
            key = "17340601455408115706",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1000.3333333333333, y = 1286},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
