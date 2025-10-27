return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17363162638301",
      startPort = "StoryStart",
      endStory = "1736316573365200",
      endPort = "In"
    },
    {
      startStory = "1736316573365200",
      startPort = "Success",
      endStory = "17363162638305",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17363162638301"] = {
      isStoryNode = true,
      key = "17363162638301",
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
    ["17363162638305"] = {
      isStoryNode = true,
      key = "17363162638305",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1436.5079365079364, y = 286.3492063492063},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1736316573365200"] = {
      isStoryNode = true,
      key = "1736316573365200",
      type = "StoryNode",
      name = "\233\146\147\233\177\188\232\181\140\229\177\128",
      pos = {x = 1131.3333333333333, y = 284.44444444444446},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_SewFishDuju_Des",
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
            startQuest = "1736316573365201",
            startPort = "QuestStart",
            endQuest = "1736316608896847",
            endPort = "In"
          },
          {
            startQuest = "1736316573365201",
            startPort = "QuestStart",
            endQuest = "17363166248501104",
            endPort = "In"
          },
          {
            startQuest = "17363170599703891",
            startPort = "Out",
            endQuest = "17363170932794181",
            endPort = "In"
          },
          {
            startQuest = "17363170995024375",
            startPort = "Out",
            endQuest = "17363171406525306",
            endPort = "In"
          },
          {
            startQuest = "17363171290004843",
            startPort = "Out",
            endQuest = "17363171533265623",
            endPort = "In"
          },
          {
            startQuest = "17363171406525306",
            startPort = "Out",
            endQuest = "17363171570215775",
            endPort = "In"
          },
          {
            startQuest = "17363171533265623",
            startPort = "Out",
            endQuest = "1736316573365208",
            endPort = "Success"
          },
          {
            startQuest = "17363171570215775",
            startPort = "Out",
            endQuest = "1736316573365208",
            endPort = "Success"
          },
          {
            startQuest = "1736316608896847",
            startPort = "Out",
            endQuest = "17363193381637148",
            endPort = "In"
          },
          {
            startQuest = "17363193381637148",
            startPort = "Option_1",
            endQuest = "17363194975577693",
            endPort = "In"
          },
          {
            startQuest = "17363193381637148",
            startPort = "Option_2",
            endQuest = "1736320449894712774",
            endPort = "In"
          },
          {
            startQuest = "17363169391603201",
            startPort = "Out",
            endQuest = "17363168841782593",
            endPort = "In"
          },
          {
            startQuest = "17363168841782593",
            startPort = "Out",
            endQuest = "17363171290004843",
            endPort = "In"
          },
          {
            startQuest = "17363170932794181",
            startPort = "Out",
            endQuest = "17363170995024375",
            endPort = "In"
          },
          {
            startQuest = "17363170932794181",
            startPort = "Out",
            endQuest = "17363168989182906",
            endPort = "In"
          },
          {
            startQuest = "17363167426871472",
            startPort = "Option_1",
            endQuest = "17363170599703891",
            endPort = "In"
          },
          {
            startQuest = "17363167426871472",
            startPort = "Option_2",
            endQuest = "17363169391603201",
            endPort = "In"
          },
          {
            startQuest = "17363170995024375",
            startPort = "Out",
            endQuest = "17363217500712831557",
            endPort = "In"
          },
          {
            startQuest = "1736320449894712774",
            startPort = "Out",
            endQuest = "1736316573365208",
            endPort = "Success"
          },
          {
            startQuest = "17363194975577693",
            startPort = "Out",
            endQuest = "1736421027525708721",
            endPort = "In"
          },
          {
            startQuest = "1736421027525708721",
            startPort = "Option_1",
            endQuest = "17363170599703891",
            endPort = "In"
          },
          {
            startQuest = "1736421027525708721",
            startPort = "Option_2",
            endQuest = "17363169391603201",
            endPort = "In"
          }
        },
        nodeData = {
          ["1736316573365201"] = {
            key = "1736316573365201",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 81.1538461538461, y = 283.84615384615387},
            propsData = {ModeType = 0}
          },
          ["1736316573365208"] = {
            key = "1736316573365208",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3932.2222222222226, y = 247.7777777777778},
            propsData = {ModeType = 0}
          },
          ["1736316573366215"] = {
            key = "1736316573366215",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3221.7460317460313, y = 994.6031746031747},
            propsData = {}
          },
          ["1736316608896847"] = {
            key = "1736316608896847",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144Npc",
            pos = {x = 462.22743922743905, y = 284.001998001998},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720438}
            }
          },
          ["17363166248501104"] = {
            key = "17363166248501104",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 462.2274392274393, y = 96.2242202242202},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005501,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17363167426871472"] = {
            key = "17363167426871472",
            type = "TalkNode",
            name = "\228\186\164\228\186\146\229\175\185\232\175\157",
            pos = {x = 1126.6291486291486, y = 21.26695526695522},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005505,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {
                {
                  OptionText = "710055061",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                },
                {
                  OptionText = "",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17363168841782593"] = {
            key = "17363168841782593",
            type = "TalkNode",
            name = "\230\148\190\233\177\188\229\136\134\230\148\175",
            pos = {x = 2355.3692279942284, y = 493.0625901875902},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005506,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17363168989182906"] = {
            key = "17363168989182906",
            type = "TalkNode",
            name = "\230\137\147\231\167\189\229\133\189\229\136\134\230\148\175",
            pos = {x = 2424.7541486291493, y = 308.83639971139974},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005504,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17363169391603201"] = {
            key = "17363169391603201",
            type = "PickUpNode",
            name = "\228\184\138\230\184\184\230\148\190\233\177\188",
            pos = {x = 1960.3692279942284, y = 492.7848124098124},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1720445},
              QuestPickupId = -1,
              UnitId = 80028,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17363170599703891"] = {
            key = "17363170599703891",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 1862.1747835497833, y = 160.7808441558442},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720440,
                1720441,
                1720442,
                1720443
              }
            }
          },
          ["17363170932794181"] = {
            key = "17363170932794181",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2170.647005772006, y = 142.6459235209235},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720444,
              GuideType = "M",
              GuidePointName = "Mechanism_Dyn_1720444"
            }
          },
          ["17363170995024375"] = {
            key = "17363170995024375",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2721.4208152958154, y = 187.58639971139974},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720440,
                1720441,
                1720442,
                1720443
              }
            }
          },
          ["17363171290004843"] = {
            key = "17363171290004843",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2909.5358946608944, y = 493.61814574314576},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818049,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1720438",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005508,
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
          ["17363171406525306"] = {
            key = "17363171406525306",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3039.0597041847036, y = 188.69751082251082},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818049,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1720438",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005508,
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
          ["17363171533265623"] = {
            key = "17363171533265623",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3345.0914502164483, y = 491.3959235209236},
            propsData = {
              DialogueId = 71005506,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17363171570215775"] = {
            key = "17363171570215775",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3364.754148629148, y = 182.03084415584425},
            propsData = {
              DialogueId = 71005505,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17363193381637148"] = {
            key = "17363193381637148",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 735.176157176155, y = 245.5404595404595},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818049,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1720438",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005502,
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
              NormalOptions = {
                {
                  OptionText = "710055021",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                },
                {
                  OptionText = "710055022",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17363194975577693"] = {
            key = "17363194975577693",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1105.5607725607701, y = 270.71528471528467},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720439,
              GuideType = "M",
              GuidePointName = "Mechanism_Dyn_1720439"
            }
          },
          ["1736320449894712774"] = {
            key = "1736320449894712774",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2278.733849483847, y = 768.2327672327672},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["17363217500712831557"] = {
            key = "17363217500712831557",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2951.0783217153, y = -14.433163893808182},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005505,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17363370863315192"] = {
            key = "17363370863315192",
            type = "TalkNode",
            name = "\231\187\132\229\144\136",
            pos = {x = 1394.707666729406, y = 1.0714285714286529},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003206,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1736421027525708721"] = {
            key = "1736421027525708721",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1434.1904761904761, y = 255.55555555555551},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005503,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {
                {
                  OptionText = "710055031",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                },
                {
                  OptionText = "710055032",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                }
              },
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
