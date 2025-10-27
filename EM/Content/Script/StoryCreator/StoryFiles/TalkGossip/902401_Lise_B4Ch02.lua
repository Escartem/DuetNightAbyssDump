return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "173407030544315589203",
      startPort = "StoryStart",
      endStory = "173407030544315589205",
      endPort = "In"
    },
    {
      startStory = "173407030544315589205",
      startPort = "Success",
      endStory = "173407030544315589204",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["173407030544315589203"] = {
      isStoryNode = true,
      key = "173407030544315589203",
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
    ["173407030544315589204"] = {
      isStoryNode = true,
      key = "173407030544315589204",
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
    ["173407030544315589205"] = {
      isStoryNode = true,
      key = "173407030544315589205",
      type = "StoryNode",
      name = "\233\187\142\231\145\159\231\156\139\230\157\191\229\168\152\231\172\172\228\186\140\231\171\160\229\137\141",
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
            startQuest = "173407030544315589207",
            startPort = "Out",
            endQuest = "173407030544415589215",
            endPort = "Success"
          },
          {
            startQuest = "173407030544415589214",
            startPort = "QuestStart",
            endQuest = "173407030544315589206",
            endPort = "In"
          },
          {
            startQuest = "173407030544315589206",
            startPort = "Out",
            endQuest = "173407030544415589208",
            endPort = "In"
          },
          {
            startQuest = "173407030544415589208",
            startPort = "Out",
            endQuest = "173407030544315589207",
            endPort = "In"
          }
        },
        nodeData = {
          ["173407030544315589206"] = {
            key = "173407030544315589206",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 163.17001858730487, y = 941.5792131953443},
            propsData = {
              NpcInfos = {
                {NpcId = 84101, NpcPose = "Idle"}
              }
            }
          },
          ["173407030544315589207"] = {
            key = "173407030544315589207",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 796.2433542717201, y = 923.6826339510894},
            propsData = {
              NpcInfos = {
                {NpcId = 84101, NpcPose = "Seating"}
              }
            }
          },
          ["173407030544415589208"] = {
            key = "173407030544415589208",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 457.4226117144261, y = 916.908054231765},
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
          ["173407030544415589214"] = {
            key = "173407030544415589214",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -108.54712798441847, y = 940.2337455587602},
            propsData = {ModeType = 0}
          },
          ["173407030544415589215"] = {
            key = "173407030544415589215",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1135.6060606060605, y = 935.9090909090909},
            propsData = {ModeType = 0}
          },
          ["173407030544415589216"] = {
            key = "173407030544415589216",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1018.3333333333333, y = 1237.7272727272727},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
