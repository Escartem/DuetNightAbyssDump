return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17443516083084914223",
      startPort = "StoryStart",
      endStory = "17443516083084914225",
      endPort = "In"
    },
    {
      startStory = "17443516083084914225",
      startPort = "Success",
      endStory = "17443516083084914224",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17443516083084914223"] = {
      isStoryNode = true,
      key = "17443516083084914223",
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
    ["17443516083084914224"] = {
      isStoryNode = true,
      key = "17443516083084914224",
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
    ["17443516083084914225"] = {
      isStoryNode = true,
      key = "17443516083084914225",
      type = "StoryNode",
      name = "\229\136\187\232\136\159\231\156\139\230\157\191\229\168\152",
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
            startQuest = "17443516083084914228",
            startPort = "QuestStart",
            endQuest = "17443516083084914226",
            endPort = "In"
          },
          {
            startQuest = "17443516083084914226",
            startPort = "Out",
            endQuest = "17443516083084914231",
            endPort = "In"
          },
          {
            startQuest = "17443516083084914227",
            startPort = "Out",
            endQuest = "17443516083084914229",
            endPort = "Success"
          },
          {
            startQuest = "17443516083084914231",
            startPort = "Out",
            endQuest = "17443516083084914227",
            endPort = "In"
          }
        },
        nodeData = {
          ["17443516083084914226"] = {
            key = "17443516083084914226",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 85, y = 156.94128009520045},
            propsData = {
              NpcInfos = {
                {NpcId = 81503, NpcPose = "Idle"}
              }
            }
          },
          ["17443516083084914227"] = {
            key = "17443516083084914227",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 600.7993047310042, y = 151.0613353605546},
            propsData = {
              NpcInfos = {
                {NpcId = 81503, NpcPose = "Seating"}
              }
            }
          },
          ["17443516083084914228"] = {
            key = "17443516083084914228",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -171.7304734684251, y = 156.44718737417537},
            propsData = {ModeType = 0}
          },
          ["17443516083084914229"] = {
            key = "17443516083084914229",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 924, y = 156.5},
            propsData = {ModeType = 0}
          },
          ["17443516083084914230"] = {
            key = "17443516083084914230",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1080, y = 392.5},
            propsData = {}
          },
          ["17443516083084914231"] = {
            key = "17443516083084914231",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 321.915458937198, y = 144},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90240001,
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
                  TalkActorId = 81503,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 81503}
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
