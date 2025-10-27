return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750142619591948739",
      startPort = "StoryStart",
      endStory = "17514248151166350500",
      endPort = "In"
    },
    {
      startStory = "17514248151166350500",
      startPort = "Success",
      endStory = "1750230312164806",
      endPort = "In"
    },
    {
      startStory = "1750230312164806",
      startPort = "Success",
      endStory = "17515246631939466277",
      endPort = "In"
    },
    {
      startStory = "17515246631939466277",
      startPort = "Success",
      endStory = "17515243582307575562",
      endPort = "In"
    },
    {
      startStory = "17515243582307575562",
      startPort = "Success",
      endStory = "1751534892992835",
      endPort = "In"
    },
    {
      startStory = "1751534892992835",
      startPort = "Success",
      endStory = "1750142619591948742",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750142619591948739"] = {
      isStoryNode = true,
      key = "1750142619591948739",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 628.2061074725796, y = 385.7386569872958},
      propsData = {QuestChainId = 200301},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750142619591948742"] = {
      isStoryNode = true,
      key = "1750142619591948742",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2594.586956521739, y = 365.0217391304348},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750230312164806"] = {
      isStoryNode = true,
      key = "1750230312164806",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1298.4707734564024, y = 450.6076840680822},
      propsData = {
        QuestId = 20030101,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200301_1",
        QuestDeatil = "Content_200301_1",
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
        SubRegionId = 104105,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_Side_God_2060081"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1750230312164807",
            startPort = "QuestStart",
            endQuest = "17515229661404743740",
            endPort = "In"
          },
          {
            startQuest = "17515229661404743740",
            startPort = "Out",
            endQuest = "17502304036541596",
            endPort = "In"
          },
          {
            startQuest = "17515229661404743740",
            startPort = "Out",
            endQuest = "17515245489808521433",
            endPort = "In"
          },
          {
            startQuest = "17515245489808521433",
            startPort = "Out",
            endQuest = "1750230312165810",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1750230312164807"] = {
            key = "1750230312164807",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 261, y = 305.7857142857143},
            propsData = {ModeType = 0}
          },
          ["1750230312165810"] = {
            key = "1750230312165810",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1691.809603440039, y = 376.1170694294264},
            propsData = {ModeType = 0}
          },
          ["1750230312165813"] = {
            key = "1750230312165813",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2313.2723112128147, y = 847.8032036613272},
            propsData = {}
          },
          ["17502304036541596"] = {
            key = "17502304036541596",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1148.5454545454545, y = 139.27272727272728},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200301/20030102.20030102'",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17515229661404743740"] = {
            key = "17515229661404743740",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 585.2142857142857, y = 341.6428571428571},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060081,
              GuideType = "M",
              GuidePointName = "Mechanism_Side_God_2060081"
            }
          },
          ["17515245489808521433"] = {
            key = "17515245489808521433",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1113.9676505349544, y = 459.25901649165223},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060082}
            }
          }
        },
        commentData = {}
      }
    },
    ["17514248151166350500"] = {
      isStoryNode = true,
      key = "17514248151166350500",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 969.684210526316, y = 392.2185354691076},
      propsData = {
        QuestId = 20030100,
        QuestDescriptionComment = "",
        SubRegionId = 104109,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Side_LaoZhe_2100066"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17514248469846351623",
            startPort = "ApproveOut",
            endQuest = "17514248151166350504",
            endPort = "Success"
          },
          {
            startQuest = "17514248469846351623",
            startPort = "CancelOut",
            endQuest = "17514248151166350512",
            endPort = "Fail"
          },
          {
            startQuest = "17514248151166350501",
            startPort = "QuestStart",
            endQuest = "17514248469846351626",
            endPort = "In"
          },
          {
            startQuest = "17514248469846351626",
            startPort = "Out",
            endQuest = "17514248469846351623",
            endPort = "Input"
          },
          {
            startQuest = "17514248469846351626",
            startPort = "Fail",
            endQuest = "17514248151166350512",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17514248151166350501"] = {
            key = "17514248151166350501",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1159.3939393939395, y = 197.3320158102767},
            propsData = {ModeType = 0}
          },
          ["17514248151166350504"] = {
            key = "17514248151166350504",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2225.909090909091, y = 128.18181818181816},
            propsData = {ModeType = 0}
          },
          ["17514248151166350512"] = {
            key = "17514248151166350512",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2200, y = 375.45454545454544},
            propsData = {}
          },
          ["17514248469846351623"] = {
            key = "17514248469846351623",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1899.0019841269843, y = 75.29872758820136},
            propsData = {
              SideQuestChainId = 200301,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17514248469846351626"] = {
            key = "17514248469846351626",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1476.1559065934064, y = 136.8419433827043},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700319,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Side_LaoZhe_2100066",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200301/20030101.20030101'",
              TalkType = "Impression",
              BlendInTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["17515243582307575562"] = {
      isStoryNode = true,
      key = "17515243582307575562",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1937.1990219532788, y = 415.2938713763018},
      propsData = {
        QuestId = 20030103,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200301_2",
        QuestDeatil = "Content_200301_2",
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
        SubRegionId = 104105,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SideGod_2060080"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17515243759747576217",
            startPort = "Out",
            endQuest = "17515243759747576219",
            endPort = "In"
          },
          {
            startQuest = "17515243759747576217",
            startPort = "Out",
            endQuest = "17515243759747576220",
            endPort = "In"
          },
          {
            startQuest = "17515243759747576216",
            startPort = "Out",
            endQuest = "17515243759747576217",
            endPort = "In"
          },
          {
            startQuest = "17515243582307575563",
            startPort = "QuestStart",
            endQuest = "17515243759747576216",
            endPort = "In"
          },
          {
            startQuest = "17515243759747576219",
            startPort = "Out",
            endQuest = "17515317888515665046",
            endPort = "In"
          },
          {
            startQuest = "17515317888515665046",
            startPort = "Out",
            endQuest = "17515243582307575566",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17515243582307575563"] = {
            key = "17515243582307575563",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 892.3076923076924, y = 313.84615384615387},
            propsData = {ModeType = 0}
          },
          ["17515243582307575566"] = {
            key = "17515243582307575566",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2823.1730769230767, y = 338.3653846153846},
            propsData = {ModeType = 0}
          },
          ["17515243582307575569"] = {
            key = "17515243582307575569",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17515243759747576216"] = {
            key = "17515243759747576216",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\177\161\231\167\189\228\185\139\229\156\176\232\190\185\231\188\152",
            pos = {x = 1344.7652261925718, y = 326.4052723108256},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060080,
              GuideType = "M",
              GuidePointName = "Mechanism_SideGod_2060080"
            }
          },
          ["17515243759747576217"] = {
            key = "17515243759747576217",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1614.526579827495, y = 325.2266505892977},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2060058,
                2060059,
                2060060
              }
            }
          },
          ["17515243759747576219"] = {
            key = "17515243759747576219",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1931.046161227862, y = 320.5967012959545},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2060058,
                2060059,
                2060060
              }
            }
          },
          ["17515243759747576220"] = {
            key = "17515243759747576220",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1849.663220912413, y = 671.1546203137123},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200301/20030104.20030104'",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17515317888515665046"] = {
            key = "17515317888515665046",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2248.4061544862457, y = 335.6885338155361},
            propsData = {WaitTime = 3}
          }
        },
        commentData = {}
      }
    },
    ["17515246631939466277"] = {
      isStoryNode = true,
      key = "17515246631939466277",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1621.6033281733746, y = 418.69551943584474},
      propsData = {
        QuestId = 20030104,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200301_4",
        QuestDeatil = "Content_200301_1",
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
        SubRegionId = 104105,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SideGod_2060080"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17515246843939467073",
            startPort = "Out",
            endQuest = "17515246843939467074",
            endPort = "In"
          },
          {
            startQuest = "17515246631939466278",
            startPort = "QuestStart",
            endQuest = "17515246895699467312",
            endPort = "In"
          },
          {
            startQuest = "17515246895699467312",
            startPort = "Out",
            endQuest = "17515246843939467073",
            endPort = "In"
          },
          {
            startQuest = "17515246843939467074",
            startPort = "Out",
            endQuest = "17515246631939466281",
            endPort = "Success"
          },
          {
            startQuest = "17515246895699467312",
            startPort = "Out",
            endQuest = "17515247153199468125",
            endPort = "In"
          }
        },
        nodeData = {
          ["17515246631939466278"] = {
            key = "17515246631939466278",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 680, y = 286},
            propsData = {ModeType = 0}
          },
          ["17515246631939466281"] = {
            key = "17515246631939466281",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2028, y = 370},
            propsData = {ModeType = 0}
          },
          ["17515246631939466284"] = {
            key = "17515246631939466284",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17515246843939467073"] = {
            key = "17515246843939467073",
            type = "TalkNode",
            name = "\232\191\153\229\156\176\230\150\185\232\141\146\230\151\160\228\186\186\231\131\159",
            pos = {x = 1454.0385802446308, y = 374.89104900013155},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700319,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Side_LaoZhe_2060082",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200301/20030103.20030103'",
              TalkType = "Impression",
              BlendInTime = 1,
              BlendOutTime = 0,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17515246843939467074"] = {
            key = "17515246843939467074",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1705.9614197553692, y = 385.10895099986834},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060082}
            }
          },
          ["17515246895699467312"] = {
            key = "17515246895699467312",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\177\161\231\167\189\228\185\139\229\156\176\232\190\185\231\188\152",
            pos = {x = 1024.2857142857142, y = 346.2857142857143},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060080,
              GuideType = "M",
              GuidePointName = "Mechanism_SideGod_2060080"
            }
          },
          ["17515247153199468125"] = {
            key = "17515247153199468125",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1294.2857142857142, y = 211.71428571428567},
            propsData = {
              NewDescription = "Description_200301_5",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["1751534892992835"] = {
      isStoryNode = true,
      key = "1751534892992835",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2237.377622377623, y = 455.7590326340327},
      propsData = {
        QuestId = 20030106,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200301_2",
        QuestDeatil = "Content_200301_2",
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
        SubRegionId = 104105,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SideGod_2060080"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1751534892992848",
            startPort = "Out",
            endQuest = "1751534892992841",
            endPort = "Success"
          },
          {
            startQuest = "1751534892992840",
            startPort = "QuestStart",
            endQuest = "1751534892992848",
            endPort = "In"
          }
        },
        nodeData = {
          ["1751534892992840"] = {
            key = "1751534892992840",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2090.3076923076924, y = 365.84615384615387},
            propsData = {ModeType = 0}
          },
          ["1751534892992841"] = {
            key = "1751534892992841",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2823.1730769230767, y = 338.3653846153846},
            propsData = {ModeType = 0}
          },
          ["1751534892992842"] = {
            key = "1751534892992842",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1751534892992848"] = {
            key = "1751534892992848",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2450.7138467939385, y = 354.15007227707446},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51100104,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200301/20030105.20030105'",
              TalkType = "QuestImpression",
              TalkStageName = "",
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
                  TalkActorId = 700319,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700318,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700319},
                {TalkActorType = "Npc", TalkActorId = 700318},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
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
