return {
  storyName = "\229\133\176\232\191\170\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1689130252306584",
      startPort = "StoryStart",
      endStory = "story_1689130261341588",
      endPort = "In"
    },
    {
      startStory = "story_1689130261341588",
      startPort = "Success",
      endStory = "story_1689130252307586",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1689130252306584 = {
      isStoryNode = true,
      key = "story_1689130252306584",
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
    story_1689130252307586 = {
      isStoryNode = true,
      key = "story_1689130252307586",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 662.1722333015617, y = 145.57813262343748},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1689130261341588 = {
      isStoryNode = true,
      key = "story_1689130261341588",
      type = "StoryNode",
      name = "\229\133\176\232\191\170\231\156\139\230\157\191\229\168\152",
      pos = {x = 379.719478733976, y = 136.68822510867167},
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
            startQuest = "quest_16917513785511281",
            startPort = "Out",
            endQuest = "1704175979597224058",
            endPort = "In"
          },
          {
            startQuest = "1704175979597224055",
            startPort = "QuestStart",
            endQuest = "quest_16917513785511281",
            endPort = "In"
          },
          {
            startQuest = "quest_16917537599052145",
            startPort = "Out",
            endQuest = "1704175979597224056",
            endPort = "Success"
          },
          {
            startQuest = "1704175979597224058",
            startPort = "Out",
            endQuest = "quest_16917537599052145",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16917513785511281 = {
            key = "quest_16917513785511281",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 99.63173123233365, y = 152.71491493360156},
            propsData = {
              NpcInfos = {
                {NpcId = 84202, NpcPose = "Idle"}
              }
            }
          },
          quest_16917537599052145 = {
            key = "quest_16917537599052145",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 700.3480414324102, y = 160.82425616696176},
            propsData = {
              NpcInfos = {
                {NpcId = 84202, NpcPose = "Seating"}
              }
            }
          },
          ["1704175979597224055"] = {
            key = "1704175979597224055",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -191.29288233018343, y = 146.8195658070611},
            propsData = {ModeType = 0}
          },
          ["1704175979597224056"] = {
            key = "1704175979597224056",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1004.2105263157895, y = 152.6315789473684},
            propsData = {ModeType = 0}
          },
          ["1704175979597224057"] = {
            key = "1704175979597224057",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1038.9473684210525, y = 347.89473684210526},
            propsData = {}
          },
          ["1704175979597224058"] = {
            key = "1704175979597224058",
            type = "TalkNode",
            name = "90080001",
            pos = {x = 382.56858400162827, y = 139.3684210526316},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90080001,
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
                  TalkActorId = 84202,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 84202}
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
