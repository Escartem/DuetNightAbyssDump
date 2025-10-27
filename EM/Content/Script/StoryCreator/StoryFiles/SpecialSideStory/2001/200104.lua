return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175101094740812182138",
      startPort = "StoryStart",
      endStory = "175101094740812182140",
      endPort = "In"
    },
    {
      startStory = "175101094740812182144",
      startPort = "Success",
      endStory = "175101094740812182145",
      endPort = "In"
    },
    {
      startStory = "175101094740812182143",
      startPort = "Success",
      endStory = "175101094740812182147",
      endPort = "In"
    },
    {
      startStory = "175101094740812182147",
      startPort = "Success",
      endStory = "175101094740812182144",
      endPort = "In"
    },
    {
      startStory = "175101094740812182141",
      startPort = "Success",
      endStory = "175101094740812182142",
      endPort = "In"
    },
    {
      startStory = "175101094740812182142",
      startPort = "Success",
      endStory = "175101094740812182143",
      endPort = "In"
    },
    {
      startStory = "175101094740812182146",
      startPort = "Success",
      endStory = "175101094740812182139",
      endPort = "StoryEnd"
    },
    {
      startStory = "175101094740812182140",
      startPort = "Success",
      endStory = "175101094740812182148",
      endPort = "In"
    },
    {
      startStory = "175101094740812182148",
      startPort = "Success",
      endStory = "175101094740812182141",
      endPort = "In"
    },
    {
      startStory = "1750936510430996116",
      startPort = "Success",
      endStory = "175101094740812182146",
      endPort = "In"
    },
    {
      startStory = "175101094740812182145",
      startPort = "Success",
      endStory = "1756089257099635507",
      endPort = "In"
    },
    {
      startStory = "1756089257099635507",
      startPort = "Success",
      endStory = "1750936510430996116",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1750936510430996116"] = {
      isStoryNode = true,
      key = "1750936510430996116",
      type = "StoryNode",
      name = "\230\138\147\230\141\149\229\174\160\231\137\169",
      pos = {x = 1995.5034899508287, y = 488.86973857568825},
      propsData = {
        QuestId = 20010415,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_9",
        QuestDeatil = "Content_200104_9",
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
        SubRegionId = 101702,
        StoryGuideType = "Point",
        StoryGuidePointName = "pPlayer20010407a"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1750936607464997409",
            startPort = "Out",
            endQuest = "1750936510430996120",
            endPort = "Success"
          },
          {
            startQuest = "1750936750092999407",
            startPort = "Out",
            endQuest = "1750936607464997409",
            endPort = "In"
          },
          {
            startQuest = "1750936762493999662",
            startPort = "Out",
            endQuest = "1750936750092999407",
            endPort = "In"
          },
          {
            startQuest = "1750936510430996117",
            startPort = "QuestStart",
            endQuest = "1750936762493999662",
            endPort = "In"
          }
        },
        nodeData = {
          ["1750936510430996117"] = {
            key = "1750936510430996117",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750936510430996120"] = {
            key = "1750936510430996120",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2183.1304347826085, y = 306.3478260869565},
            propsData = {
              ModeType = 1,
              Id = 101107,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750936510430996123"] = {
            key = "1750936510430996123",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2188.6956521739135, y = 518.4347826086956},
            propsData = {}
          },
          ["1750936607464997409"] = {
            key = "1750936607464997409",
            type = "TalkNode",
            name = "\233\187\145\229\185\149\230\150\135\229\173\151",
            pos = {x = 1753.217391304348, y = 288.4347826086956},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006801,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["1750936727451998559"] = {
            key = "1750936727451998559",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1245, y = 41.80434782608691},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["1750936730267998696"] = {
            key = "1750936730267998696",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1331.5217391304348, y = 144.84782608695653},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["1750936750092999407"] = {
            key = "1750936750092999407",
            type = "TalkNode",
            name = "\232\131\156\229\136\169\231\187\147\231\174\151",
            pos = {x = 1447.6086956521738, y = 284.4130434782608},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006720,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010407",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700251,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700251},
                {TalkActorType = "Npc", TalkActorId = 200075},
                {TalkActorType = "Npc", TalkActorId = 200087}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750936762493999662"] = {
            key = "1750936762493999662",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1284.1304347826083, y = 494.41304347826093},
            propsData = {WaitTime = 5}
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182138"] = {
      isStoryNode = true,
      key = "175101094740812182138",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 656.8776635129577, y = 331.97671740024686},
      propsData = {QuestChainId = 200104},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175101094740812182139"] = {
      isStoryNode = true,
      key = "175101094740812182139",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2554.063852268156, y = 518.1545747302766},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175101094740812182140"] = {
      isStoryNode = true,
      key = "175101094740812182140",
      type = "StoryNode",
      name = "\233\133\146\233\166\134&\229\141\161\231\177\179\230\139\137",
      pos = {x = 930.5940007361058, y = 319.7859219727641},
      propsData = {
        QuestId = 20010401,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_1",
        QuestDeatil = "Content_200104_1",
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
        SubRegionId = 101107,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveTavern"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182154",
            startPort = "Out",
            endQuest = "175101094740812182150",
            endPort = "Success"
          },
          {
            startQuest = "175101094740812182149",
            startPort = "QuestStart",
            endQuest = "175101094740812182155",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182155",
            startPort = "Out",
            endQuest = "175101094740812182154",
            endPort = "In"
          }
        },
        nodeData = {
          ["175101094740812182149"] = {
            key = "175101094740812182149",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1089.2, y = 280.4},
            propsData = {ModeType = 0}
          },
          ["175101094740812182150"] = {
            key = "175101094740812182150",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2008.2285714285715, y = 274.0571428571429},
            propsData = {ModeType = 0}
          },
          ["175101094740812182151"] = {
            key = "175101094740812182151",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1614.1142857142859, y = 481.2},
            propsData = {}
          },
          ["175101094740812182152"] = {
            key = "175101094740812182152",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 1093.2253968253967, y = 481.6},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_icelakecity"
            }
          },
          ["175101094740812182153"] = {
            key = "175101094740812182153",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\233\133\146\233\166\134",
            pos = {x = 1297.9598039215687, y = 71.90492776057795},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Tavern"
            }
          },
          ["175101094740812182154"] = {
            key = "175101094740812182154",
            type = "TalkNode",
            name = "\229\141\161\231\177\179\230\139\137\229\175\185\232\175\157",
            pos = {x = 1677.5598039215686, y = 270.27635633200657},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005601,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010401",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700248,
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
                {TalkActorType = "Npc", TalkActorId = 700248},
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
          },
          ["175101094740812182155"] = {
            key = "175101094740812182155",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1382, y = 262},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1220181,
              GuideType = "N",
              GuidePointName = "Npc_Kamila_1220002"
            }
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182141"] = {
      isStoryNode = true,
      key = "175101094740812182141",
      type = "StoryNode",
      name = "\229\159\142\233\151\168\229\164\150&\230\157\190\233\156\178",
      pos = {x = 1467.2012630188492, y = 316.28700829390027},
      propsData = {
        QuestId = 20010402,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_3",
        QuestDeatil = "Content_200104_3",
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
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_IceLake4"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182161",
            startPort = "Out",
            endQuest = "175101094740812182160",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182160",
            startPort = "Out",
            endQuest = "175101094740812182168",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182168",
            startPort = "Out",
            endQuest = "175101094740812182165",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182165",
            startPort = "Out",
            endQuest = "175101094740812182157",
            endPort = "Success"
          },
          {
            startQuest = "175101094740812182156",
            startPort = "QuestStart",
            endQuest = "175101094740812182161",
            endPort = "In"
          }
        },
        nodeData = {
          ["175101094740812182156"] = {
            key = "175101094740812182156",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1024, y = 280},
            propsData = {ModeType = 0}
          },
          ["175101094740812182157"] = {
            key = "175101094740812182157",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2382.484848484849, y = 293.0214285714285},
            propsData = {
              ModeType = 1,
              Id = 101107,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["175101094740812182158"] = {
            key = "175101094740812182158",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1928.333333333333, y = 610},
            propsData = {}
          },
          ["175101094740812182159"] = {
            key = "175101094740812182159",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 1067.0966507177036, y = 47.466081871344954},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_IceLake4"
            }
          },
          ["175101094740812182160"] = {
            key = "175101094740812182160",
            type = "TalkNode",
            name = "\230\157\190\233\156\178\229\175\185\232\175\157",
            pos = {x = 1601.4444444444448, y = 279.9120518688022},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200074,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Songlu_SQ_1240876",
              DelayShowGuideTime = 0,
              FirstDialogueId = 20005701,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010402",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
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
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
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
          ["175101094740812182161"] = {
            key = "175101094740812182161",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\166\155\229\173\144/\230\157\190\233\156\178",
            pos = {x = 1313.2353535353532, y = 290.19250398724074},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240876, 1240878}
            }
          },
          ["175101094740812182162"] = {
            key = "175101094740812182162",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1602.6575757575756, y = 648.0696969696969},
            propsData = {WaitTime = 3}
          },
          ["175101094740812182163"] = {
            key = "175101094740812182163",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1054.7575757575755, y = 591.5696969696969},
            propsData = {
              ModeType = 0,
              Id = 101103,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["175101094740812182164"] = {
            key = "175101094740812182164",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1306.9575757575753, y = 592.1696969696968},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["175101094740812182165"] = {
            key = "175101094740812182165",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\166\155\229\173\144/\230\157\190\233\156\178",
            pos = {x = 2130.1398853591772, y = 288.66597119396937},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240876, 1240878}
            }
          },
          ["175101094740812182166"] = {
            key = "175101094740812182166",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1050, y = 742},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240879,
              GuideType = "N",
              GuidePointName = "Npc_Songlu_SQ_1240876"
            }
          },
          ["175101094740812182167"] = {
            key = "175101094740812182167",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1517.7608695652173, y = 104.89130434782615},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240879,
              GuideType = "M",
              GuidePointName = "Npc_Songlu_SQ_1240876"
            }
          },
          ["175101094740812182168"] = {
            key = "175101094740812182168",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1862.390037593985, y = 279.72462406015046},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005710,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
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
    ["175101094740812182142"] = {
      isStoryNode = true,
      key = "175101094740812182142",
      type = "StoryNode",
      name = "\233\133\146\233\166\134&\229\141\161\231\177\179\230\139\137",
      pos = {x = 1743.3229716507747, y = 319.47684214426056},
      propsData = {
        QuestId = 20010403,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_8",
        QuestDeatil = "Content_200104_3",
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
        SubRegionId = 101107,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Tavern"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182175",
            startPort = "Out",
            endQuest = "175101094740812182176",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182174",
            startPort = "Out",
            endQuest = "175101094740812182170",
            endPort = "Success"
          },
          {
            startQuest = "175101094740812182172",
            startPort = "Out",
            endQuest = "175101094740812182177",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182177",
            startPort = "Out",
            endQuest = "175101094740812182174",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182169",
            startPort = "QuestStart",
            endQuest = "175101094740812182179",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182179",
            startPort = "Out",
            endQuest = "175101094740812182172",
            endPort = "In"
          }
        },
        nodeData = {
          ["175101094740812182169"] = {
            key = "175101094740812182169",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 918.1515151515152, y = 300},
            propsData = {ModeType = 0}
          },
          ["175101094740812182170"] = {
            key = "175101094740812182170",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2230.8687782805428, y = 305.3416289592761},
            propsData = {ModeType = 0}
          },
          ["175101094740812182171"] = {
            key = "175101094740812182171",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1970.0452488687781, y = 507.9185520361992},
            propsData = {}
          },
          ["175101094740812182172"] = {
            key = "175101094740812182172",
            type = "TalkNode",
            name = "\229\141\161\231\177\179\230\139\137\229\175\185\232\175\157",
            pos = {x = 1406.7025974025971, y = 289.59415584415586},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005711,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010403a",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 700248,
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
                {TalkActorType = "Npc", TalkActorId = 700248},
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
          ["175101094740812182173"] = {
            key = "175101094740812182173",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\233\133\146\233\166\134",
            pos = {x = 1143.1674641148327, y = 39.06698564593313},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "TargetPoint_Tavern"
            }
          },
          ["175101094740812182174"] = {
            key = "175101094740812182174",
            type = "TalkNode",
            name = "\229\141\161\231\177\179\230\139\137\229\175\185\232\175\157",
            pos = {x = 1938.49680144417, y = 300.0130493861147},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 200057151,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010403b",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "BlendIn",
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
                  TalkActorId = 700248,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
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
                {TalkActorType = "Npc", TalkActorId = 700248},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
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
          ["175101094740812182175"] = {
            key = "175101094740812182175",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\157\190\233\156\178",
            pos = {x = 1689.787216911056, y = 108.96327563045863},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["175101094740812182176"] = {
            key = "175101094740812182176",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\166\155\229\173\144",
            pos = {x = 1688.2306558250834, y = -46.33762934691694},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["175101094740812182177"] = {
            key = "175101094740812182177",
            type = "TalkNode",
            name = "\233\187\145\229\185\149\230\150\135\229\173\151",
            pos = {x = 1662.5616093983645, y = 290.58385015397425},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005715,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["175101094740812182178"] = {
            key = "175101094740812182178",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1396.0833333333335, y = 142.20833333333337},
            propsData = {WaitTime = 0}
          },
          ["175101094740812182179"] = {
            key = "175101094740812182179",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1162, y = 298},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1220161,
              GuideType = "N",
              GuidePointName = "Npc_Kamila_1220002"
            }
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182143"] = {
      isStoryNode = true,
      key = "175101094740812182143",
      type = "StoryNode",
      name = "\232\183\145\229\155\190",
      pos = {x = 932.6158471962818, y = 491.2167680145943},
      propsData = {
        QuestId = 20010404,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_4",
        QuestDeatil = "Content_200104_4",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_icelakecity"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182184",
            startPort = "Out",
            endQuest = "175101094740812182187",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182184",
            startPort = "Out",
            endQuest = "175101094740812182186",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182186",
            startPort = "Out",
            endQuest = "175101094740812182188",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182186",
            startPort = "Out",
            endQuest = "175101094740812182189",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182188",
            startPort = "Out",
            endQuest = "175101094740812182190",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182190",
            startPort = "Out",
            endQuest = "175101094740812182191",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182191",
            startPort = "Out",
            endQuest = "175101094740812182192",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182191",
            startPort = "Out",
            endQuest = "175101094740812182193",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182193",
            startPort = "Out",
            endQuest = "175101094740812182194",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182195",
            startPort = "Out",
            endQuest = "175101094740812182196",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182194",
            startPort = "Out",
            endQuest = "175101094740812182195",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182183",
            startPort = "Out",
            endQuest = "175101094740812182201",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182201",
            startPort = "Out",
            endQuest = "175101094740812182184",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182201",
            startPort = "Out",
            endQuest = "175101094740812182185",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182196",
            startPort = "Out",
            endQuest = "175101094740812182203",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182203",
            startPort = "Out",
            endQuest = "175101094740812182204",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182202",
            startPort = "Out",
            endQuest = "175101094740812182197",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182193",
            startPort = "Out",
            endQuest = "175101094740812182207",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182193",
            startPort = "Out",
            endQuest = "175101094740812182208",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182183",
            startPort = "Out",
            endQuest = "175101094740812182206",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182206",
            startPort = "Out",
            endQuest = "175101094740812182205",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182196",
            startPort = "Out",
            endQuest = "175101094740812182209",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182197",
            startPort = "Out",
            endQuest = "175101094740812182210",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182210",
            startPort = "Out",
            endQuest = "175101094740812182181",
            endPort = "Success"
          },
          {
            startQuest = "175101094740812182204",
            startPort = "Out",
            endQuest = "175101094740812182212",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182212",
            startPort = "Out",
            endQuest = "175101094740812182211",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182211",
            startPort = "Out",
            endQuest = "175101094740812182202",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182180",
            startPort = "QuestStart",
            endQuest = "175101094740812182183",
            endPort = "In"
          }
        },
        nodeData = {
          ["175101094740812182180"] = {
            key = "175101094740812182180",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 617.946275946276, y = 295.0140415140415},
            propsData = {ModeType = 0}
          },
          ["175101094740812182181"] = {
            key = "175101094740812182181",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3386.0298643004594, y = 1108.2544960760065},
            propsData = {ModeType = 0}
          },
          ["175101094740812182182"] = {
            key = "175101094740812182182",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["175101094740812182183"] = {
            key = "175101094740812182183",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 900.1573565323565, y = 289.0039682539683},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_icelakecity"
            }
          },
          ["175101094740812182184"] = {
            key = "175101094740812182184",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1432.5989606368864, y = 290.9138655462185},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191380,
              GuideType = "M",
              GuidePointName = "Mechanism_01_SQ_1191380"
            }
          },
          ["175101094740812182185"] = {
            key = "175101094740812182185",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1154.8911862990808, y = 111.56307435254807},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182186"] = {
            key = "175101094740812182186",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1699.1508097165995, y = 296.45965876229064},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191381,
              GuideType = "M",
              GuidePointName = "Mechanism_02_SQ_1191381"
            }
          },
          ["175101094740812182187"] = {
            key = "175101094740812182187",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1438.5234754495596, y = 113.08465876229059},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005802,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182188"] = {
            key = "175101094740812182188",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1987.3087044534418, y = 298.0047715442454},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191382,
              GuideType = "M",
              GuidePointName = "Mechanism_03_SQ_1191382"
            }
          },
          ["175101094740812182189"] = {
            key = "175101094740812182189",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1711.4722382880282, y = 109.24537304800486},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005803,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182190"] = {
            key = "175101094740812182190",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1998.2485540775024, y = 450.73973395026053},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005804,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182191"] = {
            key = "175101094740812182191",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1439.5712116830543, y = 907.7224551764028},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191383,
              GuideType = "M",
              GuidePointName = "Mechanism_04_SQ_1191383"
            }
          },
          ["175101094740812182192"] = {
            key = "175101094740812182192",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1453.7817379988437, y = 654.8653123192598},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182193"] = {
            key = "175101094740812182193",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1718.0010546728815, y = 909.980747967203},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191384,
              GuideType = "M",
              GuidePointName = "Mechanism_05_SQ_1191384"
            }
          },
          ["175101094740812182194"] = {
            key = "175101094740812182194",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 2010.8993388448498, y = 897.9658067680513},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20005902,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182195"] = {
            key = "175101094740812182195",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1978.689581299707, y = 1290.1439328215642},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191385,
              GuideType = "M",
              GuidePointName = "Mechanism_06_SQ_1191385"
            }
          },
          ["175101094740812182196"] = {
            key = "175101094740812182196",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2275.317094461602, y = 1289.7941383178224},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200104c",
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
              HideAllBattleEntity = false,
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700251,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700251},
                {TalkActorType = "Npc", TalkActorId = 200075},
                {TalkActorType = "Npc", TalkActorId = 200087}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182197"] = {
            key = "175101094740812182197",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3114.006341571315, y = 1289.857880535125},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006101,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200104c",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182198"] = {
            key = "175101094740812182198",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1156, y = -346},
            propsData = {WaitTime = 3}
          },
          ["175101094740812182199"] = {
            key = "175101094740812182199",
            type = "GoToNode",
            name = "\233\133\146\233\166\134\233\151\168\229\143\163",
            pos = {x = 884.8712590299276, y = -337.95097905676414},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191380,
              GuideType = "M",
              GuidePointName = "Mechanism_01_SQ_1191380"
            }
          },
          ["175101094740812182200"] = {
            key = "175101094740812182200",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\233\133\146\233\166\134",
            pos = {x = 597.3620907509655, y = 56.19987009408521},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveTavern"
            }
          },
          ["175101094740812182201"] = {
            key = "175101094740812182201",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1155.25, y = 297.25},
            propsData = {WaitTime = 2}
          },
          ["175101094740812182202"] = {
            key = "175101094740812182202",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2846.7231756108704, y = 1288.2611808560205},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006032,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200104d",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700251,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700251},
                {TalkActorType = "Npc", TalkActorId = 200075},
                {TalkActorType = "Npc", TalkActorId = 200087}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182203"] = {
            key = "175101094740812182203",
            type = "TalkNode",
            name = "\233\187\145\229\185\149orSeq",
            pos = {x = 2279.9167567423824, y = 1451.209755919138},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006006,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["175101094740812182204"] = {
            key = "175101094740812182204",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2278.0031135639715, y = 1615.4622296822563},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006007,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200104c",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Npc", TalkActorId = 200075},
                {TalkActorType = "Npc", TalkActorId = 200087}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182205"] = {
            key = "175101094740812182205",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\173\148\231\129\181\233\153\183\233\152\1772",
            pos = {x = 916.6409769885515, y = -13.807105279562627},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191397}
            }
          },
          ["175101094740812182206"] = {
            key = "175101094740812182206",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\173\148\231\129\181\233\153\183\233\152\1771",
            pos = {x = 912.7124055599801, y = 132.8000375775803},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191396}
            }
          },
          ["175101094740812182207"] = {
            key = "175101094740812182207",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\173\148\231\129\181\233\153\183\233\152\1773",
            pos = {x = 2012.4354632040897, y = 628.8088095074047},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191398}
            }
          },
          ["175101094740812182208"] = {
            key = "175101094740812182208",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\173\148\231\129\181",
            pos = {x = 2008.9722324988686, y = 767.3233072141221},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191407}
            }
          },
          ["175101094740812182209"] = {
            key = "175101094740812182209",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\173\148\231\129\181",
            pos = {x = 2287.6500678954903, y = 1124.3497686524004},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191407}
            }
          },
          ["175101094740812182210"] = {
            key = "175101094740812182210",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\173\148\231\129\181\233\153\183\233\152\177",
            pos = {x = 3095.4542636996866, y = 1111.5502348528664},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191398,
                1191396,
                1191397
              }
            }
          },
          ["175101094740812182211"] = {
            key = "175101094740812182211",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2583.1435743889974, y = 1454.8239611265922},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006016,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200104c",
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
              HideAllBattleEntity = false,
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700251,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700251},
                {TalkActorType = "Npc", TalkActorId = 200075},
                {TalkActorType = "Npc", TalkActorId = 200087}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182212"] = {
            key = "175101094740812182212",
            type = "TalkNode",
            name = "\233\187\145\229\185\149orSeq",
            pos = {x = 2575.805912051336, y = 1286.7070780097092},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006015,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
    ["175101094740812182144"] = {
      isStoryNode = true,
      key = "175101094740812182144",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\228\184\139\230\176\180\233\129\147",
      pos = {x = 1464.2445053802032, y = 494.34883377492093},
      propsData = {
        QuestId = 20010406,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_6",
        QuestDeatil = "Content_200104_6",
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
        SubRegionId = 101702,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Sew02_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182216",
            startPort = "Out",
            endQuest = "175101094740812182217",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182217",
            startPort = "Out",
            endQuest = "175101094740812182218",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182218",
            startPort = "Out",
            endQuest = "175101094740812182221",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182221",
            startPort = "Out",
            endQuest = "175101094740812182222",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182222",
            startPort = "Out",
            endQuest = "175101094740812182214",
            endPort = "Success"
          },
          {
            startQuest = "175101094740812182218",
            startPort = "Out",
            endQuest = "175101094740812182224",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182217",
            startPort = "Out",
            endQuest = "175101094740812182225",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182225",
            startPort = "Out",
            endQuest = "175101094740812182219",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182218",
            startPort = "Out",
            endQuest = "175101094740812182226",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182226",
            startPort = "Out",
            endQuest = "175101094740812182220",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182221",
            startPort = "Out",
            endQuest = "175101094740812182227",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182213",
            startPort = "QuestStart",
            endQuest = "175101094740812182216",
            endPort = "In"
          }
        },
        nodeData = {
          ["175101094740812182213"] = {
            key = "175101094740812182213",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1157.1282051282053, y = 323.1794871794872},
            propsData = {ModeType = 0}
          },
          ["175101094740812182214"] = {
            key = "175101094740812182214",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2962.212121212121, y = 328.78787878787875},
            propsData = {ModeType = 0}
          },
          ["175101094740812182215"] = {
            key = "175101094740812182215",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["175101094740812182216"] = {
            key = "175101094740812182216",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1445.4452214452213, y = 312.13752913752916},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010406a",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182217"] = {
            key = "175101094740812182217",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1746.30303030303, y = 307.4848484848485},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730222,
              GuideType = "M",
              GuidePointName = "Mechanism_QT_1730222"
            }
          },
          ["175101094740812182218"] = {
            key = "175101094740812182218",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2046.8732057416269, y = 309.4848484848485},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730223,
              GuideType = "M",
              GuidePointName = "Mechanism_QT_1730223"
            }
          },
          ["175101094740812182219"] = {
            key = "175101094740812182219",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1725.5238095238096, y = -48.28571428571426},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182220"] = {
            key = "175101094740812182220",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 2039.7142857142856, y = -49.04761904761905},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175101094740812182221"] = {
            key = "175101094740812182221",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2355.999544315334, y = 316.1341991341992},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730224,
              GuideType = "P",
              GuidePointName = "pPlayer20010407a"
            }
          },
          ["175101094740812182222"] = {
            key = "175101094740812182222",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2676.0053073861127, y = 318.34085213032586},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010406",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700251,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700251},
                {TalkActorType = "Npc", TalkActorId = 200087},
                {TalkActorType = "Npc", TalkActorId = 200075}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182223"] = {
            key = "175101094740812182223",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1284, y = 890},
            propsData = {WaitTime = 3}
          },
          ["175101094740812182224"] = {
            key = "175101094740812182224",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\129\171\231\174\173\233\152\159",
            pos = {x = 2354.511278195489, y = 147.1502285124575},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730214,
                1730215,
                1730225
              }
            }
          },
          ["175101094740812182225"] = {
            key = "175101094740812182225",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\132\154\229\141\176",
            pos = {x = 1731.979949874687, y = 144.98230871295868},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730255,
                1730256,
                1730257
              }
            }
          },
          ["175101094740812182226"] = {
            key = "175101094740812182226",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\132\154\229\141\176",
            pos = {x = 2040.5513784461157, y = 146.88707061772052},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730258,
                1730259,
                1730260
              }
            }
          },
          ["175101094740812182227"] = {
            key = "175101094740812182227",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\132\154\229\141\176",
            pos = {x = 2651.7794486215544, y = 144.61890019165543},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730255,
                1730256,
                1730257,
                1730258,
                1730259,
                1730260
              }
            }
          },
          ["175101094740812182228"] = {
            key = "175101094740812182228",
            type = "GoToRegionNode",
            name = "\231\161\174\232\174\164\232\191\155\229\133\165\228\184\139\230\176\180\233\129\147",
            pos = {x = 1452.6065162907275, y = 141.70849918914917},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101702,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_SewPoorEnter"
            }
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182145"] = {
      isStoryNode = true,
      key = "175101094740812182145",
      type = "StoryNode",
      name = "\231\131\173\232\161\128\231\154\132\230\136\152\230\150\151",
      pos = {x = 1735.599609048465, y = 490.02224323439845},
      propsData = {
        QuestId = 20010407,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_7",
        QuestDeatil = "Content_200104_7",
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
        SubRegionId = 101702,
        StoryGuideType = "Point",
        StoryGuidePointName = "pPlayer20010407a"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17509354318784176",
            startPort = "Success",
            endQuest = "175101094740812182235",
            endPort = "In"
          },
          {
            startQuest = "17509354318784176",
            startPort = "PassiveFail",
            endQuest = "17509354623925150",
            endPort = "In"
          },
          {
            startQuest = "17509354623925150",
            startPort = "Out",
            endQuest = "175101094740812182231",
            endPort = "Fail"
          },
          {
            startQuest = "17509354318784176",
            startPort = "Fail",
            endQuest = "17509355042115654",
            endPort = "In"
          },
          {
            startQuest = "17509355042115654",
            startPort = "Out",
            endQuest = "175101094740812182231",
            endPort = "Fail"
          },
          {
            startQuest = "175101094740812182229",
            startPort = "QuestStart",
            endQuest = "17509360518486695",
            endPort = "In"
          },
          {
            startQuest = "17509360518486695",
            startPort = "Out",
            endQuest = "17509354318784176",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182235",
            startPort = "Out",
            endQuest = "17560909527111898813",
            endPort = "In"
          },
          {
            startQuest = "17560909527111898813",
            startPort = "Out",
            endQuest = "17561127127612209477",
            endPort = "In"
          },
          {
            startQuest = "17561127127612209477",
            startPort = "Out",
            endQuest = "175101094740812182230",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17509354214543945"] = {
            key = "17509354214543945",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1121.7607782243329, y = -83.50517598343691},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["17509354318784176"] = {
            key = "17509354318784176",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1437.1347430276455, y = 253.28571428571422},
            propsData = {SpecialConfigId = 1056, BlackScreenImmediately = false}
          },
          ["17509354623925150"] = {
            key = "17509354623925150",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1864.2074201915698, y = 498.9653545666133},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "pPlayer20010407a2",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17509355042115654"] = {
            key = "17509355042115654",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1862.0335071480915, y = 369.8349197840045},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "pPlayer20010407a2",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17509360518486695"] = {
            key = "17509360518486695",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1113.891457359589, y = 254.54239499376826},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730224,
              GuideType = "P",
              GuidePointName = "pPlayer20010407a"
            }
          },
          ["175101094740812182229"] = {
            key = "175101094740812182229",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 788.1269349845202, y = 259.7533539731682},
            propsData = {ModeType = 0}
          },
          ["175101094740812182230"] = {
            key = "175101094740812182230",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2524.559796375384, y = 169.43482421468693},
            propsData = {ModeType = 0}
          },
          ["175101094740812182231"] = {
            key = "175101094740812182231",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2263.505434782609, y = 409.0036231884058},
            propsData = {}
          },
          ["175101094740812182232"] = {
            key = "175101094740812182232",
            type = "GoToRegionNode",
            name = "\230\163\128\230\181\139\229\140\186\229\159\159Sew02",
            pos = {x = 613.5925696594427, y = 684.5634674922601},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101702,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sewer"
            }
          },
          ["175101094740812182233"] = {
            key = "175101094740812182233",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 581.8592004307443, y = 1116.3949387535336},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
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
          ["175101094740812182234"] = {
            key = "175101094740812182234",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 621.6842105263157, y = 849.7894736842104},
            propsData = {WaitTime = 3}
          },
          ["175101094740812182235"] = {
            key = "175101094740812182235",
            type = "TalkNode",
            name = "\232\131\156\229\136\169\231\187\147\231\174\151",
            pos = {x = 1858.422412916349, y = 149.9979150775491},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006701,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010407",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700251,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200075,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700251},
                {TalkActorType = "Npc", TalkActorId = 200075},
                {TalkActorType = "Npc", TalkActorId = 200087}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182236"] = {
            key = "175101094740812182236",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 587.6947422031011, y = 977.6904423491885},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730226,
                1730227,
                1730228
              }
            }
          },
          ["175101094740812182237"] = {
            key = "175101094740812182237",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1204.8920285193335, y = 873.3907230876542},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "pPlayer20010407a",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17560909527111898813"] = {
            key = "17560909527111898813",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2204, y = 138},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "QusetCatchPet",
              UnitId = -1
            }
          },
          ["17561127127612209477"] = {
            key = "17561127127612209477",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2236, y = -104},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730262,
                1730264,
                1730265,
                1730266,
                1730267,
                1730268
              }
            }
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182146"] = {
      isStoryNode = true,
      key = "175101094740812182146",
      type = "StoryNode",
      name = "\233\133\146\233\166\134&\229\141\161\231\177\179\230\139\137",
      pos = {x = 2248.347091909719, y = 490.01340728190956},
      propsData = {
        QuestId = 20010408,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_8",
        QuestDeatil = "Content_200104_8",
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
        SubRegionId = 101107,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Tavern"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182243",
            startPort = "Out",
            endQuest = "175101094740812182239",
            endPort = "Success"
          },
          {
            startQuest = "175101094740812182245",
            startPort = "Out",
            endQuest = "175101094740812182243",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182241",
            startPort = "Out",
            endQuest = "175101094740812182242",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182238",
            startPort = "QuestStart",
            endQuest = "175101094740812182241",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182242",
            startPort = "Out",
            endQuest = "17561117162163312",
            endPort = "In"
          },
          {
            startQuest = "17561117162163312",
            startPort = "Out",
            endQuest = "175101094740812182245",
            endPort = "In"
          }
        },
        nodeData = {
          ["175101094740812182238"] = {
            key = "175101094740812182238",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 978.7916666666667, y = 306.875},
            propsData = {ModeType = 0}
          },
          ["175101094740812182239"] = {
            key = "175101094740812182239",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2342.646453089245, y = 318.1387559808613},
            propsData = {ModeType = 0}
          },
          ["175101094740812182240"] = {
            key = "175101094740812182240",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2246, y = 578},
            propsData = {}
          },
          ["175101094740812182241"] = {
            key = "175101094740812182241",
            type = "TalkNode",
            name = "\233\187\145\229\185\149\230\150\135\229\173\151",
            pos = {x = 1300.4519450800917, y = 291.67467581998477},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006901,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["175101094740812182242"] = {
            key = "175101094740812182242",
            type = "TalkNode",
            name = "\233\133\146\233\166\134\233\151\178\232\129\138",
            pos = {x = 1577.2368421052631, y = 289.61153872824354},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006902,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010408a",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "BlendIn",
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
                  TalkActorId = 700248,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700253,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700254,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700252,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700248},
                {TalkActorType = "Npc", TalkActorId = 700253},
                {TalkActorType = "Npc", TalkActorId = 700254},
                {TalkActorType = "Npc", TalkActorId = 700252}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182243"] = {
            key = "175101094740812182243",
            type = "TalkNode",
            name = "\229\141\161\231\177\179\230\139\137\229\175\185\232\175\157",
            pos = {x = 2102.9118993135007, y = 293.7036613272311},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20007001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20010408b",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
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
                  TalkActorId = 700248,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200074,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700252,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200003,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700248},
                {TalkActorType = "Npc", TalkActorId = 200074},
                {TalkActorType = "Npc", TalkActorId = 200086},
                {TalkActorType = "Npc", TalkActorId = 700252},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200003}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175101094740812182244"] = {
            key = "175101094740812182244",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1150.375, y = 500.75},
            propsData = {WaitTime = 3}
          },
          ["175101094740812182245"] = {
            key = "175101094740812182245",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1852.9347826086955, y = 293.695652173913},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1220161,
              GuideType = "N",
              GuidePointName = "Npc_Kamila_1220002"
            }
          },
          ["17561117162163312"] = {
            key = "17561117162163312",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1775, y = 88.00000000000006},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "QuestPetUnlock",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182147"] = {
      isStoryNode = true,
      key = "175101094740812182147",
      type = "StoryNode",
      name = "\228\187\142\232\180\171\230\176\145\229\140\186\229\133\165\229\143\163\229\137\141\229\190\128\228\184\139\230\176\180\233\129\147\239\188\136\229\173\152\230\161\163\231\130\185\239\188\137",
      pos = {x = 1205.5463773069037, y = 488.58237243305894},
      propsData = {
        QuestId = 20010405,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_5",
        QuestDeatil = "Content_200104_5",
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
        SubRegionId = 101702,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Sew02_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182246",
            startPort = "QuestStart",
            endQuest = "175101094740812182249",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182249",
            startPort = "Out",
            endQuest = "175101094740812182247",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175101094740812182246"] = {
            key = "175101094740812182246",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175101094740812182247"] = {
            key = "175101094740812182247",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1398.235294117647, y = 288.4767801857585},
            propsData = {ModeType = 0}
          },
          ["175101094740812182248"] = {
            key = "175101094740812182248",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1400.3157894736842, y = 445.57894736842104},
            propsData = {}
          },
          ["175101094740812182249"] = {
            key = "175101094740812182249",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\139\230\176\180\233\129\147",
            pos = {x = 1096.3962848297213, y = 287.89473684210526},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101702,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew02_01"
            }
          },
          ["175101094740812182250"] = {
            key = "175101094740812182250",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1302, y = -12},
            propsData = {WaitTime = 3}
          }
        },
        commentData = {}
      }
    },
    ["175101094740812182148"] = {
      isStoryNode = true,
      key = "175101094740812182148",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\134\176\230\185\150",
      pos = {x = 1198.4999999999995, y = 317.9375},
      propsData = {
        QuestId = 20010409,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_3",
        QuestDeatil = "Content_200104_3",
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
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "TargetPoint_IceLake4"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175101094740812182251",
            startPort = "QuestStart",
            endQuest = "175101094740812182256",
            endPort = "In"
          },
          {
            startQuest = "175101094740812182256",
            startPort = "Out",
            endQuest = "175101094740812182252",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175101094740812182251"] = {
            key = "175101094740812182251",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 952, y = 298},
            propsData = {ModeType = 0}
          },
          ["175101094740812182252"] = {
            key = "175101094740812182252",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1508, y = 302},
            propsData = {ModeType = 0}
          },
          ["175101094740812182253"] = {
            key = "175101094740812182253",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1274, y = 542},
            propsData = {}
          },
          ["175101094740812182254"] = {
            key = "175101094740812182254",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\233\133\146\233\166\134",
            pos = {x = 1004, y = 79.99999999999997},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveTavern"
            }
          },
          ["175101094740812182255"] = {
            key = "175101094740812182255",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1230, y = 62},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191410,
              GuideType = "M",
              GuidePointName = "Mechanism_00_SQ_1191410"
            }
          },
          ["175101094740812182256"] = {
            key = "175101094740812182256",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1220, y = 296},
            propsData = {WaitTime = 0.2}
          }
        },
        commentData = {}
      }
    },
    ["1756089257099635507"] = {
      isStoryNode = true,
      key = "1756089257099635507",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1864.075171624714, y = 707.3537100132336},
      propsData = {
        QuestId = 20010410,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_9",
        QuestDeatil = "Content_200104_9",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 1400402,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "P",
        GuidePointName = "Pet_CatchPet_200104",
        InterfaceJumpId = 0
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
