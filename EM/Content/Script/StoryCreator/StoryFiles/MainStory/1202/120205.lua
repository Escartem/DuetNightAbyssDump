return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742891256148719190",
      startPort = "Success",
      endStory = "1742891256148719191",
      endPort = "In"
    },
    {
      startStory = "1742891256148719191",
      startPort = "Success",
      endStory = "1742891256148719192",
      endPort = "In"
    },
    {
      startStory = "1742891256148719193",
      startPort = "Success",
      endStory = "1742891256148719194",
      endPort = "In"
    },
    {
      startStory = "1742891256148719194",
      startPort = "Success",
      endStory = "1742891256148719195",
      endPort = "In"
    },
    {
      startStory = "1742891256148719195",
      startPort = "Success",
      endStory = "1742891256148719196",
      endPort = "In"
    },
    {
      startStory = "1742891256148719196",
      startPort = "Success",
      endStory = "1742891256148719197",
      endPort = "In"
    },
    {
      startStory = "1742891256148719197",
      startPort = "Success",
      endStory = "1742891256148719198",
      endPort = "In"
    },
    {
      startStory = "1742891256148719198",
      startPort = "Success",
      endStory = "1742891256148719199",
      endPort = "In"
    },
    {
      startStory = "1742891256148719199",
      startPort = "Success",
      endStory = "1742891256148719200",
      endPort = "In"
    },
    {
      startStory = "1742891256148719200",
      startPort = "Success",
      endStory = "1742891256148719201",
      endPort = "In"
    },
    {
      startStory = "1742891256148719202",
      startPort = "Success",
      endStory = "1742891256148719203",
      endPort = "In"
    },
    {
      startStory = "1742891256148719203",
      startPort = "Success",
      endStory = "1742891256148719204",
      endPort = "In"
    },
    {
      startStory = "1742891256148719204",
      startPort = "Success",
      endStory = "1742891256148719205",
      endPort = "In"
    },
    {
      startStory = "1742891256148719192",
      startPort = "Success",
      endStory = "1742891256148719202",
      endPort = "In"
    },
    {
      startStory = "1742891256148719188",
      startPort = "StoryStart",
      endStory = "1742891256148719206",
      endPort = "In"
    },
    {
      startStory = "1742891256148719206",
      startPort = "Success",
      endStory = "1742891256148719189",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1742891256148719188"] = {
      isStoryNode = true,
      key = "1742891256148719188",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1864.3234471621568, y = 792.6380716058135},
      propsData = {QuestChainId = 120205},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256148719189"] = {
      isStoryNode = true,
      key = "1742891256148719189",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2461.942747636015, y = 789.8702688116479},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256148719190"] = {
      isStoryNode = true,
      key = "1742891256148719190",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\232\153\172\229\133\136\231\148\159\229\138\158\229\133\172\229\174\164",
      pos = {x = 2127.3438195791136, y = 615.5103785103786},
      propsData = {
        QuestId = 12020501,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_1",
        QuestDeatil = "Content_120205_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "1742891256148719207",
            startPort = "QuestStart",
            endQuest = "1742891256148719210",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719210",
            startPort = "Out",
            endQuest = "1742891256148719211",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719211",
            startPort = "Out",
            endQuest = "1742891256148719208",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719207"] = {
            key = "1742891256148719207",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256148719208"] = {
            key = "1742891256148719208",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2837.0257008798526, y = 419.4957463853951},
            propsData = {ModeType = 0}
          },
          ["1742891256148719209"] = {
            key = "1742891256148719209",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719210"] = {
            key = "1742891256148719210",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\232\153\172\229\133\136\231\148\159\229\138\158\229\133\172\229\174\164",
            pos = {x = 2245.3712392922844, y = 442.6881745519737},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930139,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020305"
            }
          },
          ["1742891256148719211"] = {
            key = "1742891256148719211",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2525.580064964277, y = 429.7164900387913},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12028401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_30",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 100001}
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
    },
    ["1742891256148719191"] = {
      isStoryNode = true,
      key = "1742891256148719191",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\143\164\230\136\152\229\156\186",
      pos = {x = 2396.441516420822, y = 612.6668865516408},
      propsData = {
        QuestId = 12020502,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_2",
        QuestDeatil = "Content_120205_2",
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
            startQuest = "1742891256148719218",
            startPort = "Out",
            endQuest = "1742891256148719213",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719212",
            startPort = "QuestStart",
            endQuest = "1742891256148719217",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719215",
            startPort = "Out",
            endQuest = "1742891256148719216",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719217",
            startPort = "Out",
            endQuest = "1742891256148719218",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719212",
            startPort = "QuestStart",
            endQuest = "1742891256148719215",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719212"] = {
            key = "1742891256148719212",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256148719213"] = {
            key = "1742891256148719213",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3090.474467483268, y = 420.4797528912232},
            propsData = {ModeType = 0}
          },
          ["1742891256148719214"] = {
            key = "1742891256148719214",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719215"] = {
            key = "1742891256148719215",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2510.510601695097, y = 288.92698068666334},
            propsData = {WaitTime = 3}
          },
          ["1742891256148719216"] = {
            key = "1742891256148719216",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\153\172\229\133\136\231\148\159\228\187\139\231\187\141",
            pos = {x = 2760.5438085262167, y = 279.15942850450017},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12028501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719217"] = {
            key = "1742891256148719217",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\143\164\230\136\152\229\156\186",
            pos = {x = 2219.5191405945284, y = 442.1954816354298},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930143,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020502"
            }
          },
          ["1742891256148719218"] = {
            key = "1742891256148719218",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\229\188\159\229\175\185\232\175\157",
            pos = {x = 2710.249690879158, y = 429.84254045895926},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12028601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_31",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorId = 210010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210010},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 100001}
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
    },
    ["1742891256148719192"] = {
      isStoryNode = true,
      key = "1742891256148719192",
      type = "StoryNode",
      name = "\230\183\177\229\133\165\229\143\164\230\136\152\229\156\186",
      pos = {x = 2655.2153480557263, y = 608.6378621378619},
      propsData = {
        QuestId = 12020503,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_3",
        QuestDeatil = "Content_120205_3",
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
            startQuest = "1742891256148719219",
            startPort = "QuestStart",
            endQuest = "1742891256148719222",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719222",
            startPort = "Out",
            endQuest = "1742891256148719223",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719223",
            startPort = "Out",
            endQuest = "1742891256148719220",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719219"] = {
            key = "1742891256148719219",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256148719220"] = {
            key = "1742891256148719220",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2765.831610340411, y = 435.4797528912232},
            propsData = {
              ModeType = 1,
              Id = 104201,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1742891256148719221"] = {
            key = "1742891256148719221",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719222"] = {
            key = "1742891256148719222",
            type = "GoToNode",
            name = "\230\183\177\229\133\165\229\143\164\230\136\152\229\156\186",
            pos = {x = 2213.2400708270866, y = 442.8931560540345},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930147,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020503"
            }
          },
          ["1742891256148719223"] = {
            key = "1742891256148719223",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\230\156\186\229\133\179",
            pos = {x = 2490.4102990033225, y = 430.98353971609777},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12028701,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 1,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719193"] = {
      isStoryNode = true,
      key = "1742891256148719193",
      type = "StoryNode",
      name = "\230\137\190\232\153\172\229\133\136\231\148\159\228\186\164\232\176\136",
      pos = {x = 2642.553156146179, y = 273.48353971609794},
      propsData = {
        QuestId = 12020504,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_4",
        QuestDeatil = "Content_120205_4",
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
            startQuest = "1742891256148719224",
            startPort = "QuestStart",
            endQuest = "1742891256148719227",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719224",
            startPort = "QuestStart",
            endQuest = "1742891256148719229",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719229",
            startPort = "Out",
            endQuest = "1742891256148719230",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719230",
            startPort = "Out",
            endQuest = "1742891256148719228",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719228",
            startPort = "Out",
            endQuest = "1742891256148719231",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719231",
            startPort = "Out",
            endQuest = "1742891256148719225",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719224"] = {
            key = "1742891256148719224",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256148719225"] = {
            key = "1742891256148719225",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3353.250965179121, y = 442.2539464396103},
            propsData = {ModeType = 0}
          },
          ["1742891256148719226"] = {
            key = "1742891256148719226",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719227"] = {
            key = "1742891256148719227",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\191\153\230\152\175\229\147\170\233\135\140",
            pos = {x = 2220.4480036092964, y = 299.6873449131513},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719228"] = {
            key = "1742891256148719228",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2790.448003609296, y = 430.3325062034738},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210012,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MrQiu_1980001",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField01",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256148719229"] = {
            key = "1742891256148719229",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2222.383487480263, y = 443.88089330024815},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS01"
            }
          },
          ["1742891256148719230"] = {
            key = "1742891256148719230",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\153\172\229\133\136\231\148\159",
            pos = {x = 2510.770584254457, y = 436.138957816377},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980001}
            }
          },
          ["1742891256148719231"] = {
            key = "1742891256148719231",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\153\172\229\133\136\231\148\159",
            pos = {x = 3068.189939093168, y = 441.9454094292805},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980001}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719194"] = {
      isStoryNode = true,
      key = "1742891256148719194",
      type = "StoryNode",
      name = "\230\149\178\231\159\179\231\162\145",
      pos = {x = 2900.6266866566716, y = 266.32233883058467},
      propsData = {
        QuestId = 12020505,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_5",
        QuestDeatil = "Content_120205_5",
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
            startQuest = "1742891256148719235",
            startPort = "Out",
            endQuest = "1742891256148719233",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719232",
            startPort = "QuestStart",
            endQuest = "1742891256148719235",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719232"] = {
            key = "1742891256148719232",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2502.814685314686, y = 452.5099900099899},
            propsData = {ModeType = 0}
          },
          ["1742891256148719233"] = {
            key = "1742891256148719233",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3294.359339563358, y = 440.148035109561},
            propsData = {ModeType = 0}
          },
          ["1742891256148719234"] = {
            key = "1742891256148719234",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719235"] = {
            key = "1742891256148719235",
            type = "TalkNode",
            name = "\230\149\178\231\159\179\231\162\145",
            pos = {x = 3026.247784863092, y = 440.6609864593609},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0.5,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719195"] = {
      isStoryNode = true,
      key = "1742891256148719195",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\172\172\228\184\128\229\177\130\231\187\136\231\130\185",
      pos = {x = 3163.7275878187575, y = 265.07527217364657},
      propsData = {
        QuestId = 12020506,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_6",
        QuestDeatil = "Content_120205_6",
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
            startQuest = "1742891256148719236",
            startPort = "QuestStart",
            endQuest = "1742891256148719239",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719236",
            startPort = "QuestStart",
            endQuest = "1742891256148719240",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719240",
            startPort = "Out",
            endQuest = "1742891256148719241",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719241",
            startPort = "Out",
            endQuest = "1742891256148719242",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719242",
            startPort = "Out",
            endQuest = "1742891256148719237",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719236"] = {
            key = "1742891256148719236",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256148719237"] = {
            key = "1742891256148719237",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3152.34187427003, y = 445.89031007597396},
            propsData = {ModeType = 0}
          },
          ["1742891256148719238"] = {
            key = "1742891256148719238",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719239"] = {
            key = "1742891256148719239",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\151\175\229\133\179\230\143\144\231\164\186",
            pos = {x = 2220.4480036092964, y = 299.6873449131513},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719240"] = {
            key = "1742891256148719240",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2222.383487480263, y = 443.88089330024815},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS01"
            }
          },
          ["1742891256148719241"] = {
            key = "1742891256148719241",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\187\136\231\130\185",
            pos = {x = 2510.8906420059493, y = 443.87527217364635},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980004,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020506"
            }
          },
          ["1742891256148719242"] = {
            key = "1742891256148719242",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\149\178\228\184\164\228\184\170\231\159\179\231\162\145",
            pos = {x = 2817.504003536813, y = 431.62099130387065},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719196"] = {
      isStoryNode = true,
      key = "1742891256148719196",
      type = "StoryNode",
      name = "\229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
      pos = {x = 3441.986521019331, y = 266.17452665740615},
      propsData = {
        QuestId = 12020507,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_7",
        QuestDeatil = "Content_120205_7",
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
            startQuest = "1742891256148719243",
            startPort = "QuestStart",
            endQuest = "1742891256148719246",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719246",
            startPort = "Out",
            endQuest = "1742891256148719250",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719250",
            startPort = "Out",
            endQuest = "1742891256148719247",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719247",
            startPort = "Out",
            endQuest = "1742891256148719248",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719248",
            startPort = "Out",
            endQuest = "1742891256148719249",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719249",
            startPort = "Out",
            endQuest = "1742891256148719251",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719251",
            startPort = "Out",
            endQuest = "1742891256148719244",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719243"] = {
            key = "1742891256148719243",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1796.148018648019, y = 414.5337995337994},
            propsData = {ModeType = 0}
          },
          ["1742891256148719244"] = {
            key = "1742891256148719244",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3649.8418742700296, y = 420.89031007597396},
            propsData = {ModeType = 0}
          },
          ["1742891256148719245"] = {
            key = "1742891256148719245",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719246"] = {
            key = "1742891256148719246",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2095.7168208135963, y = 415.5475599669148},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS3"
            }
          },
          ["1742891256148719247"] = {
            key = "1742891256148719247",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2589.9389019717105, y = 417.2062726891523},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "FallingPoint_12020507",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1742891256148719248"] = {
            key = "1742891256148719248",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\150\188\231\150\188\231\150\188\231\150\188",
            pos = {x = 2846.605568638379, y = 407.2062726891521},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719249"] = {
            key = "1742891256148719249",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
            pos = {x = 3087.5733105738627, y = 406.39982107624894},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Kezhou_1980008",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField02",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210021},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256148719250"] = {
            key = "1742891256148719250",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\136\187\232\136\159",
            pos = {x = 2346.229224552357, y = 415.5396060224854},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980008}
            }
          },
          ["1742891256148719251"] = {
            key = "1742891256148719251",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\136\187\232\136\159",
            pos = {x = 3356.9819127244014, y = 420.5127243020556},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980008}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719197"] = {
      isStoryNode = true,
      key = "1742891256148719197",
      type = "StoryNode",
      name = "\230\149\178\230\156\186\229\133\179",
      pos = {x = 1817.0335748455382, y = 439.31874285835204},
      propsData = {
        QuestId = 12020508,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_8",
        QuestDeatil = "Content_120205_8",
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
            startQuest = "1742891256148719255",
            startPort = "Out",
            endQuest = "1742891256148719256",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719252",
            startPort = "QuestStart",
            endQuest = "1742891256148719255",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719256",
            startPort = "Out",
            endQuest = "1742891256148719258",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719258",
            startPort = "Out",
            endQuest = "1742891256148719257",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719257",
            startPort = "Out",
            endQuest = "1742891256148719253",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719252"] = {
            key = "1742891256148719252",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2590.8908757908753, y = 510.3052281052279},
            propsData = {ModeType = 0}
          },
          ["1742891256148719253"] = {
            key = "1742891256148719253",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3851.8418742700296, y = 494.60459579025957},
            propsData = {ModeType = 0}
          },
          ["1742891256148719254"] = {
            key = "1742891256148719254",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719255"] = {
            key = "1742891256148719255",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2814.595916874888, y = 510.317510864759},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS04"
            }
          },
          ["1742891256148719256"] = {
            key = "1742891256148719256",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 3050.8173571148604, y = 509.45474688101433},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980009,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS04"
            }
          },
          ["1742891256148719257"] = {
            key = "1742891256148719257",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\149\178\230\156\186\229\133\179",
            pos = {x = 3548.573575788581, y = 500.6290374398101},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719258"] = {
            key = "1742891256148719258",
            type = "TalkNode",
            name = "\230\149\178\231\159\179\231\162\145",
            pos = {x = 3298.633328350076, y = 498.2207366712107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0.5,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719198"] = {
      isStoryNode = true,
      key = "1742891256148719198",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\187\136\231\130\185",
      pos = {x = 2098.9300316467793, y = 443.3635938140679},
      propsData = {
        QuestId = 12020509,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_9",
        QuestDeatil = "Content_120205_9",
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
            startQuest = "1742891256148719263",
            startPort = "Out",
            endQuest = "1742891256148719260",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719259",
            startPort = "QuestStart",
            endQuest = "1742891256148719263",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719259"] = {
            key = "1742891256148719259",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2841.275491175491, y = 514.9206127206126},
            propsData = {ModeType = 0}
          },
          ["1742891256148719260"] = {
            key = "1742891256148719260",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3568.984731412887, y = 510.89031007597384},
            propsData = {ModeType = 0}
          },
          ["1742891256148719261"] = {
            key = "1742891256148719261",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719262"] = {
            key = "1742891256148719262",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2868.9255872045587, y = 310.7021262493744},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS05"
            }
          },
          ["1742891256148719263"] = {
            key = "1742891256148719263",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 3157.9602142577173, y = 512.0261754524429},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980010,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS05"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719199"] = {
      isStoryNode = true,
      key = "1742891256148719199",
      type = "StoryNode",
      name = "\229\135\187\230\157\128\230\128\170\231\137\169",
      pos = {x = 2373.7761854929304, y = 443.3635938140679},
      propsData = {
        QuestId = 12020510,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_10",
        QuestDeatil = "Content_120205_10",
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
            startQuest = "1742891256148719264",
            startPort = "QuestStart",
            endQuest = "1742891256148719267",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719268",
            startPort = "Out",
            endQuest = "1742891256148719270",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719267",
            startPort = "Out",
            endQuest = "1742891256148719265",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719264"] = {
            key = "1742891256148719264",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2590.8908757908753, y = 510.3052281052279},
            propsData = {ModeType = 0}
          },
          ["1742891256148719265"] = {
            key = "1742891256148719265",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3187.99950973801, y = 509.5307041646438},
            propsData = {ModeType = 0}
          },
          ["1742891256148719266"] = {
            key = "1742891256148719266",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719267"] = {
            key = "1742891256148719267",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2875.4530597320313, y = 510.317510864759},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS05"
            }
          },
          ["1742891256148719268"] = {
            key = "1742891256148719268",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3117.718166883187, y = 315.5316288441718},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1980011,
                1980012,
                1980013,
                1980014
              }
            }
          },
          ["1742891256148719269"] = {
            key = "1742891256148719269",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3694.898243511539, y = 306.65259217203163},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1742891256148719270"] = {
            key = "1742891256148719270",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\137\147\230\128\170\231\137\169",
            pos = {x = 3416.569836286581, y = 328.458831909306},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719200"] = {
      isStoryNode = true,
      key = "1742891256148719200",
      type = "StoryNode",
      name = "\230\149\178\230\156\186\229\133\179",
      pos = {x = 2645.834719251261, y = 439.9863118668061},
      propsData = {
        QuestId = 12020511,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_11",
        QuestDeatil = "Content_120205_11",
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
            startQuest = "1742891256148719274",
            startPort = "Out",
            endQuest = "1742891256148719275",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719271",
            startPort = "QuestStart",
            endQuest = "1742891256148719274",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719275",
            startPort = "Out",
            endQuest = "1742891256148719277",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719277",
            startPort = "Out",
            endQuest = "1742891256148719276",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719276",
            startPort = "Out",
            endQuest = "1742891256148719272",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719271"] = {
            key = "1742891256148719271",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2568.13225510122, y = 510.3052281052279},
            propsData = {ModeType = 0}
          },
          ["1742891256148719272"] = {
            key = "1742891256148719272",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3851.8418742700296, y = 494.60459579025957},
            propsData = {ModeType = 0}
          },
          ["1742891256148719273"] = {
            key = "1742891256148719273",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719274"] = {
            key = "1742891256148719274",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2813.5614341162677, y = 510.317510864759},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS06"
            }
          },
          ["1742891256148719275"] = {
            key = "1742891256148719275",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 3050.8173571148604, y = 509.45474688101433},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980015,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS06"
            }
          },
          ["1742891256148719276"] = {
            key = "1742891256148719276",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\149\178\230\156\186\229\133\179",
            pos = {x = 3549.6080585472014, y = 500.6290374398101},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719277"] = {
            key = "1742891256148719277",
            type = "TalkNode",
            name = "\230\149\178\231\159\179\231\162\145",
            pos = {x = 3298.633328350076, y = 498.2207366712107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0.5,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719201"] = {
      isStoryNode = true,
      key = "1742891256148719201",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\172\172\228\186\140\229\177\130\231\187\136\231\130\185",
      pos = {x = 2906.5243744236745, y = 437.9173463495648},
      propsData = {
        QuestId = 12020512,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_12",
        QuestDeatil = "Content_120205_12",
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
            startQuest = "1742891256148719278",
            startPort = "QuestStart",
            endQuest = "1742891256148719281",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719282",
            startPort = "Out",
            endQuest = "1742891256148719283",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719283",
            startPort = "Out",
            endQuest = "1742891256148719279",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719281",
            startPort = "Out",
            endQuest = "1742891256148719284",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719284",
            startPort = "Out",
            endQuest = "1742891256148719282",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719278"] = {
            key = "1742891256148719278",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1584.4526163491682, y = 436.66023631540867},
            propsData = {ModeType = 0}
          },
          ["1742891256148719279"] = {
            key = "1742891256148719279",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3125.4453225458924, y = 422.0972066276981},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 2,
              IsWhite = true
            }
          },
          ["1742891256148719280"] = {
            key = "1742891256148719280",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719281"] = {
            key = "1742891256148719281",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2049.6248667906075, y = 439.7429622657654},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1742891256148719282"] = {
            key = "1742891256148719282",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\229\145\138\229\136\171",
            pos = {x = 2554.80023649264, y = 426.5380360047373},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField03",
              BlendInTime = 1,
              BlendOutTime = -1,
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
                  TalkActorId = 210021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256148719283"] = {
            key = "1742891256148719283",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2852.7312709753987, y = 429.64148428059923},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField04",
              BlendInTime = -1,
              BlendOutTime = 1,
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
                  TalkActorId = 210012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256148719284"] = {
            key = "1742891256148719284",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 2299.2173913043453, y = 439.3853073463269},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980016,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS08"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719202"] = {
      isStoryNode = true,
      key = "1742891256148719202",
      type = "StoryNode",
      name = "\228\188\160\233\128\129\229\155\158\229\143\164\230\136\152\229\156\186",
      pos = {x = 2894.9099543609777, y = 604.5197095036522},
      propsData = {
        QuestId = 12020513,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_13",
        QuestDeatil = "Content_120205_13",
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
            startQuest = "1742891256148719288",
            startPort = "Out",
            endQuest = "1742891256148719289",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719289",
            startPort = "Out",
            endQuest = "1742891256148719290",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719290",
            startPort = "Out",
            endQuest = "1742891256148719286",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719285",
            startPort = "QuestStart",
            endQuest = "1742891256148719291",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719291",
            startPort = "Out",
            endQuest = "1742891256148719288",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719285"] = {
            key = "1742891256148719285",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1977.5560646250296, y = 453.21196045333966},
            propsData = {ModeType = 0}
          },
          ["1742891256148719286"] = {
            key = "1742891256148719286",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3269.5923279905383, y = 448.31317758958556},
            propsData = {ModeType = 0}
          },
          ["1742891256148719287"] = {
            key = "1742891256148719287",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719288"] = {
            key = "1742891256148719288",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2512.0386598940554, y = 451.122272610593},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1742891256148719289"] = {
            key = "1742891256148719289",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\128\174\230\141\149\231\133\156\230\152\142",
            pos = {x = 2766.488076783021, y = 438.21680188495503},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12029901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_32",
              BlendInTime = 1,
              BlendOutTime = -1,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210007,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210007}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256148719290"] = {
            key = "1742891256148719290",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\230\156\186\229\133\179",
            pos = {x = 3016.6695649862877, y = 436.50173836408385},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020001,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = -1,
              BlendOutTime = 1,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719291"] = {
            key = "1742891256148719291",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2251.2863568215876, y = 451.7991004497751},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 2,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719203"] = {
      isStoryNode = true,
      key = "1742891256148719203",
      type = "StoryNode",
      name = "\229\135\187\232\180\165\231\133\156\230\152\142",
      pos = {x = 3147.0230339375753, y = 606.2698021618562},
      propsData = {
        QuestId = 12020514,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_14",
        QuestDeatil = "Content_120205_14",
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
            startQuest = "1742891256148719292",
            startPort = "QuestStart",
            endQuest = "1742891256148719295",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719296",
            startPort = "Out",
            endQuest = "1742891256148719297",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719298",
            startPort = "Out",
            endQuest = "1742891256148719299",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719295",
            startPort = "Out",
            endQuest = "1742891256148719296",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719296",
            startPort = "Out",
            endQuest = "1742891256148719298",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719299",
            startPort = "Out",
            endQuest = "1742891256148719293",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719292"] = {
            key = "1742891256148719292",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1977.5560646250296, y = 453.21196045333966},
            propsData = {ModeType = 0}
          },
          ["1742891256148719293"] = {
            key = "1742891256148719293",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3295.1004949596845, y = 454.1661721449394},
            propsData = {ModeType = 0}
          },
          ["1742891256148719294"] = {
            key = "1742891256148719294",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719295"] = {
            key = "1742891256148719295",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2235.831763342331, y = 453.19123812783437},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020514"
            }
          },
          ["1742891256148719296"] = {
            key = "1742891256148719296",
            type = "GoToNode",
            name = "\229\146\140\233\187\145\233\190\153\230\136\152\230\150\151",
            pos = {x = 2487.2310233238964, y = 453.3131945931797},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930153,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020514"
            }
          },
          ["1742891256148719297"] = {
            key = "1742891256148719297",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\187\145\233\190\153\230\136\152\230\150\151",
            pos = {x = 2736.243064922145, y = 263.0436269960259},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719298"] = {
            key = "1742891256148719298",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2743.272724802039, y = 454.0449215240841},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930152}
            }
          },
          ["1742891256148719299"] = {
            key = "1742891256148719299",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3019.4796213537625, y = 454.044921524084},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1930152}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719204"] = {
      isStoryNode = true,
      key = "1742891256148719204",
      type = "StoryNode",
      name = "\230\136\152\229\144\142\229\175\185\232\175\157",
      pos = {x = 3401.458770614691, y = 605.5644730082512},
      propsData = {
        QuestId = 12020515,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_15",
        QuestDeatil = "Content_120205_15",
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
            startQuest = "1742891256148719300",
            startPort = "QuestStart",
            endQuest = "1742891256148719304",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719304",
            startPort = "Out",
            endQuest = "1742891256148719305",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719305",
            startPort = "Out",
            endQuest = "1742891256148719301",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256148719300"] = {
            key = "1742891256148719300",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1977.5560646250296, y = 453.21196045333966},
            propsData = {ModeType = 0}
          },
          ["1742891256148719301"] = {
            key = "1742891256148719301",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2807.159318489096, y = 450.63676038023357},
            propsData = {ModeType = 0}
          },
          ["1742891256148719302"] = {
            key = "1742891256148719302",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719303"] = {
            key = "1742891256148719303",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2254.361175107037, y = 273.19123812783437},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020514"
            }
          },
          ["1742891256148719304"] = {
            key = "1742891256148719304",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \229\133\132\229\188\159\231\155\184\233\128\162",
            pos = {x = 2240.9610330581295, y = 440.0242525795925},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020201,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = -1,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1742891256148719305"] = {
            key = "1742891256148719305",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\227\128\129\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2514.4904448228363, y = 439.1418996384161},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_33",
              BlendInTime = -1,
              BlendOutTime = 0.5,
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
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210021}
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
    },
    ["1742891256148719205"] = {
      isStoryNode = true,
      key = "1742891256148719205",
      type = "StoryNode",
      name = "\229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
      pos = {x = 3657.217717550109, y = 600.4335491653596},
      propsData = {
        QuestId = 12020516,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_16",
        QuestDeatil = "Content_120205_16",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "1742891256148719306",
            startPort = "QuestStart",
            endQuest = "1742891256148719309",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719309",
            startPort = "Out",
            endQuest = "1742891256148719310",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719310",
            startPort = "Out",
            endQuest = "1742891256148719311",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719311",
            startPort = "Out",
            endQuest = "1742891256148719307",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719309",
            startPort = "Out",
            endQuest = "1742891256148719312",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719306"] = {
            key = "1742891256148719306",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1817.9137083837954, y = 455.18484497881883},
            propsData = {ModeType = 0}
          },
          ["1742891256148719307"] = {
            key = "1742891256148719307",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2909.659318489096, y = 451.4700937135669},
            propsData = {ModeType = 0}
          },
          ["1742891256148719308"] = {
            key = "1742891256148719308",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256148719309"] = {
            key = "1742891256148719309",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2079.7959577157326, y = 456.19848450464593},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020514"
            }
          },
          ["1742891256148719310"] = {
            key = "1742891256148719310",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\136\187\232\136\159",
            pos = {x = 2345.328397205752, y = 456.62770664003835},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930157}
            }
          },
          ["1742891256148719311"] = {
            key = "1742891256148719311",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2631.161730539086, y = 446.6277066400383},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Kezhou_1930157",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 12020501,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256148719312"] = {
            key = "1742891256148719312",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 2347.8283972057525, y = 309.12770664003835},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256148719206"] = {
      isStoryNode = true,
      key = "1742891256148719206",
      type = "StoryNode",
      name = "\229\143\164\230\136\152\229\156\186\229\137\175\230\156\172I",
      pos = {x = 2162.155844155845, y = 779.6233766233765},
      propsData = {
        QuestId = 12020504,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120205_4",
        QuestDeatil = "Content_120205_4",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256148719316",
            startPort = "Fail",
            endQuest = "1742891256148719317",
            endPort = "In"
          },
          {
            startQuest = "1742891256148719316",
            startPort = "Success",
            endQuest = "1742891256148719314",
            endPort = "Success"
          },
          {
            startQuest = "1742891256148719317",
            startPort = "Out",
            endQuest = "1742891256148719315",
            endPort = "Fail"
          },
          {
            startQuest = "1742891256148719316",
            startPort = "PassiveFail",
            endQuest = "1742891256148719315",
            endPort = "Fail"
          },
          {
            startQuest = "1742891256148719313",
            startPort = "QuestStart",
            endQuest = "1742891256148719316",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256148719313"] = {
            key = "1742891256148719313",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3942.6929265489953, y = 722.5440572380147},
            propsData = {ModeType = 0}
          },
          ["1742891256148719314"] = {
            key = "1742891256148719314",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4761.8308035599275, y = 476.07454738060306},
            propsData = {
              ModeType = 1,
              Id = 104601,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1742891256148719315"] = {
            key = "1742891256148719315",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4756.283057713077, y = 745.8901389347636},
            propsData = {}
          },
          ["1742891256148719316"] = {
            key = "1742891256148719316",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4466.851545919161, y = 546.6978653530376},
            propsData = {SpecialConfigId = 2006, BlackScreenImmediately = false}
          },
          ["1742891256148719317"] = {
            key = "1742891256148719317",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4758.7654134813965, y = 616.1735084838532},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 1,
              IsWhite = true
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
