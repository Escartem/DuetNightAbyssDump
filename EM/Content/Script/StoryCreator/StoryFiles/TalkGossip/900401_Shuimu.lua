return {
  storyName = "\230\176\180\230\175\141\231\156\139\230\157\191\229\168\152\229\175\185\232\175\157",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16891288629734",
      startPort = "Success",
      endStory = "story_16891288578042",
      endPort = "StoryEnd"
    },
    {
      startStory = "story_16891288578030",
      startPort = "StoryStart",
      endStory = "story_16891288629734",
      endPort = "In"
    }
  },
  storyNodeData = {
    story_16891288578030 = {
      isStoryNode = true,
      key = "story_16891288578030",
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
    story_16891288578042 = {
      isStoryNode = true,
      key = "story_16891288578042",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 638, y = 139},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16891288629734 = {
      isStoryNode = true,
      key = "story_16891288629734",
      type = "StoryNode",
      name = "\230\176\180\230\175\141\231\156\139\230\157\191\229\168\152\229\175\185\232\175\157",
      pos = {x = 377, y = 139},
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
            startQuest = "quest_16891288629748",
            startPort = "QuestStart",
            endQuest = "quest_16917508755141031",
            endPort = "In"
          },
          {
            startQuest = "quest_16917508755141031",
            startPort = "Out",
            endQuest = "quest_168912892445116",
            endPort = "In"
          },
          {
            startQuest = "quest_16917531790561744",
            startPort = "Out",
            endQuest = "quest_168912886297410",
            endPort = "Success"
          },
          {
            startQuest = "quest_168912892445116",
            startPort = "Out",
            endQuest = "quest_16917531790561744",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16891288629748 = {
            key = "quest_16891288629748",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -20.275416869797606, y = 142.64345719755653},
            propsData = {ModeType = 0}
          },
          quest_168912886297410 = {
            key = "quest_168912886297410",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1124.1061359288021, y = -13.842362975458542},
            propsData = {ModeType = 0}
          },
          quest_168912886297412 = {
            key = "quest_168912886297412",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1126.766070026267, y = 186.29676863866365},
            propsData = {}
          },
          quest_168912892445116 = {
            key = "quest_168912892445116",
            type = "TalkNode",
            name = "90040001",
            pos = {x = 496.7274809318685, y = 126.1269993815606},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90040001,
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
                  TalkActorId = 82101,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 82101}
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
          quest_16917508755141031 = {
            key = "quest_16917508755141031",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 228.84540401981587, y = 126.77854238624997},
            propsData = {
              NpcInfos = {
                {NpcId = 82101, NpcPose = "Idle"}
              }
            }
          },
          quest_16917531790561744 = {
            key = "quest_16917531790561744",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 800.1376152959313, y = 139.10270923725113},
            propsData = {
              NpcInfos = {
                {NpcId = 82101, NpcPose = "Seating"}
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
