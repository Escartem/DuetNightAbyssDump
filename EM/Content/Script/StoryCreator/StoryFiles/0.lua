return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16681501402220",
      startPort = "StoryStart",
      endStory = "story_16681501430924",
      endPort = "In"
    },
    {
      startStory = "story_16681501430924",
      startPort = "Success",
      endStory = "story_16681501402222",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_16681501402220 = {
      isStoryNode = true,
      key = "story_16681501402220",
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
    story_16681501402222 = {
      isStoryNode = true,
      key = "story_16681501402222",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 857, y = 111},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16681501430924 = {
      isStoryNode = true,
      key = "story_16681501430924",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 432, y = 98.75},
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
            startQuest = "17331227260821468832",
            startPort = "Out",
            endQuest = "17331227260821468833",
            endPort = "In"
          },
          {
            startQuest = "17331229400432094082",
            startPort = "Out",
            endQuest = "17331229155632093679",
            endPort = "In"
          },
          {
            startQuest = "17331227260821468833",
            startPort = "Out",
            endQuest = "17331229400432094082",
            endPort = "In"
          },
          {
            startQuest = "1733985130467674269",
            startPort = "Out",
            endQuest = "1733107879246839092",
            endPort = "In"
          },
          {
            startQuest = "quest_16681501430928",
            startPort = "QuestStart",
            endQuest = "17392606800328114783",
            endPort = "In"
          },
          {
            startQuest = "17392606800328114783",
            startPort = "Out",
            endQuest = "quest_166815014309210",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_16681501430928 = {
            key = "quest_16681501430928",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -163.20909090909095, y = 145.23636363636362},
            propsData = {ModeType = 0}
          },
          quest_166815014309210 = {
            key = "quest_166815014309210",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 960.0346947738253, y = 143.0680720245938},
            propsData = {ModeType = 0}
          },
          quest_166815014309212 = {
            key = "quest_166815014309212",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 988.2777777777778, y = 322.3888888888889},
            propsData = {}
          },
          ["17319968941011184"] = {
            key = "17319968941011184",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \233\128\131\232\183\145\229\147\136\229\176\148",
            pos = {x = 1263.5652173913045, y = -247.36645962732928},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180482,
                1180483,
                1180484,
                1180485,
                1180486,
                1180487,
                1180488
              }
            }
          },
          ["1733107879246839092"] = {
            key = "1733107879246839092",
            type = "BossBattleOpenNode",
            name = "BOSS\230\136\152\229\188\128\229\156\186\230\146\173\231\137\135",
            pos = {x = 550.4025974025974, y = 748.922077922078},
            propsData = {
              SequencePath = "LevelSequence'/Game/AssetDesign/Story/Sequence/Chapter01/IceLakeCity/Saiqi_Dream2.Saiqi_Dream2'",
              EnableFadeIn = false,
              EnableFadeOut = false,
              EnableSkip = false,
              PauseGameGlobal = false,
              HideNpcs = false,
              HideMonsters = true
            }
          },
          ["17331227260821468832"] = {
            key = "17331227260821468832",
            type = "TalkNode",
            name = "\229\147\136\229\176\148\229\152\178\232\174\189",
            pos = {x = 192.0955600631059, y = 1159.1282039461553},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10103100,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101031",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200053,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17331227260821468833"] = {
            key = "17331227260821468833",
            type = "TalkNode",
            name = "\229\147\136\229\176\148\229\152\178\232\174\189",
            pos = {x = 185.99534902780323, y = 1320.7808869629357},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10103101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101031",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200053}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17331229155632093679"] = {
            key = "17331229155632093679",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 732.8181818181818, y = 1189.0909090909092},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "MaerGo",
              UnitId = 200011
            }
          },
          ["17331229400432094082"] = {
            key = "17331229400432094082",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 502.3636363636365, y = 1198.6363636363637},
            propsData = {WaitTime = 2}
          },
          ["17331230429552718443"] = {
            key = "17331230429552718443",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 31.909090909090907, y = 1410.0000000000002},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720060}
            }
          },
          ["1733985130467674269"] = {
            key = "1733985130467674269",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 267.2727272727272, y = 726.6704545454546},
            propsData = {WaitTime = 3}
          },
          ["17339950869832020703"] = {
            key = "17339950869832020703",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -38.1818181818183, y = 699.3977272727274},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_IcelakeCity_FollowEnlike1",
              UnitId = -1
            }
          },
          ["17392606800328114783"] = {
            key = "17392606800328114783",
            type = "TalkNode",
            name = "\231\156\139\229\136\176\230\128\170\231\137\169\229\176\143\231\153\189\232\183\145\232\183\175",
            pos = {x = 316, y = 123.8131313131313},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10120301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_100203",
              BlendInTime = 2,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = false,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
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
