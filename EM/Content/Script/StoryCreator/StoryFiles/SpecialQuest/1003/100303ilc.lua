return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210911572137",
      startPort = "StoryStart",
      endStory = "1732783210911572139",
      endPort = "In"
    },
    {
      startStory = "1732783210911572139",
      startPort = "Success",
      endStory = "17370135193282196533",
      endPort = "In"
    },
    {
      startStory = "17371007783923705698",
      startPort = "Success",
      endStory = "17371007783913705697",
      endPort = "In"
    },
    {
      startStory = "17371007783913705697",
      startPort = "Success",
      endStory = "1732783210911572138",
      endPort = "StoryEnd"
    },
    {
      startStory = "17370135193282196533",
      startPort = "Success",
      endStory = "17371007783923705698",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1732783210911572137"] = {
      isStoryNode = true,
      key = "1732783210911572137",
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
    ["1732783210911572138"] = {
      isStoryNode = true,
      key = "1732783210911572138",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2628.9000000000005, y = 289.79999999999995},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210911572139"] = {
      isStoryNode = true,
      key = "1732783210911572139",
      type = "StoryNode",
      name = "\229\134\176\230\185\150\229\159\142\229\174\181\231\166\129",
      pos = {x = 1203.4189959679122, y = 282.22115304715874},
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "",
        QuestUIId = 100304
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1732783210911572144",
            startPort = "Out",
            endQuest = "1732783210911572142",
            endPort = "Fail"
          },
          {
            startQuest = "17370991430471490318",
            startPort = "false",
            endQuest = "17370991430471490319",
            endPort = "In"
          },
          {
            startQuest = "17370991570951490769",
            startPort = "Out",
            endQuest = "17370991570951490770",
            endPort = "In"
          },
          {
            startQuest = "1732783210911572140",
            startPort = "QuestStart",
            endQuest = "17370991430471490318",
            endPort = "In"
          },
          {
            startQuest = "17370991570951490770",
            startPort = "Out",
            endQuest = "1732783210911572141",
            endPort = "Success"
          },
          {
            startQuest = "17370991430471490318",
            startPort = "true",
            endQuest = "17428883312301605",
            endPort = "In"
          },
          {
            startQuest = "17370991430471490318",
            startPort = "true",
            endQuest = "1732783210911572144",
            endPort = "In"
          },
          {
            startQuest = "17370991430471490319",
            startPort = "Out",
            endQuest = "17458308301647884",
            endPort = "In"
          },
          {
            startQuest = "17458308301647884",
            startPort = "Out",
            endQuest = "1732783210911572141",
            endPort = "Success"
          },
          {
            startQuest = "17370131872532190434",
            startPort = "Out",
            endQuest = "17370131872532190435",
            endPort = "In"
          },
          {
            startQuest = "17370131872532190432",
            startPort = "Out",
            endQuest = "17370131872532190431",
            endPort = "In"
          },
          {
            startQuest = "17370131872532190437",
            startPort = "Out",
            endQuest = "17404725554377538",
            endPort = "In"
          },
          {
            startQuest = "17404725554377538",
            startPort = "Out",
            endQuest = "17370991570951490769",
            endPort = "In"
          },
          {
            startQuest = "17504057619824375",
            startPort = "Out",
            endQuest = "17504057802965130",
            endPort = "In"
          },
          {
            startQuest = "17504057802965130",
            startPort = "Out",
            endQuest = "17370131872532190434",
            endPort = "In"
          },
          {
            startQuest = "17428883312301605",
            startPort = "Out",
            endQuest = "17370130810162189127",
            endPort = "In"
          },
          {
            startQuest = "17370131872532190432",
            startPort = "Out",
            endQuest = "17537785264463891",
            endPort = "In"
          },
          {
            startQuest = "17537785264463891",
            startPort = "Out",
            endQuest = "17504057619824375",
            endPort = "In"
          },
          {
            startQuest = "17508411797842161",
            startPort = "Out",
            endQuest = "17370131872532190432",
            endPort = "In"
          },
          {
            startQuest = "17508411797842161",
            startPort = "Out",
            endQuest = "17370131872532190430",
            endPort = "In"
          },
          {
            startQuest = "17370131872532190431",
            startPort = "Out",
            endQuest = "17546431545122174",
            endPort = "In"
          },
          {
            startQuest = "17370131872532190435",
            startPort = "Out",
            endQuest = "17555901379461841765",
            endPort = "In"
          },
          {
            startQuest = "17555901379461841765",
            startPort = "Out",
            endQuest = "17370131872532190437",
            endPort = "In"
          },
          {
            startQuest = "17504057802965130",
            startPort = "Out",
            endQuest = "17567261986211280023",
            endPort = "In"
          },
          {
            startQuest = "17508411797842161",
            startPort = "Out",
            endQuest = "17567992847613829563",
            endPort = "In"
          },
          {
            startQuest = "17508411797842161",
            startPort = "Out",
            endQuest = "17570427501361918108",
            endPort = "In"
          },
          {
            startQuest = "17370130810162189127",
            startPort = "Out",
            endQuest = "17370131872532190429",
            endPort = "In"
          },
          {
            startQuest = "17370131872532190429",
            startPort = "Out",
            endQuest = "17508411797842161",
            endPort = "In"
          }
        },
        nodeData = {
          ["1732783210911572140"] = {
            key = "1732783210911572140",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -3534.4655843674846, y = 296.2587136722017},
            propsData = {ModeType = 0}
          },
          ["1732783210911572141"] = {
            key = "1732783210911572141",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -312.7442432249326, y = 508.00458799303175},
            propsData = {ModeType = 0}
          },
          ["1732783210911572142"] = {
            key = "1732783210911572142",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -844.318762345504, y = 637.7808922771897},
            propsData = {}
          },
          ["1732783210911572144"] = {
            key = "1732783210911572144",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -2947.9128838138113, y = 656.5514990685268},
            propsData = {}
          },
          ["1732783210911572146"] = {
            key = "1732783210911572146",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = -1761.2000000000012, y = -596.0686274509801},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1732783210911572147"] = {
            key = "1732783210911572147",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = -1764.699245852188, y = -396.3642533936649},
            propsData = {
              StaticCreatorIdList = {0},
              ManualItemIdList = {0},
              StateId = 0,
              QuestId = 0
            }
          },
          ["1732783210911572149"] = {
            key = "1732783210911572149",
            type = "PlayerCameraSightNode",
            name = "\232\167\134\231\186\191\229\136\164\230\150\173",
            pos = {x = -1756.162149408899, y = -796.7571858482062},
            propsData = {
              TargetPointName = "",
              KeepSightTime = 0,
              ECameraAxisLockType = "None",
              Speed = 1
            }
          },
          ["17370127983832187488"] = {
            key = "17370127983832187488",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = -3404.705882352941, y = -568.5882352941178},
            propsData = {
              IsHide = true,
              AtmosphereTagList = {
                "cp2iclsphide"
              }
            }
          },
          ["17370130810162189127"] = {
            key = "17370130810162189127",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -2944.19679144385, y = -70.77005347593587},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17370131872532190429"] = {
            key = "17370131872532190429",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -2673.5255477685146, y = -56.85037809889022},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180516}
            }
          },
          ["17370131872532190430"] = {
            key = "17370131872532190430",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -2167.349770583583, y = -399.7187478500173},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034405,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17370131872532190431"] = {
            key = "17370131872532190431",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1832.7068495555227, y = -87.45657280456057},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034410,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17370131872532190432"] = {
            key = "17370131872532190432",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -2201.79362531846, y = -89.4232050715024},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180515,
              GuideType = "M",
              GuidePointName = "Mechanism_1180515"
            }
          },
          ["17370131872532190434"] = {
            key = "17370131872532190434",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1717.0322512951682, y = 315.61881173522045},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100310,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1180516",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple36-37",
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
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100310,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100323,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100310},
                {TalkActorType = "Npc", TalkActorId = 100323}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17370131872532190435"] = {
            key = "17370131872532190435",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1429.5046676301229, y = 315.47244582043345},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034527,
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
          ["17370131872532190437"] = {
            key = "17370131872532190437",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1113.130463183337, y = 316.22284809012535},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034528,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple36-37",
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
          ["17370991430471490318"] = {
            key = "17370991430471490318",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = -3242.235559383857, y = 306.7581034033045},
            propsData = {
              FunctionName = "Equal",
              VarName = "icl100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17370991430471490319"] = {
            key = "17370991430471490319",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = -2673.9148165559927, y = 491.51257328842485},
            propsData = {VarName = "icl100303"}
          },
          ["17370991570951490769"] = {
            key = "17370991570951490769",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = -737.7171495171492, y = 177.66886446886474},
            propsData = {VarName = "icl100303", VarValue = 1}
          },
          ["17370991570951490770"] = {
            key = "17370991570951490770",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = -734.2828504828503, y = 390.33113553113526},
            propsData = {VarName = "icl100303"}
          },
          ["17398669077713403"] = {
            key = "17398669077713403",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -2831.0160427807486, y = -189.94117647058823},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2IcelakeCityCurfew",
              UnitId = -1
            }
          },
          ["17404725554377538"] = {
            key = "17404725554377538",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -1099.9016232701654, y = 81.82564102564135},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180144,
                1180528,
                1180527,
                1180529,
                1180140,
                1180143,
                1180146,
                1180145,
                1180516
              }
            }
          },
          ["17428883312301605"] = {
            key = "17428883312301605",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -3247, y = -72.5},
            propsData = {
              NewDescription = "QuestName_1003plus34",
              NewDetail = "QuestDesc_1003plus34",
              SubTaskTargetIndex = 0
            }
          },
          ["17458308301647884"] = {
            key = "17458308301647884",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -2160.588235294116, y = 500.3529411764705},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NewTargetPoint_12000308",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17472896760904965"] = {
            key = "17472896760904965",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -2864.501623270165, y = 95.96969696969703},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191297,
                1191298,
                1191299,
                1191300,
                1191301,
                1191302,
                1191303,
                1191304,
                1191305,
                1191306,
                1191307,
                1191308,
                1191309,
                1191310,
                1191311,
                1191312,
                1191313,
                1191314,
                1191316,
                1191317,
                1191318,
                1191319,
                1191320,
                1191321,
                1191322
              }
            }
          },
          ["17504057619824375"] = {
            key = "17504057619824375",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -2411.92007992008, y = 333.4925074925073},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240964,
                1240965,
                1240966,
                1240967,
                1240968,
                1240969,
                1240970,
                1240971,
                1240972,
                1240973,
                1240974,
                1240975,
                1240976,
                1240977,
                1240978,
                1240979,
                1240980,
                1240981,
                1240982,
                1240983
              }
            }
          },
          ["17504057802965130"] = {
            key = "17504057802965130",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = -2061.92007992008, y = 322.06393606393584},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 20,
              IsShow = false,
              GuideType = "N",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240964,
                1240965,
                1240966,
                1240967,
                1240968,
                1240969,
                1240970,
                1240971,
                1240972,
                1240973,
                1240974,
                1240975,
                1240976,
                1240977,
                1240978,
                1240979,
                1240980,
                1240981,
                1240982,
                1240983
              }
            }
          },
          ["17508411797842161"] = {
            key = "17508411797842161",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -2530.7177735265195, y = -400.380889229001},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200022,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1191375",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple35_new",
              BlendInTime = 0,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
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
                {TalkActorType = "Npc", TalkActorId = 100304},
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
          ["17508411797842162"] = {
            key = "17508411797842162",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -2238.101111124895, y = -776.1494138013011},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/cp2UIopen04",
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
          ["17508411797842163"] = {
            key = "17508411797842163",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -2956.1968686730843, y = -311.787922091033},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191375}
            }
          },
          ["17537785264463891"] = {
            key = "17537785264463891",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -2212.523809523809, y = 124.18181818181853},
            propsData = {WaitTime = 1}
          },
          ["17546431545122174"] = {
            key = "17546431545122174",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -1515.3653846153854, y = -82.41258741258743},
            propsData = {
              NewDescription = "QuestName_1003plus35",
              NewDetail = "QuestDesc_1003plus35",
              SubTaskTargetIndex = 0
            }
          },
          ["17555901379461841765"] = {
            key = "17555901379461841765",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1341.178712464007, y = 154.3411833264775},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          },
          ["17567261986211280023"] = {
            key = "17567261986211280023",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -1819.920192307692, y = 166.36250000000013},
            propsData = {
              NewDescription = "QuestName_100303sp101",
              NewDetail = "QuestDesc_100303sp101",
              SubTaskTargetIndex = 0
            }
          },
          ["17567992847613829563"] = {
            key = "17567992847613829563",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -2232.482874529728, y = -527.4415169411843},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191375}
            }
          },
          ["17570427501361918108"] = {
            key = "17570427501361918108",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -2104.3932186234806, y = -225.8289473684207},
            propsData = {
              NewDescription = "QuestName_100303sp101",
              NewDetail = "QuestDesc_100303sp101",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17370135193282196533"] = {
      isStoryNode = true,
      key = "17370135193282196533",
      type = "StoryNode",
      name = "\233\146\147\233\177\188",
      pos = {x = 1516.2600619195043, y = 262.3046439628483},
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
            startQuest = "17370135193282196534",
            startPort = "QuestStart",
            endQuest = "17371005483262966781",
            endPort = "In"
          },
          {
            startQuest = "17371005483262966781",
            startPort = "false",
            endQuest = "17371005685462968360",
            endPort = "In"
          },
          {
            startQuest = "17371008083963707669",
            startPort = "Out",
            endQuest = "17371008083963707670",
            endPort = "In"
          },
          {
            startQuest = "17371008083963707670",
            startPort = "Out",
            endQuest = "17370135193282196537",
            endPort = "Success"
          },
          {
            startQuest = "17371011393653723847",
            startPort = "Out",
            endQuest = "17370135193282196540",
            endPort = "Fail"
          },
          {
            startQuest = "17410752507431692",
            startPort = "Out",
            endQuest = "17370135504252197466",
            endPort = "In"
          },
          {
            startQuest = "17371005483262966781",
            startPort = "true",
            endQuest = "17428892444003950",
            endPort = "In"
          },
          {
            startQuest = "17428892444003950",
            startPort = "Out",
            endQuest = "17453193542854639335",
            endPort = "In"
          },
          {
            startQuest = "17453193542854639335",
            startPort = "Out",
            endQuest = "17370135504252197467",
            endPort = "In"
          },
          {
            startQuest = "17370135504252197467",
            startPort = "Out",
            endQuest = "17453193574574639543",
            endPort = "In"
          },
          {
            startQuest = "17453193574574639543",
            startPort = "Out",
            endQuest = "17410752507431692",
            endPort = "In"
          },
          {
            startQuest = "17371005483262966781",
            startPort = "true",
            endQuest = "17371011393653723847",
            endPort = "In"
          },
          {
            startQuest = "17371005685462968360",
            startPort = "Out",
            endQuest = "1745831473332563606",
            endPort = "In"
          },
          {
            startQuest = "1745831473332563606",
            startPort = "Out",
            endQuest = "17370135193282196537",
            endPort = "Success"
          },
          {
            startQuest = "17453193574574639543",
            startPort = "Out",
            endQuest = "17428892854305003",
            endPort = "In"
          },
          {
            startQuest = "17410752507431692",
            startPort = "Out",
            endQuest = "17504088350461299657",
            endPort = "In"
          },
          {
            startQuest = "17504088350461299657",
            startPort = "Out",
            endQuest = "17370135504252197469",
            endPort = "Input"
          },
          {
            startQuest = "17504088350461299657",
            startPort = "Out",
            endQuest = "17504105844562592828",
            endPort = "In"
          },
          {
            startQuest = "17370135504252197469",
            startPort = "Out",
            endQuest = "17504106018002593517",
            endPort = "In"
          },
          {
            startQuest = "17370135504252197469",
            startPort = "Out",
            endQuest = "17371008083963707669",
            endPort = "In"
          },
          {
            startQuest = "17370135504252197469",
            startPort = "Out",
            endQuest = "17562832980482577",
            endPort = "In"
          }
        },
        nodeData = {
          ["17370135193282196534"] = {
            key = "17370135193282196534",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 158, y = 282},
            propsData = {ModeType = 0}
          },
          ["17370135193282196537"] = {
            key = "17370135193282196537",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2784, y = 924},
            propsData = {ModeType = 0}
          },
          ["17370135193282196540"] = {
            key = "17370135193282196540",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2792, y = 1188},
            propsData = {}
          },
          ["17370135504252197466"] = {
            key = "17370135504252197466",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1863.510407239819, y = 37.95478345184223},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17370135504252197467"] = {
            key = "17370135504252197467",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1341.5466063348415, y = 256.15161603102774},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1240468",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034535,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple38",
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
                  TalkActorId = 100304,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17370135504252197469"] = {
            key = "17370135504252197469",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 2428.4438267614737, y = 260.2689398836457},
            propsData = {
              ResourceType = "Resource",
              ResourceId = -1,
              ResourceSType = "Fish",
              NeedCount = 3,
              bUseBagCount = false,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = ""
            }
          },
          ["17371005483262966781"] = {
            key = "17371005483262966781",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 621.9574082779964, y = 266},
            propsData = {
              FunctionName = "Equal",
              VarName = "icl100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17371005685462968360"] = {
            key = "17371005685462968360",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1223.0425917220036, y = 880},
            propsData = {VarName = "icl100303"}
          },
          ["17371008083963707669"] = {
            key = "17371008083963707669",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2787.602963702964, y = 511.8227106227109},
            propsData = {VarName = "icl100303", VarValue = 2}
          },
          ["17371008083963707670"] = {
            key = "17371008083963707670",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 2791.037262737263, y = 724.4849816849814},
            propsData = {VarName = "icl100303"}
          },
          ["17371011393653723847"] = {
            key = "17371011393653723847",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 934.6677005380297, y = 1038.1905950715695},
            propsData = {}
          },
          ["17410752507431692"] = {
            key = "17410752507431692",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1724, y = 260},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240557,
              GuideType = "M",
              GuidePointName = "Mechanism_1240557"
            }
          },
          ["17428892444003950"] = {
            key = "17428892444003950",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 810, y = 44},
            propsData = {
              NewDescription = "QuestName_100303sp102",
              NewDetail = "QuestDesc_100303sp102",
              SubTaskTargetIndex = 0
            }
          },
          ["17428892854305003"] = {
            key = "17428892854305003",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1616, y = -105.80952380952385},
            propsData = {
              NewDescription = "QuestName_100303sp103",
              NewDetail = "QuestDesc_100303sp103",
              SubTaskTargetIndex = 0
            }
          },
          ["17453193542854639335"] = {
            key = "17453193542854639335",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1022, y = 276},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240468}
            }
          },
          ["17453193574574639543"] = {
            key = "17453193574574639543",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1218, y = 42},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240468}
            }
          },
          ["1745831473332563606"] = {
            key = "1745831473332563606",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2003.705882352942, y = 880},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NewTargetPoint_12000308",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17504088350461299657"] = {
            key = "17504088350461299657",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2060.6493506493507, y = 271.42857142857156},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240984}
            }
          },
          ["17504105844562592828"] = {
            key = "17504105844562592828",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2284.935064935065, y = 51.4285714285717},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1240984"
            }
          },
          ["17504106018002593517"] = {
            key = "17504106018002593517",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2781.1108891108893, y = 276.3571428571431},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1240984"
            }
          },
          ["17562832980482577"] = {
            key = "17562832980482577",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2778.75, y = 81.5625},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034611,
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
    ["17371007783913705697"] = {
      isStoryNode = true,
      key = "17371007783913705697",
      type = "StoryNode",
      name = "\232\191\155\228\184\139\230\176\180\233\129\147\229\137\141",
      pos = {x = 2229.9928134816682, y = 269.29826546002965},
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
            startQuest = "17371009383723716372",
            startPort = "false",
            endQuest = "17371009383723716373",
            endPort = "In"
          },
          {
            startQuest = "17371007783923705708",
            startPort = "QuestStart",
            endQuest = "17371009383723716372",
            endPort = "In"
          },
          {
            startQuest = "17371009383723716373",
            startPort = "Out",
            endQuest = "17371007783923705709",
            endPort = "Success"
          },
          {
            startQuest = "17371011658843726182",
            startPort = "Out",
            endQuest = "17371007783923705710",
            endPort = "Fail"
          },
          {
            startQuest = "17371009383723716372",
            startPort = "true",
            endQuest = "17371011658843726182",
            endPort = "In"
          },
          {
            startQuest = "1747290697157579780",
            startPort = "Out",
            endQuest = "1747290730926581413",
            endPort = "In"
          },
          {
            startQuest = "1747290730926581413",
            startPort = "Out",
            endQuest = "1737454738623750726",
            endPort = "In"
          },
          {
            startQuest = "17472930950033139",
            startPort = "Out",
            endQuest = "17472933130831152120",
            endPort = "In"
          },
          {
            startQuest = "17472933130831152120",
            startPort = "Out",
            endQuest = "1747290697157579780",
            endPort = "In"
          },
          {
            startQuest = "17371009383723716372",
            startPort = "true",
            endQuest = "1748265764033873454",
            endPort = "In"
          },
          {
            startQuest = "1748265764033873454",
            startPort = "Out",
            endQuest = "17428893319316355",
            endPort = "In"
          },
          {
            startQuest = "17371007783923705712",
            startPort = "Out",
            endQuest = "174851584567517726015",
            endPort = "In"
          },
          {
            startQuest = "174851584567517726015",
            startPort = "Out",
            endQuest = "17472930950033139",
            endPort = "In"
          },
          {
            startQuest = "17428893319316355",
            startPort = "Out",
            endQuest = "17371007783923705712",
            endPort = "In"
          }
        },
        nodeData = {
          ["17371007783923705708"] = {
            key = "17371007783923705708",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17371007783923705709"] = {
            key = "17371007783923705709",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2808, y = 754},
            propsData = {ModeType = 0}
          },
          ["17371007783923705710"] = {
            key = "17371007783923705710",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2806, y = 1038},
            propsData = {}
          },
          ["17371007783923705712"] = {
            key = "17371007783923705712",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1789.4736842105265, y = 124.4210526315789},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100310,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1190834",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034710,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple40",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100310,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100340,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100341,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100342,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100310},
                {TalkActorType = "Npc", TalkActorId = 100340},
                {TalkActorType = "Npc", TalkActorId = 100341},
                {TalkActorType = "Npc", TalkActorId = 100342}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17371009383723716372"] = {
            key = "17371009383723716372",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1239.4574082779964, y = 300},
            propsData = {
              FunctionName = "Equal",
              VarName = "icl100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "3"}
              }
            }
          },
          ["17371009383723716373"] = {
            key = "17371009383723716373",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 2044.9636443535826, y = 589.8947368421053},
            propsData = {VarName = "icl100303"}
          },
          ["17371011658843726182"] = {
            key = "17371011658843726182",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1601.1940163275035, y = 981.3484898084117},
            propsData = {}
          },
          ["1737454738623750726"] = {
            key = "1737454738623750726",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2386, y = 360},
            propsData = {}
          },
          ["17428893319316355"] = {
            key = "17428893319316355",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1500, y = -36},
            propsData = {
              NewDescription = "QuestName_100303sp105",
              NewDetail = "QuestDesc_100303sp105",
              SubTaskTargetIndex = 0
            }
          },
          ["1747290697157579780"] = {
            key = "1747290697157579780",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2586.4158550315838, y = 174},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191297,
                1191298,
                1191299,
                1191300,
                1191301,
                1191302,
                1191303,
                1191304,
                1191305,
                1191306,
                1191307,
                1191308,
                1191309,
                1191310,
                1191311,
                1191312,
                1191313,
                1191314,
                1191316,
                1191317,
                1191318,
                1191319,
                1191320,
                1191321,
                1191322
              }
            }
          },
          ["1747290730926581413"] = {
            key = "1747290730926581413",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2966.715855031584, y = 234.00000000000003},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180144,
                1180528,
                1180527,
                1180529,
                1180140,
                1180143,
                1180146,
                1180145,
                1180516
              }
            }
          },
          ["17472930950033139"] = {
            key = "17472930950033139",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2192, y = 112},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191054}
            }
          },
          ["17472933130831152120"] = {
            key = "17472933130831152120",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2532, y = -44},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190834,
                1191376,
                1191377,
                1191378
              }
            }
          },
          ["1748265764033873454"] = {
            key = "1748265764033873454",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1214, y = -32},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190834,
                1191376,
                1191377,
                1191378
              }
            }
          },
          ["174851584567517726015"] = {
            key = "174851584567517726015",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2012.8484848484848, y = -37.246753246753144},
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
    ["17371007783923705698"] = {
      isStoryNode = true,
      key = "17371007783923705698",
      type = "StoryNode",
      name = "\229\134\176\230\185\150\229\159\142\230\138\165\233\129\147",
      pos = {x = 1873.50514578301, y = 269.8468325791853},
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
            startQuest = "17371008546903711000",
            startPort = "Out",
            endQuest = "17371008546903711001",
            endPort = "In"
          },
          {
            startQuest = "17371009068823714224",
            startPort = "false",
            endQuest = "17371009068823714225",
            endPort = "In"
          },
          {
            startQuest = "17371007783933705727",
            startPort = "QuestStart",
            endQuest = "17371009068823714224",
            endPort = "In"
          },
          {
            startQuest = "17371008546903711001",
            startPort = "Out",
            endQuest = "17371007783933705728",
            endPort = "Success"
          },
          {
            startQuest = "17371011545663725167",
            startPort = "Out",
            endQuest = "17371007783933705729",
            endPort = "Fail"
          },
          {
            startQuest = "17371009068823714224",
            startPort = "true",
            endQuest = "17428893044865548",
            endPort = "In"
          },
          {
            startQuest = "17428893044865548",
            startPort = "Out",
            endQuest = "17453197418337094082",
            endPort = "In"
          },
          {
            startQuest = "17371009068823714224",
            startPort = "true",
            endQuest = "17371011545663725167",
            endPort = "In"
          },
          {
            startQuest = "17371009068823714225",
            startPort = "Out",
            endQuest = "17458315649561116342",
            endPort = "In"
          },
          {
            startQuest = "17458315649561116342",
            startPort = "Out",
            endQuest = "17371007783933705728",
            endPort = "Success"
          },
          {
            startQuest = "17453197418337094082",
            startPort = "Out",
            endQuest = "17371007783933705731",
            endPort = "In"
          },
          {
            startQuest = "17371007783933705731",
            startPort = "Out",
            endQuest = "17508403977173420",
            endPort = "In"
          },
          {
            startQuest = "17508403977173420",
            startPort = "Out",
            endQuest = "17371008546903711000",
            endPort = "In"
          }
        },
        nodeData = {
          ["17371007783933705727"] = {
            key = "17371007783933705727",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 778, y = 292},
            propsData = {ModeType = 0}
          },
          ["17371007783933705728"] = {
            key = "17371007783933705728",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3054, y = 758},
            propsData = {ModeType = 0}
          },
          ["17371007783933705729"] = {
            key = "17371007783933705729",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3048, y = 1096},
            propsData = {}
          },
          ["17371007783933705731"] = {
            key = "17371007783933705731",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1976.25, y = 286.4999999999999},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1191054",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple39",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200011},
                {TalkActorType = "Npc", TalkActorId = 100304}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17371008546903711000"] = {
            key = "17371008546903711000",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2558.282850482851, y = 289.66886446886474},
            propsData = {VarName = "icl100303", VarValue = 3}
          },
          ["17371008546903711001"] = {
            key = "17371008546903711001",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 2565.7171495171497, y = 504.33113553113526},
            propsData = {VarName = "icl100303"}
          },
          ["17371009068823714224"] = {
            key = "17371009068823714224",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1196.4574082779964, y = 261},
            propsData = {
              FunctionName = "Equal",
              VarName = "icl100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "2"}
              }
            }
          },
          ["17371009068823714225"] = {
            key = "17371009068823714225",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1863.5425917220036, y = 563},
            propsData = {VarName = "icl100303"}
          },
          ["17371011545663725167"] = {
            key = "17371011545663725167",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1506.6677005380297, y = 939.3484898084117},
            propsData = {}
          },
          ["17428893044865548"] = {
            key = "17428893044865548",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1535.25, y = 279.49999999999994},
            propsData = {
              NewDescription = "QuestName_100303sp104",
              NewDetail = "QuestDesc_100303sp104",
              SubTaskTargetIndex = 0
            }
          },
          ["17453197418337094082"] = {
            key = "17453197418337094082",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1751.5000000000002, y = 48.50000000000018},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191054}
            }
          },
          ["17458315649561116342"] = {
            key = "17458315649561116342",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2350, y = 680},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Ptaopao2",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17508403977173420"] = {
            key = "17508403977173420",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2266.9550449550447, y = 60.45887445887443},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240984}
            }
          }
        },
        commentData = {}
      }
    },
    ["17373619705792214667"] = {
      isStoryNode = true,
      key = "17373619705792214667",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1732.5836707152498, y = 537.9790823211877},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "",
        QuestDeatil = "",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 0,
        GameModeKeyCount = 0,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
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
