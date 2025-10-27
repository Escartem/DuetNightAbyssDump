return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17424782177231",
      startPort = "StoryStart",
      endStory = "174247822269435",
      endPort = "In"
    },
    {
      startStory = "174247822269435",
      startPort = "Success",
      endStory = "17424782177235",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17424782177231"] = {
      isStoryNode = true,
      key = "17424782177231",
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
    ["17424782177235"] = {
      isStoryNode = true,
      key = "17424782177235",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1396.818181818182, y = 301.70454545454544},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["174247822269435"] = {
      isStoryNode = true,
      key = "174247822269435",
      type = "StoryNode",
      name = "\230\173\162\230\181\129\231\156\139\230\157\191\229\168\152",
      pos = {x = 1082.8383838383838, y = 287.3030303030303},
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
            startQuest = "174247822269542",
            startPort = "QuestStart",
            endQuest = "174247822269540",
            endPort = "In"
          },
          {
            startQuest = "174247822269540",
            startPort = "Out",
            endQuest = "174247822269545",
            endPort = "In"
          },
          {
            startQuest = "174247822269541",
            startPort = "Out",
            endQuest = "174247822269543",
            endPort = "Success"
          },
          {
            startQuest = "174247822269545",
            startPort = "Out",
            endQuest = "174247822269541",
            endPort = "In"
          }
        },
        nodeData = {
          ["174247822269540"] = {
            key = "174247822269540",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 85, y = 156.94128009520045},
            propsData = {
              NpcInfos = {
                {NpcId = 84102, NpcPose = "Idle"}
              }
            }
          },
          ["174247822269541"] = {
            key = "174247822269541",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 642.7993047310042, y = 156.82449325529143},
            propsData = {
              NpcInfos = {
                {NpcId = 84102, NpcPose = "Seating"}
              }
            }
          },
          ["174247822269542"] = {
            key = "174247822269542",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -171.7304734684251, y = 156.44718737417537},
            propsData = {ModeType = 0}
          },
          ["174247822269543"] = {
            key = "174247822269543",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 969.4736842105262, y = 157.3684210526316},
            propsData = {ModeType = 0}
          },
          ["174247822269544"] = {
            key = "174247822269544",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1005.7894736842105, y = 371.57894736842104},
            propsData = {}
          },
          ["174247822269545"] = {
            key = "174247822269545",
            type = "TalkNode",
            name = "90050001",
            pos = {x = 347.56750572082376, y = 139.26315789473685},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90230001,
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
                  TalkActorId = 84102,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 84102}
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
