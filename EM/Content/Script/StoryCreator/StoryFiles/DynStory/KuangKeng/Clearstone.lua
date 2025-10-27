return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17288947534221",
      startPort = "StoryStart",
      endStory = "1728894992729105",
      endPort = "In"
    },
    {
      startStory = "1728894992729105",
      startPort = "Success",
      endStory = "17288947534235",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17288947534221"] = {
      isStoryNode = true,
      key = "17288947534221",
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
    ["17288947534235"] = {
      isStoryNode = true,
      key = "17288947534235",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1538.5714285714284, y = 312.85714285714283},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1728894992729105"] = {
      isStoryNode = true,
      key = "1728894992729105",
      type = "StoryNode",
      name = "\230\184\133\231\144\134\229\178\169\231\159\179",
      pos = {x = 1175.8392857142858, y = 283.71428571428567},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_KuangkengClearstone_Des",
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
            startQuest = "1728894992729106",
            startPort = "QuestStart",
            endQuest = "1728895012905630",
            endPort = "In"
          },
          {
            startQuest = "17288963002872516",
            startPort = "Out",
            endQuest = "1728894992729113",
            endPort = "Success"
          },
          {
            startQuest = "1728895012905630",
            startPort = "Out",
            endQuest = "1729568047694764363",
            endPort = "In"
          },
          {
            startQuest = "1728894992729106",
            startPort = "QuestStart",
            endQuest = "1730014978131778079",
            endPort = "In"
          },
          {
            startQuest = "1728894992729106",
            startPort = "QuestStart",
            endQuest = "1730014989185778315",
            endPort = "In"
          },
          {
            startQuest = "1728894992729106",
            startPort = "QuestStart",
            endQuest = "1730015000937778596",
            endPort = "In"
          },
          {
            startQuest = "1730014978131778079",
            startPort = "Out",
            endQuest = "1730015153524780081",
            endPort = "In"
          },
          {
            startQuest = "1730014989185778315",
            startPort = "Out",
            endQuest = "1730015163890780381",
            endPort = "In"
          },
          {
            startQuest = "1730015000937778596",
            startPort = "Out",
            endQuest = "1730015165883780480",
            endPort = "In"
          },
          {
            startQuest = "1730015153524780081",
            startPort = "Out",
            endQuest = "1730015084644779526",
            endPort = "Input_1"
          },
          {
            startQuest = "1730015163890780381",
            startPort = "Out",
            endQuest = "1730015084644779526",
            endPort = "Input_2"
          },
          {
            startQuest = "1730015165883780480",
            startPort = "Out",
            endQuest = "1730015084644779526",
            endPort = "Input_3"
          },
          {
            startQuest = "1730015567690783680",
            startPort = "Out",
            endQuest = "1730015575623783929",
            endPort = "In"
          },
          {
            startQuest = "1730015575623783929",
            startPort = "Out",
            endQuest = "1729568141535766204",
            endPort = "In"
          },
          {
            startQuest = "1728894992729106",
            startPort = "QuestStart",
            endQuest = "1730015793805784826",
            endPort = "In"
          },
          {
            startQuest = "17288950336501335",
            startPort = "Out",
            endQuest = "1730015867841786306",
            endPort = "In"
          },
          {
            startQuest = "1730015867841786306",
            startPort = "Out",
            endQuest = "17288963002872516",
            endPort = "In"
          },
          {
            startQuest = "1730015084644779526",
            startPort = "Out",
            endQuest = "1730015567690783680",
            endPort = "In"
          },
          {
            startQuest = "1730015575623783929",
            startPort = "Out",
            endQuest = "17397755317631537384",
            endPort = "In"
          },
          {
            startQuest = "17397779813211875",
            startPort = "Out",
            endQuest = "17288950336501335",
            endPort = "In"
          },
          {
            startQuest = "1729568047694764363",
            startPort = "Out",
            endQuest = "17397790020321413",
            endPort = "In"
          },
          {
            startQuest = "17397790020321413",
            startPort = "Out",
            endQuest = "17397779813211875",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728894992729106"] = {
            key = "1728894992729106",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728894992729113"] = {
            key = "1728894992729113",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3055.1538220551383, y = 312.5743525480367},
            propsData = {ModeType = 0}
          },
          ["1728894992729120"] = {
            key = "1728894992729120",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3003.076923076923, y = 1027.6923076923076},
            propsData = {}
          },
          ["1728895012905630"] = {
            key = "1728895012905630",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\162\142\231\159\179",
            pos = {x = 1138.9250000000002, y = 271.5714285714286},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1380113}
            }
          },
          ["17288950336501335"] = {
            key = "17288950336501335",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2248.6764743580325, y = 297.1200707187552},
            propsData = {WaitTime = 2}
          },
          ["17288963002872516"] = {
            key = "17288963002872516",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2755.3679426120007, y = 292.4970548457393},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1729568047694764363"] = {
            key = "1729568047694764363",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1393.246153846154, y = 279.31120107962187},
            propsData = {WaitTime = 1}
          },
          ["1729568141535766204"] = {
            key = "1729568141535766204",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\130\184\232\141\175\230\161\182",
            pos = {x = 2941.864563697172, y = 653.204751884271},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1380045,
                1380049,
                1380050
              }
            }
          },
          ["1730014978131778079"] = {
            key = "1730014978131778079",
            type = "PickUpNode",
            name = "\231\148\159\230\136\144\230\156\168\231\174\177",
            pos = {x = 1170.7231529766063, y = 515.4592901594453},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1380046},
              QuestPickupId = -1,
              UnitId = 80018,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1730014989185778315"] = {
            key = "1730014989185778315",
            type = "PickUpNode",
            name = "\231\148\159\230\136\144\231\187\179\231\180\162",
            pos = {x = 1165.5231529766065, y = 678.5704012705564},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1380047},
              QuestPickupId = -1,
              UnitId = 80019,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1730015000937778596"] = {
            key = "1730015000937778596",
            type = "PickUpNode",
            name = "\231\148\159\230\136\144\230\156\168\230\161\182",
            pos = {x = 1158.3231529766063, y = 848.9704012705565},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1380048},
              QuestPickupId = -1,
              UnitId = 80020,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1730015084644779526"] = {
            key = "1730015084644779526",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 1817.0703557738086, y = 667.2093188746916},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["1730015153524780081"] = {
            key = "1730015153524780081",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\188\128\232\189\166",
            pos = {x = 1499.7626634661165, y = 510.2862419516144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003203,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730015163890780381"] = {
            key = "1730015163890780381",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\188\128\232\189\166",
            pos = {x = 1492.0703557738088, y = 676.4400881054606},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003204,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730015165883780480"] = {
            key = "1730015165883780480",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\188\128\232\189\166",
            pos = {x = 1490.9165096199627, y = 844.9016265669992},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003202,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730015567690783680"] = {
            key = "1730015567690783680",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2205.1712104746653, y = 680.224703490076},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1380051,
              GuideType = "M",
              GuidePointName = "Mechanism_DynTrigger_1380051"
            }
          },
          ["1730015575623783929"] = {
            key = "1730015575623783929",
            type = "TalkNode",
            name = "\231\187\132\229\144\136",
            pos = {x = 2552.397828301283, y = 667.8071210724935},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003206,
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
          ["1730015793805784826"] = {
            key = "1730015793805784826",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1137.839586543041, y = 16.241536656909147},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003201,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730015867841786306"] = {
            key = "1730015867841786306",
            type = "TalkNode",
            name = "\229\174\140\230\136\144\229\188\128\232\189\166",
            pos = {x = 2500.6967294001834, y = 280.52725094262354},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003207,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17397755317631537384"] = {
            key = "17397755317631537384",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\144\189\231\159\179\230\140\135\229\188\149\231\130\185",
            pos = {x = 2937.5527950310557, y = 496.97826086956525},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1380113,
              StateId = 492062,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1380113"
            }
          },
          ["17397779813211875"] = {
            key = "17397779813211875",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\232\144\189\231\159\179\232\162\171\229\135\187\230\175\129",
            pos = {x = 1942.7999999999997, y = 286.7999999999999},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1380113,
              StateId = 492062,
              IsGuideEnable = false,
              GuidePointName = "Mechanism_Dyn_1380113"
            }
          },
          ["17397790020321413"] = {
            key = "17397790020321413",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\229\136\157\229\167\139\229\140\150",
            pos = {x = 1651.0193498452004, y = 272.9912280701757},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1380113,
              StateId = 492061,
              IsGuideEnable = false,
              GuidePointName = "Mechanism_Dyn_1380113"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
