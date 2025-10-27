return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17177474275651658",
      startPort = "StoryStart",
      endStory = "17177474579142591",
      endPort = "In"
    },
    {
      startStory = "17177474579142591",
      startPort = "Success",
      endStory = "17177474275661661",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17177474275651658"] = {
      isStoryNode = true,
      key = "17177474275651658",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 358.74999999999994, y = 243.75},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17177474275661661"] = {
      isStoryNode = true,
      key = "17177474275661661",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 968.8888888888894, y = 257.61904761904765},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17177474579142591"] = {
      isStoryNode = true,
      key = "17177474579142591",
      type = "StoryNode",
      name = "\231\142\155\229\176\148\230\180\129\231\156\139\230\157\191\229\168\152",
      pos = {x = 672.1694000444004, y = 240.4789377289376},
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
            startQuest = "17177474579142597",
            startPort = "QuestStart",
            endQuest = "17177474579142595",
            endPort = "In"
          },
          {
            startQuest = "17177474579142595",
            startPort = "Out",
            endQuest = "17177474579152600",
            endPort = "In"
          },
          {
            startQuest = "17177474579142596",
            startPort = "Out",
            endQuest = "17177474579152598",
            endPort = "Success"
          },
          {
            startQuest = "17177474579152600",
            startPort = "Out",
            endQuest = "17177474579142596",
            endPort = "In"
          }
        },
        nodeData = {
          ["17177474579142595"] = {
            key = "17177474579142595",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 67.08048099364657, y = 130.6975057409552},
            propsData = {
              NpcInfos = {
                {NpcId = 83301, NpcPose = "Idle"}
              }
            }
          },
          ["17177474579142596"] = {
            key = "17177474579142596",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 694.33563485988, y = 124.96001740579118},
            propsData = {
              NpcInfos = {
                {NpcId = 83301, NpcPose = "Seating"}
              }
            }
          },
          ["17177474579142597"] = {
            key = "17177474579142597",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -187.38046131775178, y = 129.06707889209355},
            propsData = {ModeType = 0}
          },
          ["17177474579152598"] = {
            key = "17177474579152598",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1056, y = 128},
            propsData = {ModeType = 0}
          },
          ["17177474579152599"] = {
            key = "17177474579152599",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1048.5, y = 310},
            propsData = {}
          },
          ["17177474579152600"] = {
            key = "17177474579152600",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 368.19671048440426, y = 120.91271041373966},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90170001,
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
                  TalkActorId = 83301,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 83301}
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
