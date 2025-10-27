return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1700739302874210836",
      startPort = "StoryStart",
      endStory = "1700739307671211883",
      endPort = "In"
    },
    {
      startStory = "1700739307671211883",
      startPort = "Success",
      endStory = "1700739302874210839",
      endPort = "StoryEnd"
    },
    {
      startStory = "1700739307671211883",
      startPort = "Fail",
      endStory = "1700739302874210839",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1700739302874210836"] = {
      isStoryNode = true,
      key = "1700739302874210836",
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
    ["1700739302874210839"] = {
      isStoryNode = true,
      key = "1700739302874210839",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1327.1794871794891, y = 298.0769230769231},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1700739307671211883"] = {
      isStoryNode = true,
      key = "1700739307671211883",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1075.0583659659508, y = 303.2269201714024},
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
        bIsNotifyGameMode = true,
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
            startQuest = "1700739307671211884",
            startPort = "QuestStart",
            endQuest = "1700739319090214464",
            endPort = "In"
          },
          {
            startQuest = "1700739319090214464",
            startPort = "Out",
            endQuest = "1700739307671211886",
            endPort = "Success"
          },
          {
            startQuest = "1700739319090214464",
            startPort = "Fail",
            endQuest = "1700739307671211888",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1700739307671211884"] = {
            key = "1700739307671211884",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 806.5882352941177, y = 363.94117647058823},
            propsData = {ModeType = 0}
          },
          ["1700739307671211886"] = {
            key = "1700739307671211886",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1418.5238095238108, y = 282.8571428571428},
            propsData = {ModeType = 0}
          },
          ["1700739307671211888"] = {
            key = "1700739307671211888",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1428.7619047619057, y = 488.3809523809527},
            propsData = {}
          },
          ["1700739319090214464"] = {
            key = "1700739319090214464",
            type = "TalkNode",
            name = "check",
            pos = {x = 1102.7735042993077, y = 349.5359882543719},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51001901,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
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
                  TalkActorType = "Npc",
                  TalkActorId = 200015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700047,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 200015},
                {TalkActorType = "Npc", TalkActorId = 700047},
                {TalkActorType = "Npc", TalkActorId = 200003}
              },
              OptionType = "check",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              CheckOptions = {},
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
