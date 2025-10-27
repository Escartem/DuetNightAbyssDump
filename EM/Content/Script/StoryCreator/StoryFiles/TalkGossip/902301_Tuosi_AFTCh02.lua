return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17340034200115398033",
      startPort = "StoryStart",
      endStory = "17340034200115398035",
      endPort = "In"
    },
    {
      startStory = "17340034200115398035",
      startPort = "Success",
      endStory = "17340034200115398034",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17340034200115398033"] = {
      isStoryNode = true,
      key = "17340034200115398033",
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
    ["17340034200115398034"] = {
      isStoryNode = true,
      key = "17340034200115398034",
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
    ["17340034200115398035"] = {
      isStoryNode = true,
      key = "17340034200115398035",
      type = "StoryNode",
      name = "\229\185\187\230\153\175\231\156\139\230\157\191\229\168\1525\232\175\157\233\162\152",
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
            startQuest = "17340034200115398037",
            startPort = "Out",
            endQuest = "17340034200115398045",
            endPort = "Success"
          },
          {
            startQuest = "17340034200115398044",
            startPort = "QuestStart",
            endQuest = "17340034200115398036",
            endPort = "In"
          },
          {
            startQuest = "17340034200115398036",
            startPort = "Out",
            endQuest = "17340034200115398038",
            endPort = "In"
          },
          {
            startQuest = "17340034200115398038",
            startPort = "Out",
            endQuest = "17340034200115398037",
            endPort = "In"
          }
        },
        nodeData = {
          ["17340034200115398036"] = {
            key = "17340034200115398036",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 163.17001858730487, y = 941.5792131953443},
            propsData = {
              NpcInfos = {
                {NpcId = 81103, NpcPose = "Idle"}
              }
            }
          },
          ["17340034200115398037"] = {
            key = "17340034200115398037",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 801.5680295963955, y = 933.8774391458946},
            propsData = {
              NpcInfos = {
                {NpcId = 81103, NpcPose = "Seating"}
              }
            }
          },
          ["17340034200115398038"] = {
            key = "17340034200115398038",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 467.29274158455604, y = 929.8301321538431},
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
          ["17340034200115398044"] = {
            key = "17340034200115398044",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -108.54712798441847, y = 940.2337455587602},
            propsData = {ModeType = 0}
          },
          ["17340034200115398045"] = {
            key = "17340034200115398045",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1150.4761904761904, y = 927.8571428571429},
            propsData = {ModeType = 0}
          },
          ["17340034200115398046"] = {
            key = "17340034200115398046",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1381.1904761904761, y = 1169.2857142857142},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
