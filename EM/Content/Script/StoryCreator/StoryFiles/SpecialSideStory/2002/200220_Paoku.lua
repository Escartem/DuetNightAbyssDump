return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17217384899251002478",
      startPort = "Success",
      endStory = "17217387288661288370",
      endPort = "In"
    },
    {
      startStory = "17217387288661288370",
      startPort = "Success",
      endStory = "17217392738191430774",
      endPort = "In"
    },
    {
      startStory = "17217392738191430774",
      startPort = "Success",
      endStory = "17217395059661714810",
      endPort = "In"
    },
    {
      startStory = "17217395059661714810",
      startPort = "Success",
      endStory = "17217395230191715058",
      endPort = "In"
    },
    {
      startStory = "17217395230191715058",
      startPort = "Success",
      endStory = "17217397133901857992",
      endPort = "In"
    },
    {
      startStory = "17217397133901857992",
      startPort = "Success",
      endStory = "17218282255484740390",
      endPort = "StoryEnd"
    },
    {
      startStory = "17218282255484740389",
      startPort = "StoryStart",
      endStory = "1722424338396458053",
      endPort = "In"
    },
    {
      startStory = "1722424338396458053",
      startPort = "Success",
      endStory = "17217384899251002478",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1721737684964289805"] = {
      isStoryNode = true,
      key = "1721737684964289805",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\233\133\146\233\166\134",
      pos = {x = 751.6638389874253, y = 319.6340670516868},
      propsData = {
        QuestId = 20022001,
        QuestDescriptionComment = "\232\191\155\229\133\165\233\133\146\233\166\134",
        QuestDescription = "Description_200220_1",
        QuestDeatil = "Content_200220_1",
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
        StoryGuidePointName = "Npc_Waiter_SSS_1220097"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1721737684964289809",
            startPort = "QuestStart",
            endQuest = "1721737684964289813",
            endPort = "In"
          },
          {
            startQuest = "1721737684964289813",
            startPort = "Out",
            endQuest = "1721737684964289810",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721737684964289809"] = {
            key = "1721737684964289809",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1001.2608695652175, y = 163.8478260869565},
            propsData = {ModeType = 0}
          },
          ["1721737684964289810"] = {
            key = "1721737684964289810",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1512.3639751552791, y = 166.55821569734616},
            propsData = {ModeType = 0}
          },
          ["1721737684964289811"] = {
            key = "1721737684964289811",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1769.8012422360248, y = 301.59627329192546},
            propsData = {}
          },
          ["1721737684964289813"] = {
            key = "1721737684964289813",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\229\142\187\233\133\146\233\166\134",
            pos = {x = 1246.8769003978402, y = 164.71827934072147},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Npc_Waiter_SSS_1220097"
            }
          }
        },
        commentData = {}
      }
    },
    ["1721737907947717509"] = {
      isStoryNode = true,
      key = "1721737907947717509",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\233\133\146\233\166\134",
      pos = {x = 1115.2946755668509, y = 344.2602532644597},
      propsData = {
        QuestId = 20022003,
        QuestDescriptionComment = "\231\166\187\229\188\128\233\133\146\233\166\134",
        QuestDescription = "Description_200220_3",
        QuestDeatil = "Content_200220_3",
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
        StoryGuidePointName = "QuestPoint_20022004"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1721737907947717513",
            startPort = "QuestStart",
            endQuest = "1721737907947717516",
            endPort = "In"
          },
          {
            startQuest = "1721737907947717516",
            startPort = "Out",
            endQuest = "1721737907947717514",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721737907947717513"] = {
            key = "1721737907947717513",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721737907947717514"] = {
            key = "1721737907947717514",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1305.6571428571428, y = 303.7142857142857},
            propsData = {ModeType = 0}
          },
          ["1721737907947717515"] = {
            key = "1721737907947717515",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1721737907947717516"] = {
            key = "1721737907947717516",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\233\133\146\233\166\134",
            pos = {x = 1050.5810571926836, y = 301.00383717029473},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20022004"
            }
          }
        },
        commentData = {}
      }
    },
    ["17217384899251002478"] = {
      isStoryNode = true,
      key = "17217384899251002478",
      type = "StoryNode",
      name = "\229\146\140\230\142\162\233\153\169\231\154\142\231\154\142\229\175\185\232\175\157",
      pos = {x = 1190.094716113122, y = 498.97799001501744},
      propsData = {
        QuestId = 20022004,
        QuestDescriptionComment = "\229\146\140\230\142\162\233\153\169\231\154\142\231\154\142\229\175\185\232\175\157",
        QuestDescription = "Description_200220_4",
        QuestDeatil = "Content_200220_4",
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
        StoryGuidePointName = "QuestPoint_20022004"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1721822706759738829",
            startPort = "Out",
            endQuest = "17217384899261002483",
            endPort = "Success"
          },
          {
            startQuest = "17218248016961885370",
            startPort = "Out",
            endQuest = "17219149958516950218",
            endPort = "In"
          },
          {
            startQuest = "17219149958516950218",
            startPort = "Out",
            endQuest = "1721822706759738829",
            endPort = "In"
          },
          {
            startQuest = "17217384899261002482",
            startPort = "QuestStart",
            endQuest = "17218248016961885370",
            endPort = "In"
          }
        },
        nodeData = {
          ["17217384899261002482"] = {
            key = "17217384899261002482",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 699.2861640608268, y = 450.10913471835516},
            propsData = {ModeType = 0}
          },
          ["17217384899261002483"] = {
            key = "17217384899261002483",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1955.4921446839608, y = 433.34380708805253},
            propsData = {ModeType = 0}
          },
          ["17217384899261002484"] = {
            key = "17217384899261002484",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1721822706759738829"] = {
            key = "1721822706759738829",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1697.5889551326006, y = 433.6815076497067},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190718}
            }
          },
          ["17218248016961885370"] = {
            key = "17218248016961885370",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1201.8452576536092, y = 438.62542434682024},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190718}
            }
          },
          ["17219149958516950218"] = {
            key = "17219149958516950218",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1449.3532872057576, y = 427.07404500720577},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700146,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Beibao_SSS_1190718",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51006101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022004",
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
                  TalkActorId = 700146,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700144,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700145,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700146},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700144},
                {TalkActorType = "Npc", TalkActorId = 700145},
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
          ["1722510011304477061"] = {
            key = "1722510011304477061",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 955.2061099819723, y = 610.6503582624271},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20022004"
            }
          },
          ["17527556485957412137"] = {
            key = "17527556485957412137",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\233\133\146\233\166\134",
            pos = {x = 950.8348424217904, y = 233.70404770219722},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20022004"
            }
          }
        },
        commentData = {}
      }
    },
    ["17217387288661288370"] = {
      isStoryNode = true,
      key = "17217387288661288370",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\232\183\145\233\133\183\230\156\186\229\133\179\229\164\132",
      pos = {x = 725.2829784741326, y = 649.3735174537269},
      propsData = {
        QuestId = 20022005,
        QuestDescriptionComment = "\229\137\141\229\190\128\232\183\145\233\133\183\230\156\186\229\133\179\229\164\132",
        QuestDescription = "Description_200220_5",
        QuestDeatil = "Content_200220_5",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1190727"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17217387288661288374",
            startPort = "QuestStart",
            endQuest = "17219187988277532780",
            endPort = "In"
          },
          {
            startQuest = "17219187988277532780",
            startPort = "Out",
            endQuest = "17219215535427971260",
            endPort = "In"
          },
          {
            startQuest = "17219215535427971260",
            startPort = "Out",
            endQuest = "17217387288661288375",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17217387288661288374"] = {
            key = "17217387288661288374",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 893.6111801242237, y = 524.4996894409938},
            propsData = {ModeType = 0}
          },
          ["17217387288661288375"] = {
            key = "17217387288661288375",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1785.4805194805192, y = 523.2077922077922},
            propsData = {ModeType = 0}
          },
          ["17217387288661288376"] = {
            key = "17217387288661288376",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17219187988277532780"] = {
            key = "17219187988277532780",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1180.3051588635117, y = 525.2157562371523},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190727,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190727"
            }
          },
          ["17219192621947678645"] = {
            key = "17219192621947678645",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1490.7597043180567, y = 829.3066653280614},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022004",
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
                  TalkActorId = 700146,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700145,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700146},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700145},
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
          ["17219215535427971260"] = {
            key = "17219215535427971260",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1504.3960679544205, y = 512.943028964425},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022005",
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
                  TalkActorId = 700146,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700145,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700146},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700145},
                {TalkActorType = "Player", TalkActorId = 0}
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
    ["17217392738191430774"] = {
      isStoryNode = true,
      key = "17217392738191430774",
      type = "StoryNode",
      name = "\232\191\155\232\161\140\232\183\145\233\133\183",
      pos = {x = 989.0016305117504, y = 650.6235174537269},
      propsData = {
        QuestId = 20022006,
        QuestDescriptionComment = "\232\191\155\232\161\140\232\183\145\233\133\183",
        QuestDescription = "Description_200220_6",
        QuestDeatil = "Content_200220_6",
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
        StoryGuidePointName = "QuestPoint_Paoku"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17218751110574905650",
            startPort = "Out",
            endQuest = "17218751458574906334",
            endPort = "In"
          },
          {
            startQuest = "17218751458574906334",
            startPort = "Out",
            endQuest = "17217392738191430780",
            endPort = "Fail"
          },
          {
            startQuest = "17218750801974905466",
            startPort = "Out",
            endQuest = "17218752109414906939",
            endPort = "In"
          },
          {
            startQuest = "17218752141424907061",
            startPort = "Out",
            endQuest = "17219090799755487630",
            endPort = "In"
          },
          {
            startQuest = "17219091756845488182",
            startPort = "Out",
            endQuest = "17219092150985488487",
            endPort = "In"
          },
          {
            startQuest = "17219092150985488487",
            startPort = "Out",
            endQuest = "17217392738191430779",
            endPort = "Success"
          },
          {
            startQuest = "17219099070596075611",
            startPort = "Out",
            endQuest = "17218751110574905650",
            endPort = "In"
          },
          {
            startQuest = "17219217138278118303",
            startPort = "Out",
            endQuest = "17219217929648119067",
            endPort = "In"
          },
          {
            startQuest = "17219099070596075611",
            startPort = "Out",
            endQuest = "172198591558911054270",
            endPort = "In"
          },
          {
            startQuest = "17219099070596075611",
            startPort = "Out",
            endQuest = "17235616884981881100",
            endPort = "In"
          },
          {
            startQuest = "17235616884981881100",
            startPort = "Out",
            endQuest = "17218750801974905466",
            endPort = "In"
          },
          {
            startQuest = "17218750801974905466",
            startPort = "Out",
            endQuest = "17235617525231882766",
            endPort = "In"
          },
          {
            startQuest = "17235617525231882766",
            startPort = "Out",
            endQuest = "17219217138278118303",
            endPort = "In"
          },
          {
            startQuest = "17219217138278118303",
            startPort = "Out",
            endQuest = "17235618173261884492",
            endPort = "In"
          },
          {
            startQuest = "17235618173261884492",
            startPort = "Out",
            endQuest = "17218752141424907061",
            endPort = "In"
          },
          {
            startQuest = "17218752141424907061",
            startPort = "Out",
            endQuest = "17219091756845488182",
            endPort = "In"
          },
          {
            startQuest = "172198589373810907482",
            startPort = "Out",
            endQuest = "17219099070596075611",
            endPort = "In"
          },
          {
            startQuest = "17407308844032121",
            startPort = "Out",
            endQuest = "17407308947462438",
            endPort = "In"
          },
          {
            startQuest = "172198589373810907482",
            startPort = "Out",
            endQuest = "17407308844032121",
            endPort = "In"
          },
          {
            startQuest = "17407308947462438",
            startPort = "Out",
            endQuest = "17217392738191430779",
            endPort = "Success"
          },
          {
            startQuest = "17217392738191430778",
            startPort = "QuestStart",
            endQuest = "17412465288834188",
            endPort = "In"
          },
          {
            startQuest = "17412465288834188",
            startPort = "Out",
            endQuest = "172198589373810907482",
            endPort = "In"
          },
          {
            startQuest = "17219099070596075611",
            startPort = "Out",
            endQuest = "17407308844032121",
            endPort = "Stop"
          }
        },
        nodeData = {
          ["17217392738191430778"] = {
            key = "17217392738191430778",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -202.50370499066148, y = 501.90952960083405},
            propsData = {ModeType = 0}
          },
          ["17217392738191430779"] = {
            key = "17217392738191430779",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3014.3948051948055, y = 480.5181818181818},
            propsData = {ModeType = 0}
          },
          ["17217392738191430780"] = {
            key = "17217392738191430780",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1497.0151515151515, y = 696.510101010101},
            propsData = {}
          },
          ["17218750801974905466"] = {
            key = "17218750801974905466",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\183\145\229\174\140\231\172\172\228\186\140\228\184\170\231\130\185",
            pos = {x = 1146.566036874389, y = 503.2076754290713},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190701,
              StateId = 701312,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17218751110574905650"] = {
            key = "17218751110574905650",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\183\145\233\133\183\230\140\145\230\136\152\229\164\177\232\180\165",
            pos = {x = 933.0357338440856, y = 693.0460592674551},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190704,
              StateId = 702000,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17218751458574906334"] = {
            key = "17218751458574906334",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1195.8337136420655, y = 688.8389885603843},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006305,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17218752109414906939"] = {
            key = "17218752109414906939",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1386.2630065713583, y = 289.8591905805866},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17218752141424907061"] = {
            key = "17218752141424907061",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\183\145\229\174\140\231\172\172\228\186\148\228\184\170\231\130\185",
            pos = {x = 2169.156945965298, y = 489.72282694422296},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190697,
              StateId = 701312,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219090799755487630"] = {
            key = "17219090799755487630",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2443.4024005107526, y = 331.43494815634415},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006303,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17219091756845488182"] = {
            key = "17219091756845488182",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\183\145\233\133\183\230\140\145\230\136\152\229\174\140\230\136\144",
            pos = {x = 2432.701390409743, y = 488.5440390654352},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190704,
              StateId = 702003,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219092150985488487"] = {
            key = "17219092150985488487",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2723.711491419844, y = 468.9985845199805},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17219099070596075611"] = {
            key = "17219099070596075611",
            type = "WaitingMechanismEnterStateNode",
            name = "\229\188\128\229\144\175\232\183\145\233\133\183\230\140\145\230\136\152",
            pos = {x = 557.6761378844903, y = 507.80491707631313},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190704,
              StateId = 702002,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219217138278118303"] = {
            key = "17219217138278118303",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\183\145\229\174\140\231\172\172\229\155\155\228\184\170\231\130\185",
            pos = {x = 1675.1536437119962, y = 489.3066653280613},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190698,
              StateId = 701312,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219217929648119067"] = {
            key = "17219217929648119067",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1882.4263709847235, y = 301.8824229038188},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006302,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172198589373810907482"] = {
            key = "172198589373810907482",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 296.3643675160772, y = 505.3962373595141},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_Paoku"
            }
          },
          ["172198591558911054270"] = {
            key = "172198591558911054270",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 842.3259059776155, y = 367.8962373595141},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "QuestPoint_Paoku"
            }
          },
          ["17235616884981881100"] = {
            key = "17235616884981881100",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\172\172\228\186\140\228\184\170\231\130\185\231\155\145\230\181\139\231\188\147\229\173\152\228\191\157\230\138\164",
            pos = {x = 891.0068380362609, y = 497.0922430845425},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190701,
              StateId = 701310,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17235617525231882766"] = {
            key = "17235617525231882766",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\172\172\229\155\155\228\184\170\231\130\185\231\155\145\230\181\139\231\188\147\229\173\152\228\191\157\230\138\164",
            pos = {x = 1414.3401713695944, y = 498.7589097512091},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190698,
              StateId = 701310,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17235618173261884492"] = {
            key = "17235618173261884492",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\172\172\228\186\148\228\184\170\231\130\185\231\155\145\230\181\139\231\188\147\229\173\152\228\191\157\230\138\164",
            pos = {x = 1914.340171369594, y = 493.7589097512091},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190697,
              StateId = 701310,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17407308844032121"] = {
            key = "17407308844032121",
            type = "WaitingMechanismEnterStateNode",
            name = "\232\183\145\233\133\183\230\140\145\230\136\152\229\174\140\230\136\144",
            pos = {x = 997.6969696969692, y = 906.3030303030301},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190704,
              StateId = 702004,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17407308947462438"] = {
            key = "17407308947462438",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1262.2424242424236, y = 917.212121212121},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "QuestPoint_Paoku"
            }
          },
          ["17412465288834188"] = {
            key = "17412465288834188",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 44.5, y = 501.08333333333337},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "20022006ParkourStart",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17217395059661714810"] = {
      isStoryNode = true,
      key = "17217395059661714810",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\232\183\145\233\133\183\230\156\186\229\133\179\229\164\132",
      pos = {x = 1256.7398750258567, y = 653.2959312468304},
      propsData = {
        QuestId = 20022007,
        QuestDescriptionComment = "\229\137\141\229\190\128\229\176\132\229\135\187\230\156\186\229\133\179\229\164\132",
        QuestDescription = "Description_200220_7",
        QuestDeatil = "Content_200220_7",
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
        StoryGuidePointName = "QuestPoint_Sheji"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17219223065718265185",
            startPort = "Out",
            endQuest = "17219223065718265186",
            endPort = "In"
          },
          {
            startQuest = "17219224381878556191",
            startPort = "Out",
            endQuest = "17219223065718265185",
            endPort = "In"
          },
          {
            startQuest = "17219223065718265186",
            startPort = "Out",
            endQuest = "17219224643718701732",
            endPort = "In"
          },
          {
            startQuest = "17219224643718701732",
            startPort = "Out",
            endQuest = "17217395059661714815",
            endPort = "Success"
          },
          {
            startQuest = "17217395059661714814",
            startPort = "QuestStart",
            endQuest = "1722510103180793797",
            endPort = "In"
          },
          {
            startQuest = "1722510103180793797",
            startPort = "Out",
            endQuest = "17219224381878556191",
            endPort = "In"
          }
        },
        nodeData = {
          ["17217395059661714814"] = {
            key = "17217395059661714814",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 321.4072820732491, y = 594.3497644035126},
            propsData = {ModeType = 0}
          },
          ["17217395059661714815"] = {
            key = "17217395059661714815",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2049.7888198757764, y = 600.223602484472},
            propsData = {ModeType = 0}
          },
          ["17217395059661714816"] = {
            key = "17217395059661714816",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17219223065718265185"] = {
            key = "17219223065718265185",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1177.331553185302, y = 598.1839836619014},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190731,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190731"
            }
          },
          ["17219223065718265186"] = {
            key = "17219223065718265186",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1441.4224622762108, y = 585.9112563891741},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022007",
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
                  TalkActorId = 700146,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700146},
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
          ["17219224381878556191"] = {
            key = "17219224381878556191",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 888.9422251220609, y = 599.8737069820595},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190725}
            }
          },
          ["17219224643718701732"] = {
            key = "17219224643718701732",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1733.2900512090173, y = 588.1345765472768},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190725}
            }
          },
          ["1722510103180793797"] = {
            key = "1722510103180793797",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 589.33456773112, y = 600.7242498880429},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Sheji"
            }
          }
        },
        commentData = {}
      }
    },
    ["17217395230191715058"] = {
      isStoryNode = true,
      key = "17217395230191715058",
      type = "StoryNode",
      name = "\232\191\155\232\161\140\229\176\132\229\135\187",
      pos = {x = 1523.0415991637883, y = 654.1148967640718},
      propsData = {
        QuestId = 20022008,
        QuestDescriptionComment = "\232\191\155\232\161\140\229\176\132\229\135\187",
        QuestDescription = "Description_200220_8",
        QuestDeatil = "Content_200220_8",
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
        StoryGuidePointName = "QuestPoint_Sheji"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17219094931965634880",
            startPort = "Out",
            endQuest = "17219095176915635118",
            endPort = "In"
          },
          {
            startQuest = "17219094931965634880",
            startPort = "Out",
            endQuest = "17219095367565635354",
            endPort = "In"
          },
          {
            startQuest = "17219094931965634880",
            startPort = "Out",
            endQuest = "17219095474715635632",
            endPort = "In"
          },
          {
            startQuest = "17219095918155636497",
            startPort = "Out",
            endQuest = "17219096498705637028",
            endPort = "In"
          },
          {
            startQuest = "17219096498705637028",
            startPort = "Out",
            endQuest = "17217395230191715063",
            endPort = "Success"
          },
          {
            startQuest = "17219100021906366503",
            startPort = "Out",
            endQuest = "17219094931965634880",
            endPort = "In"
          },
          {
            startQuest = "17219100021906366503",
            startPort = "Out",
            endQuest = "17219101095056512055",
            endPort = "In"
          },
          {
            startQuest = "17219101095056512055",
            startPort = "Out",
            endQuest = "17219101178236512297",
            endPort = "In"
          },
          {
            startQuest = "17219101178236512297",
            startPort = "Out",
            endQuest = "17217395230191715064",
            endPort = "Fail"
          },
          {
            startQuest = "17219100021906366503",
            startPort = "Out",
            endQuest = "172199134766411202270",
            endPort = "In"
          },
          {
            startQuest = "17219095367565635354",
            startPort = "Out",
            endQuest = "1728976677041386779",
            endPort = "Input_1"
          },
          {
            startQuest = "17219095474715635632",
            startPort = "Out",
            endQuest = "1728976677041386779",
            endPort = "Input_2"
          },
          {
            startQuest = "1728976677041386779",
            startPort = "Out",
            endQuest = "17219096357155636726",
            endPort = "In"
          },
          {
            startQuest = "1728976677041386779",
            startPort = "Out",
            endQuest = "17219095918155636497",
            endPort = "In"
          },
          {
            startQuest = "172199133624611202067",
            startPort = "Out",
            endQuest = "17219100021906366503",
            endPort = "In"
          },
          {
            startQuest = "172199133624611202067",
            startPort = "Out",
            endQuest = "1740730953068785548",
            endPort = "In"
          },
          {
            startQuest = "1740730953068785548",
            startPort = "Out",
            endQuest = "1740730961548785891",
            endPort = "In"
          },
          {
            startQuest = "1740730961548785891",
            startPort = "Out",
            endQuest = "17217395230191715063",
            endPort = "Success"
          },
          {
            startQuest = "17217395230191715062",
            startPort = "QuestStart",
            endQuest = "17412466418405031",
            endPort = "In"
          },
          {
            startQuest = "17412466418405031",
            startPort = "Out",
            endQuest = "172199133624611202067",
            endPort = "In"
          },
          {
            startQuest = "17219100021906366503",
            startPort = "Out",
            endQuest = "1740730953068785548",
            endPort = "Stop"
          }
        },
        nodeData = {
          ["17217395230191715062"] = {
            key = "17217395230191715062",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100.35735646250522, y = 529.5720016317272},
            propsData = {ModeType = 0}
          },
          ["17217395230191715063"] = {
            key = "17217395230191715063",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3128.945165945165, y = 767.8542568542568},
            propsData = {ModeType = 0}
          },
          ["17217395230191715064"] = {
            key = "17217395230191715064",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2172.4242424242425, y = 919.9494949494949},
            propsData = {}
          },
          ["17219094931965634880"] = {
            key = "17219094931965634880",
            type = "ListenActorDestroyNode",
            name = "\230\137\147\229\174\140\231\172\172\228\184\128\228\184\170\231\144\131",
            pos = {x = 1188.4978162061686, y = 524.0879396093358},
            propsData = {StaticCreatorId = 1190531, DestroyReason = "Default"}
          },
          ["17219095176915635118"] = {
            key = "17219095176915635118",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1458.4978162061686, y = 345.19905072044685},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17219095367565635354"] = {
            key = "17219095367565635354",
            type = "ListenActorDestroyNode",
            name = "\230\137\147\229\174\140\231\172\172\228\186\140\230\179\162\231\144\131\231\154\132\228\184\128\228\184\170",
            pos = {x = 1493.1947859031382, y = 526.0576365790326},
            propsData = {StaticCreatorId = 1190532, DestroyReason = "Default"}
          },
          ["17219095474715635632"] = {
            key = "17219095474715635632",
            type = "ListenActorDestroyNode",
            name = "\230\137\147\229\174\140\231\172\172\228\186\140\230\179\162\231\144\131\231\154\132\228\184\128\228\184\170",
            pos = {x = 1489.60892731728, y = 704.0879396093358},
            propsData = {StaticCreatorId = 1190533, DestroyReason = "Default"}
          },
          ["17219095918155636497"] = {
            key = "17219095918155636497",
            type = "WaitingMechanismEnterStateNode",
            name = "\229\176\132\229\135\187\230\140\145\230\136\152\229\174\140\230\136\144",
            pos = {x = 2112.9422606506128, y = 617.421272942669},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190541,
              StateId = 701303,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219096357155636726"] = {
            key = "17219096357155636726",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2106.275593983946, y = 428.53238405378016},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006602,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17219096498705637028"] = {
            key = "17219096498705637028",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2379.608927317279, y = 599.6434951648914},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006603,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17219100021906366503"] = {
            key = "17219100021906366503",
            type = "WaitingMechanismEnterStateNode",
            name = "\229\188\128\229\144\175\229\176\132\229\135\187\230\140\145\230\136\152",
            pos = {x = 884.4593546677071, y = 524.1947772161733},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190541,
              StateId = 701302,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219101095056512055"] = {
            key = "17219101095056512055",
            type = "WaitingMechanismEnterStateNode",
            name = "\229\176\132\229\135\187\230\140\145\230\136\152\229\164\177\232\180\165",
            pos = {x = 1335.3051588635117, y = 919.3066653280614},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190541,
              StateId = 701300,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17219101178236512297"] = {
            key = "17219101178236512297",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1651.668795227148, y = 904.3066653280614},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006305,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172199133624611202067"] = {
            key = "172199133624611202067",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 601.3536837553935, y = 532.2017929150697},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_Sheji"
            }
          },
          ["172199134766411202270"] = {
            key = "172199134766411202270",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1192.3259059776155, y = 382.89623735951403},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "QuestPoint_Sheji"
            }
          },
          ["1728976677041386779"] = {
            key = "1728976677041386779",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 1798.209410174114, y = 583.7794885690416},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["1740730953068785548"] = {
            key = "1740730953068785548",
            type = "WaitingMechanismEnterStateNode",
            name = "\229\176\132\229\135\187\230\140\145\230\136\152\229\174\140\230\136\144",
            pos = {x = 1297.375, y = 1192.375},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190541,
              StateId = 701304,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1740730961548785891"] = {
            key = "1740730961548785891",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1595.5, y = 1207.375},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "QuestPoint_Sheji"
            }
          },
          ["17412466418405031"] = {
            key = "17412466418405031",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 352.42105263157896, y = 529.1578947368421},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "20022008ShootStart",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17217397133901857992"] = {
      isStoryNode = true,
      key = "17217397133901857992",
      type = "StoryNode",
      name = "\229\146\140\230\142\162\233\153\169\231\154\142\231\154\142\229\175\185\232\175\157",
      pos = {x = 1829.8088405430985, y = 546.4243341506416},
      propsData = {
        QuestId = 20022009,
        QuestDescriptionComment = "\229\146\140\230\142\162\233\153\169\231\154\142\231\154\142\229\175\185\232\175\157",
        QuestDescription = "Description_200220_9",
        QuestDeatil = "Content_200220_9",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Sheji"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17217397133901857997",
            startPort = "QuestStart",
            endQuest = "172198072535310174308",
            endPort = "In"
          },
          {
            startQuest = "172198072535310174308",
            startPort = "Out",
            endQuest = "172198070934510173937",
            endPort = "In"
          },
          {
            startQuest = "172198070934510173937",
            startPort = "Out",
            endQuest = "17217397133901857998",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17217397133901857997"] = {
            key = "17217397133901857997",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1450.735294117647, y = 301.9852941176471},
            propsData = {ModeType = 0}
          },
          ["17217397133901857998"] = {
            key = "17217397133901857998",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2389.6184210526317, y = 310.7894736842105},
            propsData = {ModeType = 0}
          },
          ["17217397133901857999"] = {
            key = "17217397133901857999",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172198070934510173937"] = {
            key = "172198070934510173937",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2037.957484924984, y = 294.9093952542509},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006701,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20022009",
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
                  TalkActorId = 700146,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700145,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700144,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700146},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700145},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700144}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172198072535310174308"] = {
            key = "172198072535310174308",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1732.4220598237696, y = 304.14623735951403},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17218282255484740389"] = {
      isStoryNode = true,
      key = "17218282255484740389",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 442.5263328003267, y = 511.06580004999705},
      propsData = {QuestChainId = 200220},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17218282255484740390"] = {
      isStoryNode = true,
      key = "17218282255484740390",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2130.9931009783827, y = 538.6841619354316},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722424338396458053"] = {
      isStoryNode = true,
      key = "1722424338396458053",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 805.9537416114463, y = 498.125691132402},
      propsData = {
        QuestId = 20022002,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200220_2",
        QuestDeatil = "Content_200220_2",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Waiter_SSS_1220097"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1722424524636762836",
            startPort = "Out",
            endQuest = "1722424338397458057",
            endPort = "Success"
          },
          {
            startQuest = "1722424338396458054",
            startPort = "QuestStart",
            endQuest = "1722424524636762836",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722424338396458054"] = {
            key = "1722424338396458054",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1567.3684210526317, y = 360.00000000000006},
            propsData = {ModeType = 0}
          },
          ["1722424338397458057"] = {
            key = "1722424338397458057",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2273.6421052631576, y = 361.8315789473684},
            propsData = {ModeType = 0}
          },
          ["1722424338397458060"] = {
            key = "1722424338397458060",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1722424524636762836"] = {
            key = "1722424524636762836",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1908.2947368421053, y = 350.2947368421054},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700143,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Waiter_SSS_1220097",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51006001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20022001",
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
                  TalkActorId = 700144,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700145,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700143,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700144},
                {TalkActorType = "Npc", TalkActorId = 700145},
                {TalkActorType = "Npc", TalkActorId = 700143},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200003}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17527555670467410965"] = {
            key = "17527555670467410965",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\229\142\187\233\133\146\233\166\134",
            pos = {x = 1768.251748251748, y = 187.8461538461539},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Npc_Waiter_SSS_1220097"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
