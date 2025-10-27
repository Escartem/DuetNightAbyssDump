return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716548641562646653",
      startPort = "Success",
      endStory = "1716548641562646652",
      endPort = "StoryEnd"
    },
    {
      startStory = "17503156861782873733",
      startPort = "Success",
      endStory = "17503156861782873732",
      endPort = "In"
    },
    {
      startStory = "17503156861782873732",
      startPort = "Success",
      endStory = "17503156861782873734",
      endPort = "In"
    },
    {
      startStory = "17503156861782873734",
      startPort = "Success",
      endStory = "17503156861792873735",
      endPort = "In"
    },
    {
      startStory = "17503156861792873735",
      startPort = "Success",
      endStory = "17503156861792873736",
      endPort = "In"
    },
    {
      startStory = "17503156861792873737",
      startPort = "Success",
      endStory = "17503156861782873733",
      endPort = "In"
    },
    {
      startStory = "1716548641562646651",
      startPort = "StoryStart",
      endStory = "17503156861792873737",
      endPort = "In"
    },
    {
      startStory = "17503156861792873736",
      startPort = "Success",
      endStory = "1716548641562646653",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1716548641562646651"] = {
      isStoryNode = true,
      key = "1716548641562646651",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 423.6, y = 325.02857142857147},
      propsData = {QuestChainId = 100303},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716548641562646652"] = {
      isStoryNode = true,
      key = "1716548641562646652",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2313.9545454545455, y = 316.29090909090917},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716548641562646653"] = {
      isStoryNode = true,
      key = "1716548641562646653",
      type = "StoryNode",
      name = "\231\151\133\230\136\191\231\144\179\230\129\169\231\153\187\229\156\186",
      pos = {x = 1977.5680324241196, y = 307.64086956813094},
      propsData = {
        QuestId = 10030301,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030301",
        QuestDeatil = "QuestDesc_10030301",
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
            startQuest = "1730701647488815970",
            startPort = "Out",
            endQuest = "1744446800219876",
            endPort = "In"
          },
          {
            startQuest = "1744446107126808145",
            startPort = "Out",
            endQuest = "174851558636215115484",
            endPort = "In"
          },
          {
            startQuest = "174851558636215115484",
            startPort = "Out",
            endQuest = "1730701647488815970",
            endPort = "In"
          },
          {
            startQuest = "1744446800219876",
            startPort = "Out",
            endQuest = "1716548641562646655",
            endPort = "Success"
          },
          {
            startQuest = "1716548641562646654",
            startPort = "QuestStart",
            endQuest = "17400380202561562628",
            endPort = "In"
          },
          {
            startQuest = "17400380202561562628",
            startPort = "Out",
            endQuest = "17518763615456532",
            endPort = "In"
          },
          {
            startQuest = "17518763615456532",
            startPort = "Out",
            endQuest = "1744446107126808145",
            endPort = "In"
          }
        },
        nodeData = {
          ["1716548641562646654"] = {
            key = "1716548641562646654",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1716548641562646655"] = {
            key = "1716548641562646655",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2903.3333333333335, y = 283.3333333333333},
            propsData = {ModeType = 0}
          },
          ["1716548641562646656"] = {
            key = "1716548641562646656",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17306897183991671"] = {
            key = "17306897183991671",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1697.347298010914, y = 1474.6486324506918},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190831,
              GuideType = "M",
              GuidePointName = "Cp2LeaveSickPoint"
            }
          },
          ["1730701647488815970"] = {
            key = "1730701647488815970",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1867.6390872666634, y = 280.1212814645308},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100361,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1950013",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple34_new",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100361,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100361},
                {TalkActorType = "Npc", TalkActorId = 200022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17313111427477165"] = {
            key = "17313111427477165",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1048.4714285714285, y = 1532.5124542124545},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "SickTelePoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17369269761892884588"] = {
            key = "17369269761892884588",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1435.7235294117652, y = 1240.8627450980393},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          },
          ["17369277336996019472"] = {
            key = "17369277336996019472",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1779.4518226871169, y = 1181.6147342853224},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17369277430566019656"] = {
            key = "17369277430566019656",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2274.300307535602, y = 1160.6450373156254},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          },
          ["17400380202561562628"] = {
            key = "17400380202561562628",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1069.2142857142858, y = 292.9642857142857},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101110,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "SickTelePoint"
            }
          },
          ["1744446107126808145"] = {
            key = "1744446107126808145",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1514.0833333333337, y = 296.33333333333337},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1950013}
            }
          },
          ["1744446800219876"] = {
            key = "1744446800219876",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2163.3333333333335, y = 280},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1950013}
            }
          },
          ["174851558636215115484"] = {
            key = "174851558636215115484",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1695.7477816301343, y = 483.78609625668446},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0071_lise_secret",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101110},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17518763615456532"] = {
            key = "17518763615456532",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1300.3300492610838, y = 145.17241379310346},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1950001}
            }
          }
        },
        commentData = {}
      }
    },
    ["17503156861782873732"] = {
      isStoryNode = true,
      key = "17503156861782873732",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\159\186\229\156\176",
      pos = {x = 1364.1710809023168, y = 304.4120226350875},
      propsData = {
        QuestId = 10030397,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030216",
        QuestDeatil = "QuestDesc_10030216",
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
            startQuest = "17503156861892873767",
            startPort = "QuestStart",
            endQuest = "17503156861902873770",
            endPort = "In"
          },
          {
            startQuest = "17503156861902873772",
            startPort = "Out",
            endQuest = "17503156861892873768",
            endPort = "Success"
          },
          {
            startQuest = "17503156861902873770",
            startPort = "Out",
            endQuest = "17503156861902873772",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503156861892873767"] = {
            key = "17503156861892873767",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156861892873768"] = {
            key = "17503156861892873768",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156861892873769"] = {
            key = "17503156861892873769",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503156861902873770"] = {
            key = "17503156861902873770",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1696, y = 355.1764705882353},
            propsData = {
              RegionType = 2,
              IsEnter = "Enter",
              RegionId = 1011,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_SecrEnter"
            }
          },
          ["17503156861902873772"] = {
            key = "17503156861902873772",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2282, y = 334},
            propsData = {WaitTime = 0.2}
          }
        },
        commentData = {}
      }
    },
    ["17503156861782873733"] = {
      isStoryNode = true,
      key = "17503156861782873733",
      type = "StoryNode",
      name = "\231\151\133\230\136\191",
      pos = {x = 1036.5631586421841, y = 311.4755620940138},
      propsData = {
        QuestId = 10030398,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030215",
        QuestDeatil = "QuestDesc_10030215",
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
        SubRegionId = 101110,
        StoryGuideType = "Point",
        StoryGuidePointName = "cp2sickinpoint"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503156861962873793",
            startPort = "Out",
            endQuest = "17503156861962873790",
            endPort = "In"
          },
          {
            startQuest = "17503156861962873792",
            startPort = "Out",
            endQuest = "17503156861972873797",
            endPort = "In"
          },
          {
            startQuest = "17503156861962873790",
            startPort = "Out",
            endQuest = "17503156861982873798",
            endPort = "In"
          },
          {
            startQuest = "17503156861982873798",
            startPort = "Out",
            endQuest = "17503156861982873799",
            endPort = "In"
          },
          {
            startQuest = "17503156861972873797",
            startPort = "Out",
            endQuest = "17503156861982873801",
            endPort = "In"
          },
          {
            startQuest = "17503156861982873799",
            startPort = "Out",
            endQuest = "17503156861992873802",
            endPort = "In"
          },
          {
            startQuest = "17503156861962873793",
            startPort = "Out",
            endQuest = "17503156862002873805",
            endPort = "In"
          },
          {
            startQuest = "17503156861972873794",
            startPort = "QuestStart",
            endQuest = "17503156861982873800",
            endPort = "In"
          },
          {
            startQuest = "17503156861982873800",
            startPort = "Out",
            endQuest = "17503156862002873807",
            endPort = "In"
          },
          {
            startQuest = "17503156862002873807",
            startPort = "Out",
            endQuest = "17503156861962873791",
            endPort = "In"
          },
          {
            startQuest = "17503156861962873791",
            startPort = "Out",
            endQuest = "17503156861952873789",
            endPort = "In"
          },
          {
            startQuest = "17503156861992873802",
            startPort = "Out",
            endQuest = "17503156862012873808",
            endPort = "In"
          },
          {
            startQuest = "17503156862012873808",
            startPort = "Out",
            endQuest = "17503156861972873795",
            endPort = "Success"
          },
          {
            startQuest = "17503156861952873789",
            startPort = "Out",
            endQuest = "17503156861962873792",
            endPort = "In"
          },
          {
            startQuest = "17503156861982873801",
            startPort = "Out",
            endQuest = "17503156861962873793",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503156861952873788"] = {
            key = "17503156861952873788",
            type = "SetNpcPatrolNode",
            name = "\232\174\190\231\189\174NPC\229\183\161\233\128\187",
            pos = {x = 1258.5075914797287, y = 1060.7186896694639},
            propsData = {NpcId = "", PatrolId = ""}
          },
          ["17503156861952873789"] = {
            key = "17503156861952873789",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2012.1144185879466, y = 64.11014867485467},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sicktalktele",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17503156861962873790"] = {
            key = "17503156861962873790",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1593.4512865875095, y = 558.2522936300028},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100360,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1950001",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10033954,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple24_27-29_34-35",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100360,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100360}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156861962873791"] = {
            key = "17503156861962873791",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1580.73302033364, y = 282.9550800077117},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple24_27-29_34-35",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100360,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100360}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156861962873792"] = {
            key = "17503156861962873792",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2042.3212556277576, y = 290.54331530182924},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033914,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple25-26",
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
                  TalkActorId = 100357,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100359,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100357},
                {TalkActorType = "Npc", TalkActorId = 100359}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156861962873793"] = {
            key = "17503156861962873793",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1219.441224668006, y = 569.8134391408386},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033953,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
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
          ["17503156861972873794"] = {
            key = "17503156861972873794",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 537.3333333333334, y = 290.6666666666667},
            propsData = {ModeType = 0}
          },
          ["17503156861972873795"] = {
            key = "17503156861972873795",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3614.039215686275, y = 380.5490196078432},
            propsData = {ModeType = 0}
          },
          ["17503156861972873796"] = {
            key = "17503156861972873796",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3399.4509803921574, y = 684.5490196078431},
            propsData = {}
          },
          ["17503156861972873797"] = {
            key = "17503156861972873797",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2480.0833333333335, y = 282.1176470588234},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033929,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple25-26",
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
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100358,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100358}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156861982873798"] = {
            key = "17503156861982873798",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2056.1547987616095, y = 549.6037151702787},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033958,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple24_27-29_34-35",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100360,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100360}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156861982873799"] = {
            key = "17503156861982873799",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2490.9349845201236, y = 527.2239422084622},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033963,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple24_27-29_34-35",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100360,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100360}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156861982873800"] = {
            key = "17503156861982873800",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1222.9473684210525, y = 306.140350877193},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1950011,
                1950012,
                1950001
              }
            }
          },
          ["17503156861982873801"] = {
            key = "17503156861982873801",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2907.3214285714284, y = 296.23809523809547},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sickinpoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17503156861992873802"] = {
            key = "17503156861992873802",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2944.6666666666665, y = 546},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1950011, 1950012}
            }
          },
          ["17503156861992873803"] = {
            key = "17503156861992873803",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3264.866506042976, y = 295.9168527550882},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1950001}
            }
          },
          ["17503156862002873804"] = {
            key = "17503156862002873804",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2338.6349206349205, y = 25.428571428571427},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1950001}
            }
          },
          ["17503156862002873805"] = {
            key = "17503156862002873805",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1590, y = 804},
            propsData = {
              NewDescription = "QuestName_1003plus14",
              NewDetail = "QuestDesc_1003plus14",
              SubTaskTargetIndex = 0
            }
          },
          ["17503156862002873807"] = {
            key = "17503156862002873807",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1415.4246586746583, y = 64.61663336663322},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0071_lise_secret",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17503156862012873808"] = {
            key = "17503156862012873808",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 3296.6493506493503, y = 487.2147852147851},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17503156861782873734"] = {
      isStoryNode = true,
      key = "17503156861782873734",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176",
      pos = {x = 1032.772831171162, y = 521.20147760736},
      propsData = {
        QuestId = 10030396,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030217",
        QuestDeatil = "QuestDesc_10030217",
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
            startQuest = "17503156862232873892",
            startPort = "Out",
            endQuest = "17503156862232873893",
            endPort = "In"
          },
          {
            startQuest = "17503156862232873892",
            startPort = "Out",
            endQuest = "17503156862232873891",
            endPort = "In"
          },
          {
            startQuest = "17503156862222873888",
            startPort = "QuestStart",
            endQuest = "17503156862232873892",
            endPort = "In"
          },
          {
            startQuest = "17503156862232873891",
            startPort = "Out",
            endQuest = "17503156862222873889",
            endPort = "Success"
          },
          {
            startQuest = "17503156862222873888",
            startPort = "QuestStart",
            endQuest = "17503156862242873894",
            endPort = "In"
          },
          {
            startQuest = "17503156862232873892",
            startPort = "Out",
            endQuest = "17503156862242873895",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503156862222873888"] = {
            key = "17503156862222873888",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156862222873889"] = {
            key = "17503156862222873889",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156862232873890"] = {
            key = "17503156862232873890",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503156862232873891"] = {
            key = "17503156862232873891",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\159\186\229\156\176\229\134\133",
            pos = {x = 2217.290010453942, y = 326.2558386917525},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1940010,
              GuideType = "M",
              GuidePointName = "Mechanism_1940010"
            }
          },
          ["17503156862232873892"] = {
            key = "17503156862232873892",
            type = "GoToRegionNode",
            name = "\229\137\141\229\190\128\231\167\152\229\175\134\229\159\186\229\156\176",
            pos = {x = 1424.7099895460578, y = 324.9688047246867},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_SecrEnter"
            }
          },
          ["17503156862232873893"] = {
            key = "17503156862232873893",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1988.986408276966, y = 733.0311952753134},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034007,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17503156862242873894"] = {
            key = "17503156862242873894",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1432, y = 16},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17503156862242873895"] = {
            key = "17503156862242873895",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1864, y = 124},
            propsData = {
              NewDescription = "QuestName_10030218",
              NewDetail = "QuestDesc_10030218",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17503156861792873735"] = {
      isStoryNode = true,
      key = "17503156861792873735",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176",
      pos = {x = 1365.4450533933848, y = 518.7579334703377},
      propsData = {
        QuestId = 10030395,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030218",
        QuestDeatil = "QuestDesc_10030218",
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
            startQuest = "17503156862342873931",
            startPort = "Out",
            endQuest = "17503156862342873932",
            endPort = "In"
          },
          {
            startQuest = "17503156862342873931",
            startPort = "Out",
            endQuest = "17503156862352873934",
            endPort = "In"
          },
          {
            startQuest = "17503156862342873932",
            startPort = "Out",
            endQuest = "17503156862352873935",
            endPort = "In"
          },
          {
            startQuest = "17503156862342873932",
            startPort = "Out",
            endQuest = "17503156862352873936",
            endPort = "In"
          },
          {
            startQuest = "17503156862352873937",
            startPort = "Out",
            endQuest = "17503156862342873931",
            endPort = "In"
          },
          {
            startQuest = "17503156862332873928",
            startPort = "QuestStart",
            endQuest = "17503156862362873939",
            endPort = "In"
          },
          {
            startQuest = "17503156862362873939",
            startPort = "Out",
            endQuest = "17503156862352873937",
            endPort = "In"
          },
          {
            startQuest = "17503156862342873933",
            startPort = "Out",
            endQuest = "17503156862342873929",
            endPort = "Success"
          },
          {
            startQuest = "17503156862352873935",
            startPort = "Out",
            endQuest = "17503156862362873941",
            endPort = "In"
          },
          {
            startQuest = "17503156862362873941",
            startPort = "Out",
            endQuest = "17503156862342873933",
            endPort = "Input_1"
          },
          {
            startQuest = "17503156862352873936",
            startPort = "Out",
            endQuest = "17503156862362873938",
            endPort = "In"
          },
          {
            startQuest = "17503156862362873938",
            startPort = "Out",
            endQuest = "17503156862342873933",
            endPort = "Input_2"
          }
        },
        nodeData = {
          ["17503156862332873928"] = {
            key = "17503156862332873928",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 388, y = 298},
            propsData = {ModeType = 0}
          },
          ["17503156862342873929"] = {
            key = "17503156862342873929",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156862342873930"] = {
            key = "17503156862342873930",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503156862342873931"] = {
            key = "17503156862342873931",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\159\186\229\156\176\229\134\133",
            pos = {x = 1243.3183382664806, y = 325.4659227253653},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1940011,
              GuideType = "M",
              GuidePointName = "Mechanism_1940011"
            }
          },
          ["17503156862342873932"] = {
            key = "17503156862342873932",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1549.4408833168895, y = 308.4167035235148},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple30",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156862342873933"] = {
            key = "17503156862342873933",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2471.348328400186, y = 292.7352941176472},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["17503156862352873934"] = {
            key = "17503156862352873934",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1390, y = 596},
            propsData = {
              NewDescription = "QuestName_10030219",
              NewDetail = "QuestDesc_10030219",
              SubTaskTargetIndex = 0
            }
          },
          ["17503156862352873935"] = {
            key = "17503156862352873935",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1835.6497113997118, y = 69.67754613807217},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100363,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_1940043",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10034104,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
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
          ["17503156862352873936"] = {
            key = "17503156862352873936",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1844.6774891774894, y = 520.4231601731599},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100364,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_1940044",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10034106,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
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
          ["17503156862352873937"] = {
            key = "17503156862352873937",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1019.5555555555555, y = 537.5555555555555},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940043, 1940044}
            }
          },
          ["17503156862362873938"] = {
            key = "17503156862362873938",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2175.5665168165156, y = 527.024891774892},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940044}
            }
          },
          ["17503156862362873939"] = {
            key = "17503156862362873939",
            type = "GoToRegionNode",
            name = "\229\137\141\229\190\128\231\167\152\229\175\134\229\159\186\229\156\176",
            pos = {x = 756, y = 282},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_SecrEnter"
            }
          },
          ["17503156862362873941"] = {
            key = "17503156862362873941",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2180, y = 100.66666666666663},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940043}
            }
          }
        },
        commentData = {}
      }
    },
    ["17503156861792873736"] = {
      isStoryNode = true,
      key = "17503156861792873736",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176",
      pos = {x = 1689.8198008681327, y = 515.018144274027},
      propsData = {
        QuestId = 10030394,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030219",
        QuestDeatil = "QuestDesc_10030219",
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
        SubRegionId = 101108,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_SecrEnter"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503156862542874004",
            startPort = "Out",
            endQuest = "17503156862542874002",
            endPort = "Input_1"
          },
          {
            startQuest = "17503156862542874001",
            startPort = "Out",
            endQuest = "17503156862552874006",
            endPort = "In"
          },
          {
            startQuest = "17503156862532874000",
            startPort = "Out",
            endQuest = "17503156862552874007",
            endPort = "In"
          },
          {
            startQuest = "17503156862552874007",
            startPort = "Out",
            endQuest = "17503156862532873999",
            endPort = "In"
          },
          {
            startQuest = "17503156862532873999",
            startPort = "Out",
            endQuest = "17503156862552874008",
            endPort = "In"
          },
          {
            startQuest = "17503156862552874008",
            startPort = "Out",
            endQuest = "17503156862542874002",
            endPort = "Input_2"
          },
          {
            startQuest = "17503156862532874000",
            startPort = "Out",
            endQuest = "17503156862562874009",
            endPort = "In"
          },
          {
            startQuest = "17503156862562874009",
            startPort = "Out",
            endQuest = "17503156862542874003",
            endPort = "In"
          },
          {
            startQuest = "17503156862542874003",
            startPort = "Out",
            endQuest = "17503156862562874010",
            endPort = "In"
          },
          {
            startQuest = "17503156862562874010",
            startPort = "Out",
            endQuest = "17503156862542874004",
            endPort = "In"
          },
          {
            startQuest = "17503156862562874011",
            startPort = "Out",
            endQuest = "17503156862522873998",
            endPort = "In"
          },
          {
            startQuest = "17503156862522873998",
            startPort = "Out",
            endQuest = "17503156862562874012",
            endPort = "In"
          },
          {
            startQuest = "17503156862562874012",
            startPort = "Out",
            endQuest = "17503156862542874001",
            endPort = "In"
          },
          {
            startQuest = "17503156862552874005",
            startPort = "Out",
            endQuest = "17503156862572874013",
            endPort = "In"
          },
          {
            startQuest = "17503156862522873995",
            startPort = "QuestStart",
            endQuest = "17513543723375528",
            endPort = "In"
          },
          {
            startQuest = "17513543723375528",
            startPort = "Out",
            endQuest = "17503156862532874000",
            endPort = "In"
          },
          {
            startQuest = "17503156862542874002",
            startPort = "Out",
            endQuest = "17513543845916091",
            endPort = "In"
          },
          {
            startQuest = "17503156862552874006",
            startPort = "Out",
            endQuest = "17503156862522873996",
            endPort = "Success"
          },
          {
            startQuest = "17503156862582874015",
            startPort = "Out",
            endQuest = "17503156862582874017",
            endPort = "In"
          },
          {
            startQuest = "17503156862582874017",
            startPort = "Out",
            endQuest = "17503156862582874016",
            endPort = "In"
          },
          {
            startQuest = "17503156862582874016",
            startPort = "Out",
            endQuest = "17503156862582874018",
            endPort = "In"
          },
          {
            startQuest = "17503156862582874018",
            startPort = "Out",
            endQuest = "17503156862552874005",
            endPort = "In"
          },
          {
            startQuest = "17503156862552874005",
            startPort = "Out",
            endQuest = "17503156862562874011",
            endPort = "In"
          },
          {
            startQuest = "17513543845916091",
            startPort = "Out",
            endQuest = "17503156862582874015",
            endPort = "In"
          },
          {
            startQuest = "17513543845916091",
            startPort = "Out",
            endQuest = "17503156862572874014",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503156862522873995"] = {
            key = "17503156862522873995",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 93.33333333333337, y = 321.3333333333333},
            propsData = {ModeType = 0}
          },
          ["17503156862522873996"] = {
            key = "17503156862522873996",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156862522873997"] = {
            key = "17503156862522873997",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503156862522873998"] = {
            key = "17503156862522873998",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 2115.0934878331163, y = 312.88845136556824},
            propsData = {StaticCreatorId = 1940041, ObservationPointName = ""}
          },
          ["17503156862532873999"] = {
            key = "17503156862532873999",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1095.369398197262, y = 413.7764065476409},
            propsData = {StaticCreatorId = 1940037, ObservationPointName = ""}
          },
          ["17503156862532874000"] = {
            key = "17503156862532874000",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 789.1428571428569, y = 330.4378791666447},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034107,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple31-33",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156862542874001"] = {
            key = "17503156862542874001",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2421.5238095238096, y = 297.67597440474015},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034223,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple33_49",
              BlendInTime = 0.5,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156862542874002"] = {
            key = "17503156862542874002",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 1434.9901264885782, y = 295.884249684896},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["17503156862542874003"] = {
            key = "17503156862542874003",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1087.7086834733893, y = 192.4175824175825},
            propsData = {StaticCreatorId = 1940030, ObservationPointName = ""}
          },
          ["17503156862542874004"] = {
            key = "17503156862542874004",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1537.3333333333333, y = 109.9245852187029},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple31-33",
              BlendInTime = 0.5,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156862552874005"] = {
            key = "17503156862552874005",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2377.46218487395, y = 832.2408963585435},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940041}
            }
          },
          ["17503156862552874006"] = {
            key = "17503156862552874006",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2631.7142857142862, y = 78.50915750915753},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940041}
            }
          },
          ["17503156862552874007"] = {
            key = "17503156862552874007",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 910.7843137254904, y = 565.6666666666665},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1940037"
            }
          },
          ["17503156862552874008"] = {
            key = "17503156862552874008",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1282.5490196078433, y = 555.6666666666666},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1940037"
            }
          },
          ["17503156862562874009"] = {
            key = "17503156862562874009",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 893.8495817907585, y = 78.034965034965},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1940030"
            }
          },
          ["17503156862562874010"] = {
            key = "17503156862562874010",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1265.6142876731114, y = 68.03496503496511},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1940030"
            }
          },
          ["17503156862562874011"] = {
            key = "17503156862562874011",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2013.8495817907578, y = 494.03496503496507},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1940041"
            }
          },
          ["17503156862562874012"] = {
            key = "17503156862562874012",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2272.2809543397775, y = 493.3682983682985},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1940041"
            }
          },
          ["17503156862572874013"] = {
            key = "17503156862572874013",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2534.777777777778, y = 695.75},
            propsData = {
              NewDescription = "QuestName_1003plus16",
              NewDetail = "QuestDesc_1003plus16",
              SubTaskTargetIndex = 0
            }
          },
          ["17503156862572874014"] = {
            key = "17503156862572874014",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1864.2467532467533, y = 671.8809523809523},
            propsData = {
              NewDescription = "QuestName_1003plus15",
              NewDetail = "QuestDesc_1003plus15",
              SubTaskTargetIndex = 0
            }
          },
          ["17503156862582874015"] = {
            key = "17503156862582874015",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1803.976964212258, y = 845.0588235294118},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940020}
            }
          },
          ["17503156862582874016"] = {
            key = "17503156862582874016",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2115.610951140363, y = 983.8823529411766},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1940020,
              StateId = 572,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17503156862582874017"] = {
            key = "17503156862582874017",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1851.9508204214087, y = 1037.9019607843138},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_KaiSuo_1940020"
            }
          },
          ["17503156862582874018"] = {
            key = "17503156862582874018",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2400.3821929704286, y = 1050.124183006536},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_KaiSuo_1940020"
            }
          },
          ["17513543723375528"] = {
            key = "17513543723375528",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 440, y = 326.6666666666667},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940030, 1940037}
            }
          },
          ["17513543845916091"] = {
            key = "17513543845916091",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1676.0000000000002, y = 491.3333333333334},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940030, 1940037}
            }
          },
          ["17513551966292476"] = {
            key = "17513551966292476",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2638, y = 467.99999999999994},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940030, 1940037}
            }
          }
        },
        commentData = {}
      }
    },
    ["17503156861792873737"] = {
      isStoryNode = true,
      key = "17503156861792873737",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 741.6622524310169, y = 317.89852239264013},
      propsData = {
        QuestId = 10030399,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030215",
        QuestDeatil = "QuestDesc_10030215",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_SewCityEnter",
        QuestUIId = 100303
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503156862862874114",
            startPort = "Out",
            endQuest = "17503156862842874109",
            endPort = "Success"
          },
          {
            startQuest = "17503156862842874108",
            startPort = "QuestStart",
            endQuest = "17503156862872874116",
            endPort = "In"
          },
          {
            startQuest = "17503156862872874116",
            startPort = "Out",
            endQuest = "17503156862862874113",
            endPort = "In"
          },
          {
            startQuest = "17503156862872874116",
            startPort = "Out",
            endQuest = "1754881807214903921",
            endPort = "In"
          },
          {
            startQuest = "1754881807214903921",
            startPort = "Out",
            endQuest = "17503156862862874112",
            endPort = "In"
          },
          {
            startQuest = "17503156862862874112",
            startPort = "Out",
            endQuest = "1754882032512904829",
            endPort = "In"
          },
          {
            startQuest = "1754882032512904829",
            startPort = "Out",
            endQuest = "17503156862862874114",
            endPort = "In"
          },
          {
            startQuest = "17503156862872874116",
            startPort = "Out",
            endQuest = "17503156862872874117",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503156862842874108"] = {
            key = "17503156862842874108",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 520, y = 298.46153846153845},
            propsData = {ModeType = 0}
          },
          ["17503156862842874109"] = {
            key = "17503156862842874109",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503156862852874110"] = {
            key = "17503156862852874110",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503156862852874111"] = {
            key = "17503156862852874111",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1551.4117647058824, y = 899.5882352941176},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720497,
                1720498,
                1720499,
                1720500,
                1720501,
                1720502
              }
            }
          },
          ["17503156862862874112"] = {
            key = "17503156862862874112",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1903.0509479340753, y = 262.0975723622781},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100325,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1190830",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10033803,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100311,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100311}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503156862862874113"] = {
            key = "17503156862862874113",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1630.4169610059707, y = 63.69327731092464},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033802,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17503156862862874114"] = {
            key = "17503156862862874114",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2458, y = 265.33333333333337},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sickinpoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17503156862862874115"] = {
            key = "17503156862862874115",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1645.019607843137, y = 436.7450980392157},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/cp2UIopen03",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          ["17503156862872874116"] = {
            key = "17503156862872874116",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1232.3076923076926, y = 299.846153846154},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_SewCityEnter",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17503156862872874117"] = {
            key = "17503156862872874117",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1634, y = 726},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17503156862872874118"] = {
            key = "17503156862872874118",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1934, y = 960},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1754881807214903921"] = {
            key = "1754881807214903921",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1615.0047876959643, y = 273.5487910782032},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191880}
            }
          },
          ["1754882032512904829"] = {
            key = "1754882032512904829",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2158.3381210292973, y = 293.54879107820295},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191880}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
