return {
  storyName = "\231\133\156\230\152\142\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1689130120266457",
      startPort = "StoryStart",
      endStory = "story_1689130143775461",
      endPort = "In"
    },
    {
      startStory = "story_1689130143775461",
      startPort = "Success",
      endStory = "story_1689130120266459",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1689130120266457 = {
      isStoryNode = true,
      key = "story_1689130120266457",
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
    story_1689130120266459 = {
      isStoryNode = true,
      key = "story_1689130120266459",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 770.388006196249, y = 140.00000000000003},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689130143775461 = {
      isStoryNode = true,
      key = "story_1689130143775461",
      type = "StoryNode",
      name = "\231\133\156\230\152\142\231\156\139\230\157\191\229\168\152",
      pos = {x = 424.344539721476, y = 134.53465987245215},
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
            startQuest = "1704175979590223762",
            startPort = "QuestStart",
            endQuest = "quest_16917513602471232",
            endPort = "In"
          },
          {
            startQuest = "quest_16917513602471232",
            startPort = "Out",
            endQuest = "1704175979590223765",
            endPort = "In"
          },
          {
            startQuest = "quest_16917537264362037",
            startPort = "Out",
            endQuest = "1704175979590223763",
            endPort = "Success"
          },
          {
            startQuest = "1704175979590223765",
            startPort = "Out",
            endQuest = "quest_16917537264362037",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16917513602471232 = {
            key = "quest_16917513602471232",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 47.99787583601349, y = 149.7922438734325},
            propsData = {
              NpcInfos = {
                {NpcId = 84201, NpcPose = "Idle"}
              }
            }
          },
          quest_16917537264362037 = {
            key = "quest_16917537264362037",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 736.3276598811002, y = 138.28187463575168},
            propsData = {
              NpcInfos = {
                {NpcId = 84201, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979590223762"] = {
            key = "1704175979590223762",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -263.3854351476871, y = 121.48974995226263},
            propsData = {ModeType = 0}
          },
          ["1704175979590223763"] = {
            key = "1704175979590223763",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1094.2105263157896, y = 136.8421052631579},
            propsData = {ModeType = 0}
          },
          ["1704175979590223764"] = {
            key = "1704175979590223764",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1098.9473684210525, y = 354.2105263157895},
            propsData = {}
          },
          ["1704175979590223765"] = {
            key = "1704175979590223765",
            type = "TalkNode",
            name = "90070001",
            pos = {x = 393.1578947368421, y = 122},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90070001,
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
                  TalkActorId = 84201,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 84201}
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
