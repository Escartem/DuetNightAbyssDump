return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750664597956654599",
      startPort = "StoryStart",
      endStory = "1750664601462654638",
      endPort = "In"
    },
    {
      startStory = "1750664601462654638",
      startPort = "Success",
      endStory = "1750664597956654602",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750664597956654599"] = {
      isStoryNode = true,
      key = "1750664597956654599",
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
    ["1750664597956654602"] = {
      isStoryNode = true,
      key = "1750664597956654602",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1600, y = 294},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750664601462654638"] = {
      isStoryNode = true,
      key = "1750664601462654638",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1204, y = 270},
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
            startQuest = "1750664601462654647",
            startPort = "Out",
            endQuest = "1750664601462654648",
            endPort = "In"
          },
          {
            startQuest = "1750664601462654648",
            startPort = "Out",
            endQuest = "1750664601462654644",
            endPort = "Success"
          },
          {
            startQuest = "1750664601462654643",
            startPort = "QuestStart",
            endQuest = "17528089675314814672",
            endPort = "In"
          },
          {
            startQuest = "17528089675314814672",
            startPort = "Out",
            endQuest = "1750664601462654646",
            endPort = "In"
          },
          {
            startQuest = "1750664601462654643",
            startPort = "QuestStart",
            endQuest = "17528089675314814673",
            endPort = "In"
          },
          {
            startQuest = "17528089675314814673",
            startPort = "Out",
            endQuest = "1750664601462654647",
            endPort = "In"
          }
        },
        nodeData = {
          ["1750664601462654643"] = {
            key = "1750664601462654643",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750664601462654644"] = {
            key = "1750664601462654644",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2014, y = 296},
            propsData = {ModeType = 0}
          },
          ["1750664601462654645"] = {
            key = "1750664601462654645",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2092, y = 528},
            propsData = {}
          },
          ["1750664601462654646"] = {
            key = "1750664601462654646",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1408, y = 94},
            propsData = {
              ModeType = 1,
              Id = 104106,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750664601462654647"] = {
            key = "1750664601462654647",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1404, y = 278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200301a",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
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
                  TalkActorId = 790053,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790053},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750664601462654648"] = {
            key = "1750664601462654648",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1686, y = 278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200216,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200301b",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
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
                  TalkActorId = 790054,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790054},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17528089675314814672"] = {
            key = "17528089675314814672",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1121.4444444444443, y = 70.11111111111111},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528089675314814673"] = {
            key = "17528089675314814673",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1124.5555555555557, y = 277.88888888888886},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104106,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
