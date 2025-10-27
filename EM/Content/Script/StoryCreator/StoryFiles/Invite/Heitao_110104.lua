return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101532341679",
      startPort = "StoryStart",
      endStory = "1721630101532341681",
      endPort = "In"
    },
    {
      startStory = "1721630101532341681",
      startPort = "Success",
      endStory = "1721630101532341680",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101532341679"] = {
      isStoryNode = true,
      key = "1721630101532341679",
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
    ["1721630101532341680"] = {
      isStoryNode = true,
      key = "1721630101532341680",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630101532341681"] = {
      isStoryNode = true,
      key = "1721630101532341681",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1102.888888888889, y = 288.44444444444446},
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
            startQuest = "1721630101532341685",
            startPort = "Out",
            endQuest = "1721630101532341686",
            endPort = "In"
          },
          {
            startQuest = "1725258925952199294",
            startPort = "Out",
            endQuest = "1721630101532341683",
            endPort = "Success"
          },
          {
            startQuest = "1721630101532341682",
            startPort = "QuestStart",
            endQuest = "17528088279071924725",
            endPort = "In"
          },
          {
            startQuest = "17528088279071924725",
            startPort = "Out",
            endQuest = "17376227115086725409",
            endPort = "In"
          },
          {
            startQuest = "1721630101532341682",
            startPort = "QuestStart",
            endQuest = "17528088279071924726",
            endPort = "In"
          },
          {
            startQuest = "17528088279071924726",
            startPort = "Out",
            endQuest = "1721630101532341685",
            endPort = "In"
          },
          {
            startQuest = "17528088279071924726",
            startPort = "Out",
            endQuest = "1725258907075198913",
            endPort = "In"
          },
          {
            startQuest = "17528088279071924726",
            startPort = "Out",
            endQuest = "1727074252800552",
            endPort = "In"
          },
          {
            startQuest = "1721630101532341686",
            startPort = "Out",
            endQuest = "1725258925952199294",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630101532341682"] = {
            key = "1721630101532341682",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 227.24025974025977, y = 276.67099567099564},
            propsData = {ModeType = 0}
          },
          ["1721630101532341683"] = {
            key = "1721630101532341683",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1602.8452380952383, y = 297.3492063492064},
            propsData = {ModeType = 0}
          },
          ["1721630101532341684"] = {
            key = "1721630101532341684",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1609.1111111111113, y = 497.16666666666663},
            propsData = {}
          },
          ["1721630101532341685"] = {
            key = "1721630101532341685",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 798.4869719652329, y = 273.28845642848194},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80040401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_11010401",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790007,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790012,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790061,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790062,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790063,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790007},
                {TalkActorType = "Npc", TalkActorId = 790008},
                {TalkActorType = "Npc", TalkActorId = 790012},
                {TalkActorType = "Npc", TalkActorId = 790061},
                {TalkActorType = "Npc", TalkActorId = 790062},
                {TalkActorType = "Npc", TalkActorId = 790063}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1721630101532341686"] = {
            key = "1721630101532341686",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1044.8466206995622, y = 272.82747970983274},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80040409,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_11010402",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790064,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790060,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790064},
                {TalkActorType = "Npc", TalkActorId = 790060}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1725258907075198913"] = {
            key = "1725258907075198913",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 801.8686371100168, y = 444.87027914614146},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0026_maintheme_website",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725258925952199294"] = {
            key = "1725258925952199294",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1326.948002189382, y = 294.7115489874114},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["1727074252800552"] = {
            key = "1727074252800552",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 802.8888888888889, y = 604.0000000000001},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_110104",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17376227115086725409"] = {
            key = "17376227115086725409",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 786.181818181818, y = 76.27272727272737},
            propsData = {
              ModeType = 1,
              Id = 100101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17528088279071924725"] = {
            key = "17528088279071924725",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 515.4444444444445, y = 76.11111111111117},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528088279071924726"] = {
            key = "17528088279071924726",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 516.5555555555555, y = 323.8888888888889},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
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
