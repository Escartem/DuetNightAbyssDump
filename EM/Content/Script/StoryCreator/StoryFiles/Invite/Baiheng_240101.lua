return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750662000971505",
      startPort = "StoryStart",
      endStory = "1750662332927596",
      endPort = "In"
    },
    {
      startStory = "1750662332927596",
      startPort = "Success",
      endStory = "1750662000972508",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750662000971505"] = {
      isStoryNode = true,
      key = "1750662000971505",
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
    ["1750662000972508"] = {
      isStoryNode = true,
      key = "1750662000972508",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1608, y = 296},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750662332927596"] = {
      isStoryNode = true,
      key = "1750662332927596",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1206, y = 270},
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
            startQuest = "1750662332927605",
            startPort = "Out",
            endQuest = "17506632235242020",
            endPort = "In"
          },
          {
            startQuest = "17506632235242020",
            startPort = "Out",
            endQuest = "1750662332927602",
            endPort = "Success"
          },
          {
            startQuest = "1750662332927601",
            startPort = "QuestStart",
            endQuest = "17528088734912565972",
            endPort = "In"
          },
          {
            startQuest = "17528088734912565972",
            startPort = "Out",
            endQuest = "1750662332927604",
            endPort = "In"
          },
          {
            startQuest = "1750662332927601",
            startPort = "QuestStart",
            endQuest = "17528088734912565973",
            endPort = "In"
          },
          {
            startQuest = "17528088734912565973",
            startPort = "Out",
            endQuest = "1750662332927605",
            endPort = "In"
          }
        },
        nodeData = {
          ["1750662332927601"] = {
            key = "1750662332927601",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750662332927602"] = {
            key = "1750662332927602",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2014, y = 296},
            propsData = {ModeType = 0}
          },
          ["1750662332927603"] = {
            key = "1750662332927603",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2092, y = 528},
            propsData = {}
          },
          ["1750662332927604"] = {
            key = "1750662332927604",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1412, y = 46},
            propsData = {
              ModeType = 1,
              Id = 104106,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750662332927605"] = {
            key = "1750662332927605",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1404, y = 278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200101a",
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
          ["17506632235242020"] = {
            key = "17506632235242020",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1686, y = 278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200036,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200101b",
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
          ["17528088734912565972"] = {
            key = "17528088734912565972",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1097.4444444444443, y = 34.11111111111117},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528088734912565973"] = {
            key = "17528088734912565973",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1102.5555555555557, y = 281.8888888888889},
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
