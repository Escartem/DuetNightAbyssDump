return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979566222444",
      startPort = "StoryStart",
      endStory = "1704175979566222446",
      endPort = "In"
    },
    {
      startStory = "1704175979566222446",
      startPort = "Success",
      endStory = "1704175979566222445",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175979566222444"] = {
      isStoryNode = true,
      key = "1704175979566222444",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979566222445"] = {
      isStoryNode = true,
      key = "1704175979566222445",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 937, y = 151},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979566222446"] = {
      isStoryNode = true,
      key = "1704175979566222446",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 457, y = 143},
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
            startQuest = "1704175979566222447",
            startPort = "QuestStart",
            endQuest = "1704175979566222454",
            endPort = "In"
          },
          {
            startQuest = "1704175979566222454",
            startPort = "Out",
            endQuest = "1704175979566222450",
            endPort = "In"
          },
          {
            startQuest = "quest_168959128208879",
            startPort = "Out",
            endQuest = "1704175979566222448",
            endPort = "Success"
          },
          {
            startQuest = "1704175979566222450",
            startPort = "Out",
            endQuest = "quest_168959128208879",
            endPort = "In"
          }
        },
        nodeData = {
          quest_168959128208879 = {
            key = "quest_168959128208879",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 143.97783649471467, y = 48.91885717561445},
            propsData = {
              NpcInfos = {
                {NpcId = 81101, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979566222447"] = {
            key = "1704175979566222447",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -921.3949579831933, y = 59.478991596638664},
            propsData = {ModeType = 0}
          },
          ["1704175979566222448"] = {
            key = "1704175979566222448",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 551.2061083153033, y = 49.64097816883253},
            propsData = {ModeType = 0}
          },
          ["1704175979566222449"] = {
            key = "1704175979566222449",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 553.0177386818546, y = 336.18428552026563},
            propsData = {}
          },
          ["1704175979566222450"] = {
            key = "1704175979566222450",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -274.922268907563, y = 37.46008403361345},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90030001,
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
                  TalkActorId = 81101,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 81101}
              },
              OptionType = "random",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              RandomOptionNum = 3,
              RandomOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175979566222454"] = {
            key = "1704175979566222454",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = -639.5798319327731, y = 54.924369747899156},
            propsData = {
              NpcInfos = {
                {NpcId = 81101, NpcPose = "Idle"}
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
