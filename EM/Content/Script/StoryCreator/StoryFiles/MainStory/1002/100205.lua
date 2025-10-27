return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1717643030832314553",
      startPort = "StoryStart",
      endStory = "1717643034084314766",
      endPort = "In"
    },
    {
      startStory = "1717643155708700332",
      startPort = "Success",
      endStory = "1717643155708700333",
      endPort = "In"
    },
    {
      startStory = "1717643155708700335",
      startPort = "Success",
      endStory = "1717643155708700332",
      endPort = "In"
    },
    {
      startStory = "1717643034084314767",
      startPort = "Success",
      endStory = "1717643155708700335",
      endPort = "In"
    },
    {
      startStory = "1717643034084314766",
      startPort = "Success",
      endStory = "1717643034084314767",
      endPort = "In"
    },
    {
      startStory = "1719561237665985621",
      startPort = "Success",
      endStory = "1717643030832314556",
      endPort = "StoryEnd"
    },
    {
      startStory = "1717643155708700334",
      startPort = "Success",
      endStory = "1719561237665985621",
      endPort = "In"
    },
    {
      startStory = "1717643155708700333",
      startPort = "Success",
      endStory = "1717643155708700334",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1717643030832314553"] = {
      isStoryNode = true,
      key = "1717643030832314553",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 799.1176470588235, y = 300.88235294117646},
      propsData = {QuestChainId = 100205},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1717643030832314556"] = {
      isStoryNode = true,
      key = "1717643030832314556",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2725.821678321678, y = 326.63564376799667},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1717643034084314766"] = {
      isStoryNode = true,
      key = "1717643034084314766",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\1441\230\172\161\232\176\131\229\129\156\229\133\179\229\141\161",
      pos = {x = 1023.8722205406388, y = 300.39238042267385},
      propsData = {
        QuestId = 10020501,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020501",
        QuestDeatil = "QuestDesc_10020501",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = false,
        GameModeTargetId = 10020301,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 42
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1717643034084314767"] = {
      isStoryNode = true,
      key = "1717643034084314767",
      type = "StoryNode",
      name = "\229\134\155\229\155\162\228\188\154\232\174\174\229\174\164",
      pos = {x = 1246.7640572138105, y = 308.83268995516306},
      propsData = {
        QuestId = 10020502,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020502",
        QuestDeatil = "QuestDesc_10020502",
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
            startQuest = "1717643034085314783",
            startPort = "Out",
            endQuest = "1717643034085314782",
            endPort = "In"
          },
          {
            startQuest = "1717643034085314784",
            startPort = "Out",
            endQuest = "1717643034085314786",
            endPort = "In"
          },
          {
            startQuest = "1717643034085314786",
            startPort = "Out",
            endQuest = "1717643034085314783",
            endPort = "In"
          },
          {
            startQuest = "1717643034085314782",
            startPort = "Out",
            endQuest = "1725345008599580769",
            endPort = "In"
          },
          {
            startQuest = "1717643034085314779",
            startPort = "QuestStart",
            endQuest = "174404093219522340491",
            endPort = "In"
          },
          {
            startQuest = "174404093219522340491",
            startPort = "LastDefaultOut",
            endQuest = "1717643034085314784",
            endPort = "In"
          },
          {
            startQuest = "174404093219522340491",
            startPort = "Region_1",
            endQuest = "1717643034085314786",
            endPort = "In"
          },
          {
            startQuest = "1725345008599580769",
            startPort = "Out",
            endQuest = "17580283578372198",
            endPort = "In"
          },
          {
            startQuest = "17580283578372198",
            startPort = "Out",
            endQuest = "1717643034085314780",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1717643034085314779"] = {
            key = "1717643034085314779",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -961.5924089068826, y = -294.1084284136914},
            propsData = {
              ModeType = 1,
              Id = 101103,
              StartIndex = 8,
              IsWhite = false
            }
          },
          ["1717643034085314780"] = {
            key = "1717643034085314780",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 355.8097839499745, y = -294.82217141260134},
            propsData = {ModeType = 0}
          },
          ["1717643034085314781"] = {
            key = "1717643034085314781",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 358.7140103646687, y = -147.86872959484168},
            propsData = {}
          },
          ["1717643034085314782"] = {
            key = "1717643034085314782",
            type = "TalkNode",
            name = "\229\134\155\229\155\162\228\188\154\232\174\174\229\174\164\231\187\147\230\157\159\233\187\145\229\177\143\229\175\185\232\175\157",
            pos = {x = -281.3631716379847, y = -33.313156416988335},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10108101,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["1717643034085314783"] = {
            key = "1717643034085314783",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = -277.4602453602689, y = -166.31272137887413},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10108001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101080",
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
                  TalkActorId = 100006,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100006},
                {TalkActorType = "Npc", TalkActorId = 100005},
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
          ["1717643034085314784"] = {
            key = "1717643034085314784",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\229\136\176\229\134\176\230\185\150",
            pos = {x = -583.8840585913805, y = -159.01802399637756},
            propsData = {
              ModeType = 1,
              Id = 101104,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1717643034085314786"] = {
            key = "1717643034085314786",
            type = "TalkNode",
            name = "\229\134\155\229\155\162\228\188\154\232\174\174\229\174\164\229\188\128\229\156\186\231\154\132\233\187\145\229\177\143\229\175\185\232\175\157",
            pos = {x = -273.7911013931732, y = -302.0278522773642},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10115501,
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
          ["1725345008599580769"] = {
            key = "1725345008599580769",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 6.927764053299274, y = -29.94215746862162},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["174404093219522340491"] = {
            key = "174404093219522340491",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = -574.4777417376674, y = -303.0672923186652},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {101104}
            }
          },
          ["17580283578372198"] = {
            key = "17580283578372198",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\229\136\176\229\134\176\230\185\150",
            pos = {x = -2.9706007242614376, y = -288.8},
            propsData = {
              ModeType = 1,
              Id = 101103,
              StartIndex = 8,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1717643155708700332"] = {
      isStoryNode = true,
      key = "1717643155708700332",
      type = "StoryNode",
      name = "\229\134\176\230\185\150\229\159\142\231\139\169\231\140\1421",
      pos = {x = 1714.242031136949, y = 318.9301607391722},
      propsData = {
        QuestId = 10020504,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020504",
        QuestDeatil = "QuestDesc_10020504",
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
        ResurgencePoint = "P10020505Rebron",
        bUseQuestCoordinate = true,
        bDeadTriggerQuestFail = true,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1180294",
        FailBlackScreenText = "",
        FadeInTime = 1,
        FadeOutTime = 1,
        ContinueTime = 1
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1717643155710700353",
            startPort = "Out",
            endQuest = "1717643155710700352",
            endPort = "In"
          },
          {
            startQuest = "1717643155711700359",
            startPort = "Out",
            endQuest = "1717643155710700353",
            endPort = "In"
          },
          {
            startQuest = "1717643155711700359",
            startPort = "Out",
            endQuest = "1717643155710700358",
            endPort = "In"
          },
          {
            startQuest = "1717643155710700354",
            startPort = "QuestStart",
            endQuest = "1717643155711700359",
            endPort = "In"
          },
          {
            startQuest = "1717643155710700352",
            startPort = "Out",
            endQuest = "1723797060267349796",
            endPort = "In"
          },
          {
            startQuest = "1717643155711700359",
            startPort = "Out",
            endQuest = "1717643155711700361",
            endPort = "In"
          },
          {
            startQuest = "1723797060267349796",
            startPort = "Out",
            endQuest = "1723797107283350977",
            endPort = "In"
          },
          {
            startQuest = "1723797060267349796",
            startPort = "Out",
            endQuest = "17238045913245014",
            endPort = "In"
          },
          {
            startQuest = "1723797107283350977",
            startPort = "Out",
            endQuest = "17238056064217632",
            endPort = "In"
          },
          {
            startQuest = "1717643155710700352",
            startPort = "Out",
            endQuest = "1724123366488706573",
            endPort = "In"
          },
          {
            startQuest = "17244094744141259537",
            startPort = "Out",
            endQuest = "1719560298979297148",
            endPort = "In"
          },
          {
            startQuest = "1717643155711700359",
            startPort = "Out",
            endQuest = "17244094744141259537",
            endPort = "In"
          },
          {
            startQuest = "17238056064217632",
            startPort = "Out",
            endQuest = "1724123478168882227",
            endPort = "In"
          },
          {
            startQuest = "1717643155710700358",
            startPort = "Out",
            endQuest = "17289734595508044",
            endPort = "In"
          },
          {
            startQuest = "1717643155711700359",
            startPort = "Out",
            endQuest = "17289734866038503",
            endPort = "In"
          },
          {
            startQuest = "1724123478168882227",
            startPort = "Out",
            endQuest = "17289735308849462",
            endPort = "In"
          },
          {
            startQuest = "17289735308849462",
            startPort = "Out",
            endQuest = "17238056703018384",
            endPort = "In"
          },
          {
            startQuest = "17238056703018384",
            startPort = "Out",
            endQuest = "1728974552784193949",
            endPort = "In"
          },
          {
            startQuest = "1728974552784193949",
            startPort = "Out",
            endQuest = "1717643155710700355",
            endPort = "Success"
          },
          {
            startQuest = "17289734595508044",
            startPort = "Out",
            endQuest = "1730187263776389235",
            endPort = "In"
          },
          {
            startQuest = "17471197605173718251",
            startPort = "Out",
            endQuest = "17471197605173718252",
            endPort = "In"
          },
          {
            startQuest = "17471197605173718252",
            startPort = "Out",
            endQuest = "17471197605173718253",
            endPort = "In"
          },
          {
            startQuest = "174687518512311686697",
            startPort = "Out",
            endQuest = "17471197605173718251",
            endPort = "In"
          },
          {
            startQuest = "17471198547903719231",
            startPort = "Out",
            endQuest = "17471198547903719232",
            endPort = "In"
          },
          {
            startQuest = "174687518512311686697",
            startPort = "Out",
            endQuest = "17471198547903719231",
            endPort = "In"
          },
          {
            startQuest = "174687518512311686697",
            startPort = "Out",
            endQuest = "17542951242593946039",
            endPort = "In"
          },
          {
            startQuest = "1730187263776389235",
            startPort = "Out",
            endQuest = "1717643155710700356",
            endPort = "Fail"
          },
          {
            startQuest = "1717643155710700354",
            startPort = "QuestStart",
            endQuest = "1723971677400377479",
            endPort = "In"
          },
          {
            startQuest = "1717643155711700359",
            startPort = "Out",
            endQuest = "1723729359560181126",
            endPort = "In"
          },
          {
            startQuest = "1723729359560181126",
            startPort = "Out",
            endQuest = "1756813408536644839",
            endPort = "In"
          },
          {
            startQuest = "17568135808351605623",
            startPort = "Out",
            endQuest = "17568136490721606116",
            endPort = "In"
          },
          {
            startQuest = "1756813408536644839",
            startPort = "Out",
            endQuest = "17568135808351605623",
            endPort = "In"
          }
        },
        nodeData = {
          ["1717643155710700352"] = {
            key = "1717643155710700352",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\1285\229\143\170\230\128\170\231\137\169",
            pos = {x = -463.21877416028315, y = 14.863143969922522},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180064,
                1180065,
                1180066,
                1180067,
                1180068
              }
            }
          },
          ["1717643155710700353"] = {
            key = "1717643155710700353",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = -700.0659638261593, y = 10.899219911312901},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180064,
                1180065,
                1180066,
                1180067,
                1180068
              }
            }
          },
          ["1717643155710700354"] = {
            key = "1717643155710700354",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1414.6848613993013, y = -10.45351008454293},
            propsData = {ModeType = 0}
          },
          ["1717643155710700355"] = {
            key = "1717643155710700355",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1707.7339674717869, y = 10.045202703503907},
            propsData = {ModeType = 0}
          },
          ["1717643155710700356"] = {
            key = "1717643155710700356",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 126.44454021464283, y = 303.26459101682576},
            propsData = {}
          },
          ["1717643155710700358"] = {
            key = "1717643155710700358",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\229\133\172\232\183\175",
            pos = {x = -708.6780815516674, y = 283.24366316657307},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1717643155711700359"] = {
            key = "1717643155711700359",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\136\183\230\128\170\229\140\186\229\159\159",
            pos = {x = -1137.842292078535, y = 6.833346889074482},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180294,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1180294"
            }
          },
          ["1717643155711700361"] = {
            key = "1717643155711700361",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \229\165\165\229\147\165",
            pos = {x = -434.96299430876945, y = -122.53115035580544},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180313}
            }
          },
          ["1719560298979297148"] = {
            key = "1719560298979297148",
            type = "TalkNode",
            name = "\229\156\176\228\184\138\232\191\153\228\186\155\230\152\175",
            pos = {x = -434.0623584115066, y = -419.0190959742898},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10116901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1723729359560181126"] = {
            key = "1723729359560181126",
            type = "SendMessageNode",
            name = "\229\143\145\230\182\136\230\129\175\230\140\130\230\140\135\229\188\149\231\130\185",
            pos = {x = -688.09852058248, y = -217.4097111222094},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunt1CreateTrap",
              UnitId = -1
            }
          },
          ["1723797060267349796"] = {
            key = "1723797060267349796",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\186\140\230\137\185\230\128\170\231\137\169",
            pos = {x = -106.81821115751617, y = 16.787191317454493},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180353,
                1180354,
                1180355,
                1180356
              }
            }
          },
          ["1723797107283350977"] = {
            key = "1723797107283350977",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\1284\229\143\170\230\128\170\231\137\169",
            pos = {x = 173.87811094814884, y = 20.87810040836365},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180353,
                1180354,
                1180355,
                1180356
              }
            }
          },
          ["17238045913245014"] = {
            key = "17238045913245014",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\157\144\229\156\168\229\164\169\228\184\138\231\154\132\229\165\165\229\147\165",
            pos = {x = -94.94075012552207, y = 138.24285714285728},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180470}
            }
          },
          ["17238056064217632"] = {
            key = "17238056064217632",
            type = "GoToNode",
            name = "\229\142\187\229\165\165\229\147\165\232\186\171\232\190\185",
            pos = {x = 438.54608294930836, y = 21.10000000000022},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240300,
              GuideType = "P",
              GuidePointName = "QuestPonit_10020504Nvzhu2"
            }
          },
          ["17238056703018384"] = {
            key = "17238056703018384",
            type = "TalkNode",
            name = "\229\165\165\229\147\165\232\163\133\233\128\188",
            pos = {x = 1235.2619477296892, y = 9.29051915826127},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20003401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200033",
              BlendInTime = 0.5,
              BlendOutTime = 1.5,
              InType = "FadeIn",
              OutType = "BlendOut",
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
              EndNewTargetPointName = "QuestPonit_10020504Nvzhu",
              CameraLookAtTartgetPoint = "QuestPonit_10020504Nvzhu2",
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
                  TalkActorId = 200033,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 2000331,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 2000332,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200033},
                {TalkActorType = "Npc", TalkActorId = 2000331},
                {TalkActorType = "Npc", TalkActorId = 2000332}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17238804123332429"] = {
            key = "17238804123332429",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1268.0168686386069, y = -135.5531258596475},
            propsData = {WaitTime = 1.5}
          },
          ["1723971677400377479"] = {
            key = "1723971677400377479",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\233\187\132\230\152\143",
            pos = {x = -1118.0013844136436, y = -293.2728688931203},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityTwilight",
              UnitId = -1
            }
          },
          ["1723971692744378088"] = {
            key = "1723971692744378088",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = -1474.6096956198787, y = -310.0560856763371},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "Point_QuestTrigger_1180294"
            }
          },
          ["1724123366488706573"] = {
            key = "1724123366488706573",
            type = "SendMessageNode",
            name = "\229\143\145\230\182\136\230\129\175\229\142\187\230\142\137\230\140\135\229\188\149\231\130\185",
            pos = {x = -97.44380979208208, y = -139.09565217391327},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunt1Finish",
              UnitId = -1
            }
          },
          ["1724123478168882227"] = {
            key = "1724123478168882227",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\163\133\233\165\176\231\148\168\233\152\178\229\190\161\230\156\186\229\133\179",
            pos = {x = 694.4198757763971, y = 26.991304347825775},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180475}
            }
          },
          ["17244094744141259537"] = {
            key = "17244094744141259537",
            type = "ShowGuideMainNode",
            name = "\231\129\171\231\132\176\230\156\186\229\133\179\230\149\153\229\173\166",
            pos = {x = -684.3184473042206, y = -421.81376636991155},
            propsData = {GuideId = 40}
          },
          ["17289734595508044"] = {
            key = "17289734595508044",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\232\174\173\231\187\131bgm",
            pos = {x = -466.92587412587505, y = 300.07272727272704},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17289734866038503"] = {
            key = "17289734866038503",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\232\174\173\231\187\131bgm",
            pos = {x = -695.4090909090921, y = 122.63636363636331},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/level/stage1/combat01_state1_r01",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17289735308849462"] = {
            key = "17289735308849462",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 954.5909090909074, y = 23.09090909090864},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1728974552784193949"] = {
            key = "1728974552784193949",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 1465.1818181818169, y = 15.07272727272672},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1730187263776389235"] = {
            key = "1730187263776389235",
            type = "SendMessageNode",
            name = "\229\143\145\230\182\136\230\129\175\229\142\187\230\142\137\230\140\135\229\188\149\231\130\185",
            pos = {x = -221.24984393810647, y = 298.01722650198644},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunt1Finish",
              UnitId = -1
            }
          },
          ["174687518512311686697"] = {
            key = "174687518512311686697",
            type = "MonitorPlayerStatusNode",
            name = "\231\173\137\231\142\169\229\174\182\230\173\187\228\186\161",
            pos = {x = -823.3844412166786, y = 641.0000000000002},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["17471197605173718251"] = {
            key = "17471197605173718251",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -329.0204795204795, y = 559.5835272779748},
            propsData = {WaitTime = 0.2}
          },
          ["17471197605173718252"] = {
            key = "17471197605173718252",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = 19.948718365958257, y = 565.0091934448646},
            propsData = {}
          },
          ["17471197605173718253"] = {
            key = "17471197605173718253",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 335.45684315684326, y = 551.0345429289903},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P10020505Rebron",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17471198547903719231"] = {
            key = "17471198547903719231",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\232\174\173\231\187\131bgm",
            pos = {x = -258.8288618948108, y = 785.0671782889972},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17471198547903719232"] = {
            key = "17471198547903719232",
            type = "SendMessageNode",
            name = "\229\143\145\230\182\136\230\129\175\229\142\187\230\142\137\230\140\135\229\188\149\231\130\185",
            pos = {x = 42.46255290834243, y = 772.4886005951798},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunt1Finish",
              UnitId = -1
            }
          },
          ["17542951242593946039"] = {
            key = "17542951242593946039",
            type = "FailBlackScreenNode",
            name = "\229\164\177\232\180\165\233\187\145\229\177\143\232\138\130\231\130\185",
            pos = {x = -267.18102969346694, y = 426.6395881872698},
            propsData = {
              Text = "FailBlackScreenHode_1",
              FadeInTime = 0,
              FadeOutTime = 0.5,
              ContinueTime = 2
            }
          },
          ["1756813408536644839"] = {
            key = "1756813408536644839",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -425.4763563356559, y = -259.03493215403773},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180320,
                1180321,
                1180322,
                1180323,
                1180324
              }
            }
          },
          ["17568135808351605623"] = {
            key = "17568135808351605623",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = -94.10368570385194, y = -292.6529604861672},
            propsData = {
              StaticCreatorIdList = {
                1180320,
                1180321,
                1180322,
                1180323,
                1180324
              },
              ManualItemIdList = {},
              StateId = 3901603,
              QuestId = 0
            }
          },
          ["17568136490721606116"] = {
            key = "17568136490721606116",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 404.2834110703417, y = -278.1368314539094},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunt1ActiveTrap",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1717643155708700333"] = {
      isStoryNode = true,
      key = "1717643155708700333",
      type = "StoryNode",
      name = "\229\184\174\229\138\169\229\165\165\229\147\165\232\167\163\229\155\180",
      pos = {x = 1943.724914494252, y = 311.4036375780286},
      propsData = {
        QuestId = 10020505,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020505",
        QuestDeatil = "QuestDesc_10020505",
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
        ResurgencePoint = "P10020505Rebron",
        bUseQuestCoordinate = true,
        bDeadTriggerQuestFail = true,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1180314",
        FailBlackScreenText = "",
        FadeInTime = 1,
        FadeOutTime = 1,
        ContinueTime = 1
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1717643155717700396",
            startPort = "Out",
            endQuest = "1717643155717700400",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700402",
            startPort = "Out",
            endQuest = "1717643155717700396",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700403",
            startPort = "Out",
            endQuest = "1717643155717700399",
            endPort = "Fail"
          },
          {
            startQuest = "1717643155717700402",
            startPort = "Out",
            endQuest = "1717643155717700403",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700397",
            startPort = "QuestStart",
            endQuest = "1717643155717700402",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700402",
            startPort = "Out",
            endQuest = "1719560403625433634",
            endPort = "In"
          },
          {
            startQuest = "174282395557227023048",
            startPort = "Out",
            endQuest = "174282395557227023049",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700400",
            startPort = "Out",
            endQuest = "174282395557227023047",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700400",
            startPort = "Out",
            endQuest = "174282395557227023048",
            endPort = "In"
          },
          {
            startQuest = "174282395557327023053",
            startPort = "Out",
            endQuest = "1717643155717700398",
            endPort = "Success"
          },
          {
            startQuest = "17471199079724575552",
            startPort = "Out",
            endQuest = "17471199079724575553",
            endPort = "In"
          },
          {
            startQuest = "17471199079724575553",
            startPort = "Out",
            endQuest = "17471199079724575554",
            endPort = "In"
          },
          {
            startQuest = "17468747567089981116",
            startPort = "Out",
            endQuest = "17471199079724575552",
            endPort = "In"
          },
          {
            startQuest = "174282395557227023049",
            startPort = "Out",
            endQuest = "174282395557327023053",
            endPort = "In"
          },
          {
            startQuest = "17468747567089981116",
            startPort = "Out",
            endQuest = "17542951510274930230",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700397",
            startPort = "QuestStart",
            endQuest = "1723971731560553056",
            endPort = "In"
          },
          {
            startQuest = "1717643155717700402",
            startPort = "Out",
            endQuest = "17582680876436601",
            endPort = "In"
          },
          {
            startQuest = "174282395557227023048",
            startPort = "Out",
            endQuest = "1758551533227934703",
            endPort = "In"
          }
        },
        nodeData = {
          ["1717643155717700396"] = {
            key = "1717643155717700396",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\1443\229\143\170\230\128\170\231\137\169",
            pos = {x = -632.1429496929601, y = 207.42255339941372},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180069,
                1180070,
                1180071
              }
            }
          },
          ["1717643155717700397"] = {
            key = "1717643155717700397",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1136.183635469426, y = 202.4278410817324},
            propsData = {ModeType = 0}
          },
          ["1717643155717700398"] = {
            key = "1717643155717700398",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 916.0305235735905, y = 240.05981338869987},
            propsData = {ModeType = 0}
          },
          ["1717643155717700399"] = {
            key = "1717643155717700399",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -179.410811823888, y = 393.06286663960344},
            propsData = {}
          },
          ["1717643155717700400"] = {
            key = "1717643155717700400",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = -393.38468541546024, y = 201.35132724877076},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180069,
                1180070,
                1180071
              }
            }
          },
          ["1717643155717700402"] = {
            key = "1717643155717700402",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\136\183\230\128\170\229\140\186\229\159\159",
            pos = {x = -892.0106179071806, y = 205.45227029665227},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180314,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1180314"
            }
          },
          ["1717643155717700403"] = {
            key = "1717643155717700403",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\229\133\172\232\183\175",
            pos = {x = -614.553696038007, y = 380.65489197381004},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1719560403625433634"] = {
            key = "1719560403625433634",
            type = "TalkNode",
            name = "\229\156\176\228\184\138\232\191\153\228\186\155\230\152\175",
            pos = {x = -632.3284280872075, y = 2.626739524727597},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10117001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1723971718872552586"] = {
            key = "1723971718872552586",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = -165.81700498914654, y = -301.8833888079882},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "Point_QuestTrigger_1180294"
            }
          },
          ["1723971731560553056"] = {
            key = "1723971731560553056",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\233\187\132\230\152\143",
            pos = {x = -606.82038967183, y = -188.16797378822503},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityTwilight",
              UnitId = -1
            }
          },
          ["174282395557227023047"] = {
            key = "174282395557227023047",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\228\184\141\231\148\168\231\154\132\229\165\165\229\147\165",
            pos = {x = -80.01078658557472, y = -30.25175838561387},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180470}
            }
          },
          ["174282395557227023048"] = {
            key = "174282395557227023048",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\165\165\229\147\165",
            pos = {x = -101.45979651284527, y = 240.83433547221915},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180474}
            }
          },
          ["174282395557227023049"] = {
            key = "174282395557227023049",
            type = "TalkNode",
            name = "\228\188\145\230\129\175\228\184\128\228\188\154",
            pos = {x = 269.505332361597, y = 241.56570848253466},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101083Aote_1180474",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10108301,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_101083",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200033,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 2000331,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 2000332,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200033},
                {TalkActorType = "Npc", TalkActorId = 2000331},
                {TalkActorType = "Npc", TalkActorId = 2000332}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174282395557227023050"] = {
            key = "174282395557227023050",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\163\133\233\165\176\231\167\189\229\133\189",
            pos = {x = 491.60644380883, y = -24.65365509009871},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180479,
                1180480,
                1180481
              }
            }
          },
          ["174282395557327023053"] = {
            key = "174282395557327023053",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169Bgm",
            pos = {x = 608.3146499927011, y = 244.66627693939097},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17468747567089981116"] = {
            key = "17468747567089981116",
            type = "MonitorPlayerStatusNode",
            name = "\231\173\137\231\142\169\229\174\182\230\173\187\228\186\161",
            pos = {x = -698.2753759398497, y = 619.642857142857},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["17471199079724575552"] = {
            key = "17471199079724575552",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -422.1780969030971, y = 805.5881285381288},
            propsData = {WaitTime = 0.2}
          },
          ["17471199079724575553"] = {
            key = "17471199079724575553",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = -145.5517561595165, y = 790.7852232764473},
            propsData = {}
          },
          ["17471199079724575554"] = {
            key = "17471199079724575554",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 124.55202080528157, y = 770.1677156177155},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P10020505Rebron",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17474862216635767"] = {
            key = "17474862216635767",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\163\133\233\165\176\231\167\189\229\133\189",
            pos = {x = 761.9607263715192, y = -55.626046357024705},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180479,
                1180480,
                1180481
              }
            }
          },
          ["17542951510274930230"] = {
            key = "17542951510274930230",
            type = "FailBlackScreenNode",
            name = "\229\164\177\232\180\165\233\187\145\229\177\143\232\138\130\231\130\185",
            pos = {x = -382.86304763273444, y = 550.8761544011543},
            propsData = {
              Text = "FailBlackScreenHode_1",
              FadeInTime = 0,
              FadeOutTime = 0.5,
              ContinueTime = 2
            }
          },
          ["17582680876436601"] = {
            key = "17582680876436601",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\232\174\173\231\187\131bgm",
            pos = {x = -332.3884413865401, y = 4.676751020773864},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/level/stage1/combat01_state1_r01",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1758551533227934703"] = {
            key = "1758551533227934703",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 179.66228070175453, y = 96.39181286549689},
            propsData = {
              NewDescription = "QuestName_10020503",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["1717643155708700334"] = {
      isStoryNode = true,
      key = "1717643155708700334",
      type = "StoryNode",
      name = "\233\152\178\229\190\161",
      pos = {x = 2171.5801434400937, y = 312.64742013526876},
      propsData = {
        QuestId = 10020506,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020506_1",
        QuestDeatil = "QuestDesc_10020506",
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
            startQuest = "1717643155721700432",
            startPort = "Out",
            endQuest = "1717643155721700429",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700432",
            startPort = "Out",
            endQuest = "1717643155721700431",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700432",
            startPort = "Out",
            endQuest = "1717643155721700433",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700433",
            startPort = "Out",
            endQuest = "1717643155721700430",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700434",
            startPort = "Out",
            endQuest = "1717643155721700432",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700431",
            startPort = "Out",
            endQuest = "1717643155722700437",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700432",
            startPort = "Out",
            endQuest = "1717643155722700438",
            endPort = "In"
          },
          {
            startQuest = "1717643155722700438",
            startPort = "Out",
            endQuest = "1717643155722700436",
            endPort = "In"
          },
          {
            startQuest = "1717643155721700428",
            startPort = "Out",
            endQuest = "1717643155721700434",
            endPort = "In"
          },
          {
            startQuest = "1717643155722700440",
            startPort = "Out",
            endQuest = "1717643155721700427",
            endPort = "Fail"
          },
          {
            startQuest = "1717643155722700439",
            startPort = "Fail",
            endQuest = "1722346500853995113",
            endPort = "In"
          },
          {
            startQuest = "1723971769883727983",
            startPort = "Out",
            endQuest = "1723971769883727982",
            endPort = "In"
          },
          {
            startQuest = "1717643155720700425",
            startPort = "QuestStart",
            endQuest = "1723971769883727983",
            endPort = "In"
          },
          {
            startQuest = "1717643155720700425",
            startPort = "QuestStart",
            endQuest = "1722344762547992180",
            endPort = "In"
          },
          {
            startQuest = "1722344762547992180",
            startPort = "Out",
            endQuest = "1717643155722700439",
            endPort = "In"
          },
          {
            startQuest = "1722344762547992180",
            startPort = "Out",
            endQuest = "1724403580947365392",
            endPort = "In"
          },
          {
            startQuest = "1724403580947365392",
            startPort = "Out",
            endQuest = "17238983920254193931",
            endPort = "In"
          },
          {
            startQuest = "1722346500853995113",
            startPort = "Out",
            endQuest = "1728974958331565300",
            endPort = "In"
          },
          {
            startQuest = "1717643155722700439",
            startPort = "PassiveFail",
            endQuest = "1722346500853995113",
            endPort = "In"
          },
          {
            startQuest = "1717643155722700439",
            startPort = "Success",
            endQuest = "1717643155721700426",
            endPort = "Success"
          },
          {
            startQuest = "1728974958331565300",
            startPort = "Out",
            endQuest = "1717643155722700440",
            endPort = "In"
          }
        },
        nodeData = {
          ["1717643155720700425"] = {
            key = "1717643155720700425",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2154.185384994978, y = 325.0115666271919},
            propsData = {ModeType = 0}
          },
          ["1717643155721700426"] = {
            key = "1717643155721700426",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -827.417837184337, y = 247.7988266177709},
            propsData = {ModeType = 0}
          },
          ["1717643155721700427"] = {
            key = "1717643155721700427",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -389.4414984156381, y = 417.7954606767969},
            propsData = {}
          },
          ["1717643155721700428"] = {
            key = "1717643155721700428",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = -1949.3418299254818, y = -903.4050507339246},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1717643155721700429"] = {
            key = "1717643155721700429",
            type = "BossBattleFinishNode",
            name = "\229\164\177\232\180\165\229\155\158\232\176\131",
            pos = {x = -1091.7838409624069, y = -842.3209614397032},
            propsData = {SendMessage = "", FinishCondition = "Hunt3Fail"}
          },
          ["1717643155721700430"] = {
            key = "1717643155721700430",
            type = "TalkNode",
            name = "\233\152\178\229\190\161\229\188\128\229\167\139",
            pos = {x = -786.5216934302706, y = -1159.3360461578059},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10113501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1717643155721700431"] = {
            key = "1717643155721700431",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\229\133\172\232\183\175",
            pos = {x = -1090.3133059332258, y = -687.5623265802823},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Defence"
            }
          },
          ["1717643155721700432"] = {
            key = "1717643155721700432",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -1473.1135732621879, y = -898.3285091296165},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_IcelakeHunting3",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1717643155721700433"] = {
            key = "1717643155721700433",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\1335s",
            pos = {x = -1093.2504479950062, y = -1159.5490511179732},
            propsData = {WaitTime = 8}
          },
          ["1717643155721700434"] = {
            key = "1717643155721700434",
            type = "TalkNode",
            name = "\228\188\145\230\129\175\228\184\128\228\188\154",
            pos = {x = -1714.7325277501825, y = -902.588591327423},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10108301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101083",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["1717643155722700436"] = {
            key = "1717643155722700436",
            type = "TalkNode",
            name = "\228\187\187\229\138\161\230\136\144\229\138\159\230\143\144\231\164\186",
            pos = {x = -786.8751429780393, y = -1007.62135490255},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10113801,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
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
          ["1717643155722700437"] = {
            key = "1717643155722700437",
            type = "SendMessageNode",
            name = "\228\184\173\230\173\162",
            pos = {x = -789.5156525445105, y = -663.0573914590582},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunting_Stop",
              UnitId = -1
            }
          },
          ["1717643155722700438"] = {
            key = "1717643155722700438",
            type = "BossBattleFinishNode",
            name = "\230\136\144\229\138\159\229\155\158\232\176\131",
            pos = {x = -1091.121218171458, y = -1011.6286928418498},
            propsData = {
              SendMessage = "Chapter01_Trafficway_Hunting_Init",
              FinishCondition = "Hunt3Success"
            }
          },
          ["1717643155722700439"] = {
            key = "1717643155722700439",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -1412.4786196875182, y = 328.85744909523214},
            propsData = {SpecialConfigId = 101, BlackScreenImmediately = false}
          },
          ["1717643155722700440"] = {
            key = "1717643155722700440",
            type = "SendMessageNode",
            name = "\229\164\177\232\180\165\229\144\142\229\164\132\231\144\134",
            pos = {x = -627.9085018483981, y = 415.1220598598431},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Hunting_Fail",
              UnitId = -1
            }
          },
          ["1717643155722700441"] = {
            key = "1717643155722700441",
            type = "TalkNode",
            name = "\229\146\140\229\165\165\229\147\165\229\175\185\232\175\157\229\188\128\229\167\139\228\187\187\229\138\161",
            pos = {x = -1191.8946757523363, y = -106.75716182722078},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101168Aote_1180312",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10116801,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
          ["1722344762547992180"] = {
            key = "1722344762547992180",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -1861.7884223023984, y = 342.4508284990066},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180430,
              GuideType = "M",
              GuidePointName = "Mechanism_Quest_Auto_1180430"
            }
          },
          ["1722346500853995113"] = {
            key = "1722346500853995113",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -1099.7522224689662, y = 405.2863778592183},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_IcelakeHunting2",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17238983920254193931"] = {
            key = "17238983920254193931",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\163\133\233\165\176\231\148\168\233\152\178\229\190\161\230\156\186\229\133\179",
            pos = {x = -1397.6786404654458, y = 521.3232635829386},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180475}
            }
          },
          ["1723971769883727982"] = {
            key = "1723971769883727982",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\233\187\132\230\152\143",
            pos = {x = -1733.9320814161558, y = 73.65020802995679},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityTwilight",
              UnitId = -1
            }
          },
          ["1723971769883727983"] = {
            key = "1723971769883727983",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = -1730.7152579982946, y = 190.9229353026838},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "Point_QuestTrigger_1180294"
            }
          },
          ["1724403580947365392"] = {
            key = "1724403580947365392",
            type = "WaitOfTimeNode",
            name = "\231\173\1371s",
            pos = {x = -1649.7307500483673, y = 500.42496293147786},
            propsData = {WaitTime = 1}
          },
          ["1728974958331565300"] = {
            key = "1728974958331565300",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = -859.6180319680323, y = 412.89610389610334},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17466227259361973807"] = {
            key = "17466227259361973807",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\163\133\233\165\176\231\167\189\229\133\189",
            pos = {x = -1388.7792525902764, y = 782.7330642330643},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180479,
                1180480,
                1180481
              }
            }
          }
        },
        commentData = {}
      }
    },
    ["1717643155708700335"] = {
      isStoryNode = true,
      key = "1717643155708700335",
      type = "StoryNode",
      name = "\229\146\140\229\165\165\229\147\165\232\176\136\232\176\136",
      pos = {x = 1472.9350079043477, y = 312.62616556569185},
      propsData = {
        QuestId = 10020503,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020503",
        QuestDeatil = "QuestDesc_10020503",
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
            startQuest = "1717643155731700505",
            startPort = "Out",
            endQuest = "1717643155730700500",
            endPort = "In"
          },
          {
            startQuest = "1717643155730700501",
            startPort = "QuestStart",
            endQuest = "1717643155731700504",
            endPort = "In"
          },
          {
            startQuest = "1717643155731700504",
            startPort = "Out",
            endQuest = "1717643155731700505",
            endPort = "In"
          },
          {
            startQuest = "1717643155731700504",
            startPort = "Out",
            endQuest = "1723971414269376649",
            endPort = "In"
          },
          {
            startQuest = "1717643155730700500",
            startPort = "Out",
            endQuest = "1717643155730700502",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1717643155730700500"] = {
            key = "1717643155730700500",
            type = "TalkNode",
            name = "\229\135\134\229\164\135\231\139\169\231\140\142",
            pos = {x = -871.9974875640909, y = 7.901691561653713},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101168Aote_1180313",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10108201,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
          ["1717643155730700501"] = {
            key = "1717643155730700501",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1670.3989772351551, y = 6.679610900751938},
            propsData = {ModeType = 0}
          },
          ["1717643155730700502"] = {
            key = "1717643155730700502",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -582.6744055889974, y = -1.1660859289557095},
            propsData = {ModeType = 0}
          },
          ["1717643155730700503"] = {
            key = "1717643155730700503",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -590.2819082161537, y = 134.2764487243356},
            propsData = {}
          },
          ["1717643155731700504"] = {
            key = "1717643155731700504",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = -1405.5714830838374, y = 13.769381682001807},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Point_QuestTrigger_1180294"
            }
          },
          ["1717643155731700505"] = {
            key = "1717643155731700505",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \229\165\165\229\147\165",
            pos = {x = -1141.4924443531818, y = 6.868635555298965},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180313}
            }
          },
          ["172372893607111717"] = {
            key = "172372893607111717",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\150\183\231\129\171\230\156\186\229\133\179",
            pos = {x = -515.0660650091571, y = -133.4758741258726},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180320, 1180321}
            }
          },
          ["1723971414269376649"] = {
            key = "1723971414269376649",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\233\187\132\230\152\143",
            pos = {x = -1140.2569585734645, y = -186.7450002228892},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityTwilight",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1719561237665985621"] = {
      isStoryNode = true,
      key = "1719561237665985621",
      type = "StoryNode",
      name = "\233\152\178\229\190\161\229\144\142\229\175\185\232\175\157",
      pos = {x = 2410.1450172392347, y = 314.62479365634755},
      propsData = {
        QuestId = 10020507,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020507",
        QuestDeatil = "QuestDesc_10020507",
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
            startQuest = "1723971785864728699",
            startPort = "Out",
            endQuest = "1723971785864728698",
            endPort = "In"
          },
          {
            startQuest = "1719561237665985625",
            startPort = "QuestStart",
            endQuest = "1723971785864728699",
            endPort = "In"
          },
          {
            startQuest = "174404073043920698402",
            startPort = "Out",
            endQuest = "174404073043920698403",
            endPort = "In"
          },
          {
            startQuest = "174404073043920698402",
            startPort = "Out",
            endQuest = "1719561237665985626",
            endPort = "Success"
          },
          {
            startQuest = "1723971785864728699",
            startPort = "Out",
            endQuest = "174404073043920698402",
            endPort = "In"
          }
        },
        nodeData = {
          ["1719561237665985625"] = {
            key = "1719561237665985625",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2269.185384994978, y = 332.28429389991913},
            propsData = {ModeType = 0}
          },
          ["1719561237665985626"] = {
            key = "1719561237665985626",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -1262.0223261736085, y = 337.77158212313503},
            propsData = {ModeType = 0}
          },
          ["1719561237665985627"] = {
            key = "1719561237665985627",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -1339.6228440969837, y = 506.3020014333377},
            propsData = {}
          },
          ["17214576694192869861"] = {
            key = "17214576694192869861",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -1464.6298306656615, y = 206.43469538715135},
            propsData = {WaitTime = 1}
          },
          ["1723971785864728698"] = {
            key = "1723971785864728698",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\233\187\132\230\152\143",
            pos = {x = -2060.2957177797916, y = 179.55929893904764},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityTwilight",
              UnitId = -1
            }
          },
          ["1723971785864728699"] = {
            key = "1723971785864728699",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = -2032.5334398164757, y = 305.0138443935929},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_IcelakeHunting2"
            }
          },
          ["174404073043920698402"] = {
            key = "174404073043920698402",
            type = "TalkNode",
            name = "\230\175\148\230\136\145\230\131\179\232\177\161\228\184\173\230\156\137\230\156\172\228\186\139",
            pos = {x = -1766.5928571428576, y = 314.3430130305714},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10108337,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_101083",
              BlendInTime = 0,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174404073043920698403"] = {
            key = "174404073043920698403",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = -1769.9524975024985, y = 465.1212726837144},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
