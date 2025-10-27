return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171575904225612474",
      startPort = "Success",
      endStory = "171576115651916402",
      endPort = "In"
    },
    {
      startStory = "173278004274811238",
      startPort = "Success",
      endStory = "173278004063911077",
      endPort = "In"
    },
    {
      startStory = "173278004063911077",
      startPort = "Success",
      endStory = "17327796199279416",
      endPort = "In"
    },
    {
      startStory = "17327796199279416",
      startPort = "Success",
      endStory = "17327796213719553",
      endPort = "In"
    },
    {
      startStory = "17327796213719553",
      startPort = "Success",
      endStory = "173278024589319989",
      endPort = "In"
    },
    {
      startStory = "173278024589319989",
      startPort = "Success",
      endStory = "173278024835420257",
      endPort = "In"
    },
    {
      startStory = "173278024835420257",
      startPort = "Success",
      endStory = "173278025111720437",
      endPort = "In"
    },
    {
      startStory = "173278025111720437",
      startPort = "Success",
      endStory = "173278025245520587",
      endPort = "In"
    },
    {
      startStory = "171576115651916402",
      startPort = "Success",
      endStory = "17352894887948928825",
      endPort = "In"
    },
    {
      startStory = "17352894887948928825",
      startPort = "Success",
      endStory = "1716803576920724745",
      endPort = "In"
    },
    {
      startStory = "1716803576920724745",
      startPort = "Success",
      endStory = "173934612267215543",
      endPort = "In"
    },
    {
      startStory = "173934612267215543",
      startPort = "Success",
      endStory = "17459174708174352",
      endPort = "In"
    },
    {
      startStory = "17459174708174352",
      startPort = "Success",
      endStory = "17473096152385179",
      endPort = "In"
    },
    {
      startStory = "17473096152385179",
      startPort = "Success",
      endStory = "173278004274811238",
      endPort = "In"
    },
    {
      startStory = "171558839943234689",
      startPort = "StoryStart",
      endStory = "171558841534135488",
      endPort = "In"
    },
    {
      startStory = "171558841534135488",
      startPort = "Success",
      endStory = "171575904225612474",
      endPort = "In"
    },
    {
      startStory = "173278025245520587",
      startPort = "Success",
      endStory = "17563754594421912144",
      endPort = "In"
    },
    {
      startStory = "17563754594421912144",
      startPort = "Success",
      endStory = "171558839943334692",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171558839943234689"] = {
      isStoryNode = true,
      key = "171558839943234689",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 812.3999999999999, y = 319.73333333333335},
      propsData = {QuestChainId = 100301},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171558839943334692"] = {
      isStoryNode = true,
      key = "171558839943334692",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1997.0974025974026, y = 310.2337662337663},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171558841534135488"] = {
      isStoryNode = true,
      key = "171558841534135488",
      type = "StoryNode",
      name = "\230\162\166",
      pos = {x = 1111.2676815993707, y = 301.9006363022723},
      propsData = {
        QuestId = 10030101,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030101",
        QuestDeatil = "QuestDesc_10030101",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 210101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveHomeBase"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "171558841534135489",
            startPort = "QuestStart",
            endQuest = "17368563229724551",
            endPort = "In"
          },
          {
            startQuest = "17368563229724551",
            startPort = "Out",
            endQuest = "17485888584634669",
            endPort = "In"
          },
          {
            startQuest = "17485888584634669",
            startPort = "Out",
            endQuest = "17552437845284956",
            endPort = "In"
          },
          {
            startQuest = "17485888584634669",
            startPort = "Out",
            endQuest = "17552438181306708",
            endPort = "In"
          },
          {
            startQuest = "17552437845284956",
            startPort = "Out",
            endQuest = "17552444426275492",
            endPort = "In"
          },
          {
            startQuest = "17552444426275492",
            startPort = "Out",
            endQuest = "171558841534135492",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171558841534135489"] = {
            key = "171558841534135489",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 505.4919908466819, y = 300.48054919908463},
            propsData = {ModeType = 0}
          },
          ["171558841534135492"] = {
            key = "171558841534135492",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2803.6, y = 301.6},
            propsData = {ModeType = 0}
          },
          ["171558841534135495"] = {
            key = "171558841534135495",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17368563229724551"] = {
            key = "17368563229724551",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1218, y = 302},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC001/SQ_OBT0103_SC001",
              InType = "BlendIn",
              OutType = "BlendOut",
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
          },
          ["17485888584634669"] = {
            key = "17485888584634669",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1552, y = 320},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17552437845284956"] = {
            key = "17552437845284956",
            type = "TalkNode",
            name = "\229\141\161\231\177\179\230\139\137\231\171\153\230\161\169",
            pos = {x = 2042, y = 409.99999999999994},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030401,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple01stg",
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
                  TalkActorId = 200003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["17552438181306708"] = {
            key = "17552438181306708",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 2040, y = 644},
            propsData = {
              ActionType = 0,
              Condition = "task_cp2",
              SaveToServer = true
            }
          },
          ["17552444426275492"] = {
            key = "17552444426275492",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2432, y = 298},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P10030102PlayerStart",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17157570858325475"] = {
      isStoryNode = true,
      key = "17157570858325475",
      type = "StoryNode",
      name = "\230\141\174\231\130\185",
      pos = {x = 1388.0804168965599, y = -26.18149814880519},
      propsData = {
        QuestId = 10030102,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030102",
        QuestDeatil = "QuestDesc_10030102",
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
        SubRegionId = 210101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveHomeBase",
        QuestUIId = 100301
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17168827782453076",
            startPort = "Out",
            endQuest = "17157570858325479",
            endPort = "Success"
          },
          {
            startQuest = "17157570858325476",
            startPort = "QuestStart",
            endQuest = "17168827782453076",
            endPort = "In"
          }
        },
        nodeData = {
          ["17157570858325476"] = {
            key = "17157570858325476",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17157570858325479"] = {
            key = "17157570858325479",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17157570858325482"] = {
            key = "17157570858325482",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171575895575311327"] = {
            key = "171575895575311327",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1417.8499742002064, y = 1303.0377966976264},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["17168827782453076"] = {
            key = "17168827782453076",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2414.5714285714284, y = 342.40225563909775},
            propsData = {WaitTime = 0.2}
          },
          ["17295069301904215"] = {
            key = "17295069301904215",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1498.8756686008528, y = -93.3682550978283},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveHomeBase"
            }
          },
          ["1744812050443820484"] = {
            key = "1744812050443820484",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1987.4285714285716, y = -159.49999999999994},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/cp2UIopen01",
              BlendOutTime = 0,
              InType = "BlendIn",
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
          }
        },
        commentData = {}
      }
    },
    ["171575904225612474"] = {
      isStoryNode = true,
      key = "171575904225612474",
      type = "StoryNode",
      name = "\229\142\187\233\133\146\233\166\134",
      pos = {x = 1659.5930262036163, y = 298.1938069278054},
      propsData = {
        QuestId = 10030103,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030103",
        QuestDeatil = "QuestDesc_10030103",
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
        QuestUIId = 100301
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "171575904225612478",
            startPort = "QuestStart",
            endQuest = "171575908086313348",
            endPort = "In"
          },
          {
            startQuest = "171575908086313348",
            startPort = "Out",
            endQuest = "17401192320967747",
            endPort = "In"
          },
          {
            startQuest = "17401192320967747",
            startPort = "Out",
            endQuest = "17405716066867240",
            endPort = "In"
          },
          {
            startQuest = "17405716066867240",
            startPort = "Out",
            endQuest = "17402223648345424",
            endPort = "In"
          },
          {
            startQuest = "171575908086313348",
            startPort = "Out",
            endQuest = "17376203788583869",
            endPort = "In"
          },
          {
            startQuest = "17402223648345424",
            startPort = "Out",
            endQuest = "1747060813443859467",
            endPort = "In"
          },
          {
            startQuest = "1747060813443859467",
            startPort = "Out",
            endQuest = "171575904225612479",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171575904225612478"] = {
            key = "171575904225612478",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171575904225612479"] = {
            key = "171575904225612479",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3184.285714285714, y = 290.2857142857143},
            propsData = {ModeType = 0}
          },
          ["171575904225612480"] = {
            key = "171575904225612480",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171575908086313348"] = {
            key = "171575908086313348",
            type = "GoToRegionNode",
            name = "\232\191\155\229\159\142",
            pos = {x = 1251.6499742002063, y = 304.11757703081236},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          },
          ["17376203788583869"] = {
            key = "17376203788583869",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1700, y = 10},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17400484052055037"] = {
            key = "17400484052055037",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1208, y = 602},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["17401192320967747"] = {
            key = "17401192320967747",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 1588, y = 302},
            propsData = {
              IsHide = true,
              AtmosphereTagList = {
                "cp2ilchide01"
              }
            }
          },
          ["17402223648345424"] = {
            key = "17402223648345424",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2334.6666666666665, y = 306},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191085,
                1191086,
                1191087,
                1191088,
                1191089,
                1191090,
                1191091,
                1191092,
                1191093,
                1191094
              }
            }
          },
          ["17405716066867240"] = {
            key = "17405716066867240",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 1954, y = 306},
            propsData = {
              IsHide = false,
              AtmosphereTagList = {
                "cp2ilchide02"
              }
            }
          },
          ["1747060813443859467"] = {
            key = "1747060813443859467",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2761.333333333333, y = 304.8018648018649},
            propsData = {WaitTime = 0.1}
          }
        },
        commentData = {}
      }
    },
    ["171576115651916402"] = {
      isStoryNode = true,
      key = "171576115651916402",
      type = "StoryNode",
      name = "\233\133\146\233\166\134\229\134\133",
      pos = {x = 708.8475957015028, y = 520.1625702408127},
      propsData = {
        QuestId = 10030104,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030104",
        QuestDeatil = "QuestDesc_10030104",
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
            startQuest = "1716803539240487190",
            startPort = "Out",
            endQuest = "1716803539239487186",
            endPort = "In"
          },
          {
            startQuest = "1716803539239487186",
            startPort = "Out",
            endQuest = "1716803539239487188",
            endPort = "In"
          },
          {
            startQuest = "1716803539239487187",
            startPort = "Out",
            endQuest = "17393449101622038813",
            endPort = "In"
          },
          {
            startQuest = "17393449101622038813",
            startPort = "Out",
            endQuest = "171576115651916406",
            endPort = "Success"
          },
          {
            startQuest = "171576115651916403",
            startPort = "QuestStart",
            endQuest = "17393431600037408",
            endPort = "In"
          },
          {
            startQuest = "17393431600037408",
            startPort = "Out",
            endQuest = "1716803539240487190",
            endPort = "In"
          },
          {
            startQuest = "1716803539239487188",
            startPort = "Out",
            endQuest = "1716803539240487191",
            endPort = "In"
          },
          {
            startQuest = "1716803539240487191",
            startPort = "Out",
            endQuest = "17448983501765353",
            endPort = "In"
          },
          {
            startQuest = "17448983501765353",
            startPort = "Out",
            endQuest = "1716803539239487187",
            endPort = "In"
          }
        },
        nodeData = {
          ["171576115651916403"] = {
            key = "171576115651916403",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 600.5882352941177, y = 298.2352941176471},
            propsData = {ModeType = 0}
          },
          ["171576115651916406"] = {
            key = "171576115651916406",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171576115651916409"] = {
            key = "171576115651916409",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1716803539239487186"] = {
            key = "1716803539239487186",
            type = "TalkNode",
            name = "\229\146\140\229\165\165\229\147\165\228\186\164\228\186\146\229\175\185\232\175\157",
            pos = {x = 1420.6933882519322, y = 318.93753274297603},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Aote100312_1220086",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10030410,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple02stg",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
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
          ["1716803539239487187"] = {
            key = "1716803539239487187",
            type = "TalkNode",
            name = "\229\146\140\233\187\142\231\145\159\228\186\164\228\186\146\229\175\185\232\175\157",
            pos = {x = 1434.4801529578142, y = 523.4463046728007},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Lise100313_1220088",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10030701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple03stg",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 100304},
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
          ["1716803539239487188"] = {
            key = "1716803539239487188",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\160\229\165\165\229\147\165\229\176\143\231\153\189",
            pos = {x = 1751.5056390977443, y = 311.1264758763918},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220086, 1220113}
            }
          },
          ["1716803539240487190"] = {
            key = "1716803539240487190",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\229\165\165\229\147\165\229\176\143\231\153\189\230\176\155\229\155\180\232\183\175\228\186\186",
            pos = {x = 1159.326845726849, y = 319.287674108545},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220086, 1220113}
            }
          },
          ["1716803539240487191"] = {
            key = "1716803539240487191",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\233\187\142\231\145\159\229\176\143\231\153\189",
            pos = {x = 2045.7703449800974, y = 312.91867536488286},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1220089,
                1220092,
                1220088
              }
            }
          },
          ["17393431600037408"] = {
            key = "17393431600037408",
            type = "GoToRegionNode",
            name = "\232\191\155\233\133\146\233\166\134",
            pos = {x = 878, y = 298.8695652173913},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveTavern"
            }
          },
          ["17393449101622038813"] = {
            key = "17393449101622038813",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\233\187\142\231\145\159\229\176\143\231\153\189",
            pos = {x = 1748.6342710997442, y = 541.8823529411765},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1220089,
                1220092,
                1220088
              }
            }
          },
          ["17448983501765353"] = {
            key = "17448983501765353",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1158.6050420168067, y = 543.3277310924369},
            propsData = {
              NewDescription = "QuestName_1003plus02",
              NewDetail = "QuestDesc_1003plus02",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["1716803576920724745"] = {
      isStoryNode = true,
      key = "1716803576920724745",
      type = "StoryNode",
      name = "\232\176\131\230\159\165",
      pos = {x = 1285.2871517027866, y = 526.9756420909673},
      propsData = {
        QuestId = 10030106,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus04",
        QuestDeatil = "QuestDesc_1003plus04",
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
            startQuest = "1716803576920724746",
            startPort = "QuestStart",
            endQuest = "17358100632406816",
            endPort = "In"
          },
          {
            startQuest = "17356339677125669",
            startPort = "Out",
            endQuest = "17168036564201081611",
            endPort = "In"
          },
          {
            startQuest = "173934711092521351",
            startPort = "Out",
            endQuest = "173934711092521350",
            endPort = "Input"
          },
          {
            startQuest = "174575162785310285",
            startPort = "Out",
            endQuest = "174575163271510499",
            endPort = "Input"
          },
          {
            startQuest = "174575163271510499",
            startPort = "Out",
            endQuest = "174575169937910810",
            endPort = "In"
          },
          {
            startQuest = "17168036564201081611",
            startPort = "Out",
            endQuest = "173934711092521351",
            endPort = "Input"
          },
          {
            startQuest = "17352909071238949275",
            startPort = "Out",
            endQuest = "17453129455691647050",
            endPort = "In"
          },
          {
            startQuest = "17393458832539033",
            startPort = "Out",
            endQuest = "17458478901535164",
            endPort = "In"
          },
          {
            startQuest = "174575163271510499",
            startPort = "Out",
            endQuest = "17465163933705652",
            endPort = "Input"
          },
          {
            startQuest = "173934711092521350",
            startPort = "Out",
            endQuest = "17465165465837052",
            endPort = "Input"
          },
          {
            startQuest = "17465165465837052",
            startPort = "Out",
            endQuest = "17466925989324424",
            endPort = "In"
          },
          {
            startQuest = "17466925989324424",
            startPort = "Out",
            endQuest = "1716803576921724749",
            endPort = "Success"
          },
          {
            startQuest = "1716803576920724746",
            startPort = "QuestStart",
            endQuest = "17168036564201081617",
            endPort = "In"
          },
          {
            startQuest = "17516190884795751",
            startPort = "Out",
            endQuest = "17356339677125669",
            endPort = "In"
          },
          {
            startQuest = "17352909071238949275",
            startPort = "Out",
            endQuest = "174575162785310285",
            endPort = "Input"
          },
          {
            startQuest = "174575169937910810",
            startPort = "Out",
            endQuest = "17393458832539033",
            endPort = "In"
          },
          {
            startQuest = "1756978007995966822",
            startPort = "BeginOverlap",
            endQuest = "1756978090241967878",
            endPort = "In"
          },
          {
            startQuest = "1756978090241967878",
            startPort = "Out",
            endQuest = "1756978007995966822",
            endPort = "Input"
          },
          {
            startQuest = "1756978007995966822",
            startPort = "EndOverlap",
            endQuest = "1756978153292968809",
            endPort = "In"
          },
          {
            startQuest = "1756978153292968809",
            startPort = "Out",
            endQuest = "1756978007995966822",
            endPort = "Input"
          },
          {
            startQuest = "17168036564201081617",
            startPort = "Out",
            endQuest = "17352909071238949275",
            endPort = "In"
          },
          {
            startQuest = "17168036564201081617",
            startPort = "Out",
            endQuest = "1756978007995966822",
            endPort = "Input"
          },
          {
            startQuest = "17393458832539033",
            startPort = "Out",
            endQuest = "17574207125895356",
            endPort = "In"
          },
          {
            startQuest = "17574207125895356",
            startPort = "Out",
            endQuest = "17516190884795751",
            endPort = "In"
          }
        },
        nodeData = {
          ["1716803576920724746"] = {
            key = "1716803576920724746",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 536.1224489795918, y = 325.2244897959184},
            propsData = {ModeType = 0}
          },
          ["1716803576921724749"] = {
            key = "1716803576921724749",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3168, y = 296},
            propsData = {ModeType = 0}
          },
          ["1716803576921724752"] = {
            key = "1716803576921724752",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3142, y = 704},
            propsData = {}
          },
          ["17168036564201081611"] = {
            key = "17168036564201081611",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 1899.532172007558, y = 600.6426511087063},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190462}
            }
          },
          ["17168036564201081617"] = {
            key = "17168036564201081617",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\161\136\229\143\145\229\156\176\231\130\185",
            pos = {x = 1105.1620593692028, y = 323.75241543465825},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 10301003,
              GuideType = "M",
              GuidePointName = "Mechanism_1190470"
            }
          },
          ["17352909071238949275"] = {
            key = "17352909071238949275",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1392.9243813949697, y = 322.35172156180556},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple05-06",
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
                  TalkActorId = 100304,
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
                {TalkActorType = "Npc", TalkActorId = 100304},
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
          ["17356339677125669"] = {
            key = "17356339677125669",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1575.6076923076917, y = 581.301098901099},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple07",
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
                  TalkActorId = 100304,
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
                {TalkActorType = "Npc", TalkActorId = 100304},
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
          ["17358100632406816"] = {
            key = "17358100632406816",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\233\187\142\231\145\159\229\188\128\232\189\166",
            pos = {x = 881.3333333333334, y = 600},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17393458832539033"] = {
            key = "17393458832539033",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2569.458823529411, y = 312.8941176470587},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031101,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple05-06",
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
                  TalkActorId = 100304,
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
                {TalkActorType = "Npc", TalkActorId = 100304},
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
          ["173934711092521350"] = {
            key = "173934711092521350",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2512.3473684210517, y = 602.7157894736845},
            propsData = {
              AnswerIds = {100301}
            }
          },
          ["173934711092521351"] = {
            key = "173934711092521351",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 2209.252631578946, y = 602.0842105263162},
            propsData = {
              QuestionIds = {1003},
              OpenToast = true
            }
          },
          ["17453129455691647050"] = {
            key = "17453129455691647050",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1996.6666666666665, y = 147.33333333333331},
            propsData = {
              NewDescription = "QuestName_1003plus03",
              NewDetail = "QuestDesc_1003plus03",
              SubTaskTargetIndex = 0
            }
          },
          ["174575162785310285"] = {
            key = "174575162785310285",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 1673.6270053475935, y = 323.9759358288771},
            propsData = {
              QuestionIds = {1001},
              OpenToast = true
            }
          },
          ["174575163271510499"] = {
            key = "174575163271510499",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 1980.7593582887698, y = 322.65240641711233},
            propsData = {
              AnswerIds = {100101}
            }
          },
          ["174575169937910810"] = {
            key = "174575169937910810",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 2283.1122994652405, y = 322.65240641711233},
            propsData = {
              ResultIds = {10010101}
            }
          },
          ["17458478901535164"] = {
            key = "17458478901535164",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2914.6666666666665, y = 165.99999999999997},
            propsData = {
              NewDescription = "QuestName_10030106",
              NewDetail = "QuestDesc_10030106",
              SubTaskTargetIndex = 0
            }
          },
          ["17465163933705652"] = {
            key = "17465163933705652",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2287.879953379953, y = 97.65034965034965},
            propsData = {AnswerId = 100101, AutoOpenDetectiveGameUI = true}
          },
          ["17465165465837052"] = {
            key = "17465165465837052",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2822.685508935509, y = 601.4836829836829},
            propsData = {AnswerId = 100301, AutoOpenDetectiveGameUI = false}
          },
          ["17466925989324424"] = {
            key = "17466925989324424",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 3166, y = 475.33333333333326},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190463,
                1190464,
                1190465,
                1190466
              }
            }
          },
          ["17485134966423484883"] = {
            key = "17485134966423484883",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1510.6666666666665, y = 134.53333333333345},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17485135772303487435"] = {
            key = "17485135772303487435",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2574.666666666666, y = 165.66666666666708},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17485135772303487436"] = {
            key = "17485135772303487436",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2562.6666666666665, y = 470.3333333333336},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17516190884795751"] = {
            key = "17516190884795751",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1271.3131313131312, y = 580.262626262626},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10030102,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301Clue1_1190462",
              IsUseCount = false
            }
          },
          ["1756978007995966822"] = {
            key = "1756978007995966822",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 1192.323876317167, y = -195.10228022579662},
            propsData = {StaticCreatorId = 1191932}
          },
          ["1756978090241967878"] = {
            key = "1756978090241967878",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1424.9016961838236, y = -296.9076898848573},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["1756978153292968809"] = {
            key = "1756978153292968809",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1421.620661701065, y = -96.49734505727108},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17574207125895356"] = {
            key = "17574207125895356",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 2847.794050343249, y = 369.8993135011445},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190462}
            }
          }
        },
        commentData = {}
      }
    },
    ["17327796199279416"] = {
      isStoryNode = true,
      key = "17327796199279416",
      type = "StoryNode",
      name = "\229\137\167\233\153\162",
      pos = {x = 1702.2250053867701, y = 784.2478991596639},
      propsData = {
        QuestId = 10030110,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030109",
        QuestDeatil = "QuestDesc_10030109",
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
            startQuest = "17327796199279417",
            startPort = "QuestStart",
            endQuest = "173562616479916840",
            endPort = "In"
          },
          {
            startQuest = "173562616479916840",
            startPort = "Out",
            endQuest = "17470507274521719757",
            endPort = "In"
          },
          {
            startQuest = "17470485694958346",
            startPort = "Out",
            endQuest = "17470508831981720586",
            endPort = "In"
          },
          {
            startQuest = "17470508831981720586",
            startPort = "Out",
            endQuest = "17327796199279420",
            endPort = "Success"
          },
          {
            startQuest = "17470507274521719757",
            startPort = "Out",
            endQuest = "17557615694466758",
            endPort = "In"
          },
          {
            startQuest = "17557615694466758",
            startPort = "Out",
            endQuest = "17470485694958346",
            endPort = "In"
          }
        },
        nodeData = {
          ["17327796199279417"] = {
            key = "17327796199279417",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17327796199279420"] = {
            key = "17327796199279420",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17327796199279423"] = {
            key = "17327796199279423",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173562616479916840"] = {
            key = "173562616479916840",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1484, y = 360},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100329,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1960136",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10032201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple13",
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
                  TalkActorId = 100329,
                  TalkActorVisible = true
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
                {TalkActorType = "Npc", TalkActorId = 100329},
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
          ["17470485694958346"] = {
            key = "17470485694958346",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2098.8888888888887, y = 356},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100362,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1969956",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10032214,
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
          ["17470507274521719757"] = {
            key = "17470507274521719757",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1808, y = 586},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1969956}
            }
          },
          ["17470508831981720586"] = {
            key = "17470508831981720586",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2484, y = 476},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1969956}
            }
          },
          ["17557615694466758"] = {
            key = "17557615694466758",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2149.9102941176466, y = 571.9367647058824},
            propsData = {
              NewDescription = "QuestName_1003plus06",
              NewDetail = "QuestDesc_1003plus06",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17327796213719553"] = {
      isStoryNode = true,
      key = "17327796213719553",
      type = "StoryNode",
      name = "\229\137\167\233\153\162",
      pos = {x = 2010.5309216926862, y = 797.890323402088},
      propsData = {
        QuestId = 10030111,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030110",
        QuestDeatil = "QuestDesc_10030110",
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
            startQuest = "17327796213719554",
            startPort = "QuestStart",
            endQuest = "173562796560424781",
            endPort = "In"
          },
          {
            startQuest = "1744699774219816958",
            startPort = "Out",
            endQuest = "173562738777023015",
            endPort = "In"
          },
          {
            startQuest = "173562738777023015",
            startPort = "Out",
            endQuest = "1744699774219816959",
            endPort = "In"
          },
          {
            startQuest = "1744699774219816959",
            startPort = "Out",
            endQuest = "173562802106626633",
            endPort = "In"
          },
          {
            startQuest = "17453134999732472804",
            startPort = "Out",
            endQuest = "1744699774219816958",
            endPort = "In"
          },
          {
            startQuest = "17453135705642473924",
            startPort = "Out",
            endQuest = "17356404151723729601",
            endPort = "In"
          },
          {
            startQuest = "17491958916514899",
            startPort = "Out",
            endQuest = "17441041253651648533",
            endPort = "In"
          },
          {
            startQuest = "17441041253651648533",
            startPort = "Out",
            endQuest = "17491959708656618",
            endPort = "In"
          },
          {
            startQuest = "17491959708656618",
            startPort = "Out",
            endQuest = "173278014686915745",
            endPort = "In"
          },
          {
            startQuest = "173278014686915745",
            startPort = "Out",
            endQuest = "17491959828677348",
            endPort = "In"
          },
          {
            startQuest = "17491959828677348",
            startPort = "Out",
            endQuest = "17441043459681651255",
            endPort = "In"
          },
          {
            startQuest = "17441043459681651255",
            startPort = "Out",
            endQuest = "17491959887517756",
            endPort = "In"
          },
          {
            startQuest = "17491959887517756",
            startPort = "Out",
            endQuest = "17327796213719557",
            endPort = "Success"
          },
          {
            startQuest = "173562796560424781",
            startPort = "Out",
            endQuest = "17515121339145676",
            endPort = "In"
          },
          {
            startQuest = "17515121339145676",
            startPort = "Out",
            endQuest = "17453134999732472804",
            endPort = "In"
          },
          {
            startQuest = "1744699774219816959",
            startPort = "Out",
            endQuest = "17515121614106293",
            endPort = "In"
          },
          {
            startQuest = "173562802106626633",
            startPort = "Out",
            endQuest = "17491958916514899",
            endPort = "In"
          }
        },
        nodeData = {
          ["17327796213719554"] = {
            key = "17327796213719554",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 110.00000000000011, y = 268.57142857142856},
            propsData = {ModeType = 0}
          },
          ["17327796213719557"] = {
            key = "17327796213719557",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3162, y = 318},
            propsData = {ModeType = 0}
          },
          ["17327796213719560"] = {
            key = "17327796213719560",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3180, y = 908},
            propsData = {}
          },
          ["173278014686915745"] = {
            key = "173278014686915745",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2373.819073083779, y = 193.19985504691414},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple15",
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
                  TalkActorId = 100313,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100313}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173562738777023015"] = {
            key = "173562738777023015",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1474, y = 648.6666666666666},
            propsData = {StaticCreatorId = 1969921, ObservationPointName = ""}
          },
          ["173562796560424781"] = {
            key = "173562796560424781",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 545.1428571428572, y = 315.14285714285717},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100318,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1960141",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10032301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple14",
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
                  TalkActorType = "Npc",
                  TalkActorId = 100318,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100319,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100318},
                {TalkActorType = "Npc", TalkActorId = 100319},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["173562802106626633"] = {
            key = "173562802106626633",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1450, y = 330},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1960001}
            }
          },
          ["17356404151723729601"] = {
            key = "17356404151723729601",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1515.6000000000001, y = -72.80000000000004},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1960075,
              GuideType = "M",
              GuidePointName = "Mechanism_1960075"
            }
          },
          ["174056072467310771"] = {
            key = "174056072467310771",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1434, y = 1010.6666666666665},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 0,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17411721312889600"] = {
            key = "17411721312889600",
            type = "TalkNode",
            name = "seq",
            pos = {x = 1106.0000000000002, y = 1006.6666666666666},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Region/Imperial/Thea/LS_Thea_DQup.LS_Thea_DQup",
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
          ["17441041253651648533"] = {
            key = "17441041253651648533",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2086.5333333333333, y = -93.02857142857141},
            propsData = {
              SendMessage = "cp2theaplatdown",
              FinishCondition = "cp2theaplatdownfinish"
            }
          },
          ["17441043459681651255"] = {
            key = "17441043459681651255",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2720.666666666666, y = 618.5714285714284},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2theaplatup",
              UnitId = -1
            }
          },
          ["1744699774219816958"] = {
            key = "1744699774219816958",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1194.1176470588236, y = 657},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_NewTargetPoint_100301_guancha2"
            }
          },
          ["1744699774219816959"] = {
            key = "1744699774219816959",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1787.8823529411766, y = 657.0000000000001},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_NewTargetPoint_100301_guancha2"
            }
          },
          ["17453134999732472804"] = {
            key = "17453134999732472804",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 853.9047619047619, y = 696.6666666666666},
            propsData = {
              NewDescription = "QuestName_1003plus07",
              NewDetail = "QuestDesc_1003plus07",
              SubTaskTargetIndex = 0
            }
          },
          ["17453135705642473924"] = {
            key = "17453135705642473924",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1393.9047619047617, y = 117.6},
            propsData = {
              NewDescription = "QuestName_1003plus08",
              NewDetail = "QuestDesc_1003plus08",
              SubTaskTargetIndex = 0
            }
          },
          ["17491958916514899"] = {
            key = "17491958916514899",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 1780, y = -106},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["17491959708656618"] = {
            key = "17491959708656618",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 2421.666666666667, y = -76.33333333333327},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          },
          ["17491959828677348"] = {
            key = "17491959828677348",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 2408.3333333333335, y = 586.3333333333336},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["17491959887517756"] = {
            key = "17491959887517756",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 3084.333333333333, y = 593.0000000000001},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          },
          ["17515121339145676"] = {
            key = "17515121339145676",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 573.6944444444448, y = 558.6666666666666},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1969921}
            }
          },
          ["17515121614106293"] = {
            key = "17515121614106293",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1792.5833333333335, y = 856.4444444444442},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1969921}
            }
          }
        },
        commentData = {}
      }
    },
    ["173278004063911077"] = {
      isStoryNode = true,
      key = "173278004063911077",
      type = "StoryNode",
      name = "\229\137\167\233\153\162",
      pos = {x = 1433.2348093083385, y = 801.9582166199815},
      propsData = {
        QuestId = 10030109,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus05",
        QuestDeatil = "QuestDesc_1003plus05",
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
            startQuest = "173278009398712979",
            startPort = "Out",
            endQuest = "173278010453613580",
            endPort = "In"
          },
          {
            startQuest = "173278009398712979",
            startPort = "Out",
            endQuest = "173278004063911081",
            endPort = "Success"
          },
          {
            startQuest = "173278008912912801",
            startPort = "Out",
            endQuest = "173562606361912433",
            endPort = "In"
          },
          {
            startQuest = "173278008912912801",
            startPort = "Out",
            endQuest = "173278009398712979",
            endPort = "In"
          },
          {
            startQuest = "173562606361912433",
            startPort = "Out",
            endQuest = "17453132660581652906",
            endPort = "In"
          },
          {
            startQuest = "17446991085126366",
            startPort = "Out",
            endQuest = "17545585877745817",
            endPort = "In"
          },
          {
            startQuest = "17356365995623261",
            startPort = "Out",
            endQuest = "173278008912912801",
            endPort = "In"
          },
          {
            startQuest = "173278004063911078",
            startPort = "QuestStart",
            endQuest = "17446990693565680",
            endPort = "In"
          },
          {
            startQuest = "17446990693565680",
            startPort = "Out",
            endQuest = "17356365995623261",
            endPort = "In"
          },
          {
            startQuest = "17356365995623261",
            startPort = "Out",
            endQuest = "17446991085126366",
            endPort = "In"
          }
        },
        nodeData = {
          ["173278004063911078"] = {
            key = "173278004063911078",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278004063911081"] = {
            key = "173278004063911081",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278004063911084"] = {
            key = "173278004063911084",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173278008912912801"] = {
            key = "173278008912912801",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1342.2020685197156, y = 339.0212777418661},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1960065,
              GuideType = "M",
              GuidePointName = "Mechanism_1960065"
            }
          },
          ["173278009398712979"] = {
            key = "173278009398712979",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2061.025641025641, y = 361.8750582750582},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100313,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1960001",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10032101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple12",
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
                  TalkActorId = 100313,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100313}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173278010453613580"] = {
            key = "173278010453613580",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2336, y = 174},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032109,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173562606361912433"] = {
            key = "173562606361912433",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1753.5, y = 125.2857142857141},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032002,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17356365995623261"] = {
            key = "17356365995623261",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1090.909090909091, y = 586},
            propsData = {StaticCreatorId = 1969919, ObservationPointName = ""}
          },
          ["17446990693565680"] = {
            key = "17446990693565680",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 904.96256684492, y = 843.8181818181818},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_NewTargetPoint_100301_guancha1"
            }
          },
          ["17446991085126366"] = {
            key = "17446991085126366",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1414, y = 852.0000000000001},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_NewTargetPoint_100301_guancha1"
            }
          },
          ["17453132660581652906"] = {
            key = "17453132660581652906",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2035.8997668997674, y = 47.56561085972851},
            propsData = {
              NewDescription = "QuestName_10030108",
              NewDetail = "QuestDesc_10030108",
              SubTaskTargetIndex = 0
            }
          },
          ["17545585877745817"] = {
            key = "17545585877745817",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1804.8108362226012, y = 848.1418581418577},
            propsData = {
              NewDescription = "QuestName_1003plus32",
              NewDetail = "QuestDesc_1003plus32",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["173278004274811238"] = {
      isStoryNode = true,
      key = "173278004274811238",
      type = "StoryNode",
      name = "\229\137\167\233\153\162",
      pos = {x = 1140.6329503829502, y = 807.8200492318141},
      propsData = {
        QuestId = 10030108,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030107",
        QuestDeatil = "QuestDesc_10030107",
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
            startQuest = "173278006371411541",
            startPort = "Out",
            endQuest = "173278006371411543",
            endPort = "In"
          },
          {
            startQuest = "173278004274811239",
            startPort = "QuestStart",
            endQuest = "173278006371411541",
            endPort = "In"
          },
          {
            startQuest = "173278006371411543",
            startPort = "Out",
            endQuest = "17479843606995588",
            endPort = "In"
          },
          {
            startQuest = "17479843606995588",
            startPort = "Out",
            endQuest = "173278004274811242",
            endPort = "Success"
          },
          {
            startQuest = "173278004274811239",
            startPort = "QuestStart",
            endQuest = "17484193172664792",
            endPort = "In"
          }
        },
        nodeData = {
          ["173278004274811239"] = {
            key = "173278004274811239",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278004274811242"] = {
            key = "173278004274811242",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278004274911245"] = {
            key = "173278004274911245",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173278006371411541"] = {
            key = "173278006371411541",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1537.3446852425177, y = 346.2071678063939},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101901,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "LeavePoint_Theater"
            }
          },
          ["173278006371411543"] = {
            key = "173278006371411543",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1930.7103675478274, y = 368.34185180144914},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1960001,
                1960141,
                1960142,
                1960136
              }
            }
          },
          ["17361546543814321"] = {
            key = "17361546543814321",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 1532, y = 596},
            propsData = {
              IsHide = false,
              AtmosphereTagList = {
                "cp2ilchide01"
              }
            }
          },
          ["17479843606995588"] = {
            key = "17479843606995588",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2338, y = 374},
            propsData = {WaitTime = 0.2}
          },
          ["17484193172664792"] = {
            key = "17484193172664792",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1538.5714285714287, y = 38.0000000000002},
            propsData = {
              ActionType = 0,
              Condition = "training",
              SaveToServer = true
            }
          }
        },
        commentData = {}
      }
    },
    ["173278024589319989"] = {
      isStoryNode = true,
      key = "173278024589319989",
      type = "StoryNode",
      name = "\232\180\171\230\176\145\231\170\159",
      pos = {x = 1564.832148243913, y = 526.533613445378},
      propsData = {
        QuestId = 10030112,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030111",
        QuestDeatil = "QuestDesc_10030111",
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
            startQuest = "173278024589319990",
            startPort = "QuestStart",
            endQuest = "17356350934949394",
            endPort = "In"
          },
          {
            startQuest = "17356350934949394",
            startPort = "Out",
            endQuest = "173278031895721848",
            endPort = "In"
          },
          {
            startQuest = "17470570798072580800",
            startPort = "Out",
            endQuest = "173278024589319993",
            endPort = "Success"
          },
          {
            startQuest = "17356350934949394",
            startPort = "Out",
            endQuest = "17484193429535885",
            endPort = "In"
          },
          {
            startQuest = "173278031895721848",
            startPort = "Out",
            endQuest = "17485141117565241874",
            endPort = "In"
          },
          {
            startQuest = "17485141117565241874",
            startPort = "Out",
            endQuest = "173278031895721846",
            endPort = "In"
          },
          {
            startQuest = "173278031895721846",
            startPort = "Out",
            endQuest = "17485141117565241875",
            endPort = "In"
          },
          {
            startQuest = "17485141117565241875",
            startPort = "Out",
            endQuest = "17470570798072580800",
            endPort = "In"
          }
        },
        nodeData = {
          ["173278024589319990"] = {
            key = "173278024589319990",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278024589319993"] = {
            key = "173278024589319993",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278024589319996"] = {
            key = "173278024589319996",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173278031895721846"] = {
            key = "173278031895721846",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2002.2440349124568, y = 311.85014005602244},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple16",
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
          ["173278031895721848"] = {
            key = "173278031895721848",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1510.3512031827809, y = 319.8641480810212},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "PlayerLeaveTheater",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17356350934949394"] = {
            key = "17356350934949394",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1174.9884634972877, y = 310.07864292570196},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Theater"
            }
          },
          ["17356350934949395"] = {
            key = "17356350934949395",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1432.5115365027123, y = 689.4213570742982},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1960136,
                1960137,
                1960141,
                1960142
              }
            }
          },
          ["17470570798072580800"] = {
            key = "17470570798072580800",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2444.75, y = 315.75},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190818}
            }
          },
          ["17484193429535885"] = {
            key = "17484193429535885",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1572, y = -2},
            propsData = {ActionType = 1, Condition = "training"}
          },
          ["17485141117565241874"] = {
            key = "17485141117565241874",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1756.5462454212452, y = 531.8106060606061},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17485141117565241875"] = {
            key = "17485141117565241875",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2240.7962454212447, y = 527.3939393939394},
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
    ["173278024835420257"] = {
      isStoryNode = true,
      key = "173278024835420257",
      type = "StoryNode",
      name = "\232\180\171\230\176\145\231\170\159",
      pos = {x = 1875.9750053867697, y = 529.1050420168067},
      propsData = {
        QuestId = 10030113,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030112",
        QuestDeatil = "QuestDesc_10030112",
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
            startQuest = "173278036194923680",
            startPort = "Out",
            endQuest = "173278036194923679",
            endPort = "In"
          },
          {
            startQuest = "173278034482122945",
            startPort = "Out",
            endQuest = "173278036194923680",
            endPort = "In"
          },
          {
            startQuest = "173278036194923679",
            startPort = "Out",
            endQuest = "173278024835420261",
            endPort = "Success"
          },
          {
            startQuest = "17453141815152478528",
            startPort = "Out",
            endQuest = "173278034482122945",
            endPort = "In"
          },
          {
            startQuest = "17453137521242476764",
            startPort = "Out",
            endQuest = "17453187564482457557",
            endPort = "In"
          },
          {
            startQuest = "17453187564482457557",
            startPort = "Out",
            endQuest = "17453141815152478528",
            endPort = "In"
          },
          {
            startQuest = "17453189611453275510",
            startPort = "Out",
            endQuest = "173278034055522749",
            endPort = "In"
          },
          {
            startQuest = "17453189611453275510",
            startPort = "Out",
            endQuest = "17453137521242476764",
            endPort = "In"
          },
          {
            startQuest = "17453187564482457557",
            startPort = "Out",
            endQuest = "17453215525032451616",
            endPort = "In"
          },
          {
            startQuest = "173278024835420258",
            startPort = "QuestStart",
            endQuest = "17453189611453275510",
            endPort = "In"
          }
        },
        nodeData = {
          ["173278024835420258"] = {
            key = "173278024835420258",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 536, y = 308},
            propsData = {ModeType = 0}
          },
          ["173278024835420261"] = {
            key = "173278024835420261",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278024835420264"] = {
            key = "173278024835420264",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173278034055522749"] = {
            key = "173278034055522749",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1381.1932773109247, y = 23.838235294117567},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173278034482122945"] = {
            key = "173278034482122945",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1589.25, y = 296.1988795518206},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100320,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1190818",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10032603,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173278036194923679"] = {
            key = "173278036194923679",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2410.666666666666, y = 299.3333333333335},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190829}
            }
          },
          ["173278036194923680"] = {
            key = "173278036194923680",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2017.333333333334, y = 302.6666666666664},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190818}
            }
          },
          ["17453137521242476764"] = {
            key = "17453137521242476764",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1004, y = 572.75},
            propsData = {
              NewDescription = "QuestName_1003plus09",
              NewDetail = "QuestDesc_1003plus09",
              SubTaskTargetIndex = 0
            }
          },
          ["17453141815152478528"] = {
            key = "17453141815152478528",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1396.5, y = 572},
            propsData = {
              NewDescription = "QuestName_1003plus10",
              NewDetail = "QuestDesc_1003plus10",
              SubTaskTargetIndex = 0
            }
          },
          ["17453187564482457557"] = {
            key = "17453187564482457557",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1212, y = 320},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1191368},
              QuestPickupId = -1,
              UnitId = 10030101,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Drop_1191368",
              IsUseCount = false
            }
          },
          ["17453189611453275510"] = {
            key = "17453189611453275510",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 889.061605061605, y = 285.31002331002355},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191366,
              GuideType = "M",
              GuidePointName = "Mechanism_1191366"
            }
          },
          ["17453215525032451616"] = {
            key = "17453215525032451616",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1702.75, y = 88.25000000000001},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032602,
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
    ["173278025111720437"] = {
      isStoryNode = true,
      key = "173278025111720437",
      type = "StoryNode",
      name = "\232\180\171\230\176\145\231\170\159",
      pos = {x = 2171.97500538677, y = 519.8214285714286},
      propsData = {
        QuestId = 10030114,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030113",
        QuestDeatil = "QuestDesc_10030113",
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
            startQuest = "173278040039225264",
            startPort = "Out",
            endQuest = "173278040039225265",
            endPort = "In"
          },
          {
            startQuest = "173278040679825595",
            startPort = "Out",
            endQuest = "173278025111720441",
            endPort = "Success"
          },
          {
            startQuest = "173278025111720438",
            startPort = "QuestStart",
            endQuest = "173278040039225264",
            endPort = "In"
          },
          {
            startQuest = "173278025111720438",
            startPort = "QuestStart",
            endQuest = "17358101211399751",
            endPort = "In"
          },
          {
            startQuest = "173278040039225265",
            startPort = "Out",
            endQuest = "17447131812977586",
            endPort = "In"
          },
          {
            startQuest = "17447131812977586",
            startPort = "Out",
            endQuest = "173278040679825595",
            endPort = "In"
          }
        },
        nodeData = {
          ["173278025111720438"] = {
            key = "173278025111720438",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278025111720441"] = {
            key = "173278025111720441",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278025111720444"] = {
            key = "173278025111720444",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173278040039225264"] = {
            key = "173278040039225264",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1185.8095238095239, y = 303.7142857142858},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190816,
              GuideType = "M",
              GuidePointName = "Mechanism_1190816"
            }
          },
          ["173278040039225265"] = {
            key = "173278040039225265",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1568.1904761904764, y = 288.2857142857142},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032613,
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
          ["173278040679825595"] = {
            key = "173278040679825595",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2427.8397832301844, y = 300.84020267658036},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190829}
            }
          },
          ["17358101211399751"] = {
            key = "17358101211399751",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1182, y = 582},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032609,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17447131812977586"] = {
            key = "17447131812977586",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2010, y = 304},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190824}
            }
          }
        },
        commentData = {}
      }
    },
    ["173278025245520587"] = {
      isStoryNode = true,
      key = "173278025245520587",
      type = "StoryNode",
      name = "\232\180\171\230\176\145\231\170\159",
      pos = {x = 2458.9360443478095, y = 516.140756302521},
      propsData = {
        QuestId = 10030115,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030114",
        QuestDeatil = "QuestDesc_10030114",
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
            startQuest = "173278025245520588",
            startPort = "QuestStart",
            endQuest = "173278046099127775",
            endPort = "In"
          },
          {
            startQuest = "173278025245520588",
            startPort = "QuestStart",
            endQuest = "17358100948658388",
            endPort = "In"
          },
          {
            startQuest = "173278046099127775",
            startPort = "Out",
            endQuest = "17485141466885243290",
            endPort = "In"
          },
          {
            startQuest = "17485141466885243290",
            startPort = "Out",
            endQuest = "173278046099127774",
            endPort = "In"
          },
          {
            startQuest = "173278046099127774",
            startPort = "Out",
            endQuest = "173278046099127776",
            endPort = "In"
          },
          {
            startQuest = "173278046099127776",
            startPort = "Out",
            endQuest = "173278025245520591",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173278025245520588"] = {
            key = "173278025245520588",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173278025245520591"] = {
            key = "173278025245520591",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2305.4323308270673, y = 267.3496240601504},
            propsData = {ModeType = 0}
          },
          ["173278025245520594"] = {
            key = "173278025245520594",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173278046099127774"] = {
            key = "173278046099127774",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1456.392271505586, y = 285.59110940658934},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032701,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple17",
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
                  TalkActorId = 100314,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100314}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173278046099127775"] = {
            key = "173278046099127775",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1146.9686274509809, y = 301.69685412626586},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190819,
              GuideType = "M",
              GuidePointName = "Mechanism_1190819"
            }
          },
          ["173278046099127776"] = {
            key = "173278046099127776",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1749.0313725490191, y = 466.018422753717},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190824}
            }
          },
          ["17358100948658388"] = {
            key = "17358100948658388",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1148, y = 560},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032614,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17485141466885243290"] = {
            key = "17485141466885243290",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1338.2223193473196, y = 127.5448717948721},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17352894887948928825"] = {
      isStoryNode = true,
      key = "17352894887948928825",
      type = "StoryNode",
      name = "\229\159\142\229\162\153",
      pos = {x = 996.6666666666666, y = 523.132075471698},
      propsData = {
        QuestId = 10030105,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030105",
        QuestDeatil = "QuestDesc_10030105",
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
            startQuest = "17352894887948928826",
            startPort = "QuestStart",
            endQuest = "17352908076528944256",
            endPort = "In"
          },
          {
            startQuest = "17352908076528944256",
            startPort = "Out",
            endQuest = "17440318051376543",
            endPort = "In"
          },
          {
            startQuest = "17440320237097523",
            startPort = "Out",
            endQuest = "17457485413417612",
            endPort = "Input"
          },
          {
            startQuest = "17440318051376543",
            startPort = "Out",
            endQuest = "1748513075200878719",
            endPort = "In"
          },
          {
            startQuest = "1748513075200878719",
            startPort = "Out",
            endQuest = "17352895440068930621",
            endPort = "In"
          },
          {
            startQuest = "17352895440068930621",
            startPort = "Out",
            endQuest = "1748513135731879579",
            endPort = "In"
          },
          {
            startQuest = "1748513135731879579",
            startPort = "Out",
            endQuest = "17440320237097523",
            endPort = "In"
          },
          {
            startQuest = "17457485413417612",
            startPort = "Out",
            endQuest = "17352894887958928829",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17352894887948928826"] = {
            key = "17352894887948928826",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17352894887958928829"] = {
            key = "17352894887958928829",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17352894887958928832"] = {
            key = "17352894887958928832",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17352895440068930621"] = {
            key = "17352895440068930621",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1692.3059440559443, y = 269.31643356643355},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1190845",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10030801,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple04_66",
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
          ["17352908076528944256"] = {
            key = "17352908076528944256",
            type = "GoToRegionNode",
            name = "\232\191\155\229\134\176\230\185\150\229\159\142",
            pos = {x = 1095.6573426573427, y = 268.3688811188809},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "N",
              GuideName = "Npc_1190845"
            }
          },
          ["17352908682678947503"] = {
            key = "17352908682678947503",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 2347.8041958041954, y = 583.0454545454543},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190462,
                1190463,
                1190464,
                1190465
              }
            }
          },
          ["17440318051376543"] = {
            key = "17440318051376543",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1391.3461538461538, y = 282.3169330669332},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190845}
            }
          },
          ["17440320237097523"] = {
            key = "17440320237097523",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2029.3269230769233, y = 280.4900099900102},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190845}
            }
          },
          ["17457485413417612"] = {
            key = "17457485413417612",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 2288, y = 282},
            propsData = {
              QuestionIds = {1000},
              OpenToast = true
            }
          },
          ["1748513075200878719"] = {
            key = "1748513075200878719",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1556.75, y = 61.5},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["1748513135731879579"] = {
            key = "1748513135731879579",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1871.3863636363635, y = 61.045454545454504},
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
    ["173934612267215543"] = {
      isStoryNode = true,
      key = "173934612267215543",
      type = "StoryNode",
      name = "\232\176\131\230\159\165",
      pos = {x = 208.2032085561498, y = 812.7402429871471},
      propsData = {
        QuestId = 10030107,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus04",
        QuestDeatil = "QuestDesc_1003plus04",
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
            startQuest = "17397782798264101035",
            startPort = "Out",
            endQuest = "17398642004452331032",
            endPort = "In"
          },
          {
            startQuest = "173934612267415558",
            startPort = "Out",
            endQuest = "17393502578773894",
            endPort = "Input"
          },
          {
            startQuest = "173934612267415559",
            startPort = "Out",
            endQuest = "17394170145921032783",
            endPort = "Input"
          },
          {
            startQuest = "173934612267415560",
            startPort = "Out",
            endQuest = "17397787967564667",
            endPort = "Input"
          },
          {
            startQuest = "173934612267415561",
            startPort = "Out",
            endQuest = "17398659328543105927",
            endPort = "Input"
          },
          {
            startQuest = "173934612267415555",
            startPort = "Out",
            endQuest = "17457603982188331",
            endPort = "Input"
          },
          {
            startQuest = "173934612267415554",
            startPort = "Out",
            endQuest = "17457603982188331",
            endPort = "Input"
          },
          {
            startQuest = "17398659328543105927",
            startPort = "Out",
            endQuest = "17465165752988731",
            endPort = "Input"
          },
          {
            startQuest = "17393502578773894",
            startPort = "Out",
            endQuest = "17465165851169208",
            endPort = "Input"
          },
          {
            startQuest = "17394170145921032783",
            startPort = "Out",
            endQuest = "17465165974359917",
            endPort = "Input"
          },
          {
            startQuest = "17397787967564667",
            startPort = "Out",
            endQuest = "174651660570310440",
            endPort = "Input"
          },
          {
            startQuest = "173934612267315548",
            startPort = "QuestStart",
            endQuest = "17397782798264101035",
            endPort = "In"
          },
          {
            startQuest = "17393502578773894",
            startPort = "Out",
            endQuest = "17458465991034822",
            endPort = "Input_1"
          },
          {
            startQuest = "17394170145921032783",
            startPort = "Out",
            endQuest = "17458465991034822",
            endPort = "Input_2"
          },
          {
            startQuest = "17397787967564667",
            startPort = "Out",
            endQuest = "17458465991034822",
            endPort = "Input_3"
          },
          {
            startQuest = "1751619390373950541",
            startPort = "Out",
            endQuest = "173934612267415556",
            endPort = "In"
          },
          {
            startQuest = "1751619429921951460",
            startPort = "Out",
            endQuest = "173934612267315553",
            endPort = "In"
          },
          {
            startQuest = "1751619452924952141",
            startPort = "Out",
            endQuest = "173934612267415554",
            endPort = "In"
          },
          {
            startQuest = "1751619468473952505",
            startPort = "Out",
            endQuest = "173934612267415555",
            endPort = "In"
          },
          {
            startQuest = "17465165752988731",
            startPort = "Out",
            endQuest = "17545569663335620",
            endPort = "In"
          },
          {
            startQuest = "17458465991034822",
            startPort = "Out",
            endQuest = "173934612267315549",
            endPort = "Success"
          },
          {
            startQuest = "17561268163321895815",
            startPort = "Out",
            endQuest = "17561268163321895816",
            endPort = "Input"
          },
          {
            startQuest = "17473211443467581",
            startPort = "Out",
            endQuest = "17561268163321895815",
            endPort = "Input"
          },
          {
            startQuest = "17397782798264101035",
            startPort = "Out",
            endQuest = "1751619390373950541",
            endPort = "In"
          },
          {
            startQuest = "17397782798264101035",
            startPort = "Out",
            endQuest = "1751619429921951460",
            endPort = "In"
          },
          {
            startQuest = "17397782798264101035",
            startPort = "Out",
            endQuest = "1751619452924952141",
            endPort = "In"
          },
          {
            startQuest = "17397782798264101035",
            startPort = "Out",
            endQuest = "1751619468473952505",
            endPort = "In"
          },
          {
            startQuest = "173934612267415555",
            startPort = "Out",
            endQuest = "173934612267415560",
            endPort = "In"
          },
          {
            startQuest = "173934612267415554",
            startPort = "Out",
            endQuest = "173934612267415559",
            endPort = "In"
          },
          {
            startQuest = "173934612267315553",
            startPort = "Out",
            endQuest = "173934612267415558",
            endPort = "In"
          },
          {
            startQuest = "173934612267415556",
            startPort = "Out",
            endQuest = "173934612267415561",
            endPort = "In"
          },
          {
            startQuest = "17398659328543105927",
            startPort = "Out",
            endQuest = "17473211443467581",
            endPort = "In"
          },
          {
            startQuest = "17561268163321895815",
            startPort = "Out",
            endQuest = "17458465991034822",
            endPort = "Input_4"
          },
          {
            startQuest = "17569849459422877932",
            startPort = "BeginOverlap",
            endQuest = "17569849459422877933",
            endPort = "In"
          },
          {
            startQuest = "17569849459422877933",
            startPort = "Out",
            endQuest = "17569849459422877932",
            endPort = "Input"
          },
          {
            startQuest = "17569849459422877932",
            startPort = "EndOverlap",
            endQuest = "17569849459422877934",
            endPort = "In"
          },
          {
            startQuest = "17569849459422877934",
            startPort = "Out",
            endQuest = "17569849459422877932",
            endPort = "Input"
          },
          {
            startQuest = "173934612267315548",
            startPort = "QuestStart",
            endQuest = "17569849459422877932",
            endPort = "Input"
          },
          {
            startQuest = "173934612267415556",
            startPort = "Out",
            endQuest = "17457603468786708",
            endPort = "Input"
          },
          {
            startQuest = "17561268163321895815",
            startPort = "Out",
            endQuest = "17601648566208091",
            endPort = "In"
          }
        },
        nodeData = {
          ["173934612267315548"] = {
            key = "173934612267315548",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 536.1224489795918, y = 325.2244897959184},
            propsData = {ModeType = 0}
          },
          ["173934612267315549"] = {
            key = "173934612267315549",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3896.8333333333335, y = 321.3333333333335},
            propsData = {ModeType = 0}
          },
          ["173934612267315550"] = {
            key = "173934612267315550",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4072.6666666666665, y = 915.1666666666667},
            propsData = {}
          },
          ["173934612267315553"] = {
            key = "173934612267315553",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1590.0240487582591, y = 203.02626455408532},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031210,
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
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173934612267415554"] = {
            key = "173934612267415554",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1593.2094829319285, y = 450.5832673552056},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031301,
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
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173934612267415555"] = {
            key = "173934612267415555",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1595.3988386742258, y = 672.3331272991832},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031401,
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
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173934612267415556"] = {
            key = "173934612267415556",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1581.0733684861516, y = -38.58578026384198},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031601,
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
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173934612267415558"] = {
            key = "173934612267415558",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 2122.856701819483, y = 232.46485967592716},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190463}
            }
          },
          ["173934612267415559"] = {
            key = "173934612267415559",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 2117.7811916154014, y = 388.4148596759272},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190464}
            }
          },
          ["173934612267415560"] = {
            key = "173934612267415560",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 2111.595477329687, y = 532.1862882473556},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190465}
            }
          },
          ["173934612267415561"] = {
            key = "173934612267415561",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\186\191\231\180\162",
            pos = {x = 2128.5478582820683, y = 43.77438348545113},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190466}
            }
          },
          ["173934767076325461"] = {
            key = "173934767076325461",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 600.2499999999991, y = 1059.0499999999997},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "cp2cluesphere"
            }
          },
          ["17393502578773894"] = {
            key = "17393502578773894",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2420.5196078431372, y = 214.6127450980391},
            propsData = {
              AnswerIds = {100302}
            }
          },
          ["17394170145921032783"] = {
            key = "17394170145921032783",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2417.843137254902, y = 364.30392156862735},
            propsData = {
              AnswerIds = {100201}
            }
          },
          ["17397782798264101035"] = {
            key = "17397782798264101035",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 906, y = 328},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190485,
              GuideType = "M",
              GuidePointName = "Mechanism_1190485"
            }
          },
          ["17397787967564667"] = {
            key = "17397787967564667",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2426.0354449472097, y = 539.067496229261},
            propsData = {
              AnswerIds = {100202}
            }
          },
          ["17398642004452331032"] = {
            key = "17398642004452331032",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1329.1, y = 761.6999999999999},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190459}
            }
          },
          ["17398659328543105927"] = {
            key = "17398659328543105927",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2420.7666666666673, y = 48.78333333333325},
            propsData = {
              AnswerIds = {100402}
            }
          },
          ["17457599604385185"] = {
            key = "17457599604385185",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 850.25, y = -37.31818181818181},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["17457603468786708"] = {
            key = "17457603468786708",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 1918.3452380952378, y = -179.98484848484847},
            propsData = {
              QuestionIds = {1004},
              OpenToast = true
            }
          },
          ["17457603982188331"] = {
            key = "17457603982188331",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 1915.9999999999998, y = 952.681818181818},
            propsData = {
              QuestionIds = {1002},
              OpenToast = true
            }
          },
          ["17458465991034822"] = {
            key = "17458465991034822",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2978, y = 277.3333333333333},
            propsData = {ListenCount = 4, NeedFinishCount = 4}
          },
          ["17465165752988731"] = {
            key = "17465165752988731",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2461.476249240954, y = -121.98499539675987},
            propsData = {AnswerId = 100402, AutoOpenDetectiveGameUI = false}
          },
          ["17465165851169208"] = {
            key = "17465165851169208",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2808.6135041429147, y = 106.79931832873024},
            propsData = {AnswerId = 100302, AutoOpenDetectiveGameUI = false}
          },
          ["17465165974359917"] = {
            key = "17465165974359917",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2810.966445319385, y = 537.3875536228478},
            propsData = {AnswerId = 100201, AutoOpenDetectiveGameUI = false}
          },
          ["174651660570310440"] = {
            key = "174651660570310440",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2754.4958570840913, y = 732.6816712699066},
            propsData = {AnswerId = 100202, AutoOpenDetectiveGameUI = false}
          },
          ["17471351276952579851"] = {
            key = "17471351276952579851",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3495.8974358974356, y = 226.41025641025638},
            propsData = {
              NewDescription = "QuestName_1003plus03",
              NewDetail = "QuestDesc_1003plus03",
              SubTaskTargetIndex = 0
            }
          },
          ["17473211443467581"] = {
            key = "17473211443467581",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3090.6666666666665, y = -48},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301ClueLise_1190459",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10031701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple08-11",
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
          ["17485137736544361469"] = {
            key = "17485137736544361469",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1141.2257018343971, y = -58.263099219621225},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["1751619390373950541"] = {
            key = "1751619390373950541",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1449.0454545454545, y = -248.83333333333326},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10030106,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301Clue5_1190466",
              IsUseCount = false
            }
          },
          ["1751619429921951460"] = {
            key = "1751619429921951460",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1461.5454545454545, y = 69.91666666666674},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10030103,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301Clue2_1190463",
              IsUseCount = false
            }
          },
          ["1751619452924952141"] = {
            key = "1751619452924952141",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1481.5454545454545, y = 274.91666666666674},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10030104,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301Clue3_1190464",
              IsUseCount = false
            }
          },
          ["1751619468473952505"] = {
            key = "1751619468473952505",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1536.5454545454545, y = 566.1666666666667},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10030105,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301Clue4_1190465",
              IsUseCount = false
            }
          },
          ["17545569663335620"] = {
            key = "17545569663335620",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2790.5228643905116, y = -215.93994241053036},
            propsData = {
              NewDescription = "QuestName_1003plus31",
              NewDetail = "QuestDesc_1003plus31",
              SubTaskTargetIndex = 0
            }
          },
          ["17561268163321895815"] = {
            key = "17561268163321895815",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 3294.412026209088, y = -172.50226097431974},
            propsData = {
              AnswerIds = {100403}
            }
          },
          ["17561268163321895816"] = {
            key = "17561268163321895816",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 3682.5059225088653, y = -280.3156877436286},
            propsData = {AnswerId = 100403, AutoOpenDetectiveGameUI = false}
          },
          ["17569849459422877932"] = {
            key = "17569849459422877932",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 682.2620260022125, y = 713.2742875008418},
            propsData = {StaticCreatorId = 1191932}
          },
          ["17569849459422877933"] = {
            key = "17569849459422877933",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 914.8398458688689, y = 611.468877841781},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17569849459422877934"] = {
            key = "17569849459422877934",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 911.5588113861104, y = 811.8792226693672},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17601648566208091"] = {
            key = "17601648566208091",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3627.063736263736, y = -92.45054945054876},
            propsData = {
              NewDescription = "QuestName_1003plus04",
              NewDetail = "QuestDesc_1003plus04",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17445531617683519070"] = {
      isStoryNode = true,
      key = "17445531617683519070",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\230\141\174\231\130\185\228\188\145\230\129\175",
      pos = {x = 935.7284610814025, y = 72.65537730243607},
      propsData = {
        QuestId = 10030199,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus01",
        QuestDeatil = "QuestDesc_1003plus01",
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
            startQuest = "17445531617683519082",
            startPort = "Out",
            endQuest = "17445531617683519078",
            endPort = "In"
          },
          {
            startQuest = "17445531617683519079",
            startPort = "Out",
            endQuest = "17445531617683519081",
            endPort = "In"
          },
          {
            startQuest = "17445531617683519075",
            startPort = "QuestStart",
            endQuest = "17445531617683519080",
            endPort = "In"
          },
          {
            startQuest = "17445531617683519075",
            startPort = "QuestStart",
            endQuest = "17445531617683519079",
            endPort = "In"
          },
          {
            startQuest = "17445531617683519080",
            startPort = "Out",
            endQuest = "17445531617683519082",
            endPort = "In"
          },
          {
            startQuest = "17445531617683519078",
            startPort = "Out",
            endQuest = "17445531617683519083",
            endPort = "In"
          },
          {
            startQuest = "17445531617683519083",
            startPort = "Out",
            endQuest = "17445531617683519076",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17445531617683519075"] = {
            key = "17445531617683519075",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 247.27826700746974, y = 203.87824956829624},
            propsData = {ModeType = 0}
          },
          ["17445531617683519076"] = {
            key = "17445531617683519076",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1538.297183924734, y = 208.5298456737273},
            propsData = {
              ModeType = 1,
              Id = 210101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17445531617683519077"] = {
            key = "17445531617683519077",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1483.922140126283, y = 388.57889966613425},
            propsData = {}
          },
          ["17445531617683519078"] = {
            key = "17445531617683519078",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \229\184\131\233\178\129\230\150\175\232\162\173\229\135\187\228\184\187\232\167\146",
            pos = {x = 1073.8941929896823, y = 197.3614965358865},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC010/SQ_OBT0101_SC010",
              BlendInTime = 1,
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
          },
          ["17445531617683519079"] = {
            key = "17445531617683519079",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 546.855791872665, y = 60.62880055748011},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17445531617683519080"] = {
            key = "17445531617683519080",
            type = "GoToNode",
            name = "\229\156\168\233\133\146\233\166\134\229\144\142\230\148\190\228\184\170\232\167\166\229\143\145\231\155\146\229\184\166\230\140\135\229\188\149\231\130\185",
            pos = {x = 547.6730146501217, y = 204.57916338586205},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190645,
              GuideType = "M",
              GuidePointName = "Mechanism_1190645"
            }
          },
          ["17445531617683519081"] = {
            key = "17445531617683519081",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 798.0326923076904, y = 59.163533834585124},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17445531617683519082"] = {
            key = "17445531617683519082",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\230\154\130\229\129\156\233\159\179\228\185\144",
            pos = {x = 806.0669643778058, y = 208.68601202647628},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17445531617683519083"] = {
            key = "17445531617683519083",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162mute\239\188\140\231\187\167\231\187\173\230\146\173\233\159\179\228\185\144",
            pos = {x = 1303.5454545454547, y = 203.54545454545425},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17445531617683519084"] = {
            key = "17445531617683519084",
            type = "SendMessageNode",
            name = "\229\185\178\230\142\137\230\158\129\229\133\137",
            pos = {x = 820.5002247752224, y = 560.7219753930266},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeAuroraOff",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17459174708174352"] = {
      isStoryNode = true,
      key = "17459174708174352",
      type = "StoryNode",
      name = "\232\176\131\230\159\165",
      pos = {x = 513.0736886092923, y = 818.8754418096522},
      propsData = {
        QuestId = 10030198,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus03",
        QuestDeatil = "QuestDesc_1003plus03",
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
        StoryGuidePointName = "P10030101Player"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17459174708204377",
            startPort = "Out",
            endQuest = "174651662898511895",
            endPort = "Input"
          },
          {
            startQuest = "17459174708184357",
            startPort = "QuestStart",
            endQuest = "17459174708234385",
            endPort = "In"
          },
          {
            startQuest = "17459174708234385",
            startPort = "Out",
            endQuest = "17459174708204376",
            endPort = "In"
          },
          {
            startQuest = "17459174708204376",
            startPort = "Out",
            endQuest = "17459174708204377",
            endPort = "Input"
          },
          {
            startQuest = "174651662898511895",
            startPort = "Out",
            endQuest = "17476246936919592",
            endPort = "In"
          },
          {
            startQuest = "17476246936919592",
            startPort = "Out",
            endQuest = "17459174708184358",
            endPort = "Success"
          },
          {
            startQuest = "17569849524302878189",
            startPort = "BeginOverlap",
            endQuest = "17569849524302878190",
            endPort = "In"
          },
          {
            startQuest = "17569849524302878190",
            startPort = "Out",
            endQuest = "17569849524302878189",
            endPort = "Input"
          },
          {
            startQuest = "17569849524302878189",
            startPort = "EndOverlap",
            endQuest = "17569849524302878191",
            endPort = "In"
          },
          {
            startQuest = "17569849524302878191",
            startPort = "Out",
            endQuest = "17569849524302878189",
            endPort = "Input"
          },
          {
            startQuest = "17459174708184357",
            startPort = "QuestStart",
            endQuest = "17569849524302878189",
            endPort = "Input"
          }
        },
        nodeData = {
          ["17459174708184357"] = {
            key = "17459174708184357",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 536.1224489795918, y = 325.2244897959184},
            propsData = {ModeType = 0}
          },
          ["17459174708184358"] = {
            key = "17459174708184358",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4006.8333333333335, y = 329.3333333333335},
            propsData = {ModeType = 0}
          },
          ["17459174708184359"] = {
            key = "17459174708184359",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4072.6666666666665, y = 915.1666666666667},
            propsData = {}
          },
          ["17459174708204371"] = {
            key = "17459174708204371",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 600.2499999999991, y = 1059.0499999999997},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "cp2cluesphere"
            }
          },
          ["17459174708204376"] = {
            key = "17459174708204376",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2015.4423076923092, y = 358.55769230769215},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301ClueLise_1190459",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10031501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple08-11",
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
          ["17459174708204377"] = {
            key = "17459174708204377",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2621.1, y = 328.28333333333336},
            propsData = {
              AnswerIds = {100401}
            }
          },
          ["17459174708234385"] = {
            key = "17459174708234385",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 1399.916666666667, y = 358.08333333333354},
            propsData = {
              ResultIds = {10020101}
            }
          },
          ["174651662898511895"] = {
            key = "174651662898511895",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2947.9166666666665, y = 326.5098039215688},
            propsData = {AnswerId = 100401, AutoOpenDetectiveGameUI = false}
          },
          ["17476246936919592"] = {
            key = "17476246936919592",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3492.6666666666665, y = 322},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10031801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple08-11",
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
          ["17569849524302878189"] = {
            key = "17569849524302878189",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 795.3869558675376, y = 627.0812978513281},
            propsData = {StaticCreatorId = 1191932}
          },
          ["17569849524302878190"] = {
            key = "17569849524302878190",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1027.964775734194, y = 525.2758881922674},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17569849524302878191"] = {
            key = "17569849524302878191",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1024.6837412514355, y = 725.6862330198536},
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
    ["17473096152385179"] = {
      isStoryNode = true,
      key = "17473096152385179",
      type = "StoryNode",
      name = "\232\176\131\230\159\165",
      pos = {x = 823.863636363636, y = 818.4918414918417},
      propsData = {
        QuestId = 10030197,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus03",
        QuestDeatil = "QuestDesc_1003plus03",
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
        StoryGuidePointName = "P10030101Player"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17473096152395193",
            startPort = "Out",
            endQuest = "17473096152385185",
            endPort = "Success"
          },
          {
            startQuest = "17473096152395199",
            startPort = "Out",
            endQuest = "17473096152395194",
            endPort = "In"
          },
          {
            startQuest = "17473096152385184",
            startPort = "QuestStart",
            endQuest = "17473096152395199",
            endPort = "In"
          },
          {
            startQuest = "17569849790292879154",
            startPort = "BeginOverlap",
            endQuest = "17569849790292879155",
            endPort = "In"
          },
          {
            startQuest = "17569849790292879155",
            startPort = "Out",
            endQuest = "17569849790292879154",
            endPort = "Input"
          },
          {
            startQuest = "17569849790292879154",
            startPort = "EndOverlap",
            endQuest = "17569849790292879156",
            endPort = "In"
          },
          {
            startQuest = "17569849790292879156",
            startPort = "Out",
            endQuest = "17569849790292879154",
            endPort = "Input"
          },
          {
            startQuest = "17473096152385184",
            startPort = "QuestStart",
            endQuest = "17569849790292879154",
            endPort = "Input"
          },
          {
            startQuest = "17473096152385189",
            startPort = "Out",
            endQuest = "17473096152395193",
            endPort = "In"
          },
          {
            startQuest = "17473096152395194",
            startPort = "Out",
            endQuest = "17473096152385189",
            endPort = "In"
          },
          {
            startQuest = "17473096152395194",
            startPort = "Out",
            endQuest = "17574248855942808177",
            endPort = "In"
          }
        },
        nodeData = {
          ["17473096152385184"] = {
            key = "17473096152385184",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 536.1224489795918, y = 325.2244897959184},
            propsData = {ModeType = 0}
          },
          ["17473096152385185"] = {
            key = "17473096152385185",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4006.8333333333335, y = 329.3333333333335},
            propsData = {ModeType = 0}
          },
          ["17473096152385186"] = {
            key = "17473096152385186",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4072.6666666666665, y = 915.1666666666667},
            propsData = {}
          },
          ["17473096152385189"] = {
            key = "17473096152385189",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2566.5471905186205, y = 470.00726377869273},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_100301ClueLise_1190459",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10031901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple08-11",
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
          ["17473096152395190"] = {
            key = "17473096152395190",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 600.2499999999991, y = 1059.0499999999997},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "cp2cluesphere"
            }
          },
          ["17473096152395193"] = {
            key = "17473096152395193",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3453.778571428572, y = 391.7357142857141},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190459}
            }
          },
          ["17473096152395194"] = {
            key = "17473096152395194",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1731, y = 356.67857142857144},
            propsData = {WaitTime = 3}
          },
          ["17473096152395199"] = {
            key = "17473096152395199",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 1291.7857142857144, y = 365.4642857142857},
            propsData = {
              ResultIds = {10030101, 10040101}
            }
          },
          ["17485140162075240167"] = {
            key = "17485140162075240167",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2991.555124223602, y = 300.65890269151134},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17569849790292879154"] = {
            key = "17569849790292879154",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 821.6740665616178, y = 607.2041831714641},
            propsData = {StaticCreatorId = 1191932}
          },
          ["17569849790292879155"] = {
            key = "17569849790292879155",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1054.2518864282742, y = 505.3987735124036},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17569849790292879156"] = {
            key = "17569849790292879156",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1050.9708519455157, y = 705.8091183399897},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17574248855942808177"] = {
            key = "17574248855942808177",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2091.648520277676, y = 191.80599196200217},
            propsData = {
              NewDescription = "QuestName_1003plus02",
              NewDetail = "QuestDesc_1003plus03",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17563754594421912144"] = {
      isStoryNode = true,
      key = "17563754594421912144",
      type = "StoryNode",
      name = "\232\180\171\230\176\145\231\170\159",
      pos = {x = 2735.8675213675215, y = 524.3003663003664},
      propsData = {
        QuestId = 10030116,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus11",
        QuestDeatil = "QuestDesc_1003plus11",
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
            startQuest = "17563754594431912160",
            startPort = "Out",
            endQuest = "17563754594431912157",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912161",
            startPort = "Out",
            endQuest = "17563754594431912162",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912163",
            startPort = "Out",
            endQuest = "17563754594431912164",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912162",
            startPort = "Out",
            endQuest = "17563754594431912163",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912157",
            startPort = "Out",
            endQuest = "17563754594431912161",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912159",
            startPort = "Out",
            endQuest = "17563754594441912167",
            endPort = "In"
          },
          {
            startQuest = "17563754594441912167",
            startPort = "Out",
            endQuest = "17563754594431912155",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912155",
            startPort = "Out",
            endQuest = "17563754594441912168",
            endPort = "In"
          },
          {
            startQuest = "17563754594441912168",
            startPort = "Out",
            endQuest = "17563754594431912160",
            endPort = "In"
          },
          {
            startQuest = "17563754594431912164",
            startPort = "Out",
            endQuest = "17563754594441912169",
            endPort = "In"
          },
          {
            startQuest = "17563754594441912169",
            startPort = "Out",
            endQuest = "17563754594421912150",
            endPort = "Success"
          },
          {
            startQuest = "17563754594421912149",
            startPort = "QuestStart",
            endQuest = "17563755847071915937",
            endPort = "In"
          },
          {
            startQuest = "17563755847071915937",
            startPort = "Out",
            endQuest = "17563754594441912166",
            endPort = "In"
          },
          {
            startQuest = "17563754594441912166",
            startPort = "Out",
            endQuest = "17563754594431912159",
            endPort = "In"
          }
        },
        nodeData = {
          ["17563754594421912149"] = {
            key = "17563754594421912149",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17563754594421912150"] = {
            key = "17563754594421912150",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3472.5, y = 197.5},
            propsData = {ModeType = 0}
          },
          ["17563754594421912151"] = {
            key = "17563754594421912151",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3437.0588235294117, y = 537.6470588235294},
            propsData = {}
          },
          ["17563754594431912155"] = {
            key = "17563754594431912155",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2312.565610859729, y = 270.349170437406},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1190828",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10032801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple18",
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
          ["17563754594431912157"] = {
            key = "17563754594431912157",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 3002.75, y = 194.00000000000006},
            propsData = {
              IsHide = false,
              AtmosphereTagList = {
                "cp2ilchide01"
              }
            }
          },
          ["17563754594431912159"] = {
            key = "17563754594431912159",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1954.75, y = 294},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190828}
            }
          },
          ["17563754594431912160"] = {
            key = "17563754594431912160",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2668.394938394938, y = 489.8571428571429},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190828}
            }
          },
          ["17563754594431912161"] = {
            key = "17563754594431912161",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 2536.2272727272725, y = -45.64772727272725},
            propsData = {
              IsHide = false,
              AtmosphereTagList = {
                "cp2iclsphide"
              }
            }
          },
          ["17563754594431912162"] = {
            key = "17563754594431912162",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2529.294117647059, y = -256.2934491978609},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191085,
                1191086,
                1191087,
                1191088,
                1191089,
                1191090,
                1191091,
                1191092,
                1191093,
                1191094
              }
            }
          },
          ["17563754594431912163"] = {
            key = "17563754594431912163",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 2505, y = -486.35227272727275},
            propsData = {
              IsHide = false,
              AtmosphereTagList = {
                "cp2ilchide01"
              }
            }
          },
          ["17563754594431912164"] = {
            key = "17563754594431912164",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 2939, y = -48.35227272727275},
            propsData = {
              IsHide = true,
              AtmosphereTagList = {
                "cp2ilchide02"
              }
            }
          },
          ["17563754594441912166"] = {
            key = "17563754594441912166",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1654.9723193473192, y = 134.37820512820537},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17563754594441912167"] = {
            key = "17563754594441912167",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2160.7223193473196, y = 126.29487179487202},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17563754594441912168"] = {
            key = "17563754594441912168",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2477.472319347319, y = 133.12820512820528},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17563754594441912169"] = {
            key = "17563754594441912169",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3172.6896551724135, y = -62.965517241379295},
            propsData = {WaitTime = 2}
          },
          ["17563755847071915937"] = {
            key = "17563755847071915937",
            type = "GoToRegionNode",
            name = "\232\191\155\229\134\176\230\185\150\229\159\142",
            pos = {x = 1149.4999999999998, y = 324.75000000000006},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "N",
              GuideName = "Npc_1190828"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
