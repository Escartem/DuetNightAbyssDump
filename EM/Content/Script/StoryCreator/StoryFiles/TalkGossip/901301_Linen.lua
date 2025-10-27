return {
  storyName = "\231\144\179\230\129\169\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1689144450784743",
      startPort = "StoryStart",
      endStory = "story_1689144451613747",
      endPort = "In"
    },
    {
      startStory = "story_1689144451613747",
      startPort = "Success",
      endStory = "story_1689144450784745",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1689144450784743 = {
      isStoryNode = true,
      key = "story_1689144450784743",
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
    story_1689144450784745 = {
      isStoryNode = true,
      key = "story_1689144450784745",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 747.410115073039, y = 142.03759598283307},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689144451613747 = {
      isStoryNode = true,
      key = "story_1689144451613747",
      type = "StoryNode",
      name = "\231\144\179\230\129\169\231\156\139\230\157\191\229\168\152",
      pos = {x = 416.42082861958863, y = 119.40455158891598},
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
            startQuest = "1704175979628225722",
            startPort = "QuestStart",
            endQuest = "quest_16917515547691597",
            endPort = "In"
          },
          {
            startQuest = "quest_16917515547691597",
            startPort = "Out",
            endQuest = "1704175979628225725",
            endPort = "In"
          },
          {
            startQuest = "quest_16917539926112562",
            startPort = "Out",
            endQuest = "1704175979628225723",
            endPort = "Success"
          },
          {
            startQuest = "1704175979628225725",
            startPort = "Out",
            endQuest = "quest_16917539926112562",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16917515547691597 = {
            key = "quest_16917515547691597",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 67.08048099364657, y = 130.6975057409552},
            propsData = {
              NpcInfos = {
                {NpcId = 83101, NpcPose = "Idle"}
              }
            }
          },
          quest_16917539926112562 = {
            key = "quest_16917539926112562",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 657.33563485988, y = 122.96001740579118},
            propsData = {
              NpcInfos = {
                {NpcId = 83101, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979628225722"] = {
            key = "1704175979628225722",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -206.88046131775178, y = 118.56707889209353},
            propsData = {ModeType = 0}
          },
          ["1704175979628225723"] = {
            key = "1704175979628225723",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 936, y = 128},
            propsData = {ModeType = 0}
          },
          ["1704175979628225724"] = {
            key = "1704175979628225724",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 926, y = 306},
            propsData = {}
          },
          ["1704175979628225725"] = {
            key = "1704175979628225725",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 357.06034684804064, y = 116.91271041373966},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90130001,
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
                  TalkActorId = 83101,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 83101}
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
