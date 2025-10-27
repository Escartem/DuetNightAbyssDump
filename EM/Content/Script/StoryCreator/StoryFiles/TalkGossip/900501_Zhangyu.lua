return {
  storyName = "\231\171\160\233\177\188\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1689129624587127",
      startPort = "StoryStart",
      endStory = "story_1689129631050131",
      endPort = "In"
    },
    {
      startStory = "story_1689129631050131",
      startPort = "Success",
      endStory = "story_1689129624587129",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1689129624587127 = {
      isStoryNode = true,
      key = "story_1689129624587127",
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
    story_1689129624587129 = {
      isStoryNode = true,
      key = "story_1689129624587129",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 822.2088582679835, y = 166.0622752017274},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689129631050131 = {
      isStoryNode = true,
      key = "story_1689129631050131",
      type = "StoryNode",
      name = "\231\171\160\233\177\188\231\156\139\230\157\191\229\168\152",
      pos = {x = 400.2410070962615, y = 141.00621859313978},
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
            startQuest = "1704175979578223125",
            startPort = "QuestStart",
            endQuest = "quest_16917509034691080",
            endPort = "In"
          },
          {
            startQuest = "quest_16917509034691080",
            startPort = "Out",
            endQuest = "1704175979578223128",
            endPort = "In"
          },
          {
            startQuest = "quest_16917536493781866",
            startPort = "Out",
            endQuest = "1704175979578223126",
            endPort = "Success"
          },
          {
            startQuest = "1704175979578223128",
            startPort = "Out",
            endQuest = "quest_16917536493781866",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16917509034691080 = {
            key = "quest_16917509034691080",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 105, y = 155.94128009520045},
            propsData = {
              NpcInfos = {
                {NpcId = 82301, NpcPose = "Idle"}
              }
            }
          },
          quest_16917536493781866 = {
            key = "quest_16917536493781866",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 789.9421618738612, y = 154.41847821769744},
            propsData = {
              NpcInfos = {
                {NpcId = 82301, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979578223125"] = {
            key = "1704175979578223125",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -192.39714013509177, y = 153.44718737417537},
            propsData = {ModeType = 0}
          },
          ["1704175979578223126"] = {
            key = "1704175979578223126",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1162.8571428571427, y = 154.28571428571428},
            propsData = {ModeType = 0}
          },
          ["1704175979578223127"] = {
            key = "1704175979578223127",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1166.4285714285713, y = 346.90476190476187},
            propsData = {}
          },
          ["1704175979578223128"] = {
            key = "1704175979578223128",
            type = "TalkNode",
            name = "90050001",
            pos = {x = 418, y = 134.85714285714286},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90050001,
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
                  TalkActorId = 82301,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 82301}
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
