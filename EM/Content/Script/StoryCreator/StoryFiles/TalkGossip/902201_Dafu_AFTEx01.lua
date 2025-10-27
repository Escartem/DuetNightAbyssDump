return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17339079840571",
      startPort = "StoryStart",
      endStory = "173390799164568",
      endPort = "In"
    },
    {
      startStory = "173390799164568",
      startPort = "Success",
      endStory = "17339079840575",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17339079840571"] = {
      isStoryNode = true,
      key = "17339079840571",
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
    ["17339079840575"] = {
      isStoryNode = true,
      key = "17339079840575",
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
    ["173390799164568"] = {
      isStoryNode = true,
      key = "173390799164568",
      type = "StoryNode",
      name = "\232\190\190\232\138\153\230\182\133\231\156\139\230\157\191\229\168\1525\232\175\157\233\162\152",
      pos = {x = 1090.0689655172414, y = 282.62068965517244},
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
            startQuest = "173390799164673",
            startPort = "Out",
            endQuest = "173390799164781",
            endPort = "Success"
          },
          {
            startQuest = "173390799164680",
            startPort = "QuestStart",
            endQuest = "173390799164672",
            endPort = "In"
          },
          {
            startQuest = "173390799164672",
            startPort = "Out",
            endQuest = "173390799164674",
            endPort = "In"
          },
          {
            startQuest = "173390799164674",
            startPort = "Out",
            endQuest = "173390799164673",
            endPort = "In"
          }
        },
        nodeData = {
          ["173390799164672"] = {
            key = "173390799164672",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 163.17001858730487, y = 941.5792131953443},
            propsData = {
              NpcInfos = {
                {NpcId = 85401, NpcPose = "Idle"}
              }
            }
          },
          ["173390799164673"] = {
            key = "173390799164673",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 805.9251724535384, y = 954.0917248601804},
            propsData = {
              NpcInfos = {
                {NpcId = 85401, NpcPose = "Seating"}
              }
            }
          },
          ["173390799164674"] = {
            key = "173390799164674",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 461.6498844416989, y = 941.0444178681288},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90190001,
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
                  TalkActorId = 85401,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 85401}
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
          ["173390799164680"] = {
            key = "173390799164680",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -108.54712798441847, y = 940.2337455587602},
            propsData = {ModeType = 0}
          },
          ["173390799164781"] = {
            key = "173390799164781",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1130.8333333333333, y = 955},
            propsData = {ModeType = 0}
          },
          ["173390799164782"] = {
            key = "173390799164782",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1145.8333333333333, y = 1148},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
