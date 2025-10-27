return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17262133751511",
      startPort = "StoryStart",
      endStory = "1726213396578199",
      endPort = "In"
    },
    {
      startStory = "1726213396578199",
      startPort = "Success",
      endStory = "17262133751525",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17262133751511"] = {
      isStoryNode = true,
      key = "17262133751511",
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
    ["17262133751525"] = {
      isStoryNode = true,
      key = "17262133751525",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1465.5357142857142, y = 289.82142857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1726213396578199"] = {
      isStoryNode = true,
      key = "1726213396578199",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\232\186\171\230\137\139",
      pos = {x = 1135.1344001715522, y = 284.028252449305},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_KuangkengTestskill_Des",
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
            startQuest = "1726213396578200",
            startPort = "QuestStart",
            endQuest = "17262135608091109",
            endPort = "In"
          },
          {
            startQuest = "1726213396578200",
            startPort = "QuestStart",
            endQuest = "17262136826741451",
            endPort = "In"
          },
          {
            startQuest = "17262135608091109",
            startPort = "Out",
            endQuest = "17262150429422848",
            endPort = "In"
          },
          {
            startQuest = "17262150429422848",
            startPort = "Option_1",
            endQuest = "17262151946634289",
            endPort = "In"
          },
          {
            startQuest = "17262150429422848",
            startPort = "Option_1",
            endQuest = "17262155573707542",
            endPort = "In"
          },
          {
            startQuest = "17262155573707542",
            startPort = "Out",
            endQuest = "17262155688677825",
            endPort = "In"
          },
          {
            startQuest = "17262154846416770",
            startPort = "Out",
            endQuest = "17262171556559576",
            endPort = "In"
          },
          {
            startQuest = "172621729332911595",
            startPort = "Out",
            endQuest = "172621730819211893",
            endPort = "In"
          },
          {
            startQuest = "172621726272911179",
            startPort = "Out",
            endQuest = "172621731408912154",
            endPort = "In"
          },
          {
            startQuest = "172621730819211893",
            startPort = "Out",
            endQuest = "1726213396578207",
            endPort = "Success"
          },
          {
            startQuest = "172621731408912154",
            startPort = "Out",
            endQuest = "1726213396578207",
            endPort = "Success"
          },
          {
            startQuest = "17262150429422848",
            startPort = "Option_1",
            endQuest = "17262989448088239",
            endPort = "In"
          },
          {
            startQuest = "17262989448088239",
            startPort = "Out",
            endQuest = "17262154846416770",
            endPort = "In"
          },
          {
            startQuest = "17262998000359650",
            startPort = "Out",
            endQuest = "17262998000359651",
            endPort = "In"
          },
          {
            startQuest = "17262998000359651",
            startPort = "Out",
            endQuest = "172621729332911595",
            endPort = "In"
          },
          {
            startQuest = "172629983228810490",
            startPort = "Out",
            endQuest = "172629983228810491",
            endPort = "In"
          },
          {
            startQuest = "172629983228810491",
            startPort = "Out",
            endQuest = "172621726272911179",
            endPort = "In"
          },
          {
            startQuest = "17262171556559576",
            startPort = "Out",
            endQuest = "172630073139912349",
            endPort = "In"
          },
          {
            startQuest = "17262154846416770",
            startPort = "Out",
            endQuest = "172664758436113984",
            endPort = "In"
          },
          {
            startQuest = "172664758436113984",
            startPort = "TimerRange_2",
            endQuest = "172629983228810490",
            endPort = "In"
          },
          {
            startQuest = "172664758436113984",
            startPort = "TimerRange_1",
            endQuest = "17262998000359650",
            endPort = "In"
          },
          {
            startQuest = "172630073139912349",
            startPort = "Out",
            endQuest = "172664758436113984",
            endPort = "Stop"
          },
          {
            startQuest = "17262150429422848",
            startPort = "Option_2",
            endQuest = "172681764325810241",
            endPort = "In"
          },
          {
            startQuest = "17262150429422848",
            startPort = "Option_1",
            endQuest = "172681765909010713",
            endPort = "In"
          },
          {
            startQuest = "172664758436113984",
            startPort = "TimerRange_1",
            endQuest = "172681802152211370",
            endPort = "In"
          },
          {
            startQuest = "172664758436113984",
            startPort = "TimerRange_2",
            endQuest = "172681802152211370",
            endPort = "In"
          },
          {
            startQuest = "17262154846416770",
            startPort = "Out",
            endQuest = "1743594753950517124",
            endPort = "In"
          },
          {
            startQuest = "1743594753950517124",
            startPort = "Out",
            endQuest = "172664758436113984",
            endPort = "Stop"
          }
        },
        nodeData = {
          ["1726213396578200"] = {
            key = "1726213396578200",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1726213396578207"] = {
            key = "1726213396578207",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4838.896825396826, y = 59.33333333333326},
            propsData = {ModeType = 0}
          },
          ["1726213396578214"] = {
            key = "1726213396578214",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3390, y = 1040},
            propsData = {}
          },
          ["17262135608091109"] = {
            key = "17262135608091109",
            type = "ChangeStaticCreatorNode",
            name = "NPC\228\184\142\230\156\186\229\133\179",
            pos = {x = 1153.178549649525, y = 299.97338265449685},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310047, 1310046}
            }
          },
          ["17262136826741451"] = {
            key = "17262136826741451",
            type = "TalkNode",
            name = "NPC\229\188\128\232\189\166",
            pos = {x = 1156.392835363811, y = 113.5448112259255},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002301,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17262150429422848"] = {
            key = "17262150429422848",
            type = "TalkNode",
            name = "NPC\229\175\185\232\175\157\233\128\137\233\161\185",
            pos = {x = 1488.5753750463498, y = 263.6638588449732},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1310047",
              DelayShowGuideTime = 0,
              FirstDialogueId = 71002302,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {
                {
                  OptionText = "710023031",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                },
                {
                  OptionText = "710023032",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17262151946634289"] = {
            key = "17262151946634289",
            type = "TalkNode",
            name = "NPC\229\188\128\229\144\175\230\156\186\229\133\179\229\188\128\232\189\166",
            pos = {x = 1801.5531528241274, y = -4.869474488360176},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002304,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17262154846416770"] = {
            key = "17262154846416770",
            type = "SwitchMechanismStateNode",
            name = "\230\156\186\229\133\179\229\188\128\229\144\175-\230\191\128\229\133\137",
            pos = {x = 2037.3420417130158, y = 272.6749699560843},
            propsData = {
              StaticCreatorIdList = {1310046},
              ManualItemIdList = {},
              StateId = 3902400,
              QuestId = 0
            }
          },
          ["17262155573707542"] = {
            key = "17262155573707542",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\171\152\231\169\186NPC",
            pos = {x = 1814.1309306019052, y = -191.89169671058235},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310048}
            }
          },
          ["17262155688677825"] = {
            key = "17262155688677825",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\156\176\228\184\139NPC",
            pos = {x = 2061.908708379683, y = -190.78058559947124},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310047}
            }
          },
          ["17262171556559576"] = {
            key = "17262171556559576",
            type = "WaitingMechanismEnterStateNode",
            name = "\230\163\128\230\181\139\230\156\186\229\133\179\231\138\182\230\128\129-\230\156\186\229\133\179\230\191\128\230\180\187",
            pos = {x = 2311.2546679756397, y = 286.08305076416525},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1310046,
              StateId = 3902400,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172621726272911179"] = {
            key = "172621726272911179",
            type = "TalkNode",
            name = "\230\156\170\229\143\151\228\188\164\229\175\185\232\175\157",
            pos = {x = 4130.44997822095, y = 382.16941440052904},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1310047",
              DelayShowGuideTime = 0,
              FirstDialogueId = 71002305,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172621729332911595"] = {
            key = "172621729332911595",
            type = "TalkNode",
            name = "\229\143\151\228\188\164\229\175\185\232\175\157",
            pos = {x = 4131.583311554283, y = -86.9750300439155},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1310047",
              DelayShowGuideTime = 0,
              FirstDialogueId = 71002306,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172621730819211893"] = {
            key = "172621730819211893",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4539.416644887617, y = -80.47503004391555},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["172621731408912154"] = {
            key = "172621731408912154",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4534.661089332061, y = 397.43608106719563},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17262989448088239"] = {
            key = "17262989448088239",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1781.6275475421935, y = 280.7344779676279},
            propsData = {WaitTime = 5}
          },
          ["17262998000359650"] = {
            key = "17262998000359650",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\171\152\231\169\186NPC",
            pos = {x = 3359.775004687134, y = -61.33274806847667},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310048}
            }
          },
          ["17262998000359651"] = {
            key = "17262998000359651",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\156\176\228\184\139NPC",
            pos = {x = 3748.4559056575085, y = -78.62953169420769},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310047}
            }
          },
          ["172629983228810490"] = {
            key = "172629983228810490",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\171\152\231\169\186NPC",
            pos = {x = 3366.6871504361216, y = 408.7356729841549},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310048}
            }
          },
          ["172629983228810491"] = {
            key = "172629983228810491",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\156\176\228\184\139NPC",
            pos = {x = 3716.6559056575084, y = 394.7704683057923},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310047}
            }
          },
          ["172630073139912349"] = {
            key = "172630073139912349",
            type = "WaitingMechanismEnterStateNode",
            name = "\230\156\186\229\133\179\229\133\179\233\151\173-\230\156\186\229\133\179\229\188\128\229\144\175\230\151\182\233\151\180\231\187\147\230\157\159",
            pos = {x = 2560.4625979676057, y = 294.9634164204796},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1310046,
              StateId = 3902401,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172664758436113984"] = {
            key = "172664758436113984",
            type = "TimerBranchNode",
            name = "\232\174\161\230\151\182\229\153\168",
            pos = {x = 3027.3541960312946, y = 254.00476237176014},
            propsData = {
              TimerRange = {
                {StartTime = 0, EndTime = 14.9},
                {StartTime = 14.9, EndTime = -1}
              }
            }
          },
          ["172681764325810241"] = {
            key = "172681764325810241",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1755.6272068511191, y = 672.5775268210053},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["172681765909010713"] = {
            key = "172681765909010713",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186\230\176\148\229\162\153",
            pos = {x = 1815.6272068511191, y = -390.62247317899465},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310052}
            }
          },
          ["172681802152211370"] = {
            key = "172681802152211370",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\169\186\230\176\148\229\162\153",
            pos = {x = 3509.627206851119, y = 201.26629023150804},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310052}
            }
          },
          ["1743594753950517124"] = {
            key = "1743594753950517124",
            type = "WaitingMechanismEnterStateNode",
            name = "\230\156\186\229\133\179\229\133\179\233\151\173-\232\167\146\232\137\178\229\143\151\229\135\187",
            pos = {x = 2551.166666666667, y = 71.50000000000006},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1310046,
              StateId = 3902402,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
