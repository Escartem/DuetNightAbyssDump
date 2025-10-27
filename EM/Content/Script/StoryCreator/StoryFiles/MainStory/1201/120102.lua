return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17369484810791364173",
      startPort = "Success",
      endStory = "17369484810791364174",
      endPort = "In"
    },
    {
      startStory = "17369484810791364174",
      startPort = "Success",
      endStory = "17369484810791364175",
      endPort = "In"
    },
    {
      startStory = "17369484810791364176",
      startPort = "Success",
      endStory = "17369484810791364177",
      endPort = "In"
    },
    {
      startStory = "17292421988657900909",
      startPort = "Success",
      endStory = "17369484810791364183",
      endPort = "StoryEnd"
    },
    {
      startStory = "17369484810791364182",
      startPort = "StoryStart",
      endStory = "17388274279851012769",
      endPort = "In"
    },
    {
      startStory = "17388274279851012769",
      startPort = "Success",
      endStory = "173883315853110094544",
      endPort = "In"
    },
    {
      startStory = "173883315853110094544",
      startPort = "Success",
      endStory = "17388990773701773657",
      endPort = "In"
    },
    {
      startStory = "17388990773701773657",
      startPort = "Success",
      endStory = "17369484810791364173",
      endPort = "In"
    },
    {
      startStory = "17369484810791364179",
      startPort = "Success",
      endStory = "17369484810791364181",
      endPort = "In"
    },
    {
      startStory = "17369484810791364181",
      startPort = "Success",
      endStory = "17492849336551852877",
      endPort = "In"
    },
    {
      startStory = "17492849336551852877",
      startPort = "Success",
      endStory = "17292421988657900909",
      endPort = "In"
    },
    {
      startStory = "17369484810791364175",
      startPort = "Success",
      endStory = "17512639315923966182",
      endPort = "In"
    },
    {
      startStory = "17512639315923966182",
      startPort = "Success",
      endStory = "17369484810791364176",
      endPort = "In"
    },
    {
      startStory = "17512790288048897076",
      startPort = "Success",
      endStory = "17369484810791364179",
      endPort = "In"
    },
    {
      startStory = "17369484810791364178",
      startPort = "Success",
      endStory = "17532380571306650",
      endPort = "In"
    },
    {
      startStory = "17532380571306650",
      startPort = "Success",
      endStory = "17512790288048897076",
      endPort = "In"
    },
    {
      startStory = "17369484810791364177",
      startPort = "Success",
      endStory = "175325486419625280",
      endPort = "In"
    },
    {
      startStory = "175325486419625280",
      startPort = "Success",
      endStory = "17369484810791364178",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17292421988657900909"] = {
      isStoryNode = true,
      key = "17292421988657900909",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\230\180\158\231\169\180",
      pos = {x = 2816.195896028314, y = 518.0878976334598},
      propsData = {
        QuestId = 12010213,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_11",
        QuestDeatil = "Content_120102_11",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
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
            startQuest = "17292422763939040015",
            startPort = "Out",
            endQuest = "17292421988657900914",
            endPort = "Success"
          },
          {
            startQuest = "17292421988657900913",
            startPort = "QuestStart",
            endQuest = "17532587076455961",
            endPort = "In"
          },
          {
            startQuest = "17532587076455961",
            startPort = "Out",
            endQuest = "17292422763939040015",
            endPort = "In"
          }
        },
        nodeData = {
          ["17292421988657900913"] = {
            key = "17292421988657900913",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2019.3017953311064, y = 809.6496725496727},
            propsData = {ModeType = 0}
          },
          ["17292421988657900914"] = {
            key = "17292421988657900914",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3074.350048342631, y = 813.3257943827839},
            propsData = {ModeType = 0}
          },
          ["17292421988657900915"] = {
            key = "17292421988657900915",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4029.3877174065015, y = 949.8553483953211},
            propsData = {}
          },
          ["17292422763939040015"] = {
            key = "17292422763939040015",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\230\180\158\231\169\180\229\137\141\229\190\128\229\135\186\229\143\163",
            pos = {x = 2722.6048745626786, y = 795.1059985555853},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040032,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010210"
            }
          },
          ["17532587076455961"] = {
            key = "17532587076455961",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2392.926315789473, y = 796.0842105263159},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040068,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2040068"
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810791364173"] = {
      isStoryNode = true,
      key = "17369484810791364173",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\173\162\230\181\129\230\137\128\229\156\168\229\164\132",
      pos = {x = 2009.0013446036467, y = 297.83367401014453},
      propsData = {
        QuestId = 12010204,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_1",
        QuestDeatil = "Content_120102_1_3",
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
            startQuest = "17369484810791364188",
            startPort = "Out",
            endQuest = "17369484810791364189",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364189",
            startPort = "Out",
            endQuest = "17290599594902064235",
            endPort = "In"
          },
          {
            startQuest = "17290599594902064235",
            startPort = "Out",
            endQuest = "17369484810791364185",
            endPort = "Success"
          },
          {
            startQuest = "17369484810791364184",
            startPort = "QuestStart",
            endQuest = "17369484810791364187",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364187",
            startPort = "Out",
            endQuest = "17369484810791364188",
            endPort = "In"
          }
        },
        nodeData = {
          ["1729059253065375726"] = {
            key = "1729059253065375726",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1681.7170742110673, y = 204.3906846077901},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104110,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_2110016"
            }
          },
          ["17290599594902064235"] = {
            key = "17290599594902064235",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\187\135\230\152\159\229\174\162",
            pos = {x = 3193.755994968925, y = 446.35302065505556},
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
          ["17369484810791364184"] = {
            key = "17369484810791364184",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1649.6403432094223, y = 463.541474972396},
            propsData = {ModeType = 0}
          },
          ["17369484810791364185"] = {
            key = "17369484810791364185",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3457.4761319143345, y = 449.2177291440158},
            propsData = {ModeType = 0}
          },
          ["17369484810791364186"] = {
            key = "17369484810791364186",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17369484810791364187"] = {
            key = "17369484810791364187",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\187\135\230\152\159\229\174\162\227\128\129\230\173\162\230\181\129\231\173\137",
            pos = {x = 1998.8408320321937, y = 461.2064740814742},
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
          ["17369484810791364188"] = {
            key = "17369484810791364188",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 2399.27480620155, y = 436.97120247323716},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110023,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010203"
            }
          },
          ["17369484810791364189"] = {
            key = "17369484810791364189",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\173\162\230\181\129\229\146\140\231\187\135\230\152\159\229\174\162 Fixsimple04",
            pos = {x = 2763.3142798857616, y = 406.32909721007934},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010709,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_14",
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
          ["173891339213311899134"] = {
            key = "173891339213311899134",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 2164.4553571428573, y = 168.94642857142867},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110016,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110016"
            }
          },
          ["173891342852511899983"] = {
            key = "173891342852511899983",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 2231.3303571428573, y = 607.0714285714286},
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
    ["17369484810791364174"] = {
      isStoryNode = true,
      key = "17369484810791364174",
      type = "StoryNode",
      name = "\229\146\140\230\173\162\230\181\129\228\186\164\232\176\136",
      pos = {x = 2274.6991200058965, y = 302.71700375239755},
      propsData = {
        QuestId = 12010205,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_2",
        QuestDeatil = "Content_120102_2",
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
            startQuest = "175178041573812681314",
            startPort = "Out",
            endQuest = "17369484810791364191",
            endPort = "Success"
          },
          {
            startQuest = "17369484810791364190",
            startPort = "QuestStart",
            endQuest = "17369484810791364193",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364193",
            startPort = "Out",
            endQuest = "175178276846115536927",
            endPort = "In"
          },
          {
            startQuest = "175178276846115536927",
            startPort = "Out",
            endQuest = "175178041573812681314",
            endPort = "In"
          }
        },
        nodeData = {
          ["17369484810791364190"] = {
            key = "17369484810791364190",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2225.842157842158, y = 814.9000999000999},
            propsData = {ModeType = 0}
          },
          ["17369484810791364191"] = {
            key = "17369484810791364191",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3253.5682989424367, y = 802.8310679741716},
            propsData = {ModeType = 0}
          },
          ["17369484810791364192"] = {
            key = "17369484810791364192",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3252.0076550136523, y = 974.5287414983818},
            propsData = {}
          },
          ["17369484810791364193"] = {
            key = "17369484810791364193",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\228\186\164\232\176\136 Fixsimple05",
            pos = {x = 2593.539870850309, y = 800.0276008943412},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Zhiliu_2110020",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_15",
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
          ["175178041573812681314"] = {
            key = "175178041573812681314",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\173\162\230\181\129",
            pos = {x = 2927.6, y = 800.9714285714284},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110026}
            }
          },
          ["175178276846115536927"] = {
            key = "175178276846115536927",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\173\162\230\181\129",
            pos = {x = 2863.15944055944, y = 987.7270729270731},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110020}
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810791364175"] = {
      isStoryNode = true,
      key = "17369484810791364175",
      type = "StoryNode",
      name = "\230\139\191\230\173\162\230\181\129\231\154\132\231\155\152\231\188\160",
      pos = {x = 2521.281907846038, y = 300.207503117897},
      propsData = {
        QuestId = 12010206,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_3",
        QuestDeatil = "Content_120102_3",
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
        StoryGuidePointName = "QuestPoint_12010203"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17290625374963379760",
            startPort = "Out",
            endQuest = "17290634601473942239",
            endPort = "In"
          },
          {
            startQuest = "17290634601473942239",
            startPort = "Out",
            endQuest = "17369484810791364195",
            endPort = "Success"
          },
          {
            startQuest = "17369484810791364194",
            startPort = "QuestStart",
            endQuest = "17536759143744009783",
            endPort = "In"
          },
          {
            startQuest = "17536759143744009783",
            startPort = "Out",
            endQuest = "17290625374963379760",
            endPort = "In"
          }
        },
        nodeData = {
          ["17290625374963379760"] = {
            key = "17290625374963379760",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2306.3471081685907, y = 824.6002011061834},
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
              GuidePointName = "QuestPoint_12010206",
              IsUseCount = false
            }
          },
          ["17290634601473942239"] = {
            key = "17290634601473942239",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\228\186\164\232\176\136 Fixsimple06",
            pos = {x = 2571.4481942170455, y = 825.2327199031761},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Zhiliu_2110026",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010901,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_16",
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
          ["17369484810791364194"] = {
            key = "17369484810791364194",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1954.1242091242098, y = 817.5496725496726},
            propsData = {ModeType = 0}
          },
          ["17369484810791364195"] = {
            key = "17369484810791364195",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2889.4495019499554, y = 846.3615191019912},
            propsData = {ModeType = 0}
          },
          ["17369484810791364196"] = {
            key = "17369484810791364196",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3089.864797870795, y = 932.6715986412389},
            propsData = {}
          },
          ["17536759143744009783"] = {
            key = "17536759143744009783",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\161\140\229\173\144",
            pos = {x = 2269.764705882353, y = 645.5147058823528},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110126}
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810791364176"] = {
      isStoryNode = true,
      key = "17369484810791364176",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\180\158\231\169\180",
      pos = {x = 3033.805613504143, y = 309.11383080900305},
      propsData = {
        QuestId = 12010207,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_4",
        QuestDeatil = "Content_120102_4",
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
            startQuest = "17291504770723375784",
            startPort = "Out",
            endQuest = "17291507154094125252",
            endPort = "In"
          },
          {
            startQuest = "17291504770723375784",
            startPort = "Out",
            endQuest = "17369484810791364198",
            endPort = "Success"
          },
          {
            startQuest = "17369484810791364197",
            startPort = "QuestStart",
            endQuest = "17369484810791364200",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364200",
            startPort = "Out",
            endQuest = "17291502761792626734",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364197",
            startPort = "QuestStart",
            endQuest = "17291504770723375784",
            endPort = "In"
          }
        },
        nodeData = {
          ["17291502761792626734"] = {
            key = "17291502761792626734",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\136\176\229\177\177\230\180\158\229\137\141",
            pos = {x = 2473.3750310175387, y = 458.3102007323972},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17291504770723375784"] = {
            key = "17291504770723375784",
            type = "GoToNode",
            name = "\232\191\155\229\133\165\230\180\158\231\169\180",
            pos = {x = 2217.254076457225, y = 786.5017666035969},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040002,
              GuideType = "P",
              GuidePointName = "RegionPoint_Cav_01"
            }
          },
          ["17291507154094125252"] = {
            key = "17291507154094125252",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\191\155\229\133\165\230\180\158\231\169\180",
            pos = {x = 2848.3761570209517, y = 592.8809754953919},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17369484810791364197"] = {
            key = "17369484810791364197",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1720.6951200972946, y = 854.8805904240686},
            propsData = {ModeType = 0}
          },
          ["17369484810791364198"] = {
            key = "17369484810791364198",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2836.5972263333774, y = 795.9272450109664},
            propsData = {ModeType = 0}
          },
          ["17369484810791364199"] = {
            key = "17369484810791364199",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3209.403499697826, y = 974.4285271945063},
            propsData = {}
          },
          ["17369484810791364200"] = {
            key = "17369484810791364200",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 2166.6909022172763, y = 552.7111487546268},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080015,
              GuideType = "P",
              GuidePointName = "QuestPoint_120102071"
            }
          },
          ["1749450366656925211"] = {
            key = "1749450366656925211",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 2705.9198267407655, y = 1182.2353710362863},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110080,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110080"
            }
          },
          ["1749450370272925398"] = {
            key = "1749450370272925398",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 1725.9660019614255, y = 518.9571755475646},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110081,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110081"
            }
          },
          ["1749450371046925434"] = {
            key = "1749450371046925434",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 1638.2330827067672, y = 1197.968045112782},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110082,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110082"
            }
          },
          ["17494507359851848546"] = {
            key = "17494507359851848546",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 2146.385093167702, y = 1079.5279503105594},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2080029,
              GuideType = "P",
              GuidePointName = "QuestPoint_120102072"
            }
          },
          ["175178074464212686160"] = {
            key = "175178074464212686160",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2731.9130434782605, y = 311.3089244851258},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    ["17369484810791364177"] = {
      isStoryNode = true,
      key = "17369484810791364177",
      type = "StoryNode",
      name = "\230\136\152\230\150\151Cav\239\188\13601\239\188\137",
      pos = {x = 1150.7151386692296, y = 497.69058768739075},
      propsData = {
        QuestId = 12010208,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_5",
        QuestDeatil = "Content_120102_5",
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
        StoryGuidePointName = "QuestPoint_120102074"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810791364201",
            startPort = "QuestStart",
            endQuest = "175325254074116706",
            endPort = "In"
          },
          {
            startQuest = "175325254074116706",
            startPort = "Out",
            endQuest = "175325267270617445",
            endPort = "In"
          },
          {
            startQuest = "175325267270617445",
            startPort = "Fail",
            endQuest = "175325282151119044",
            endPort = "In"
          },
          {
            startQuest = "175325267270617445",
            startPort = "PassiveFail",
            endQuest = "175325282151219045",
            endPort = "In"
          },
          {
            startQuest = "175325282151119044",
            startPort = "Out",
            endQuest = "17369484810791364203",
            endPort = "Fail"
          },
          {
            startQuest = "175325282151219045",
            startPort = "Out",
            endQuest = "17369484810791364203",
            endPort = "Fail"
          },
          {
            startQuest = "175325267270617445",
            startPort = "Success",
            endQuest = "17369484810791364202",
            endPort = "Success"
          },
          {
            startQuest = "175325254074116706",
            startPort = "Out",
            endQuest = "17536767814654014612",
            endPort = "In"
          }
        },
        nodeData = {
          ["17292364518763385424"] = {
            key = "17292364518763385424",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1956.7775849610375, y = 551.0315800089337},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_120102043"
            }
          },
          ["17369484810791364201"] = {
            key = "17369484810791364201",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1634.6296950176265, y = 884.6656600104875},
            propsData = {ModeType = 0}
          },
          ["17369484810791364202"] = {
            key = "17369484810791364202",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2695.9181444933047, y = 828.015621031231},
            propsData = {ModeType = 0}
          },
          ["17369484810791364203"] = {
            key = "17369484810791364203",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2986.520118338902, y = 1142.0213157612884},
            propsData = {}
          },
          ["175325254074116706"] = {
            key = "175325254074116706",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\230\180\158\231\169\180\229\134\133\230\136\152\230\150\151\228\189\141\231\189\174",
            pos = {x = 1989.2484792204104, y = 865.2158811350628},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040003,
              GuideType = "P",
              GuidePointName = "QuestPoint_120102074"
            }
          },
          ["175325267270617445"] = {
            key = "175325267270617445",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2326.7484792204104, y = 856.2158811350628},
            propsData = {SpecialConfigId = 2005, BlackScreenImmediately = false}
          },
          ["175325282151119044"] = {
            key = "175325282151119044",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2696.4022386189067, y = 1060.8887194809276},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "SQ_Cav02_QuestFailTp",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["175325282151219045"] = {
            key = "175325282151219045",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2695.894719821914, y = 1196.7430427891984},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "SQ_Cav02_QuestFailTp",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17536767814654014612"] = {
            key = "17536767814654014612",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\136\152\230\150\151\229\137\141",
            pos = {x = 2316, y = 640},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011104,
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
    ["17369484810791364178"] = {
      isStoryNode = true,
      key = "17369484810791364178",
      type = "StoryNode",
      name = "\229\146\140\231\133\156\230\152\142\231\166\187\229\188\128\230\180\158\231\169\180",
      pos = {x = 1454.0816299644289, y = 504.32410317816317},
      propsData = {
        QuestId = 12010209,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_6",
        QuestDeatil = "Content_120102_6",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2040071"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810791364208",
            startPort = "QuestStart",
            endQuest = "175325385761021091",
            endPort = "In"
          },
          {
            startQuest = "175325385761021091",
            startPort = "Out",
            endQuest = "175325390823421692",
            endPort = "In"
          },
          {
            startQuest = "175325390823421692",
            startPort = "Fail",
            endQuest = "175325447431223240",
            endPort = "In"
          },
          {
            startQuest = "175325447431223240",
            startPort = "Out",
            endQuest = "17369484810791364210",
            endPort = "Fail"
          },
          {
            startQuest = "175325390823421692",
            startPort = "PassiveFail",
            endQuest = "17369484810791364210",
            endPort = "Fail"
          },
          {
            startQuest = "175325390823421692",
            startPort = "Success",
            endQuest = "17369484810791364209",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17369484810791364208"] = {
            key = "17369484810791364208",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1901.6283897262165, y = 883.7286023155589},
            propsData = {ModeType = 0}
          },
          ["17369484810791364209"] = {
            key = "17369484810791364209",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3311.7067912900866, y = 826.3507985448438},
            propsData = {ModeType = 0}
          },
          ["17369484810791364210"] = {
            key = "17369484810791364210",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3374.699514139714, y = 1224.1500852374263},
            propsData = {}
          },
          ["175325385761021091"] = {
            key = "175325385761021091",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2212.8691653536494, y = 853.3349115112918},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040071,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2040071"
            }
          },
          ["175325390823421692"] = {
            key = "175325390823421692",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2557.9296845446033, y = 827.8698693071192},
            propsData = {SpecialConfigId = 2007, BlackScreenImmediately = false}
          },
          ["175325447431223240"] = {
            key = "175325447431223240",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3338.223196888812, y = 974.4808794830609},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
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
    },
    ["17369484810791364179"] = {
      isStoryNode = true,
      key = "17369484810791364179",
      type = "StoryNode",
      name = "\230\136\152\230\150\151Cav\239\188\13602\239\188\137",
      pos = {x = 2016.085460306434, y = 509.5714124879092},
      propsData = {
        QuestId = 12010210,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_7",
        QuestDeatil = "Content_120102_7",
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
            startQuest = "173960806848313829659",
            startPort = "Out",
            endQuest = "17369484810791364216",
            endPort = "Fail"
          },
          {
            startQuest = "173960807951313830005",
            startPort = "Out",
            endQuest = "17369484810791364216",
            endPort = "Fail"
          },
          {
            startQuest = "17510153296212804",
            startPort = "Out",
            endQuest = "17510153296212803",
            endPort = "In"
          },
          {
            startQuest = "173960798111013829272",
            startPort = "Success",
            endQuest = "17369484810791364215",
            endPort = "Success"
          },
          {
            startQuest = "173960798111013829272",
            startPort = "Fail",
            endQuest = "173960806848313829659",
            endPort = "In"
          },
          {
            startQuest = "173960798111013829272",
            startPort = "PassiveFail",
            endQuest = "173960807951313830005",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364214",
            startPort = "QuestStart",
            endQuest = "17512790959328898861",
            endPort = "In"
          },
          {
            startQuest = "17512790959328898861",
            startPort = "Out",
            endQuest = "173960798111013829272",
            endPort = "In"
          }
        },
        nodeData = {
          ["17369484810791364214"] = {
            key = "17369484810791364214",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2626.229664195454, y = 802.6276734960945},
            propsData = {ModeType = 0}
          },
          ["17369484810791364215"] = {
            key = "17369484810791364215",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4008.2240885492483, y = 720.4732744888846},
            propsData = {ModeType = 0}
          },
          ["17369484810791364216"] = {
            key = "17369484810791364216",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4399.968074549359, y = 849.149991252464},
            propsData = {}
          },
          ["173960798111013829272"] = {
            key = "173960798111013829272",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 3354.462793785162, y = 769.6679997633946},
            propsData = {SpecialConfigId = 2006, BlackScreenImmediately = false}
          },
          ["173960806848313829659"] = {
            key = "173960806848313829659",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4001.4485974551762, y = 846.1768724696357},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "SpawnPoint_CavSpecialQuest",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["173960807951313830005"] = {
            key = "173960807951313830005",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4009.9410786581834, y = 982.0311957779065},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "SpawnPoint_CavSpecialQuest",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17482605881373534674"] = {
            key = "17482605881373534674",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\133\156\230\152\142\229\164\132",
            pos = {x = 2728.082754010694, y = 304.3913238722061},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040035,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2040035"
            }
          },
          ["17510153296212803"] = {
            key = "17510153296212803",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3649.576829383928, y = 1086.108305575661},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 30,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17510153296212804"] = {
            key = "17510153296212804",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 3400.2233617293045, y = 1002.041918326608},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01CavSQCreateMonster",
              UnitId = -1
            }
          },
          ["17512790959328898861"] = {
            key = "17512790959328898861",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2963.5936532507735, y = 790.3401702786377},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040093,
              GuideType = "M",
              GuidePointName = "QuestPoint_CavSpecialQuest"
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810791364181"] = {
      isStoryNode = true,
      key = "17369484810791364181",
      type = "StoryNode",
      name = "\232\175\162\233\151\174\231\133\156\230\152\142\228\188\164\229\138\191",
      pos = {x = 2283.268079004908, y = 520.8012719994147},
      propsData = {
        QuestId = 12010211,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_9",
        QuestDeatil = "Content_120102_9",
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
        StoryGuidePointName = "QuestPoint_CavSpecialQuest"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810791364224",
            startPort = "QuestStart",
            endQuest = "17482622621954418428",
            endPort = "In"
          },
          {
            startQuest = "17482622621954418428",
            startPort = "Out",
            endQuest = "17369484810791364227",
            endPort = "In"
          },
          {
            startQuest = "17369484810791364227",
            startPort = "Out",
            endQuest = "17369484810791364225",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17369484810791364224"] = {
            key = "17369484810791364224",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2117.2017953311065, y = 809.2996725496726},
            propsData = {ModeType = 0}
          },
          ["17369484810791364225"] = {
            key = "17369484810791364225",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3063.1789957110523, y = 825.4279921849816},
            propsData = {ModeType = 0}
          },
          ["17369484810791364226"] = {
            key = "17369484810791364226",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4029.3877174065015, y = 949.8553483953211},
            propsData = {}
          },
          ["17369484810791364227"] = {
            key = "17369484810791364227",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\133\156\230\152\142\229\175\146\230\154\132 Fixsimple09",
            pos = {x = 2748.2844683780813, y = 806.7591283226892},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_19",
              BlendInTime = 1,
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
          ["17482622621954418428"] = {
            key = "17482622621954418428",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2420.9191729323306, y = 807.7434210526314},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2040028}
            }
          },
          ["17532622191855833447"] = {
            key = "17532622191855833447",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\133\156\230\152\142\229\175\146\230\154\132 Fixsimple09",
            pos = {x = 2986, y = 479.9999999999999},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210007,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Yuming_2040028",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12012001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_19",
              BlendInTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["17369484810791364182"] = {
      isStoryNode = true,
      key = "17369484810791364182",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 866.0704584040748, y = 292.4855687606112},
      propsData = {QuestChainId = 120102},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17369484810791364183"] = {
      isStoryNode = true,
      key = "17369484810791364183",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3234.3203437284205, y = 558.7583356894143},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17388274279851012769"] = {
      isStoryNode = true,
      key = "17388274279851012769",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
      pos = {x = 1150.8548805121727, y = 303.4350836671891},
      propsData = {
        QuestId = 12010201,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_1_1",
        QuestDeatil = "Content_120102_1_1",
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
            startQuest = "17388274279861012780",
            startPort = "Out",
            endQuest = "17388274279861012781",
            endPort = "In"
          },
          {
            startQuest = "17388274279861012776",
            startPort = "QuestStart",
            endQuest = "17388274279861012780",
            endPort = "In"
          },
          {
            startQuest = "17388274279861012781",
            startPort = "Out",
            endQuest = "17388274279861012777",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17388274279861012776"] = {
            key = "17388274279861012776",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2223.580919080919, y = 453.91258741258736},
            propsData = {ModeType = 0}
          },
          ["17388274279861012777"] = {
            key = "17388274279861012777",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3018.183112433815, y = 460.92633304011974},
            propsData = {ModeType = 0}
          },
          ["17388274279861012778"] = {
            key = "17388274279861012778",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17388274279861012780"] = {
            key = "17388274279861012780",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\189\233\190\153\231\165\160\229\160\130",
            pos = {x = 2517.1092217859655, y = 442.74879987583466},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110009,
              GuideType = "P",
              GuidePointName = "TargetPoint_Spr_In"
            }
          },
          ["17388274279861012781"] = {
            key = "17388274279861012781",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\153\189\233\190\153\231\165\160\229\160\130",
            pos = {x = 2764.2233707948526, y = 446.840460846443},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010601,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_12",
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
          }
        },
        commentData = {}
      }
    },
    ["173883315853110094544"] = {
      isStoryNode = true,
      key = "173883315853110094544",
      type = "StoryNode",
      name = "\229\146\140\233\166\153\229\174\152\229\175\185\232\175\157",
      pos = {x = 1439.2447606189387, y = 302.10778552234837},
      propsData = {
        QuestId = 12010202,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_1_2",
        QuestDeatil = "Content_120102_1_2",
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
            startQuest = "173883315853110094553",
            startPort = "Out",
            endQuest = "173883315853110094550",
            endPort = "Success"
          },
          {
            startQuest = "173883315853110094549",
            startPort = "QuestStart",
            endQuest = "173883315853110094553",
            endPort = "In"
          }
        },
        nodeData = {
          ["173883315853110094549"] = {
            key = "173883315853110094549",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2484.4170535347007, y = 428.0848563201504},
            propsData = {ModeType = 0}
          },
          ["173883315853110094550"] = {
            key = "173883315853110094550",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3060.1529762414075, y = 435.50862802708},
            propsData = {ModeType = 0}
          },
          ["173883315853110094551"] = {
            key = "173883315853110094551",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173883315853110094553"] = {
            key = "173883315853110094553",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\228\184\138\233\166\153",
            pos = {x = 2780.7300091868865, y = 419.15051590294837},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210034,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Xiangguan_2110011",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 12010616,
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
          }
        },
        commentData = {}
      }
    },
    ["17388990773701773657"] = {
      isStoryNode = true,
      key = "17388990773701773657",
      type = "StoryNode",
      name = "\229\146\140\231\154\142\231\154\142\229\145\138\229\136\171",
      pos = {x = 1729.0967320261436, y = 298.264705882353},
      propsData = {
        QuestId = 12010203,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_1_3",
        QuestDeatil = "Content_120102_1_3",
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
        StoryGuidePointName = "Mechanism_QuestTrigger_2110012"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17388990773701773662",
            startPort = "QuestStart",
            endQuest = "17389084046783798772",
            endPort = "In"
          },
          {
            startQuest = "17388990773701773662",
            startPort = "QuestStart",
            endQuest = "174952187984429545462",
            endPort = "In"
          },
          {
            startQuest = "174952187984429545462",
            startPort = "Out",
            endQuest = "17389084046783798771",
            endPort = "In"
          },
          {
            startQuest = "17389084046783798772",
            startPort = "Out",
            endQuest = "1755085004012922947",
            endPort = "In"
          },
          {
            startQuest = "1755085004012922947",
            startPort = "Out",
            endQuest = "17388990773701773663",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17388990773701773662"] = {
            key = "17388990773701773662",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2659.8398476523475, y = 454.5554445554445},
            propsData = {ModeType = 0}
          },
          ["17388990773701773663"] = {
            key = "17388990773701773663",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3537.0134695766724, y = 465.27454732583396},
            propsData = {ModeType = 0}
          },
          ["17388990773701773664"] = {
            key = "17388990773701773664",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17389084046783798771"] = {
            key = "17389084046783798771",
            type = "TalkNode",
            name = "\229\188\128\232\189\166 - \230\137\190\230\173\162\230\181\129",
            pos = {x = 3235.2892080745346, y = 281.03299689440996},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010617,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17389084046783798772"] = {
            key = "17389084046783798772",
            type = "GoToNode",
            name = "\229\145\138\229\136\171\231\154\142\231\154\142",
            pos = {x = 2944.696816770187, y = 454.9759316770185},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110012,
              GuideType = "P",
              GuidePointName = "TargetPoint_Spr_Cen02"
            }
          },
          ["17389099488455823680"] = {
            key = "17389099488455823680",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\154\142\231\154\142\229\149\134\233\147\186",
            pos = {x = 3324.267857142858, y = 47.48214285714289},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_13",
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
          ["174952187984429545462"] = {
            key = "174952187984429545462",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2946.25, y = 303},
            propsData = {WaitTime = 1}
          },
          ["1755085004012922947"] = {
            key = "1755085004012922947",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3233.0809523809526, y = 452.58571428571423},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/MainStory/1201/12010701.12010701'",
              TalkType = "FixSimple",
              TalkStageName = "",
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
          }
        },
        commentData = {}
      }
    },
    ["17492849336551852877"] = {
      isStoryNode = true,
      key = "17492849336551852877",
      type = "StoryNode",
      name = "\232\151\143\229\140\191\231\133\156\230\152\142",
      pos = {x = 2552.692481942611, y = 522.4514113337643},
      propsData = {
        QuestId = 12010212,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_10",
        QuestDeatil = "Content_120102_10",
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
        StoryGuidePointName = "QuestPoint_CavSpecialQuest"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17492849336551852878",
            startPort = "QuestStart",
            endQuest = "17536780029048011062",
            endPort = "In"
          },
          {
            startQuest = "17536780029048011062",
            startPort = "Out",
            endQuest = "17494348279654009",
            endPort = "In"
          },
          {
            startQuest = "17494348279654009",
            startPort = "Out",
            endQuest = "17492849336551852881",
            endPort = "Success"
          },
          {
            startQuest = "17492849336551852878",
            startPort = "QuestStart",
            endQuest = "17536781225948011914",
            endPort = "In"
          }
        },
        nodeData = {
          ["17492849336551852878"] = {
            key = "17492849336551852878",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 772.8571428571429, y = 417.14285714285717},
            propsData = {ModeType = 0}
          },
          ["17492849336551852881"] = {
            key = "17492849336551852881",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1825.4619883040937, y = 421.5438596491228},
            propsData = {ModeType = 0}
          },
          ["17492849336551852884"] = {
            key = "17492849336551852884",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1893.6842105263158, y = 714.2105263157895},
            propsData = {}
          },
          ["17494348279654009"] = {
            key = "17494348279654009",
            type = "TalkNode",
            name = "\227\128\14420\227\128\145\232\151\143\229\165\189\231\133\156\230\152\142Fixsimple09",
            pos = {x = 1473.762841587852, y = 426.759350801907},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012029,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_20",
              BlendInTime = 0,
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
              EndNewTargetPointName = "East01_12012033",
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
          ["17494348279654010"] = {
            key = "17494348279654010",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1112.576232247285, y = 222.7962047536485},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2040033}
            }
          },
          ["17494348279654011"] = {
            key = "17494348279654011",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1490.8857560568088, y = 114.34382380126749},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2040028, 2040033}
            }
          },
          ["17536780029048011062"] = {
            key = "17536780029048011062",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1139.7142857142858, y = 431.1428571428571},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040067,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2040067"
            }
          },
          ["17536781225948011914"] = {
            key = "17536781225948011914",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1144, y = 650},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012040,
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
    ["17512639315923966182"] = {
      isStoryNode = true,
      key = "17512639315923966182",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\180\158\231\169\180",
      pos = {x = 2770.7705541026476, y = 305.31419581562614},
      propsData = {
        QuestId = 12010250,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_4",
        QuestDeatil = "Content_120102_4",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
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
        StoryGuidePointName = "Mechanism_QuestTrigger_2110081",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512639315923966191",
            startPort = "QuestStart",
            endQuest = "17512640000443966691",
            endPort = "In"
          },
          {
            startQuest = "17512640000443966691",
            startPort = "Out",
            endQuest = "17512639315923966192",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17512639315923966191"] = {
            key = "17512639315923966191",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1623.564685314686, y = 936.2718947718947},
            propsData = {ModeType = 0}
          },
          ["17512639315923966192"] = {
            key = "17512639315923966192",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3196.8829406190916, y = 909.3558164395379},
            propsData = {ModeType = 0}
          },
          ["17512639315923966193"] = {
            key = "17512639315923966193",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3201.403499697826, y = 1162.4285271945064},
            propsData = {}
          },
          ["17512639315923966197"] = {
            key = "17512639315923966197",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180",
            pos = {x = 1638.2330827067672, y = 1197.968045112782},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110082,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110082"
            }
          },
          ["17512640000443966691"] = {
            key = "17512640000443966691",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2272, y = 936},
            propsData = {WaitTime = 4}
          }
        },
        commentData = {}
      }
    },
    ["17512790288048897076"] = {
      isStoryNode = true,
      key = "17512790288048897076",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\231\133\156\230\152\142",
      pos = {x = 2023.5779808338664, y = 697.6458531238582},
      propsData = {
        QuestId = 12010251,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_7",
        QuestDeatil = "Content_120102_7",
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
            startQuest = "175178217377812692667",
            startPort = "Out",
            endQuest = "1752734412159967035",
            endPort = "In"
          },
          {
            startQuest = "1752734412159967035",
            startPort = "Out",
            endQuest = "17512790288048897082",
            endPort = "Success"
          },
          {
            startQuest = "17512790288048897081",
            startPort = "QuestStart",
            endQuest = "17512790610608898116",
            endPort = "In"
          },
          {
            startQuest = "17512790610608898116",
            startPort = "Out",
            endQuest = "175178217377812692667",
            endPort = "In"
          }
        },
        nodeData = {
          ["17512790288048897081"] = {
            key = "17512790288048897081",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1984.5980852480857, y = 804.8908313908314},
            propsData = {ModeType = 0}
          },
          ["17512790288048897082"] = {
            key = "17512790288048897082",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3480.0661938124063, y = 820.025906067832},
            propsData = {ModeType = 0}
          },
          ["17512790288048897083"] = {
            key = "17512790288048897083",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3528.389127180938, y = 1029.1499912524641},
            propsData = {}
          },
          ["17512790610608898115"] = {
            key = "17512790610608898115",
            type = "TalkNode",
            name = "\227\128\144SC004\227\128\145\228\184\187\232\167\146\229\138\160\229\133\165\230\136\152\230\150\151",
            pos = {x = 2981.127304467978, y = 1048.328765313634},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011801,
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
          },
          ["17512790610608898116"] = {
            key = "17512790610608898116",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\133\156\230\152\142\229\164\132",
            pos = {x = 2365.9744345137124, y = 790.4811298995121},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040034,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2040034"
            }
          },
          ["175178161624712690686"] = {
            key = "175178161624712690686",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\132\154\229\141\176",
            pos = {x = 2845.6730769230767, y = 599.8653846153846},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040048,
                2040049,
                2040057
              }
            }
          },
          ["175178217377812692667"] = {
            key = "175178217377812692667",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2797.3245379334626, y = 794.9480285161063},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040093,
              GuideType = "M",
              GuidePointName = "QuestPoint_CavSpecialQuest"
            }
          },
          ["175179262056619334338"] = {
            key = "175179262056619334338",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\184\228\189\147",
            pos = {x = 3141.3680161943325, y = 652.4271255060728},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040058,
                2040059,
                2040060,
                2040061,
                2040062,
                2040063
              }
            }
          },
          ["1752734412159967035"] = {
            key = "1752734412159967035",
            type = "TalkNode",
            name = "\227\128\144SC004\227\128\145\228\184\187\232\167\146\229\138\160\229\133\165\230\136\152\230\150\151",
            pos = {x = 3152.75, y = 804.5},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC004/SQ_Ver0101_SC004",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
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
    ["17532380571306650"] = {
      isStoryNode = true,
      key = "17532380571306650",
      type = "StoryNode",
      name = "\232\183\159\233\154\143Cav\239\188\13603\239\188\137",
      pos = {x = 1727.8104671893568, y = 506.36069065343275},
      propsData = {
        QuestId = 12010252,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_6",
        QuestDeatil = "Content_120102_6",
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
        StoryGuidePointName = "RegionPoint_Cav_03"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17532380571326665",
            startPort = "Out",
            endQuest = "17532380571326667",
            endPort = "In"
          },
          {
            startQuest = "17532380571326667",
            startPort = "Out",
            endQuest = "17532380571326668",
            endPort = "In"
          },
          {
            startQuest = "17532380571326668",
            startPort = "Out",
            endQuest = "17532380571306659",
            endPort = "In"
          },
          {
            startQuest = "17532380571306659",
            startPort = "Out",
            endQuest = "17532380571326661",
            endPort = "Success"
          },
          {
            startQuest = "17532380571306660",
            startPort = "QuestStart",
            endQuest = "17532380571326664",
            endPort = "In"
          },
          {
            startQuest = "17532380571326664",
            startPort = "Out",
            endQuest = "17532380571326665",
            endPort = "In"
          }
        },
        nodeData = {
          ["17532380571306657"] = {
            key = "17532380571306657",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2199.7650925454614, y = 1242.6727385134027},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010206"
            }
          },
          ["17532380571306659"] = {
            key = "17532380571306659",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\145\138\229\136\171\231\133\156\230\152\142 Fixsimple08",
            pos = {x = 3427.6671042367216, y = 842.7226893401285},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011702,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_18a",
              BlendInTime = 0,
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
          ["17532380571306660"] = {
            key = "17532380571306660",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2018.7437743416012, y = 812.1420638540204},
            propsData = {ModeType = 0}
          },
          ["17532380571326661"] = {
            key = "17532380571326661",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4160.127843921666, y = 869.0876406501069},
            propsData = {ModeType = 0}
          },
          ["17532380571326662"] = {
            key = "17532380571326662",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4131.015303613398, y = 1006.2553483953211},
            propsData = {}
          },
          ["17532380571326664"] = {
            key = "17532380571326664",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180\229\135\186\229\143\163",
            pos = {x = 2351.743112328247, y = 784.1557420154227},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040046,
              GuideType = "P",
              GuidePointName = "RegionPoint_Cav_03"
            }
          },
          ["17532380571326665"] = {
            key = "17532380571326665",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\145\138\229\136\171\231\133\156\230\152\142 Fixsimple08",
            pos = {x = 2690.210458870593, y = 777.9525000466633},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_18",
              BlendInTime = 1,
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
          ["17532380571326667"] = {
            key = "17532380571326667",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 2909.727568754774, y = 992.2446683218741},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {2040045}
            }
          },
          ["17532380571326668"] = {
            key = "17532380571326668",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\180\158\231\169\180\229\135\186\229\143\163",
            pos = {x = 3125.4955882352942, y = 787.4789215686274},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040016,
              GuideType = "P",
              GuidePointName = "QuestPoint_120102091"
            }
          }
        },
        commentData = {}
      }
    },
    ["175325486419625280"] = {
      isStoryNode = true,
      key = "175325486419625280",
      type = "StoryNode",
      name = "\230\136\152\230\150\151\231\187\147\230\157\159\229\144\142\229\175\185\232\175\157",
      pos = {x = 1294.033258485979, y = 682.1837594426677},
      propsData = {
        QuestId = 12010253,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_5",
        QuestDeatil = "Content_120102_5",
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
        StoryGuidePointName = "QuestPoint_120102074"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175325491235926549",
            startPort = "Out",
            endQuest = "175325491235926550",
            endPort = "In"
          },
          {
            startQuest = "175325486419625281",
            startPort = "QuestStart",
            endQuest = "175325491235926549",
            endPort = "In"
          },
          {
            startQuest = "175325491235926550",
            startPort = "Out",
            endQuest = "175325486419625284",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325486419625281"] = {
            key = "175325486419625281",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325486419625284"] = {
            key = "175325486419625284",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1910, y = 318},
            propsData = {ModeType = 0}
          },
          ["175325486419625287"] = {
            key = "175325486419625287",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["175325491235926549"] = {
            key = "175325491235926549",
            type = "TalkNode",
            name = "\227\128\144SC003\227\128\145\231\133\156\230\152\142\231\153\187\229\156\186",
            pos = {x = 1163.8585584951688, y = 293.8895182474904},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC003/SQ_Ver0101_SC003",
              BlendInTime = 0.5,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["175325491235926550"] = {
            key = "175325491235926550",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\136\157\233\129\135\231\133\156\230\152\142 Fixsimple07",
            pos = {x = 1506.1414415048316, y = 294.1104817525095},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_17",
              BlendInTime = 0,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
