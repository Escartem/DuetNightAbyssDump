return {
  storyName = "\231\153\189\232\152\133\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1689144189040643",
      startPort = "StoryStart",
      endStory = "story_1689144190433647",
      endPort = "In"
    },
    {
      startStory = "story_1689144190433647",
      startPort = "Success",
      endStory = "story_1689144189041645",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1689144189040643 = {
      isStoryNode = true,
      key = "story_1689144189040643",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -65.61802674291363, y = 157.5360263610144},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689144189041645 = {
      isStoryNode = true,
      key = "story_1689144189041645",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 646.3003963049522, y = 148.38469434229623},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689144190433647 = {
      isStoryNode = true,
      key = "story_1689144190433647",
      type = "StoryNode",
      name = "\231\153\189\232\152\133\231\156\139\230\157\191\229\168\152",
      pos = {x = 383.018657889994, y = 130.82949248164923},
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
            startQuest = "quest_16917514707791440",
            startPort = "Out",
            endQuest = "1704175979616225039",
            endPort = "In"
          },
          {
            startQuest = "quest_16917538566122328",
            startPort = "Out",
            endQuest = "1704175979616225037",
            endPort = "Success"
          },
          {
            startQuest = "1704175979616225036",
            startPort = "QuestStart",
            endQuest = "quest_16917514707791440",
            endPort = "In"
          },
          {
            startQuest = "1704175979616225039",
            startPort = "Out",
            endQuest = "quest_16917538566122328",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16917514707791440 = {
            key = "quest_16917514707791440",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 44.100981089121404, y = 147.84379649998644},
            propsData = {
              NpcInfos = {
                {NpcId = 82401, NpcPose = "Idle"}
              }
            }
          },
          quest_16917538566122328 = {
            key = "quest_16917538566122328",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 706.6969464717592, y = 151.44693076514966},
            propsData = {
              NpcInfos = {
                {NpcId = 82401, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979616225036"] = {
            key = "1704175979616225036",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -264.3596588344101, y = 127.33509207260077},
            propsData = {ModeType = 0}
          },
          ["1704175979616225037"] = {
            key = "1704175979616225037",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1032, y = 153.5},
            propsData = {ModeType = 0}
          },
          ["1704175979616225038"] = {
            key = "1704175979616225038",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1045.5, y = 346},
            propsData = {}
          },
          ["1704175979616225039"] = {
            key = "1704175979616225039",
            type = "TalkNode",
            name = "90110001",
            pos = {x = 360.56034684804064, y = 140},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90110001,
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
                  TalkActorId = 82401,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 82401}
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
