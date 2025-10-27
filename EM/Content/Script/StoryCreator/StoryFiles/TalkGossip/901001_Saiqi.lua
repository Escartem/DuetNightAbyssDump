return {
  storyName = "\232\181\155\231\144\170\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1689144049481593",
      startPort = "StoryStart",
      endStory = "story_1689144051141597",
      endPort = "In"
    },
    {
      startStory = "story_1689144051141597",
      startPort = "Success",
      endStory = "story_1689144049481595",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1689144049481593 = {
      isStoryNode = true,
      key = "story_1689144049481593",
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
    story_1689144049481595 = {
      isStoryNode = true,
      key = "story_1689144049481595",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 663.1830202564457, y = 143.1207472757681},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689144051141597 = {
      isStoryNode = true,
      key = "story_1689144051141597",
      type = "StoryNode",
      name = "\232\181\155\231\144\170\231\156\139\230\157\191\229\168\152",
      pos = {x = 371.30360078590684, y = 137.90704722001914},
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
            startQuest = "quest_16917514504061391",
            startPort = "Out",
            endQuest = "1704175979609224745",
            endPort = "In"
          },
          {
            startQuest = "1704175979609224742",
            startPort = "QuestStart",
            endQuest = "quest_16917514504061391",
            endPort = "In"
          },
          {
            startQuest = "quest_16917538168042270",
            startPort = "Out",
            endQuest = "1704175979609224743",
            endPort = "Success"
          },
          {
            startQuest = "1704175979609224745",
            startPort = "Out",
            endQuest = "quest_16917538168042270",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16917514504061391 = {
            key = "quest_16917514504061391",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 77.22458643770415, y = 151.74069124687844},
            propsData = {
              NpcInfos = {
                {NpcId = 85301, NpcPose = "Idle"}
              }
            }
          },
          quest_16917538168042270 = {
            key = "quest_16917538168042270",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 686.7739671270251, y = 147.3282904014551},
            propsData = {
              NpcInfos = {
                {NpcId = 85301, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979609224742"] = {
            key = "1704175979609224742",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -265.3338825211331, y = 131.2319868194928},
            propsData = {ModeType = 0}
          },
          ["1704175979609224743"] = {
            key = "1704175979609224743",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1006.5, y = 144.5},
            propsData = {ModeType = 0}
          },
          ["1704175979609224744"] = {
            key = "1704175979609224744",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1020, y = 296.5},
            propsData = {}
          },
          ["1704175979609224745"] = {
            key = "1704175979609224745",
            type = "TalkNode",
            name = "90100001",
            pos = {x = 365.44923573692955, y = 138.25},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90100001,
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
                  TalkActorId = 85301,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 85301}
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
