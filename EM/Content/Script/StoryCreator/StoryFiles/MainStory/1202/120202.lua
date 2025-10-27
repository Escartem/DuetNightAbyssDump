return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742891256129713490",
      startPort = "Success",
      endStory = "1742891256129713491",
      endPort = "In"
    },
    {
      startStory = "1742891256129713491",
      startPort = "Success",
      endStory = "1742891256129713492",
      endPort = "In"
    },
    {
      startStory = "1742891256129713492",
      startPort = "Success",
      endStory = "1742891256129713493",
      endPort = "In"
    },
    {
      startStory = "1742891256129713493",
      startPort = "Success",
      endStory = "1742891256129713494",
      endPort = "In"
    },
    {
      startStory = "1742891256129713497",
      startPort = "Success",
      endStory = "1742891256129713489",
      endPort = "In"
    },
    {
      startStory = "1742891256129713498",
      startPort = "StoryStart",
      endStory = "1742891256129713500",
      endPort = "In"
    },
    {
      startStory = "1742891256129713500",
      startPort = "Success",
      endStory = "1742891256129713501",
      endPort = "In"
    },
    {
      startStory = "1742891256129713501",
      startPort = "Success",
      endStory = "1742891256129713502",
      endPort = "In"
    },
    {
      startStory = "1742891256129713502",
      startPort = "Success",
      endStory = "1742891256129713490",
      endPort = "In"
    },
    {
      startStory = "1742891256129713494",
      startPort = "Success",
      endStory = "1742891256129713497",
      endPort = "In"
    },
    {
      startStory = "1742891256129713489",
      startPort = "Success",
      endStory = "17507753325035270251",
      endPort = "In"
    },
    {
      startStory = "17507753325035270251",
      startPort = "Success",
      endStory = "17509395813392304458",
      endPort = "In"
    },
    {
      startStory = "17509395813392304458",
      startPort = "Success",
      endStory = "1742891256129713499",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1742891256129713489"] = {
      isStoryNode = true,
      key = "1742891256129713489",
      type = "StoryNode",
      name = "\231\137\185\230\174\138\230\136\152\230\150\151",
      pos = {x = 2399.4871742805058, y = 405.3729428256256},
      propsData = {
        QuestId = 12020210,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_10",
        QuestDeatil = "Content_120202_10",
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
        SubRegionId = 104301,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020210"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713503",
            startPort = "QuestStart",
            endQuest = "1742891256129713506",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713506",
            startPort = "Out",
            endQuest = "17509270774114402",
            endPort = "In"
          },
          {
            startQuest = "17509270774114402",
            startPort = "Success",
            endQuest = "1742891256129713504",
            endPort = "Success"
          },
          {
            startQuest = "17509270774114402",
            startPort = "Fail",
            endQuest = "1742891256129713505",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1742891256129713503"] = {
            key = "1742891256129713503",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2475.7017953311065, y = 830.0496725496726},
            propsData = {ModeType = 0}
          },
          ["1742891256129713504"] = {
            key = "1742891256129713504",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3275.005918787975, y = 856.27964053663},
            propsData = {ModeType = 0}
          },
          ["1742891256129713505"] = {
            key = "1742891256129713505",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3313.310794329578, y = 995.1630407030134},
            propsData = {}
          },
          ["1742891256129713506"] = {
            key = "1742891256129713506",
            type = "GoToNode",
            name = "goto\231\137\185\230\174\138\228\187\187\229\138\161\231\155\146\229\173\144",
            pos = {x = 2720.7502379712, y = 851.023291788668},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010030,
              GuideType = "M",
              GuidePointName = "Mechanism_12020209_2010030"
            }
          },
          ["17509270774114402"] = {
            key = "17509270774114402",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2989.9818795758947, y = 872.3664331361192},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713490"] = {
      isStoryNode = true,
      key = "1742891256129713490",
      type = "StoryNode",
      name = "\229\142\187\229\129\154\231\148\181\230\162\175",
      pos = {x = 2126.6382493655515, y = 205.35748353395408},
      propsData = {
        QuestId = 12020204,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_1",
        QuestDeatil = "Content_120202_1",
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
        SubRegionId = 104110,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_2110016"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713509",
            startPort = "QuestStart",
            endQuest = "1742891256129713515",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713515",
            startPort = "Out",
            endQuest = "1742891256129713514",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713514",
            startPort = "Out",
            endQuest = "1742891256129713510",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256129713508"] = {
            key = "1742891256129713508",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\187\135\230\152\159\229\174\162",
            pos = {x = 2543.6415784929522, y = 292.98917626146283},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2110018,
                2110019,
                2110031
              }
            }
          },
          ["1742891256129713509"] = {
            key = "1742891256129713509",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1444.3771853146854, y = 458.8046328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256129713510"] = {
            key = "1742891256129713510",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2537.91091452303, y = 490.9568595787984},
            propsData = {ModeType = 0}
          },
          ["1742891256129713511"] = {
            key = "1742891256129713511",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256129713512"] = {
            key = "1742891256129713512",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\187\135\230\152\159\229\174\162\227\128\129\230\173\162\230\181\129\231\173\137",
            pos = {x = 1692.3892191289679, y = 298.40808698469993},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2110018,
                2110019,
                2110020,
                2110031
              }
            }
          },
          ["1742891256129713513"] = {
            key = "1742891256129713513",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 2265.6110130981015, y = 268.8246507490992},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110023,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020201"
            }
          },
          ["1742891256129713514"] = {
            key = "1742891256129713514",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\173\162\230\181\129\229\146\140\231\187\135\230\152\159\229\174\162 Fixsimple04",
            pos = {x = 2114.162105972718, y = 473.0372911900124},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020204",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210006,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210033,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210005},
                {TalkActorType = "Npc", TalkActorId = 210006},
                {TalkActorType = "Npc", TalkActorId = 210033}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256129713515"] = {
            key = "1742891256129713515",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 1731.3908410138251, y = 458.22062211981574},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 12020204,
              GuideType = "M",
              GuidePointName = "Mechanism_12020204_2010021"
            }
          },
          ["1742891256129713516"] = {
            key = "1742891256129713516",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 1984.3907019704436, y = 281.9852216748768},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110017,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110017"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713491"] = {
      isStoryNode = true,
      key = "1742891256129713491",
      type = "StoryNode",
      name = "\230\137\167\229\190\139\233\152\129\229\134\133\229\137\141\229\143\176",
      pos = {x = 2404.0731652868567, y = 205.390900031557},
      propsData = {
        QuestId = 12020205,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_2",
        QuestDeatil = "Content_120202_2",
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
        SubRegionId = 104110,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Zhiliu_2110020"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713520",
            startPort = "Out",
            endQuest = "1742891256129713518",
            endPort = "Success"
          },
          {
            startQuest = "1742891256129713517",
            startPort = "QuestStart",
            endQuest = "17502349363738512607",
            endPort = "In"
          },
          {
            startQuest = "17502349363738512607",
            startPort = "Out",
            endQuest = "17502482916791895391",
            endPort = "In"
          },
          {
            startQuest = "17502482916791895391",
            startPort = "Out",
            endQuest = "1742891256129713520",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256129713517"] = {
            key = "1742891256129713517",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2267.457542457543, y = 801.4385614385615},
            propsData = {ModeType = 0}
          },
          ["1742891256129713518"] = {
            key = "1742891256129713518",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3007.396870371008, y = 804.7167822598859},
            propsData = {ModeType = 0}
          },
          ["1742891256129713519"] = {
            key = "1742891256129713519",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3004.864797870795, y = 961.6715986412389},
            propsData = {}
          },
          ["1742891256129713520"] = {
            key = "1742891256129713520",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\142\165\229\190\133\229\145\152\228\186\164\232\176\136 Fixsimple05",
            pos = {x = 2599.369830364479, y = 790.4931879388756},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200003,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_jiedaiyuan12020205_2010023",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020205",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17502349363738512607"] = {
            key = "17502349363738512607",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2425.4265608365254, y = 641.7727272727273},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "12020205zhilvge",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17502482916791895391"] = {
            key = "17502482916791895391",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2691.518573214541, y = 632.3355930213338},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010022,
              GuideType = "M",
              GuidePointName = "Mechanism_12020205_2010022"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713492"] = {
      isStoryNode = true,
      key = "1742891256129713492",
      type = "StoryNode",
      name = "\230\137\167\229\190\139\233\152\129\229\134\133\232\173\166\229\141\171",
      pos = {x = 1280.5259554650852, y = 408.17178883218276},
      propsData = {
        QuestId = 12020206,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_3",
        QuestDeatil = "Content_120202_3",
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
        SubRegionId = 104110,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020203"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713523",
            startPort = "QuestStart",
            endQuest = "1742891256129713522",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713523",
            startPort = "QuestStart",
            endQuest = "17502489882895671505",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713522",
            startPort = "Out",
            endQuest = "1742891256129713524",
            endPort = "Success"
          },
          {
            startQuest = "17502489882895671505",
            startPort = "Out",
            endQuest = "1742891256129713524",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256129713521"] = {
            key = "1742891256129713521",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2249.73956936593, y = 607.3330170707067},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                2110027,
                2110028,
                2110029,
                2110030
              },
              QuestPickupId = -1,
              UnitId = 10053,
              UnitCount = 4,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020203",
              IsUseCount = false
            }
          },
          ["1742891256129713522"] = {
            key = "1742891256129713522",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\228\186\164\232\176\136 Fixsimple06",
            pos = {x = 2356.8867907082736, y = 834.153772534755},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020206",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256129713523"] = {
            key = "1742891256129713523",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2005.3742091242098, y = 830.0496725496726},
            propsData = {ModeType = 0}
          },
          ["1742891256129713524"] = {
            key = "1742891256129713524",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2827.396870371008, y = 852.7167822598859},
            propsData = {ModeType = 0}
          },
          ["1742891256129713525"] = {
            key = "1742891256129713525",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3089.864797870795, y = 932.6715986412389},
            propsData = {}
          },
          ["1742891256129713526"] = {
            key = "1742891256129713526",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\173\162\230\181\129",
            pos = {x = 2551.071428571429, y = 676.3571428571429},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110020}
            }
          },
          ["17502489882895671505"] = {
            key = "17502489882895671505",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\228\186\164\232\176\136 Fixsimple06",
            pos = {x = 2379.076802407761, y = 1042.6456820604774},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200005,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020206",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004}
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
    ["1742891256129713493"] = {
      isStoryNode = true,
      key = "1742891256129713493",
      type = "StoryNode",
      name = "\230\137\167\229\190\139\233\152\129\229\129\183\229\129\183\232\129\138\229\164\169\231\156\139\230\156\186\229\153\168\228\186\186",
      pos = {x = 1564.720906544436, y = 403.48960720651866},
      propsData = {
        QuestId = 12020207,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_4",
        QuestDeatil = "Content_120202_4",
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
        SubRegionId = 104107,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_120202041"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713531",
            startPort = "QuestStart",
            endQuest = "1742891256129713534",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713534",
            startPort = "Out",
            endQuest = "17507739223711339451",
            endPort = "In"
          },
          {
            startQuest = "17507739223711339451",
            startPort = "Out",
            endQuest = "1742891256129713532",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256129713531"] = {
            key = "1742891256129713531",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2038.707542457543, y = 822.2718947718947},
            propsData = {ModeType = 0}
          },
          ["1742891256129713532"] = {
            key = "1742891256129713532",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3187.3340684386408, y = 845.0851397478085},
            propsData = {ModeType = 0}
          },
          ["1742891256129713533"] = {
            key = "1742891256129713533",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3121.087710224142, y = 1187.270632457664},
            propsData = {}
          },
          ["1742891256129713534"] = {
            key = "1742891256129713534",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 2325.139659981252, y = 830.4782294999684},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010028,
              GuideType = "M",
              GuidePointName = "Mechanism_12020207_2010028"
            }
          },
          ["17507739223711339451"] = {
            key = "17507739223711339451",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2746.9204616544457, y = 910.9069228096664},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020207",
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
              TalkActors = {},
              RemoveTalkActors = {},
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
    ["1742891256129713494"] = {
      isStoryNode = true,
      key = "1742891256129713494",
      type = "StoryNode",
      name = "\232\191\155\230\189\156\232\161\140",
      pos = {x = 1842.4107161309835, y = 405.27094343711764},
      propsData = {
        QuestId = 12020208,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_5",
        QuestDeatil = "Content_120202_5",
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
        SubRegionId = 104103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_120202043"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713542",
            startPort = "Out",
            endQuest = "1742891256129713543",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713537",
            startPort = "QuestStart",
            endQuest = "17507739787812321941",
            endPort = "In"
          },
          {
            startQuest = "17507739787812321941",
            startPort = "Out",
            endQuest = "17507740040452322389",
            endPort = "In"
          },
          {
            startQuest = "17507740040452322389",
            startPort = "Success",
            endQuest = "1742891256129713538",
            endPort = "Success"
          },
          {
            startQuest = "17507740040452322389",
            startPort = "Fail",
            endQuest = "1742891256129713539",
            endPort = "Fail"
          },
          {
            startQuest = "17507740040452322389",
            startPort = "PassiveFail",
            endQuest = "1742891256129713539",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1742891256129713535"] = {
            key = "1742891256129713535",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2412.0505509008735, y = 552.2432885804874},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040004,
                2040005,
                2040006,
                2040007
              }
            }
          },
          ["1742891256129713537"] = {
            key = "1742891256129713537",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1719.8569677448993, y = 836.2565691013966},
            propsData = {ModeType = 0}
          },
          ["1742891256129713538"] = {
            key = "1742891256129713538",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2599.881780856941, y = 858.9792573948674},
            propsData = {ModeType = 0}
          },
          ["1742891256129713539"] = {
            key = "1742891256129713539",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2613.59284561163, y = 981.875861215834},
            propsData = {}
          },
          ["1742891256129713542"] = {
            key = "1742891256129713542",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \231\133\156\230\152\142\231\153\187\229\156\186",
            pos = {x = 2541.4624221295885, y = 567.6537339046286},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021301,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0.5,
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
          ["1742891256129713543"] = {
            key = "1742891256129713543",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\136\157\233\129\135\231\133\156\230\152\142 Fixsimple07",
            pos = {x = 2810.5147097112877, y = 566.1177861922101},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12021401",
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
                  TalkActorId = 210007,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["17507739787812321941"] = {
            key = "17507739787812321941",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1988.9481265860572, y = 830.1217605482974},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010029,
              GuideType = "M",
              GuidePointName = "Mechanism_12020208_2010029"
            }
          },
          ["17507740040452322389"] = {
            key = "17507740040452322389",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2285.1805568421946, y = 833.936977076876},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          },
          ["175100894724811531081"] = {
            key = "175100894724811531081",
            type = "GoToNode",
            name = "\230\189\156\232\161\140\231\187\136\231\130\185",
            pos = {x = 2354.9557433921764, y = 1111.8462998102466},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "M",
              GuidePointName = "Mechanism_12020208qianxingEnd_2010043"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713497"] = {
      isStoryNode = true,
      key = "1742891256129713497",
      type = "StoryNode",
      name = "\228\184\138\228\186\140\230\165\188\230\145\184\229\135\186\233\151\168",
      pos = {x = 2122.343648888034, y = 404.91680246947374},
      propsData = {
        QuestId = 12020209,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_9",
        QuestDeatil = "Content_120202_9",
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
        SubRegionId = 104301,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_CavSpecialQuest"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713564",
            startPort = "QuestStart",
            endQuest = "17507750211094287378",
            endPort = "In"
          },
          {
            startQuest = "17507750211094287378",
            startPort = "Out",
            endQuest = "1742891256129713567",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713567",
            startPort = "Out",
            endQuest = "1742891256129713565",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256129713563"] = {
            key = "1742891256129713563",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\133\156\230\152\142\229\175\146\230\154\132 Fixsimple09",
            pos = {x = 3145.0953394992976, y = 600.2468762069886},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022029,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12022033",
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
              EndNewTargetPointName = "East01_12022033",
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256129713564"] = {
            key = "1742891256129713564",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2475.7017953311065, y = 830.0496725496726},
            propsData = {ModeType = 0}
          },
          ["1742891256129713565"] = {
            key = "1742891256129713565",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3219.4289957110523, y = 851.0232302802197},
            propsData = {ModeType = 0}
          },
          ["1742891256129713566"] = {
            key = "1742891256129713566",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4029.3877174065015, y = 949.8553483953211},
            propsData = {}
          },
          ["1742891256129713567"] = {
            key = "1742891256129713567",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\136\187\232\136\159\230\177\130\229\137\145 Fixsimple09",
            pos = {x = 2907.487765081378, y = 808.5448426084035},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020209",
              BlendInTime = 1,
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
                  TalkActorId = 210007,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["17507750211094287378"] = {
            key = "17507750211094287378",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2691.109084992504, y = 654.1275344470621},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Point12020209",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = true
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713498"] = {
      isStoryNode = true,
      key = "1742891256129713498",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1000.7311726897891, y = 202.05699733203977},
      propsData = {QuestChainId = 120202},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256129713499"] = {
      isStoryNode = true,
      key = "1742891256129713499",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1840.9294746872126, y = 603.9732671769689},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256129713500"] = {
      isStoryNode = true,
      key = "1742891256129713500",
      type = "StoryNode",
      name = "\229\136\187\232\136\159\230\177\130\229\137\145",
      pos = {x = 1276.6364022513033, y = 207.1182418133907},
      propsData = {
        QuestId = 12020201,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_11",
        QuestDeatil = "Content_120202_11",
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
        SubRegionId = 104110,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020201kezhou_2010018"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713571",
            startPort = "Out",
            endQuest = "1742891256129713572",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713568",
            startPort = "QuestStart",
            endQuest = "17497993870645907211",
            endPort = "In"
          },
          {
            startQuest = "17497993870645907211",
            startPort = "Out",
            endQuest = "17501689702352846767",
            endPort = "In"
          },
          {
            startQuest = "17501689702352846767",
            startPort = "Out",
            endQuest = "1742891256129713571",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713572",
            startPort = "Out",
            endQuest = "1742891256129713569",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256129713568"] = {
            key = "1742891256129713568",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1885.1335506598666, y = 389.09679793890314},
            propsData = {ModeType = 0}
          },
          ["1742891256129713569"] = {
            key = "1742891256129713569",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2916.2545410052435, y = 433.2834758972626},
            propsData = {ModeType = 0}
          },
          ["1742891256129713570"] = {
            key = "1742891256129713570",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256129713571"] = {
            key = "1742891256129713571",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\136\187\232\136\159\228\189\141\231\189\174",
            pos = {x = 2379.7633571243114, y = 383.2788750638046},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010018,
              GuideType = "M",
              GuidePointName = "Mechanism_12020201kezhou_2010018"
            }
          },
          ["1742891256129713572"] = {
            key = "1742891256129713572",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\153\189\233\190\153\231\165\160\229\160\130",
            pos = {x = 2650.7233707948526, y = 441.4118894178716},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12020602",
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
                  TalkActorId = 210003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210033,
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
                {TalkActorType = "Npc", TalkActorId = 210003},
                {TalkActorType = "Npc", TalkActorId = 210033},
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
          ["17497984556072802911"] = {
            key = "17497984556072802911",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\229\143\152\228\184\186\229\136\187\232\136\159\230\136\152\230\150\151",
            pos = {x = 2520.150097559404, y = 213.96468976566769},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          },
          ["17497991706364976334"] = {
            key = "17497991706364976334",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "success\232\138\130\231\130\185\233\128\129\231\142\169\229\174\182\229\135\186\229\142\187",
            pos = {x = 2826.8091518913825, y = 309.1239566550759},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17497993870645907211"] = {
            key = "17497993870645907211",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\230\138\138\231\142\169\229\174\182\233\128\129\232\191\135\230\157\165",
            pos = {x = 2119.389408781551, y = 376.8974634539063},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Point12020201",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17501689702352846767"] = {
            key = "17501689702352846767",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 2200.5617197523025, y = 562.5532122229782},
            propsData = {QuestRoleId = 11030102, IsPlayFX = true}
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713501"] = {
      isStoryNode = true,
      key = "1742891256129713501",
      type = "StoryNode",
      name = "\229\155\158\229\136\176\229\145\138\231\164\186\231\137\140",
      pos = {x = 1561.123606772785, y = 205.60778552234837},
      propsData = {
        QuestId = 12020202,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_12",
        QuestDeatil = "Content_120202_12",
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
        SubRegionId = 104110,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Xiangguan_2110011"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713576",
            startPort = "Out",
            endQuest = "1742891256129713574",
            endPort = "Success"
          },
          {
            startQuest = "17498224733631792",
            startPort = "Out",
            endQuest = "17500636399317318",
            endPort = "In"
          },
          {
            startQuest = "17500636399317318",
            startPort = "Out",
            endQuest = "1742891256129713576",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713573",
            startPort = "QuestStart",
            endQuest = "17501690710292847880",
            endPort = "In"
          },
          {
            startQuest = "17501690710292847880",
            startPort = "Out",
            endQuest = "17498224733631792",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256129713573"] = {
            key = "1742891256129713573",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2282.915505547084, y = 448.2396550817603},
            propsData = {ModeType = 0}
          },
          ["1742891256129713574"] = {
            key = "1742891256129713574",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3137.865483254484, y = 468.9856035568371},
            propsData = {ModeType = 0}
          },
          ["1742891256129713575"] = {
            key = "1742891256129713575",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256129713576"] = {
            key = "1742891256129713576",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\228\184\138\233\166\153",
            pos = {x = 2885.234009092725, y = 448.23255811088075},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["17498224733631792"] = {
            key = "17498224733631792",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "success\232\138\130\231\130\185\233\128\129\231\142\169\229\174\182\229\135\186\229\142\187",
            pos = {x = 2609.8291991007254, y = 462.81692670142303},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "12020202",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17500636399317318"] = {
            key = "17500636399317318",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2770.8709718710497, y = 274.3160054972062},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010019,
              GuideType = "M",
              GuidePointName = "Mechanism_12020202_2010019"
            }
          },
          ["17501690710292847880"] = {
            key = "17501690710292847880",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 2467.836484983315, y = 204.15092252260968},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["1742891256129713502"] = {
      isStoryNode = true,
      key = "1742891256129713502",
      type = "StoryNode",
      name = "\229\129\183\229\129\183\229\175\185\232\175\157",
      pos = {x = 1839.966970121382, y = 203.81232492997202},
      propsData = {
        QuestId = 12020203,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_13",
        QuestDeatil = "Content_120202_13",
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
        SubRegionId = 104110,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020203_2010020"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256129713577",
            startPort = "QuestStart",
            endQuest = "1742891256129713581",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713581",
            startPort = "Out",
            endQuest = "1742891256129713582",
            endPort = "In"
          },
          {
            startQuest = "1742891256129713582",
            startPort = "Out",
            endQuest = "1742891256129713578",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256129713577"] = {
            key = "1742891256129713577",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2659.8398476523475, y = 454.5554445554445},
            propsData = {ModeType = 0}
          },
          ["1742891256129713578"] = {
            key = "1742891256129713578",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3509.870612433815, y = 466.7031187544054},
            propsData = {ModeType = 0}
          },
          ["1742891256129713579"] = {
            key = "1742891256129713579",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256129713581"] = {
            key = "1742891256129713581",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\232\175\180\230\130\132\230\130\132\232\175\157",
            pos = {x = 2946.8351146425275, y = 464.6142295493589},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010020,
              GuideType = "M",
              GuidePointName = "Mechanism_12020203_2010020"
            }
          },
          ["1742891256129713582"] = {
            key = "1742891256129713582",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\154\142\231\154\142\229\149\134\233\147\186",
            pos = {x = 3228.6250000000005, y = 462.5425824175825},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020203",
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
                  TalkActorId = 210003,
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
                {TalkActorType = "Npc", TalkActorId = 210003},
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
          ["17500639516411346887"] = {
            key = "17500639516411346887",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2940.5872208852265, y = 272.15457864480305},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17507753325035270251"] = {
      isStoryNode = true,
      key = "17507753325035270251",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\229\185\179\229\143\176",
      pos = {x = 1278.986251974232, y = 606.2648621973785},
      propsData = {
        QuestId = 12020211,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_10",
        QuestDeatil = "Content_120202_10",
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
        SubRegionId = 104301,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020210"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17507753325035270256",
            startPort = "QuestStart",
            endQuest = "17507753325035270259",
            endPort = "In"
          },
          {
            startQuest = "17507753325035270259",
            startPort = "Out",
            endQuest = "17509395245231320549",
            endPort = "In"
          },
          {
            startQuest = "17509395245231320549",
            startPort = "Out",
            endQuest = "17507753325035270257",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17507753325035270256"] = {
            key = "17507753325035270256",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2475.7017953311065, y = 830.0496725496726},
            propsData = {ModeType = 0}
          },
          ["17507753325035270257"] = {
            key = "17507753325035270257",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3309.2017229837793, y = 834.8985216555111},
            propsData = {ModeType = 0}
          },
          ["17507753325035270258"] = {
            key = "17507753325035270258",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4029.3877174065015, y = 949.8553483953211},
            propsData = {}
          },
          ["17507753325035270259"] = {
            key = "17507753325035270259",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\229\185\179\229\143\176",
            pos = {x = 2785.6311903521528, y = 829.2375775029536},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010032,
              GuideType = "M",
              GuidePointName = "Mechanism_12020211_2010032"
            }
          },
          ["17509395245231320549"] = {
            key = "17509395245231320549",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3047.591358246587, y = 832.3618921731855},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          }
        },
        commentData = {}
      }
    },
    ["17509395813392304458"] = {
      isStoryNode = true,
      key = "17509395813392304458",
      type = "StoryNode",
      name = "\230\151\160\231\148\177\231\148\159\231\137\185\230\174\138\231\142\169\230\179\149",
      pos = {x = 1560.7367486493072, y = 604.9200665000319},
      propsData = {
        QuestId = 12020212,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120202_10",
        QuestDeatil = "Content_120202_10",
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
        SubRegionId = 104301,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020210"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17509395813392304466",
            startPort = "Out",
            endQuest = "17509396694982305116",
            endPort = "In"
          },
          {
            startQuest = "17509396694982305116",
            startPort = "Success",
            endQuest = "17509395813392304464",
            endPort = "Success"
          },
          {
            startQuest = "17509396694982305116",
            startPort = "Fail",
            endQuest = "17509395813392304465",
            endPort = "Fail"
          },
          {
            startQuest = "17509396694982305116",
            startPort = "PassiveFail",
            endQuest = "17509395813392304465",
            endPort = "Fail"
          },
          {
            startQuest = "17509395813392304463",
            startPort = "QuestStart",
            endQuest = "17509400736893618707",
            endPort = "In"
          },
          {
            startQuest = "17509400736893618707",
            startPort = "Out",
            endQuest = "17509395813392304466",
            endPort = "In"
          }
        },
        nodeData = {
          ["17509395813392304463"] = {
            key = "17509395813392304463",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2475.7017953311065, y = 830.0496725496726},
            propsData = {ModeType = 0}
          },
          ["17509395813392304464"] = {
            key = "17509395813392304464",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3309.2017229837793, y = 834.8985216555111},
            propsData = {ModeType = 0}
          },
          ["17509395813392304465"] = {
            key = "17509395813392304465",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3303.137717406502, y = 971.1053483953211},
            propsData = {}
          },
          ["17509395813392304466"] = {
            key = "17509395813392304466",
            type = "GoToNode",
            name = "\230\151\160\231\148\177\231\148\159\231\142\169\230\179\149\231\155\146\229\173\144",
            pos = {x = 2756.1056801480713, y = 829.2375775029536},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010032,
              GuideType = "M",
              GuidePointName = "Mechanism_12020212_2010045"
            }
          },
          ["17509395813392304467"] = {
            key = "17509395813392304467",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3615.191280412726, y = 982.0982122826244},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          ["17509396694982305116"] = {
            key = "17509396694982305116",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\230\151\160\231\148\177\231\148\159\231\142\169\230\179\149",
            pos = {x = 3017.7015686226396, y = 783.4964504649681},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          },
          ["17509400620683618502"] = {
            key = "17509400620683618502",
            type = "SkipRegionNode",
            name = "\228\188\160\233\128\129\229\136\176\230\151\160\231\148\177\231\148\159",
            pos = {x = 3126.85632436253, y = 598.8616483907604},
            propsData = {
              ModeType = 0,
              Id = 0,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17509400736893618707"] = {
            key = "17509400736893618707",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2705.8063243625306, y = 683.7616483907601},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Point12020212",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
