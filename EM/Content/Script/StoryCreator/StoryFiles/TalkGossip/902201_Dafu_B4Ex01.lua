return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17339088024757360755",
      startPort = "StoryStart",
      endStory = "17339088024757360757",
      endPort = "In"
    },
    {
      startStory = "17339088024757360757",
      startPort = "Success",
      endStory = "17339088024757360756",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17339088024757360755"] = {
      isStoryNode = true,
      key = "17339088024757360755",
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
    ["17339088024757360756"] = {
      isStoryNode = true,
      key = "17339088024757360756",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1400.156739811912, y = 293.4639498432602},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17339088024757360757"] = {
      isStoryNode = true,
      key = "17339088024757360757",
      type = "StoryNode",
      name = "\232\190\190\232\138\153\230\182\133\231\156\139\230\157\191\229\168\1524\232\175\157\233\162\152",
      pos = {x = 1090.0689655172414, y = 284.62068965517244},
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
            startQuest = "17339088024757360759",
            startPort = "Out",
            endQuest = "17339088024757360767",
            endPort = "Success"
          },
          {
            startQuest = "17339088024757360766",
            startPort = "QuestStart",
            endQuest = "17339088024757360758",
            endPort = "In"
          },
          {
            startQuest = "17339088024757360758",
            startPort = "Out",
            endQuest = "17339088024757360760",
            endPort = "In"
          },
          {
            startQuest = "17339088024757360760",
            startPort = "Out",
            endQuest = "17339088024757360759",
            endPort = "In"
          }
        },
        nodeData = {
          ["17339088024757360758"] = {
            key = "17339088024757360758",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 163.17001858730487, y = 941.5792131953443},
            propsData = {
              NpcInfos = {
                {NpcId = 85401, NpcPose = "Idle"}
              }
            }
          },
          ["17339088024757360759"] = {
            key = "17339088024757360759",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 822.6860420187558, y = 941.7656379036587},
            propsData = {
              NpcInfos = {
                {NpcId = 85401, NpcPose = "Seating"}
              }
            }
          },
          ["17339088024757360760"] = {
            key = "17339088024757360760",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 475.80205835474237, y = 931.1965917811723},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90190001,
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
                  TalkActorId = 85401,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 85401}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17339088024757360766"] = {
            key = "17339088024757360766",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -108.54712798441847, y = 940.2337455587602},
            propsData = {ModeType = 0}
          },
          ["17339088024757360767"] = {
            key = "17339088024757360767",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1228.9855072463768, y = 968.0434782608695},
            propsData = {ModeType = 0}
          },
          ["17339088024757360768"] = {
            key = "17339088024757360768",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1678.3333333333333, y = 815},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
