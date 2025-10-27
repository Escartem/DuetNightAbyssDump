return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17241226553772721",
      startPort = "StoryStart",
      endStory = "17241226647363060",
      endPort = "In"
    },
    {
      startStory = "17241226647363060",
      startPort = "Success",
      endStory = "17241226553772724",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17241226553772721"] = {
      isStoryNode = true,
      key = "17241226553772721",
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
    ["17241226553772724"] = {
      isStoryNode = true,
      key = "17241226553772724",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1477.5, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17241226647363060"] = {
      isStoryNode = true,
      key = "17241226647363060",
      type = "StoryNode",
      name = "\228\191\157\230\138\164\230\142\162\233\153\169\229\174\182\231\154\142\231\154\142\239\188\136\230\173\163\229\188\143\229\144\141\239\188\154\230\142\162\233\153\169\229\174\182\229\176\143\229\167\148\230\137\152\239\188\137",
      pos = {x = 1134.855044834611, y = 293.6627656451495},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_Protectjiaojiao_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "17241226647363061",
            startPort = "QuestStart",
            endQuest = "17241227484583977",
            endPort = "In"
          },
          {
            startQuest = "17241227484583977",
            startPort = "Out",
            endQuest = "17241227705064541",
            endPort = "In"
          },
          {
            startQuest = "17241227484583977",
            startPort = "Out",
            endQuest = "17241227827384848",
            endPort = "In"
          },
          {
            startQuest = "172412429989723620",
            startPort = "Out",
            endQuest = "17241226647363067",
            endPort = "Fail"
          },
          {
            startQuest = "172412431566524007",
            startPort = "Out",
            endQuest = "17241226647363064",
            endPort = "Success"
          },
          {
            startQuest = "172412327851413121",
            startPort = "Out",
            endQuest = "172412431566524007",
            endPort = "In"
          },
          {
            startQuest = "1727425821384803",
            startPort = "Out",
            endQuest = "17241230107778515",
            endPort = "In"
          },
          {
            startQuest = "17275996599642182",
            startPort = "Out",
            endQuest = "172412316675510516",
            endPort = "In"
          },
          {
            startQuest = "172412316675510516",
            startPort = "Out",
            endQuest = "17275997217094278",
            endPort = "In"
          },
          {
            startQuest = "17275997217094278",
            startPort = "Out",
            endQuest = "1731400628560208940",
            endPort = "In"
          },
          {
            startQuest = "17241230903709066",
            startPort = "Out",
            endQuest = "1731400666584209697",
            endPort = "In"
          },
          {
            startQuest = "1731400666584209697",
            startPort = "Out",
            endQuest = "172412316675510517",
            endPort = "In"
          },
          {
            startQuest = "172412316675510517",
            startPort = "Out",
            endQuest = "172412319621211014",
            endPort = "In"
          },
          {
            startQuest = "172412319621211014",
            startPort = "Out",
            endQuest = "172412319621211015",
            endPort = "In"
          },
          {
            startQuest = "1731400637784209202",
            startPort = "Out",
            endQuest = "1731400787984211848",
            endPort = "In"
          },
          {
            startQuest = "1731400628560208940",
            startPort = "Out",
            endQuest = "1731048503919419693",
            endPort = "In"
          },
          {
            startQuest = "1731400628560208940",
            startPort = "Out",
            endQuest = "1731400843553212932",
            endPort = "In"
          },
          {
            startQuest = "1731400843553212932",
            startPort = "Out",
            endQuest = "1731400637784209202",
            endPort = "In"
          },
          {
            startQuest = "1731401036165215396",
            startPort = "Out",
            endQuest = "17241230903709066",
            endPort = "In"
          },
          {
            startQuest = "1727425821384803",
            startPort = "Out",
            endQuest = "1731401036165215396",
            endPort = "In"
          },
          {
            startQuest = "17241230107778515",
            startPort = "Out",
            endQuest = "17275996599642182",
            endPort = "In"
          },
          {
            startQuest = "1731401036165215396",
            startPort = "Out",
            endQuest = "1731048472966419189",
            endPort = "In"
          },
          {
            startQuest = "1731400787984211848",
            startPort = "Out",
            endQuest = "17314792117241026024",
            endPort = "Input_1"
          },
          {
            startQuest = "17314792117241026024",
            startPort = "Out",
            endQuest = "172412327851413121",
            endPort = "In"
          },
          {
            startQuest = "172412316675510516",
            startPort = "Out",
            endQuest = "1731401599163823084",
            endPort = "In"
          },
          {
            startQuest = "1731747494598810227",
            startPort = "Out",
            endQuest = "1731747494598810228",
            endPort = "In"
          },
          {
            startQuest = "172412319621211015",
            startPort = "Out",
            endQuest = "1731747494598810227",
            endPort = "In"
          },
          {
            startQuest = "17241230903709066",
            startPort = "Out",
            endQuest = "17328467227561446724",
            endPort = "In"
          },
          {
            startQuest = "172412316675510517",
            startPort = "Out",
            endQuest = "17328467470671447369",
            endPort = "In"
          },
          {
            startQuest = "172412319621211015",
            startPort = "Out",
            endQuest = "17328467589501447671",
            endPort = "In"
          },
          {
            startQuest = "1731747494598810228",
            startPort = "Out",
            endQuest = "17328467748201448008",
            endPort = "In"
          },
          {
            startQuest = "17328467748201448008",
            startPort = "Out",
            endQuest = "17314792117241026024",
            endPort = "Input_2"
          },
          {
            startQuest = "17241227827384848",
            startPort = "Option_1",
            endQuest = "1727425821384803",
            endPort = "In"
          },
          {
            startQuest = "17241227827384848",
            startPort = "Option_2",
            endQuest = "172412429989723620",
            endPort = "In"
          }
        },
        nodeData = {
          ["17241226647363061"] = {
            key = "17241226647363061",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17241226647363064"] = {
            key = "17241226647363064",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5481.338041185868, y = 383.9975821280168},
            propsData = {ModeType = 0}
          },
          ["17241226647363067"] = {
            key = "17241226647363067",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2623.783099051978, y = 914.5255802549854},
            propsData = {}
          },
          ["17241227484583977"] = {
            key = "17241227484583977",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\154\142\231\154\142",
            pos = {x = 1129.6820744516708, y = 296.4637404824058},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570101}
            }
          },
          ["17241227705064541"] = {
            key = "17241227705064541",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1488.7495347691313, y = -67.28625951759437},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001701,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17241227827384848"] = {
            key = "17241227827384848",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\233\128\137\233\161\185\229\175\185\232\175\157",
            pos = {x = 1491.8303428499394, y = 303.82485159351677},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818012,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1570101",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001702,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["17241230107778515"] = {
            key = "17241230107778515",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133\229\136\176\232\190\190\229\162\153\229\163\129",
            pos = {x = 2211.2130878826842, y = 200.09164036030552},
            propsData = {WaitTime = 10}
          },
          ["17241230903709066"] = {
            key = "17241230903709066",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\184\128\230\179\162\230\128\170\231\137\169",
            pos = {x = 2508.000633670231, y = 403.87918614785116},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1570105,
                1570106,
                1570107,
                1570108
              }
            }
          },
          ["172412316675510516"] = {
            key = "172412316675510516",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133\229\136\176\232\190\190\231\165\158\229\131\143",
            pos = {x = 2895.1097044240382, y = 201.72509900692205},
            propsData = {WaitTime = 12}
          },
          ["172412316675510517"] = {
            key = "172412316675510517",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\186\140\230\179\162\230\128\170\231\137\169",
            pos = {x = 3112.1930377573726, y = 401.74890853073157},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1570109,
                1570110,
                1570111,
                1570112
              }
            }
          },
          ["172412319621211014"] = {
            key = "172412319621211014",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3399.454942519276, y = 401.8084323402553},
            propsData = {WaitTime = 6}
          },
          ["172412319621211015"] = {
            key = "172412319621211015",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\184\137\230\179\162\230\128\170\231\137\169",
            pos = {x = 3667.1930377573726, y = 404.36795614977916},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1570113,
                1570114,
                1570115
              }
            }
          },
          ["172412327851413121"] = {
            key = "172412327851413121",
            type = "TalkNode",
            name = "\231\187\147\230\157\159\229\175\185\232\175\157",
            pos = {x = 4879.968415202202, y = 389.9889918519365},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818012,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1570101",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001706,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 2,
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
          ["172412429989723620"] = {
            key = "172412429989723620",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2324.682559477735, y = 916.9993942924166},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["172412431566524007"] = {
            key = "172412431566524007",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 5178.150439423876, y = 393.20570971612347},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1727425821384803"] = {
            key = "1727425821384803",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175\229\137\141\229\190\128\229\162\153\229\163\129",
            pos = {x = 1889.7063492063494, y = 323.20833333333326},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 818012
            }
          },
          ["17275996599642182"] = {
            key = "17275996599642182",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2545.727846047926, y = 196.44711457497507},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 818012
            }
          },
          ["17275997217094278"] = {
            key = "17275997217094278",
            type = "SendMessageNode",
            name = "\229\137\141\229\190\128\231\167\189\229\133\189",
            pos = {x = 3209.1861793812595, y = 204.86378124164173},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 818012
            }
          },
          ["1731048472966419189"] = {
            key = "1731048472966419189",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2553.3126566416036, y = 545.061499903605},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001703,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1731048503919419693"] = {
            key = "1731048503919419693",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 3809.687656641603, y = 22.757518796992258},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001705,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1731400628560208940"] = {
            key = "1731400628560208940",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133\229\136\176\232\190\190\231\167\189\229\133\189",
            pos = {x = 3520.089285714286, y = 206.1130952380951},
            propsData = {WaitTime = 25}
          },
          ["1731400637784209202"] = {
            key = "1731400637784209202",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 4032.714285714286, y = 206.65476190476178},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 818012
            }
          },
          ["1731400666584209697"] = {
            key = "1731400666584209697",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2813.9166666666665, y = 408.8511904761903},
            propsData = {WaitTime = 8}
          },
          ["1731400787984211848"] = {
            key = "1731400787984211848",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 4279.5297619047615, y = 206.4226190476194},
            propsData = {WaitTime = 3}
          },
          ["1731400843553212932"] = {
            key = "1731400843553212932",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3795.5297619047615, y = 205.85119047619082},
            propsData = {WaitTime = 2}
          },
          ["1731401036165215396"] = {
            key = "1731401036165215396",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2224.246545121545, y = 406.44809357309384},
            propsData = {WaitTime = 8}
          },
          ["1731401599163823084"] = {
            key = "1731401599163823084",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 3224.5047868797865, y = 5.118423243423649},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001704,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17314792117241026024"] = {
            key = "17314792117241026024",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 4609.779971829168, y = 392.5072753601025},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["1731747494598810227"] = {
            key = "1731747494598810227",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3967.029304029303, y = 401.15567765567755},
            propsData = {WaitTime = 8}
          },
          ["1731747494598810228"] = {
            key = "1731747494598810228",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\229\155\155\230\179\162\230\128\170\231\137\169",
            pos = {x = 4219.7673992674, y = 403.71520146520146},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1570116,
                1570117,
                1570118,
                1570119
              }
            }
          },
          ["17328467227561446724"] = {
            key = "17328467227561446724",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2906.343599383073, y = 634.3946334367384},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1570105,
                1570106,
                1570107,
                1570108
              }
            }
          },
          ["17328467470671447369"] = {
            key = "17328467470671447369",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3447.5435993830733, y = 636.5946334367384},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1570109,
                1570110,
                1570111,
                1570112
              }
            }
          },
          ["17328467589501447671"] = {
            key = "17328467589501447671",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3959.4864565259318, y = 659.3946334367384},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1570113,
                1570114,
                1570115
              }
            }
          },
          ["17328467748201448008"] = {
            key = "17328467748201448008",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 4299.543599383074, y = 643.7946334367386},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1570116,
                1570117,
                1570118,
                1570119
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
