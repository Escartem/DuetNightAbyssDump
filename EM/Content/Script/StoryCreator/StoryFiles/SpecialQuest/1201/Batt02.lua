return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17501517483363111240",
      startPort = "Success",
      endStory = "17501517483363111241",
      endPort = "In"
    },
    {
      startStory = "17501517483363111242",
      startPort = "Success",
      endStory = "17501517483363111239",
      endPort = "StoryEnd"
    },
    {
      startStory = "17501517483363111238",
      startPort = "StoryStart",
      endStory = "17501517483363111240",
      endPort = "In"
    },
    {
      startStory = "17501517483363111241",
      startPort = "Success",
      endStory = "1753346561265696880",
      endPort = "In"
    },
    {
      startStory = "1753346561265696880",
      startPort = "Success",
      endStory = "1753348573061710306",
      endPort = "In"
    },
    {
      startStory = "1753348573061710306",
      startPort = "Success",
      endStory = "17501517483363111242",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17501517483363111238"] = {
      isStoryNode = true,
      key = "17501517483363111238",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 847.9852249200077, y = 315.0566172957477},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17501517483363111239"] = {
      isStoryNode = true,
      key = "17501517483363111239",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2436.049699554147, y = 417.63842751938336},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17501517483363111240"] = {
      isStoryNode = true,
      key = "17501517483363111240",
      type = "StoryNode",
      name = "\227\128\144Phase01\227\128\145",
      pos = {x = 1104.7399065745685, y = 303.5148885375123},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_Batt01_01_01",
        QuestDeatil = "Content_Batt01_01_01",
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
            startQuest = "17501517483363111246",
            startPort = "Out",
            endQuest = "17501517483363111247",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111243",
            startPort = "QuestStart",
            endQuest = "17501517483363111246",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111247",
            startPort = "Out",
            endQuest = "17501517483363111245",
            endPort = "Fail"
          },
          {
            startQuest = "17501517483363111252",
            startPort = "false",
            endQuest = "17501517483363111253",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111253",
            startPort = "true",
            endQuest = "17501517483363111254",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111256",
            startPort = "Out",
            endQuest = "17501517483363111244",
            endPort = "Success"
          },
          {
            startQuest = "17501517483363111260",
            startPort = "Out",
            endQuest = "17501517483363111261",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111259",
            startPort = "Out",
            endQuest = "17501517483363111262",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111260",
            startPort = "Out",
            endQuest = "17501517483363111258",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111261",
            startPort = "Out",
            endQuest = "17501517483363111263",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111262",
            startPort = "Out",
            endQuest = "17501517483363111265",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111243",
            startPort = "QuestStart",
            endQuest = "17501517483363111252",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111252",
            startPort = "true",
            endQuest = "17501517483363111260",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111254",
            startPort = "Out",
            endQuest = "17501517483363111244",
            endPort = "Success"
          },
          {
            startQuest = "17501517483363111255",
            startPort = "Out",
            endQuest = "17501517483363111244",
            endPort = "Success"
          },
          {
            startQuest = "17501517483363111263",
            startPort = "Out",
            endQuest = "17501693226651902260",
            endPort = "In"
          },
          {
            startQuest = "17501693226651902260",
            startPort = "Out",
            endQuest = "17501517483363111259",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111265",
            startPort = "Out",
            endQuest = "17501517483363111266",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111257",
            startPort = "Out",
            endQuest = "17533422381473731",
            endPort = "In"
          },
          {
            startQuest = "17501697218031905003",
            startPort = "Out",
            endQuest = "17501517483363111257",
            endPort = "In"
          },
          {
            startQuest = "17533422381473731",
            startPort = "Out",
            endQuest = "17501517483363111269",
            endPort = "In"
          },
          {
            startQuest = "17501695937701904156",
            startPort = "Out",
            endQuest = "17533426145237492",
            endPort = "In"
          },
          {
            startQuest = "17533426145237492",
            startPort = "Out",
            endQuest = "17501697658501905169",
            endPort = "In"
          },
          {
            startQuest = "17533426145237492",
            startPort = "Out",
            endQuest = "17501697218031905003",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111269",
            startPort = "Out",
            endQuest = "17533427780468902",
            endPort = "In"
          },
          {
            startQuest = "17533427780468902",
            startPort = "Out",
            endQuest = "17533429615719357",
            endPort = "In"
          },
          {
            startQuest = "17533429615719357",
            startPort = "Out",
            endQuest = "17501517483363111256",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111266",
            startPort = "Out",
            endQuest = "175334312217312064",
            endPort = "In"
          },
          {
            startQuest = "175334312217312064",
            startPort = "Out",
            endQuest = "17501695937701904156",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111253",
            startPort = "false",
            endQuest = "1753346671388698493",
            endPort = "In"
          },
          {
            startQuest = "1753346671388698493",
            startPort = "true",
            endQuest = "17501517483363111255",
            endPort = "In"
          },
          {
            startQuest = "1753346671388698493",
            startPort = "false",
            endQuest = "1753346693873699237",
            endPort = "In"
          },
          {
            startQuest = "1753346693873699237",
            startPort = "true",
            endQuest = "1753354149846719362",
            endPort = "In"
          },
          {
            startQuest = "1753354149846719362",
            startPort = "Out",
            endQuest = "17501517483363111244",
            endPort = "Success"
          },
          {
            startQuest = "1753346693873699237",
            startPort = "false",
            endQuest = "17533562710342721246",
            endPort = "In"
          },
          {
            startQuest = "17533562710342721246",
            startPort = "Out",
            endQuest = "17501517483363111244",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17501517483363111243"] = {
            key = "17501517483363111243",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -916.010430745725, y = -101.64458482693783},
            propsData = {ModeType = 0}
          },
          ["17501517483363111244"] = {
            key = "17501517483363111244",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1012.6473567468518, y = 168.8922084411009},
            propsData = {ModeType = 0}
          },
          ["17501517483363111245"] = {
            key = "17501517483363111245",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 230.86181882633494, y = 1170.2772329820716},
            propsData = {}
          },
          ["17501517483363111246"] = {
            key = "17501517483363111246",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -390.2424857120553, y = 1148.916104682385},
            propsData = {}
          },
          ["17501517483363111247"] = {
            key = "17501517483363111247",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = -86.86941967262221, y = 1163.7531986835797},
            propsData = {}
          },
          ["17501517483363111248"] = {
            key = "17501517483363111248",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3481.857333006322, y = -925.3944759759449},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1980046,
              StateId = 118012,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_Stone01"
            }
          },
          ["17501517483363111249"] = {
            key = "17501517483363111249",
            type = "SendMessageNode",
            name = "\230\142\162\231\180\162\231\187\132\229\136\157\229\167\139\229\140\150",
            pos = {x = -1324.6436616420676, y = -844.5416150823587},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Nai01_Init",
              UnitId = -1
            }
          },
          ["17501517483363111250"] = {
            key = "17501517483363111250",
            type = "SendMessageNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 3101.5510155870993, y = -859.1601883433148},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Batt01_StoneInOrder01",
              UnitId = -1
            }
          },
          ["17501517483363111251"] = {
            key = "17501517483363111251",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = -1074.6521956304562, y = -859.4014267914513},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          },
          ["17501517483363111252"] = {
            key = "17501517483363111252",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = -613.1197484999338, y = -114.99463082234381},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17501517483363111253"] = {
            key = "17501517483363111253",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1812",
            pos = {x = -536.695434612179, y = 144.12250418291222},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17501517483363111254"] = {
            key = "17501517483363111254",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -218.05317783511384, y = 38.569764166443235},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Phase02",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17501517483363111255"] = {
            key = "17501517483363111255",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -186.0880259120599, y = 291.3058485939733},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Phase03",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17501517483363111256"] = {
            key = "17501517483363111256",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2422.925995876429, y = -720.5346687857818},
            propsData = {
              VarName = "East01Batt02Phase",
              VarValue = 1
            }
          },
          ["17501517483363111257"] = {
            key = "17501517483363111257",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1160.9485900029294, y = -320.599044420225},
            propsData = {
              NewDescription = "Description_Batt02_01_04",
              NewDetail = "Content_Batt02_01_04",
              SubTaskTargetIndex = 0
            }
          },
          ["17501517483363111258"] = {
            key = "17501517483363111258",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\191\153\230\152\175\229\147\170\233\135\140",
            pos = {x = -95.44733702482674, y = -1034.1860382488003},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17501517483363111259"] = {
            key = "17501517483363111259",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159",
            pos = {x = 487.04716846967835, y = -841.1123055299064},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_50",
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
          ["17501517483363111260"] = {
            key = "17501517483363111260",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165Batt02\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = -327.22613886814605, y = -758.7067755759891},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104601,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_StartPoint"
            }
          },
          ["17501517483363111261"] = {
            key = "17501517483363111261",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\187\232\136\159",
            pos = {x = -59.981899236809106, y = -870.7344253455747},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2250101}
            }
          },
          ["17501517483363111262"] = {
            key = "17501517483363111262",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\136\187\232\136\159",
            pos = {x = 481.4264665909129, y = -647.4627722674695},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2250101}
            }
          },
          ["17501517483363111263"] = {
            key = "17501517483363111263",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -66.58816166633453, y = -621.8981281876021},
            propsData = {
              NewDescription = "Description_Batt02_01_01",
              NewDetail = "Content_Batt02_01_01",
              SubTaskTargetIndex = 0
            }
          },
          ["17501517483363111265"] = {
            key = "17501517483363111265",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 497.9209857909552, y = -477.55961582277394},
            propsData = {
              NewDescription = "Description_Batt02_01_02",
              NewDetail = "Content_Batt02_01_02",
              SubTaskTargetIndex = 0
            }
          },
          ["17501517483363111266"] = {
            key = "17501517483363111266",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 831.5464104655855, y = -741.2463752459939},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250127,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250127"
            }
          },
          ["17501517483363111267"] = {
            key = "17501517483363111267",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\143\144\231\164\186\230\156\186\229\133\179\231\137\185\231\130\185",
            pos = {x = 3184.3991295214005, y = -644.5624471730965},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17501517483363111268"] = {
            key = "17501517483363111268",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\231\159\179\231\162\145\229\174\140\230\136\144",
            pos = {x = 3647.5315766266244, y = -816.6936454804843},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1980046,
              StateId = 118015,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17501517483363111269"] = {
            key = "17501517483363111269",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1807.7959444427167, y = -818.7122405100689},
            propsData = {
              NewDescription = "Description_Batt01_01_05",
              NewDetail = "Content_Batt01_01_05",
              SubTaskTargetIndex = 0
            }
          },
          ["17501693226651902260"] = {
            key = "17501693226651902260",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 201.64897457838978, y = -750.1887535334497},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250121,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250121"
            }
          },
          ["17501695937701904156"] = {
            key = "17501695937701904156",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\230\128\170\231\137\169",
            pos = {x = 1145.3060103904263, y = -908.358054663513},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250113,
                2250114,
                2250115,
                2250116,
                2250117,
                2250118,
                2250119,
                2250120
              }
            }
          },
          ["17501697218031905003"] = {
            key = "17501697218031905003",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1166.0719694056115, y = -534.4040962380376},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 8,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17501697658501905169"] = {
            key = "17501697658501905169",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1501.420207648277, y = -1116.3491795345142},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17533422381473731"] = {
            key = "17533422381473731",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1494.3271413828693, y = -728.4978006260927},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250125,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250125"
            }
          },
          ["17533426145237492"] = {
            key = "17533426145237492",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1160.8222394220847, y = -722.989261263628},
            propsData = {
              NewDescription = "Description_Batt02_01_03",
              NewDetail = "Content_Batt02_01_03",
              SubTaskTargetIndex = 0
            }
          },
          ["17533427780468902"] = {
            key = "17533427780468902",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\146\169\233\148\129",
            pos = {x = 1790.1895363408519, y = -619.1447301408595},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250089,
                2250090,
                2250091
              }
            }
          },
          ["17533429615719357"] = {
            key = "17533429615719357",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2104.475250626567, y = -732.478063474193},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250126,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250126"
            }
          },
          ["175334312217312064"] = {
            key = "175334312217312064",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\230\128\170\231\137\169",
            pos = {x = 1151.3985699542977, y = -1070.3037456217214},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2250104}
            }
          },
          ["1753346671388698493"] = {
            key = "1753346671388698493",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1813",
            pos = {x = -501.94188513516485, y = 367.72464068439376},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "2"}
              }
            }
          },
          ["1753346693873699237"] = {
            key = "1753346693873699237",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1814",
            pos = {x = -432.98890467118065, y = 600.4877985791306},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "3"}
              }
            }
          },
          ["1753354149846719362"] = {
            key = "1753354149846719362",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -96.10074677644388, y = 524.6356313964679},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Phase04",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17533562710342721246"] = {
            key = "17533562710342721246",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -98.44444693593354, y = 757.6882629754152},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Leave",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {
          ["173702325391818809635"] = {
            key = "173702325391818809635",
            name = "\229\185\187\229\162\131\229\136\157\229\167\139\229\140\150",
            position = {x = -1392.5165622878, y = -944.0660265606591},
            size = {width = 610.909090909091, height = 248.1818181818182}
          },
          ["173702336979418811119"] = {
            key = "173702336979418811119",
            name = "\229\136\164\230\150\173\231\142\169\229\174\182\229\189\147\229\137\141\233\152\182\230\174\181",
            position = {x = -633.5469792392701, y = -196.2655594838762},
            size = {width = 1476.8146535154578, height = 1261.9538224592916}
          }
        }
      }
    },
    ["17501517483363111241"] = {
      isStoryNode = true,
      key = "17501517483363111241",
      type = "StoryNode",
      name = "\227\128\144Phase02\227\128\145",
      pos = {x = 1352.3630013778834, y = 301.63427159216644},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_Batt01_02_01",
        QuestDeatil = "Content_Batt01_02_01",
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
            startQuest = "17501517483363111273",
            startPort = "Out",
            endQuest = "17501517483363111274",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111270",
            startPort = "QuestStart",
            endQuest = "17501517483363111273",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111274",
            startPort = "Out",
            endQuest = "17501517483363111272",
            endPort = "Fail"
          },
          {
            startQuest = "17501517483363111278",
            startPort = "Out",
            endQuest = "17501517483363111271",
            endPort = "Success"
          },
          {
            startQuest = "1753343491042677081",
            startPort = "Out",
            endQuest = "1753343492153677144",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111270",
            startPort = "QuestStart",
            endQuest = "1753343753541680659",
            endPort = "In"
          },
          {
            startQuest = "1753343753541680659",
            startPort = "true",
            endQuest = "1753343726773679537",
            endPort = "In"
          },
          {
            startQuest = "1753343492153677144",
            startPort = "Out",
            endQuest = "1753343713869679079",
            endPort = "In"
          },
          {
            startQuest = "1753343726773679537",
            startPort = "Out",
            endQuest = "1753344117753685014",
            endPort = "In"
          },
          {
            startQuest = "1753343713869679079",
            startPort = "Out",
            endQuest = "17501517483363111279",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111279",
            startPort = "Out",
            endQuest = "1753344294905686809",
            endPort = "In"
          },
          {
            startQuest = "1753344294905686809",
            startPort = "Out",
            endQuest = "17501517483363111276",
            endPort = "In"
          },
          {
            startQuest = "1753344294905686809",
            startPort = "Out",
            endQuest = "1753344237937686104",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111276",
            startPort = "Out",
            endQuest = "1753344300546686925",
            endPort = "Branch_1"
          },
          {
            startQuest = "1753344237937686104",
            startPort = "Out",
            endQuest = "1753344300546686925",
            endPort = "Branch_2"
          },
          {
            startQuest = "1753344117753685014",
            startPort = "Out",
            endQuest = "1753344758621690842",
            endPort = "In"
          },
          {
            startQuest = "1753344758621690842",
            startPort = "Out",
            endQuest = "1753343491042677081",
            endPort = "In"
          },
          {
            startQuest = "1753344300546686925",
            startPort = "Out",
            endQuest = "17501517483363111278",
            endPort = "In"
          },
          {
            startQuest = "17533542198811384425",
            startPort = "true",
            endQuest = "17533542198811384424",
            endPort = "In"
          },
          {
            startQuest = "17533542198811384425",
            startPort = "false",
            endQuest = "17533542198811384426",
            endPort = "In"
          },
          {
            startQuest = "17533542198811384426",
            startPort = "true",
            endQuest = "17533542198811384427",
            endPort = "In"
          },
          {
            startQuest = "1753343753541680659",
            startPort = "false",
            endQuest = "17533542198811384425",
            endPort = "In"
          },
          {
            startQuest = "17533542198811384426",
            startPort = "false",
            endQuest = "17533559856422719641",
            endPort = "In"
          },
          {
            startQuest = "17533559856422719641",
            startPort = "Out",
            endQuest = "17501517483363111271",
            endPort = "Success"
          },
          {
            startQuest = "17533542198811384424",
            startPort = "Out",
            endQuest = "17501517483363111271",
            endPort = "Success"
          },
          {
            startQuest = "17533542198811384427",
            startPort = "Out",
            endQuest = "17501517483363111271",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17501517483363111270"] = {
            key = "17501517483363111270",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -26.493014209732394, y = 291.08726284035885},
            propsData = {ModeType = 0}
          },
          ["17501517483363111271"] = {
            key = "17501517483363111271",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1680.2062601169255, y = 707.1151569199352},
            propsData = {ModeType = 0}
          },
          ["17501517483363111272"] = {
            key = "17501517483363111272",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 944.2118444649186, y = 1941.610482263546},
            propsData = {}
          },
          ["17501517483363111273"] = {
            key = "17501517483363111273",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 352.3818476780343, y = 2075.1884193683863},
            propsData = {}
          },
          ["17501517483363111274"] = {
            key = "17501517483363111274",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 642.1903606235026, y = 2003.3089358294735},
            propsData = {}
          },
          ["17501517483363111275"] = {
            key = "17501517483363111275",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1812",
            pos = {x = -104.16164867423419, y = 826.2065932414906},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17501517483363111276"] = {
            key = "17501517483363111276",
            type = "WaitingMechanismEnterStateNode",
            name = "GravityBallSensor01",
            pos = {x = 1803.5149121838008, y = 67.9133370342517},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250016,
              StateId = 1210151,
              IsGuideEnable = false,
              GuidePointName = "QuestPoint_GravitySensor01"
            }
          },
          ["17501517483363111277"] = {
            key = "17501517483363111277",
            type = "SendMessageNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 783.5989646286316, y = -214.9974729255842},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Batt01_StoneInOrder02",
              UnitId = -1
            }
          },
          ["17501517483363111278"] = {
            key = "17501517483363111278",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2517.2285777120687, y = 218.7579927092633},
            propsData = {
              VarName = "East01Batt02Phase",
              VarValue = 2
            }
          },
          ["17501517483363111279"] = {
            key = "17501517483363111279",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1477.4371006758138, y = 62.18671535081303},
            propsData = {
              NewDescription = "Description_Batt01_02_02",
              NewDetail = "Content_Batt01_02_02",
              SubTaskTargetIndex = 0
            }
          },
          ["17501517483363111280"] = {
            key = "17501517483363111280",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\231\159\179\231\162\145\229\174\140\230\136\144",
            pos = {x = 2860.725697693587, y = 766.8611966443884},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1980079,
              StateId = 118015,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17501517483363111281"] = {
            key = "17501517483363111281",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2470.317085711699, y = 674.5528660235977},
            propsData = {
              NewDescription = "Description_Batt02_02_04",
              NewDetail = "Content_Batt02_02_04",
              SubTaskTargetIndex = 0
            }
          },
          ["1753343491042677081"] = {
            key = "1753343491042677081",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV2",
            pos = {x = 1151.625, y = 33.52777777777786},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2250145}
            }
          },
          ["1753343492153677144"] = {
            key = "1753343492153677144",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV1",
            pos = {x = 1143.8472222222226, y = 213.25000000000006},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250137,
                2250138,
                2250139,
                2250140,
                2250141,
                2250142,
                2250143,
                2250144
              }
            }
          },
          ["1753343713869679079"] = {
            key = "1753343713869679079",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1155.3193278943281, y = 403.8210921928312},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 9,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1753343726773679537"] = {
            key = "1753343726773679537",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 570.3460424078849, y = 251.81497842355967},
            propsData = {
              NewDescription = "Description_Batt02_02_01",
              NewDetail = "Content_Batt02_02_01",
              SubTaskTargetIndex = 0
            }
          },
          ["1753343753541680659"] = {
            key = "1753343753541680659",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1812",
            pos = {x = 262.47744949706566, y = 280.0798573944519},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["1753344117753685014"] = {
            key = "1753344117753685014",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 855.1479897314364, y = 228.16146965163014},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250204,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250204"
            }
          },
          ["1753344237937686104"] = {
            key = "1753344237937686104",
            type = "WaitingMechanismEnterStateNode",
            name = "GravityBallSensor02",
            pos = {x = 1806.6631412465883, y = 346.39379288395344},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250015,
              StateId = 1210151,
              IsGuideEnable = false,
              GuidePointName = "QuestPoint_GravitySensor02"
            }
          },
          ["1753344294905686809"] = {
            key = "1753344294905686809",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 1477.841066296367, y = 225.3740316891351},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["1753344300546686925"] = {
            key = "1753344300546686925",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 2139.760258215558, y = 207.0912034063068},
            propsData = {
              InputBranchQuestNumber = 2,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["1753344758621690842"] = {
            key = "1753344758621690842",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1143.5704416689034, y = -112.12229365622431},
            propsData = {
              NewDescription = "Description_Batt02_02_02",
              NewDetail = "Content_Batt02_02_02",
              SubTaskTargetIndex = 0
            }
          },
          ["1753345015878694134"] = {
            key = "1753345015878694134",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2789.781225982629, y = 554.6146344483509},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["17533542198811384424"] = {
            key = "17533542198811384424",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 994.4900000288741, y = 631.0742253543187},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Phase03",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17533542198811384425"] = {
            key = "17533542198811384425",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1813",
            pos = {x = 556.4932836629121, y = 720.3501603018822},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "2"}
              }
            }
          },
          ["17533542198811384426"] = {
            key = "17533542198811384426",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1814",
            pos = {x = 634.0176926983248, y = 965.9704610537618},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "3"}
              }
            }
          },
          ["17533542198811384427"] = {
            key = "17533542198811384427",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 998.7629934502048, y = 878.6897224425278},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Phase04",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17533559856422719641"] = {
            key = "17533559856422719641",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1001.1854246914438, y = 1099.681781434043},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Leave",
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
    ["17501517483363111242"] = {
      isStoryNode = true,
      key = "17501517483363111242",
      type = "StoryNode",
      name = "\227\128\144Leave\227\128\145",
      pos = {x = 2125.5262179240394, y = 295.2688551056974},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_Batt02_05_01",
        QuestDeatil = "Content_Batt02_05_01",
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
            startQuest = "17501517483363111287",
            startPort = "Out",
            endQuest = "17501517483363111288",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111282",
            startPort = "QuestStart",
            endQuest = "17501517483363111287",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111285",
            startPort = "Out",
            endQuest = "17501517483363111289",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111289",
            startPort = "Out",
            endQuest = "17501517483363111286",
            endPort = "In"
          },
          {
            startQuest = "17501517483363111288",
            startPort = "Out",
            endQuest = "17501517483363111284",
            endPort = "Fail"
          },
          {
            startQuest = "17501517483363111282",
            startPort = "QuestStart",
            endQuest = "17501517483363111285",
            endPort = "In"
          }
        },
        nodeData = {
          ["17501517483363111282"] = {
            key = "17501517483363111282",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3679.3285589410584, y = 418.6582417582418},
            propsData = {ModeType = 0}
          },
          ["17501517483363111283"] = {
            key = "17501517483363111283",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4755.562535503711, y = 423.2640431463958},
            propsData = {ModeType = 0}
          },
          ["17501517483363111284"] = {
            key = "17501517483363111284",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4699.238361638361, y = 596.3445304695304},
            propsData = {}
          },
          ["17501517483363111285"] = {
            key = "17501517483363111285",
            type = "GoToNode",
            name = "GOTO - \232\167\166\229\143\145\231\166\187\229\188\128\229\185\187\229\162\131",
            pos = {x = 4006.870849975793, y = 401.9782425961425},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250170,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250170"
            }
          },
          ["17501517483363111286"] = {
            key = "17501517483363111286",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 4522.874071753119, y = 409.4850330955592},
            propsData = {}
          },
          ["17501517483363111287"] = {
            key = "17501517483363111287",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 4005.4398972136373, y = 579.1142798855781},
            propsData = {}
          },
          ["17501517483363111288"] = {
            key = "17501517483363111288",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 4276.553222993331, y = 579.587737523136},
            propsData = {}
          },
          ["17501517483363111289"] = {
            key = "17501517483363111289",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 4263.249937792718, y = 418.26417520654013},
            propsData = {}
          },
          ["1753353970651717641"] = {
            key = "1753353970651717641",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\166\187\229\188\128\231\130\185",
            pos = {x = 3878.3897849462364, y = 156.98348694316434},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2250169}
            }
          },
          ["1753353984324717821"] = {
            key = "1753353984324717821",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 4262.583333333333, y = 214.52380952380952},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 2250169,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Drop_Leave_2250169",
              IsUseCount = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1753346561265696880"] = {
      isStoryNode = true,
      key = "1753346561265696880",
      type = "StoryNode",
      name = "\227\128\144Phase03\227\128\145",
      pos = {x = 1615.9626024877741, y = 294.25330015776245},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_Batt01_03_01",
        QuestDeatil = "Content_Batt01_03_01",
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
            startQuest = "1753346561265696888",
            startPort = "Out",
            endQuest = "1753346561265696889",
            endPort = "In"
          },
          {
            startQuest = "1753346561265696885",
            startPort = "QuestStart",
            endQuest = "1753346561265696888",
            endPort = "In"
          },
          {
            startQuest = "1753346561265696889",
            startPort = "Out",
            endQuest = "1753346561265696887",
            endPort = "Fail"
          },
          {
            startQuest = "1753346561265696893",
            startPort = "Out",
            endQuest = "1753346561265696886",
            endPort = "Success"
          },
          {
            startQuest = "1753346561265696897",
            startPort = "Out",
            endQuest = "1753346561265696898",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696901",
            startPort = "false",
            endQuest = "1753346561266696902",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696902",
            startPort = "true",
            endQuest = "1753346561266696903",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696902",
            startPort = "false",
            endQuest = "1753346561266696904",
            endPort = "In"
          },
          {
            startQuest = "1753346561265696885",
            startPort = "QuestStart",
            endQuest = "1753346561266696901",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696901",
            startPort = "true",
            endQuest = "1753346561266696900",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696903",
            startPort = "Out",
            endQuest = "1753346561265696886",
            endPort = "Success"
          },
          {
            startQuest = "1753346561266696904",
            startPort = "Out",
            endQuest = "1753346561265696886",
            endPort = "Success"
          },
          {
            startQuest = "1753346561265696898",
            startPort = "Out",
            endQuest = "1753346561266696899",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696900",
            startPort = "Out",
            endQuest = "1753346561266696905",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696899",
            startPort = "Out",
            endQuest = "1753346561265696894",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696905",
            startPort = "Out",
            endQuest = "1753346561266696909",
            endPort = "In"
          },
          {
            startQuest = "1753347656111703504",
            startPort = "Out",
            endQuest = "1753347191627702998",
            endPort = "In"
          },
          {
            startQuest = "1753347091138702766",
            startPort = "Out",
            endQuest = "1753347698238704684",
            endPort = "In"
          },
          {
            startQuest = "1753347698238704684",
            startPort = "Out",
            endQuest = "1753347656111703504",
            endPort = "In"
          },
          {
            startQuest = "1753347191627702998",
            startPort = "Out",
            endQuest = "1753348340473706711",
            endPort = "In"
          },
          {
            startQuest = "1753348340473706711",
            startPort = "Out",
            endQuest = "1753348261527706228",
            endPort = "In"
          },
          {
            startQuest = "1753346561265696894",
            startPort = "Out",
            endQuest = "17533558915082053487",
            endPort = "In"
          },
          {
            startQuest = "17533558915082053487",
            startPort = "Out",
            endQuest = "1753347091138702766",
            endPort = "In"
          },
          {
            startQuest = "1753346561266696909",
            startPort = "Out",
            endQuest = "17533558837902053402",
            endPort = "In"
          },
          {
            startQuest = "17533558837902053402",
            startPort = "Out",
            endQuest = "1753346561265696897",
            endPort = "In"
          },
          {
            startQuest = "1753348261527706228",
            startPort = "Out",
            endQuest = "175342577120312667470",
            endPort = "In"
          },
          {
            startQuest = "175342576882012667382",
            startPort = "Out",
            endQuest = "1753346561265696893",
            endPort = "In"
          },
          {
            startQuest = "175342577120312667470",
            startPort = "Out",
            endQuest = "1753429939393670685",
            endPort = "In"
          },
          {
            startQuest = "1753429939393670685",
            startPort = "Out",
            endQuest = "175342576882012667382",
            endPort = "In"
          }
        },
        nodeData = {
          ["1753346561265696885"] = {
            key = "1753346561265696885",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -26.493014209732394, y = 291.08726284035885},
            propsData = {ModeType = 0}
          },
          ["1753346561265696886"] = {
            key = "1753346561265696886",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1680.2062601169255, y = 707.1151569199352},
            propsData = {ModeType = 0}
          },
          ["1753346561265696887"] = {
            key = "1753346561265696887",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1165.4618444649186, y = 1122.235482263546},
            propsData = {}
          },
          ["1753346561265696888"] = {
            key = "1753346561265696888",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 573.6318476780343, y = 1255.8134193683863},
            propsData = {}
          },
          ["1753346561265696889"] = {
            key = "1753346561265696889",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 863.4403606235026, y = 1183.9339358294735},
            propsData = {}
          },
          ["1753346561265696890"] = {
            key = "1753346561265696890",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1812",
            pos = {x = -104.16164867423419, y = 826.2065932414906},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["1753346561265696892"] = {
            key = "1753346561265696892",
            type = "SendMessageNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 783.5989646286316, y = -214.9974729255842},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Batt01_StoneInOrder02",
              UnitId = -1
            }
          },
          ["1753346561265696893"] = {
            key = "1753346561265696893",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2865.9273299402325, y = 176.11984654170536},
            propsData = {
              VarName = "East01Batt02Phase",
              VarValue = 3
            }
          },
          ["1753346561265696894"] = {
            key = "1753346561265696894",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1472.7594690968663, y = 233.06829429818143},
            propsData = {
              NewDescription = "Description_Batt02_03_03",
              NewDetail = "Content_Batt02_03_03",
              SubTaskTargetIndex = 0
            }
          },
          ["1753346561265696895"] = {
            key = "1753346561265696895",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\231\159\179\231\162\145\229\174\140\230\136\144",
            pos = {x = 2860.725697693587, y = 766.8611966443884},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1980079,
              StateId = 118015,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1753346561265696896"] = {
            key = "1753346561265696896",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2470.317085711699, y = 674.5528660235977},
            propsData = {
              NewDescription = "Description_Batt02_02_04",
              NewDetail = "Content_Batt02_02_04",
              SubTaskTargetIndex = 0
            }
          },
          ["1753346561265696897"] = {
            key = "1753346561265696897",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV2",
            pos = {x = 1169.8618421052631, y = -80.78801169590635},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250150,
                2250154,
                2250158,
                2250162
              }
            }
          },
          ["1753346561265696898"] = {
            key = "1753346561265696898",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV1",
            pos = {x = 1164.9938387635762, y = 58.885338345864724},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250147,
                2250148,
                2250149,
                2250163,
                2250164,
                2250165,
                2250151,
                2250152,
                2250153,
                2250154,
                2250155,
                2250156,
                2250157,
                2250159,
                2250160,
                2250161
              }
            }
          },
          ["1753346561266696899"] = {
            key = "1753346561266696899",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1185.3193278943281, y = 243.3210921928312},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 19,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1753346561266696900"] = {
            key = "1753346561266696900",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 555.3460424078849, y = 218.43997842355967},
            propsData = {
              NewDescription = "Description_Batt02_02_01",
              NewDetail = "Content_Batt02_03_01",
              SubTaskTargetIndex = 0
            }
          },
          ["1753346561266696901"] = {
            key = "1753346561266696901",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1813",
            pos = {x = 260.47744949706566, y = 280.0798573944519},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "2"}
              }
            }
          },
          ["1753346561266696902"] = {
            key = "1753346561266696902",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1814",
            pos = {x = 615.9017633848207, y = 647.1969923997078},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "3"}
              }
            }
          },
          ["1753346561266696903"] = {
            key = "1753346561266696903",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1021.2808622671489, y = 590.3284629095546},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Phase04",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1753346561266696904"] = {
            key = "1753346561266696904",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1031.1056633130097, y = 832.3364771616459},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "RespawnPoint_Batt02Leave",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1753346561266696905"] = {
            key = "1753346561266696905",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 811.6479897314364, y = 213.16146965163014},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250203,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250203"
            }
          },
          ["1753346561266696909"] = {
            key = "1753346561266696909",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1146.0178100899561, y = -370.1222936562243},
            propsData = {
              NewDescription = "Description_Batt02_03_02",
              NewDetail = "Content_Batt02_03_02",
              SubTaskTargetIndex = 0
            }
          },
          ["1753346561266696910"] = {
            key = "1753346561266696910",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2789.781225982629, y = 554.6146344483509},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["1753347091138702766"] = {
            key = "1753347091138702766",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1813.1911056719705, y = 219.48784740109917},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250166,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250166"
            }
          },
          ["1753347191627702998"] = {
            key = "1753347191627702998",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\228\186\164\228\186\146Xingshibei",
            pos = {x = 2114.909580745284, y = -35.70703925346492},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250047,
              StateId = 118012,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_Xingshibei01"
            }
          },
          ["1753347656111703504"] = {
            key = "1753347656111703504",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2111.087000100123, y = -190.75197012904096},
            propsData = {
              NewDescription = "Description_Batt02_03_04",
              NewDetail = "Content_Batt02_03_04",
              SubTaskTargetIndex = 0
            }
          },
          ["1753347698238704684"] = {
            key = "1753347698238704684",
            type = "SwitchMechanismStateNode",
            name = "\232\167\163\233\148\129Xingshibei",
            pos = {x = 2108.665341113948, y = -348.3648733548474},
            propsData = {
              StaticCreatorIdList = {2250047},
              ManualItemIdList = {},
              StateId = 118011,
              QuestId = 0
            }
          },
          ["1753348261527706228"] = {
            key = "1753348261527706228",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144Xingshibei",
            pos = {x = 2127.067844050606, y = 336.8992629937291},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250047,
              StateId = 118015,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1753348340473706711"] = {
            key = "1753348340473706711",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2115.5789355839934, y = 146.32024618511085},
            propsData = {
              NewDescription = "Description_Batt02_03_05",
              NewDetail = "Content_Batt02_03_05",
              SubTaskTargetIndex = 0
            }
          },
          ["17533558837902053402"] = {
            key = "17533558837902053402",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1180.0379739270222, y = -242.39993612500007},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {2250202}
            }
          },
          ["17533558915082053487"] = {
            key = "17533558915082053487",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1495.6394776864213, y = 388.84066537875935},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {2250202}
            }
          },
          ["175342576882012667382"] = {
            key = "175342576882012667382",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\228\186\164\228\186\146Xingshibei",
            pos = {x = 2524.0000000000005, y = 40.00000000000017},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250048,
              StateId = 118012,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_Xingshibei01"
            }
          },
          ["175342577120312667470"] = {
            key = "175342577120312667470",
            type = "SwitchMechanismStateNode",
            name = "\232\167\163\233\148\129Xingshibei",
            pos = {x = 2501.6190476190477, y = -327.99196048694745},
            propsData = {
              StaticCreatorIdList = {2250048},
              ManualItemIdList = {},
              StateId = 118011,
              QuestId = 0
            }
          },
          ["1753429939393670685"] = {
            key = "1753429939393670685",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2514.344152235793, y = -149.5316742081448},
            propsData = {
              NewDescription = "Description_Batt02_03_06",
              NewDetail = "Content_Batt02_03_06",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["1753348573061710306"] = {
      isStoryNode = true,
      key = "1753348573061710306",
      type = "StoryNode",
      name = "\227\128\144Phase04\227\128\145",
      pos = {x = 1872.6292691544406, y = 292.0310779355402},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_Batt02_04_01",
        QuestDeatil = "Content_Batt02_04_01",
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
            startQuest = "1753348573061710314",
            startPort = "Out",
            endQuest = "1753348573061710315",
            endPort = "In"
          },
          {
            startQuest = "1753348573061710311",
            startPort = "QuestStart",
            endQuest = "1753348573061710314",
            endPort = "In"
          },
          {
            startQuest = "1753348573061710315",
            startPort = "Out",
            endQuest = "1753348573061710313",
            endPort = "Fail"
          },
          {
            startQuest = "1753348573061710318",
            startPort = "Out",
            endQuest = "1753348573061710312",
            endPort = "Success"
          },
          {
            startQuest = "1753348573062710322",
            startPort = "Out",
            endQuest = "1753348573062710323",
            endPort = "In"
          },
          {
            startQuest = "1753348573061710311",
            startPort = "QuestStart",
            endQuest = "1753348573062710326",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710326",
            startPort = "true",
            endQuest = "1753348573062710325",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710323",
            startPort = "Out",
            endQuest = "1753348573062710324",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710325",
            startPort = "Out",
            endQuest = "1753348573062710330",
            endPort = "In"
          },
          {
            startQuest = "1753348573061710319",
            startPort = "Out",
            endQuest = "1753348573062710333",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710335",
            startPort = "Out",
            endQuest = "1753348573062710334",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710333",
            startPort = "Out",
            endQuest = "1753348573062710336",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710336",
            startPort = "Out",
            endQuest = "1753348573062710335",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710334",
            startPort = "Out",
            endQuest = "1753348573062710338",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710338",
            startPort = "Out",
            endQuest = "1753348573062710337",
            endPort = "In"
          },
          {
            startQuest = "1753353010214713775",
            startPort = "Out",
            endQuest = "1753348573061710319",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710330",
            startPort = "Out",
            endQuest = "1753348573062710331",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710326",
            startPort = "false",
            endQuest = "1753348573061710312",
            endPort = "Success"
          },
          {
            startQuest = "1753348573062710331",
            startPort = "Out",
            endQuest = "1753348573062710322",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710324",
            startPort = "Out",
            endQuest = "17533555048991386887",
            endPort = "In"
          },
          {
            startQuest = "17533555048991386887",
            startPort = "Out",
            endQuest = "17533556129511388310",
            endPort = "In"
          },
          {
            startQuest = "17533556129511388310",
            startPort = "Out",
            endQuest = "1753353010214713775",
            endPort = "In"
          },
          {
            startQuest = "1753348573062710337",
            startPort = "Out",
            endQuest = "1753428980418668717",
            endPort = "In"
          },
          {
            startQuest = "1753428980418668717",
            startPort = "Out",
            endQuest = "1753428977597668612",
            endPort = "In"
          },
          {
            startQuest = "1753428977597668612",
            startPort = "Out",
            endQuest = "1753348573061710318",
            endPort = "In"
          }
        },
        nodeData = {
          ["1753348573061710311"] = {
            key = "1753348573061710311",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -26.493014209732394, y = 291.08726284035885},
            propsData = {ModeType = 0}
          },
          ["1753348573061710312"] = {
            key = "1753348573061710312",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1463.4113883220534, y = 750.560669740448},
            propsData = {ModeType = 0}
          },
          ["1753348573061710313"] = {
            key = "1753348573061710313",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1165.4618444649186, y = 1122.235482263546},
            propsData = {}
          },
          ["1753348573061710314"] = {
            key = "1753348573061710314",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 545.3965535603872, y = 1040.6295958389746},
            propsData = {}
          },
          ["1753348573061710315"] = {
            key = "1753348573061710315",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 866.9697723882084, y = 954.5221711235912},
            propsData = {}
          },
          ["1753348573061710316"] = {
            key = "1753348573061710316",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1812",
            pos = {x = -104.16164867423419, y = 826.2065932414906},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["1753348573061710317"] = {
            key = "1753348573061710317",
            type = "SendMessageNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 215.47396462863162, y = -492.4974729255842},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Batt01_StoneInOrder02",
              UnitId = -1
            }
          },
          ["1753348573061710318"] = {
            key = "1753348573061710318",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 3168.7629257170047, y = 183.35212406810064},
            propsData = {
              VarName = "East01Batt02Phase",
              VarValue = 4
            }
          },
          ["1753348573061710319"] = {
            key = "1753348573061710319",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1734.079044409829, y = 178.7950913098923},
            propsData = {
              NewDescription = "Description_Batt02_04_03",
              NewDetail = "Content_Batt02_04_03",
              SubTaskTargetIndex = 0
            }
          },
          ["1753348573061710320"] = {
            key = "1753348573061710320",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\231\159\179\231\162\145\229\174\140\230\136\144",
            pos = {x = 2860.725697693587, y = 766.8611966443884},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1980079,
              StateId = 118015,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1753348573061710321"] = {
            key = "1753348573061710321",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2470.317085711699, y = 674.5528660235977},
            propsData = {
              NewDescription = "Description_Batt02_02_04",
              NewDetail = "Content_Batt02_02_04",
              SubTaskTargetIndex = 0
            }
          },
          ["1753348573062710322"] = {
            key = "1753348573062710322",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV2",
            pos = {x = 1114.1796218487395, y = -580.6732026143791},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250185,
                2250186,
                2250187,
                2250188,
                2250189,
                2250190,
                2250191,
                2250192,
                2250196,
                2250197,
                2250198
              }
            }
          },
          ["1753348573062710323"] = {
            key = "1753348573062710323",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV1",
            pos = {x = 1117.2768440709622, y = -422.70098039215674},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2250178}
            }
          },
          ["1753348573062710324"] = {
            key = "1753348573062710324",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1128.3918068859248, y = -268.59417391361137},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 12,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1753348573062710325"] = {
            key = "1753348573062710325",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 553.9174709793134, y = 221.633255734484},
            propsData = {
              NewDescription = "Description_Batt02_04_01",
              NewDetail = "Content_Batt02_04_01",
              SubTaskTargetIndex = 0
            }
          },
          ["1753348573062710326"] = {
            key = "1753348573062710326",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1814",
            pos = {x = 262.47744949706566, y = 280.0798573944519},
            propsData = {
              FunctionName = "Equal",
              VarName = "East01Batt02Phase",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "3"}
              }
            }
          },
          ["1753348573062710330"] = {
            key = "1753348573062710330",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 832.8244603196716, y = 186.33794023986545},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250146,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250146"
            }
          },
          ["1753348573062710331"] = {
            key = "1753348573062710331",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1106.1505160063307, y = -777.4314673256921},
            propsData = {
              NewDescription = "Description_Batt02_04_02",
              NewDetail = "Content_Batt02_04_02",
              SubTaskTargetIndex = 0
            }
          },
          ["1753348573062710332"] = {
            key = "1753348573062710332",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2789.781225982629, y = 554.6146344483509},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["1753348573062710333"] = {
            key = "1753348573062710333",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2092.8969880249115, y = 192.42902387168743},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2250168,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2250168"
            }
          },
          ["1753348573062710334"] = {
            key = "1753348573062710334",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\228\186\164\228\186\146Xingshibei",
            pos = {x = 2459.909580745284, y = -22.373705920131584},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250087,
              StateId = 118012,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_Xingshibei01"
            }
          },
          ["1753348573062710335"] = {
            key = "1753348573062710335",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2456.087000100123, y = -177.4186367957076},
            propsData = {
              NewDescription = "Description_Batt02_03_04",
              NewDetail = "Content_Batt02_03_04",
              SubTaskTargetIndex = 0
            }
          },
          ["1753348573062710336"] = {
            key = "1753348573062710336",
            type = "SwitchMechanismStateNode",
            name = "\232\167\163\233\148\129Xingshibei",
            pos = {x = 2453.665341113948, y = -335.0315400215141},
            propsData = {
              StaticCreatorIdList = {2250087},
              ManualItemIdList = {},
              StateId = 118011,
              QuestId = 0
            }
          },
          ["1753348573062710337"] = {
            key = "1753348573062710337",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144Xingshibei",
            pos = {x = 2464.8409532943033, y = 317.7956215371465},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250087,
              StateId = 118015,
              IsGuideEnable = false,
              GuidePointName = "QuestPoint_Xingshibei02"
            }
          },
          ["1753348573062710338"] = {
            key = "1753348573062710338",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2460.5789355839934, y = 159.6535795184442},
            propsData = {
              NewDescription = "Description_Batt02_03_05",
              NewDetail = "Content_Batt02_03_05",
              SubTaskTargetIndex = 0
            }
          },
          ["1753353010214713775"] = {
            key = "1753353010214713775",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1427.6371347103768, y = 168.59439250930387},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2250054,
              StateId = 701001,
              IsGuideEnable = true,
              GuidePointName = ""
            }
          },
          ["1753353027375714408"] = {
            key = "1753353027375714408",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1434.40184059273, y = -1233.52557784822},
            propsData = {
              NewDescription = "Description_Batt02_03_02",
              NewDetail = "Content_Batt02_03_02",
              SubTaskTargetIndex = 0
            }
          },
          ["17533555048991386887"] = {
            key = "17533555048991386887",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144LV2",
            pos = {x = 1096.3380514407056, y = -71.11685865782988},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2250199,
                2250200,
                2250201
              }
            }
          },
          ["17533556129511388310"] = {
            key = "17533556129511388310",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1120.4261372679223, y = 117.26322091022877},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2250199,
                2250200,
                2250201
              }
            }
          },
          ["1753428977597668612"] = {
            key = "1753428977597668612",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\228\186\164\228\186\146Xingshibei",
            pos = {x = 2826.065934065934, y = 125.98319327731076},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1980085,
              StateId = 118012,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_Xingshibei01"
            }
          },
          ["1753428980418668717"] = {
            key = "1753428980418668717",
            type = "SwitchMechanismStateNode",
            name = "\232\167\163\233\148\129Xingshibei",
            pos = {x = 2813.208791208792, y = -124.3897195905891},
            propsData = {
              StaticCreatorIdList = {1980085},
              ManualItemIdList = {},
              StateId = 118011,
              QuestId = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
