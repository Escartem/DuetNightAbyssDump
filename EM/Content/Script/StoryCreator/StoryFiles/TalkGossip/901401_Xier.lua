return {
  storyName = "\231\144\179\230\129\169\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991239473245273",
      startPort = "StoryStart",
      endStory = "17141991239473245275",
      endPort = "In"
    },
    {
      startStory = "17141991239473245275",
      startPort = "Success",
      endStory = "17141991239473245274",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991239473245273"] = {
      isStoryNode = true,
      key = "17141991239473245273",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 204.44444444444446, y = 121.11111111111111},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991239473245274"] = {
      isStoryNode = true,
      key = "17141991239473245274",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 712.7434484063724, y = 123.14870709394418},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991239473245275"] = {
      isStoryNode = true,
      key = "17141991239473245275",
      type = "StoryNode",
      name = "\229\184\140\229\176\148\229\166\178\231\156\139\230\157\191\229\168\152",
      pos = {x = 459.42082861958863, y = 108.29344047780486},
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
            startQuest = "17141991239473245278",
            startPort = "QuestStart",
            endQuest = "17141991239473245276",
            endPort = "In"
          },
          {
            startQuest = "17141991239473245276",
            startPort = "Out",
            endQuest = "17141991239473245281",
            endPort = "In"
          },
          {
            startQuest = "17141991239473245277",
            startPort = "Out",
            endQuest = "17141991239473245279",
            endPort = "Success"
          },
          {
            startQuest = "17141991239473245281",
            startPort = "Out",
            endQuest = "17141991239473245277",
            endPort = "In"
          }
        },
        nodeData = {
          ["17141991239473245276"] = {
            key = "17141991239473245276",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 67.08048099364657, y = 130.6975057409552},
            propsData = {
              NpcInfos = {
                {NpcId = 83102, NpcPose = "Idle"}
              }
            }
          },
          ["17141991239473245277"] = {
            key = "17141991239473245277",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 727.33563485988, y = 123.46001740579118},
            propsData = {
              NpcInfos = {
                {NpcId = 83102, NpcPose = "Seating"}
              }
            }
          },
          ["17141991239473245278"] = {
            key = "17141991239473245278",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -187.38046131775178, y = 129.06707889209355},
            propsData = {ModeType = 0}
          },
          ["17141991239473245279"] = {
            key = "17141991239473245279",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1065, y = 120.5},
            propsData = {ModeType = 0}
          },
          ["17141991239473245280"] = {
            key = "17141991239473245280",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1065, y = 325},
            propsData = {}
          },
          ["17141991239473245281"] = {
            key = "17141991239473245281",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 378.56034684804064, y = 104.41271041373966},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90140001,
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
                  TalkActorId = 83102,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 83102}
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
