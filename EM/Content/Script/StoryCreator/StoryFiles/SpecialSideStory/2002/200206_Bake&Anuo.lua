return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171271844790264878",
      startPort = "Success",
      endStory = "17141991237953238596",
      endPort = "StoryEnd"
    },
    {
      startStory = "171274608476014661",
      startPort = "Success",
      endStory = "171271837129763756",
      endPort = "In"
    },
    {
      startStory = "171271837129763756",
      startPort = "Success",
      endStory = "171271844790264878",
      endPort = "In"
    },
    {
      startStory = "171271831440062678",
      startPort = "Success",
      endStory = "1740577402456786302",
      endPort = "In"
    },
    {
      startStory = "1740577402456786302",
      startPort = "Success",
      endStory = "171274608476014661",
      endPort = "In"
    },
    {
      startStory = "17141991237953238595",
      startPort = "StoryStart",
      endStory = "17512708800921485",
      endPort = "In"
    },
    {
      startStory = "17512708800921485",
      startPort = "Success",
      endStory = "171273213042378637",
      endPort = "In"
    },
    {
      startStory = "171273213042378637",
      startPort = "Success",
      endStory = "171271831440062678",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["171271814750461454"] = {
      isStoryNode = true,
      key = "171271814750461454",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\233\133\146\233\166\134",
      pos = {x = 1158.0812963996786, y = 691.3964988041569},
      propsData = {
        QuestId = 20020604,
        QuestDescriptionComment = "\231\166\187\229\188\128\233\133\146\233\166\134",
        QuestDescription = "Description_200206_4",
        QuestDeatil = "Content_200206_4",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveTavern"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1712733435423102907",
            startPort = "Out",
            endQuest = "171271814750461460",
            endPort = "Success"
          },
          {
            startQuest = "171271814750461459",
            startPort = "QuestStart",
            endQuest = "1712733435423102907",
            endPort = "In"
          }
        },
        nodeData = {
          ["171271814750461459"] = {
            key = "171271814750461459",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 496.6666666666667, y = 310},
            propsData = {ModeType = 0}
          },
          ["171271814750461460"] = {
            key = "171271814750461460",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1060.5380952380951, y = 306.3333333333333},
            propsData = {ModeType = 0}
          },
          ["171271814750461461"] = {
            key = "171271814750461461",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1712733435423102907"] = {
            key = "1712733435423102907",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\233\133\146\233\166\134",
            pos = {x = 786.0520716854373, y = 293.6228847893423},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveTavern"
            }
          },
          ["17404640006801568736"] = {
            key = "17404640006801568736",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 752.4316512669516, y = 542.7583339666572},
            propsData = {
              AnswerIds = {200101}
            }
          }
        },
        commentData = {}
      }
    },
    ["171271831440062678"] = {
      isStoryNode = true,
      key = "171271831440062678",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\228\184\164\229\164\132\231\186\191\231\180\162",
      pos = {x = 1246.849395794096, y = 849.8533938843599},
      propsData = {
        QuestId = 20020605,
        QuestDescriptionComment = "\229\175\187\230\137\190\231\186\191\231\180\162",
        QuestDescription = "Description_200206_5",
        QuestDeatil = "Content_200206_5",
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
        StoryGuidePointName = "QuestArea_200206_2"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17406419627633911288",
            startPort = "Out",
            endQuest = "171274593498312684",
            endPort = "In"
          },
          {
            startQuest = "17406419627633911288",
            startPort = "Out",
            endQuest = "17406421953723913665",
            endPort = "In"
          },
          {
            startQuest = "171274593498312684",
            startPort = "Out",
            endQuest = "17406428899448601329",
            endPort = "Input"
          },
          {
            startQuest = "17406421953723913665",
            startPort = "Out",
            endQuest = "17406429215148601592",
            endPort = "Input"
          },
          {
            startQuest = "17406428324608600404",
            startPort = "Out",
            endQuest = "174064317467612505899",
            endPort = "In"
          },
          {
            startQuest = "17225985039912403190",
            startPort = "Out",
            endQuest = "171274593498312685",
            endPort = "In"
          },
          {
            startQuest = "171274593498312685",
            startPort = "Out",
            endQuest = "17407323222713916990",
            endPort = "In"
          },
          {
            startQuest = "17407323222713916990",
            startPort = "Out",
            endQuest = "17406419627633911288",
            endPort = "In"
          },
          {
            startQuest = "174073942888324276080",
            startPort = "Out",
            endQuest = "17225985039912403190",
            endPort = "In"
          },
          {
            startQuest = "171271831440062683",
            startPort = "QuestStart",
            endQuest = "174073942888324276080",
            endPort = "Input"
          },
          {
            startQuest = "17468660037404356",
            startPort = "Out",
            endQuest = "17468660397574864",
            endPort = "Input"
          },
          {
            startQuest = "17406428899448601329",
            startPort = "Out",
            endQuest = "17468671591776687",
            endPort = "Input"
          },
          {
            startQuest = "17406429215148601592",
            startPort = "Out",
            endQuest = "17468671619956819",
            endPort = "Input"
          },
          {
            startQuest = "17468671619956819",
            startPort = "Out",
            endQuest = "1747030998418862032",
            endPort = "In"
          },
          {
            startQuest = "17468671591776687",
            startPort = "Out",
            endQuest = "17406422599914694916",
            endPort = "In"
          },
          {
            startQuest = "17406422599914694916",
            startPort = "Out",
            endQuest = "17406420001293912228",
            endPort = "Branch_1"
          },
          {
            startQuest = "1747030998418862032",
            startPort = "Out",
            endQuest = "17406420001293912228",
            endPort = "Branch_2"
          },
          {
            startQuest = "17406426967577818662",
            startPort = "Out",
            endQuest = "17406428324608600404",
            endPort = "In"
          },
          {
            startQuest = "17406420001293912228",
            startPort = "Out",
            endQuest = "171271831440062684",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171271831440062683"] = {
            key = "171271831440062683",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -497.45762775708397, y = 523.0081353869398},
            propsData = {ModeType = 0}
          },
          ["171271831440062684"] = {
            key = "171271831440062684",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2036.417935105435, y = 542.3811441936442},
            propsData = {ModeType = 0}
          },
          ["171271831440062685"] = {
            key = "171271831440062685",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171274593498312684"] = {
            key = "171274593498312684",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 970.8230040314669, y = 389.8028788372408},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700091,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Clue01_1190402",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003101,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
          ["171274593498312685"] = {
            key = "171274593498312685",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\228\184\164\230\157\161\231\186\191\231\180\162\229\146\140\231\155\184\229\133\179NPC",
            pos = {x = 253.43884491335612, y = 520.6025394080012},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190402,
                1190403,
                1191151,
                1191152,
                1191153,
                1191156,
                1191157,
                1191163,
                1191205
              }
            }
          },
          ["17225985039912403190"] = {
            key = "17225985039912403190",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 9.653376246050165, y = 507.7380287531148},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestArea_200206_2"
            }
          },
          ["17406419627633911288"] = {
            key = "17406419627633911288",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 737.043453779867, y = 519.5309684684684},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_20020605_1",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_20020605_2",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["17406420001293912228"] = {
            key = "17406420001293912228",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 1754.2852491466624, y = 517.7609395109395},
            propsData = {
              InputBranchQuestNumber = 2,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["17406421953723913665"] = {
            key = "17406421953723913665",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 969.2900754014887, y = 610.2150900900899},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700092,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Clue02_1190403",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003103,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
          ["17406422599914694916"] = {
            key = "17406422599914694916",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\228\184\164\230\157\161\231\186\191\231\180\162",
            pos = {x = 1810.785869353164, y = 283.6788789840259},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190402}
            }
          },
          ["17406426967577818662"] = {
            key = "17406426967577818662",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2229.2334373069248, y = 389.0335745771116},
            propsData = {
              NewDescription = "Description_20020605_3",
              NewDetail = "Content_20020605_3",
              SubTaskTargetIndex = 0
            }
          },
          ["17406428324608600404"] = {
            key = "17406428324608600404",
            type = "HasDetectiveAnswerNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2500.9676406036274, y = 407.68055259908954},
            propsData = {
              AnswerIds = {200106}
            }
          },
          ["17406428899448601329"] = {
            key = "17406428899448601329",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 1220.6104977464854, y = 398.03769545623254},
            propsData = {
              AnswerIds = {200102}
            }
          },
          ["17406429215148601592"] = {
            key = "17406429215148601592",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 1220.5301406036283, y = 616.4751954562325},
            propsData = {
              AnswerIds = {200103, 200104}
            }
          },
          ["174064317467612505899"] = {
            key = "174064317467612505899",
            type = "TalkNode",
            name = "\229\190\151\229\135\186\230\142\168\231\144\134\231\187\147\232\174\186",
            pos = {x = 2810.074783460771, y = 394.55555259908965},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003104,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17407323222713916990"] = {
            key = "17407323222713916990",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 501.2067932067928, y = 506.5464535464535},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191162,
              GuideType = "P",
              GuidePointName = "QuestArea_200206_2"
            }
          },
          ["174073942888324276080"] = {
            key = "174073942888324276080",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = -239.12577160156482, y = 522.5800419584451},
            propsData = {
              AnswerIds = {200101}
            }
          },
          ["17468659940214184"] = {
            key = "17468659940214184",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 74.23919025289464, y = 171.1771141985277},
            propsData = {AnswerId = 0, AutoOpenDetectiveGameUI = false}
          },
          ["17468660037404356"] = {
            key = "17468660037404356",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = -460.1067399796634, y = 191.29339326829515},
            propsData = {
              QuestionIds = {2001},
              OpenToast = true
            }
          },
          ["17468660397574864"] = {
            key = "17468660397574864",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = -212.2724376540822, y = 173.3414905198808},
            propsData = {
              AnswerIds = {}
            }
          },
          ["17468671591776687"] = {
            key = "17468671591776687",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 1523.3320927952757, y = 290.2842802652356},
            propsData = {AnswerId = 200102, AutoOpenDetectiveGameUI = true}
          },
          ["17468671619956819"] = {
            key = "17468671619956819",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 1458.9593898679507, y = 755.3466128905936},
            propsData = {AnswerId = 200103, AutoOpenDetectiveGameUI = true}
          },
          ["1747030998418862032"] = {
            key = "1747030998418862032",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\228\184\164\230\157\161\231\186\191\231\180\162",
            pos = {x = 1770.420730468378, y = 768.6665594164832},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190403}
            }
          }
        },
        commentData = {}
      }
    },
    ["171271837129763756"] = {
      isStoryNode = true,
      key = "171271837129763756",
      type = "StoryNode",
      name = "\229\146\140\233\152\191\232\175\186\228\186\164\230\181\129",
      pos = {x = 1150.5779702427055, y = 1059.8944766767509},
      propsData = {
        QuestId = 20020607,
        QuestDescriptionComment = "\229\146\140\233\152\191\232\175\186\228\186\164\230\181\129",
        QuestDescription = "Description_200206_7",
        QuestDeatil = "Content_200206_7",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_NPC_Anuo_1190329"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "171271837129763761",
            startPort = "QuestStart",
            endQuest = "1712733480345104359",
            endPort = "In"
          },
          {
            startQuest = "1712733480345104359",
            startPort = "Out",
            endQuest = "171271837129763762",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171271837129763761"] = {
            key = "171271837129763761",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 600.7142857142857, y = 304.61538461538464},
            propsData = {ModeType = 0}
          },
          ["171271837129763762"] = {
            key = "171271837129763762",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1231.8285714285714, y = 303.39904443382704},
            propsData = {ModeType = 0}
          },
          ["171271837129763763"] = {
            key = "171271837129763763",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1712733480345104359"] = {
            key = "1712733480345104359",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 922.6790982820294, y = 312.1871147622679},
            propsData = {
              ImpressionTalkTriggerId = 510033,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_NPC_Anuo_1190329",
              GuideStaticCreatorId = 700080
            }
          }
        },
        commentData = {}
      }
    },
    ["171271844790264878"] = {
      isStoryNode = true,
      key = "171271844790264878",
      type = "StoryNode",
      name = "\229\146\140\229\183\180\229\133\139\228\186\164\230\181\129",
      pos = {x = 1409.4667162200346, y = 1110.6684913288543},
      propsData = {
        QuestId = 20020608,
        QuestDescriptionComment = "\229\134\141\230\172\161\229\146\140\229\183\180\229\133\139\228\186\164\230\181\129",
        QuestDescription = "Description_200206_8",
        QuestDeatil = "Content_200206_8",
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
        SubRegionId = 101107,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Bake"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "171271844790364883",
            startPort = "QuestStart",
            endQuest = "171274652454720323",
            endPort = "In"
          },
          {
            startQuest = "171274652454720323",
            startPort = "Out",
            endQuest = "171274677909321506",
            endPort = "In"
          },
          {
            startQuest = "171274677909321506",
            startPort = "Out",
            endQuest = "17135263466209159",
            endPort = "In"
          },
          {
            startQuest = "171352636733211679",
            startPort = "Out",
            endQuest = "171352638531814235",
            endPort = "In"
          },
          {
            startQuest = "171352638531814235",
            startPort = "Out",
            endQuest = "171352640478716812",
            endPort = "In"
          },
          {
            startQuest = "17135263466209159",
            startPort = "Out",
            endQuest = "171352636733211679",
            endPort = "In"
          },
          {
            startQuest = "171352640478716812",
            startPort = "Out",
            endQuest = "171274678812621836",
            endPort = "In"
          },
          {
            startQuest = "171274678812621836",
            startPort = "Out",
            endQuest = "171271844790364884",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171271844790364883"] = {
            key = "171271844790364883",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 682.8571428571429, y = 300.35714285714283},
            propsData = {ModeType = 0}
          },
          ["171271844790364884"] = {
            key = "171271844790364884",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2012.1560150375933, y = 337.8926119646944},
            propsData = {ModeType = 0}
          },
          ["171271844790364885"] = {
            key = "171271844790364885",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2004.3478260869565, y = 659.4565217391304},
            propsData = {}
          },
          ["171274652454720323"] = {
            key = "171274652454720323",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\229\142\187\233\133\146\233\166\134",
            pos = {x = 950.2017780936382, y = 305.52457628216945},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Tavern"
            }
          },
          ["171274677909321506"] = {
            key = "171274677909321506",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1188.701778093638, y = 305.52457628216945},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220081, 1220082}
            }
          },
          ["171274678812621836"] = {
            key = "171274678812621836",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1741.2188588389795, y = 474.7956252814793},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220081, 1220082}
            }
          },
          ["17135263466209159"] = {
            key = "17135263466209159",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1468.4653042609568, y = 290.1344025539679},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700102,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Bake_1220081",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51003401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_510034",
              BlendInTime = 1,
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700102,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700103,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700102},
                {TalkActorType = "Npc", TalkActorId = 700103},
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
          ["171352636733211679"] = {
            key = "171352636733211679",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 941.2770891579821, y = 452.50568401849875},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003402,
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
          ["171352638531814235"] = {
            key = "171352638531814235",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1194.4578671900185, y = 452.0937847049977},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003403,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_510034",
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700103,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700102,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700103},
                {TalkActorType = "Npc", TalkActorId = 700102},
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
          ["171352640478716812"] = {
            key = "171352640478716812",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1474.823999913131, y = 458.3409242930981},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003414,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
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
          }
        },
        commentData = {}
      }
    },
    ["171273213042378637"] = {
      isStoryNode = true,
      key = "171273213042378637",
      type = "StoryNode",
      name = "\228\184\142\229\183\180\229\133\139\228\186\164\230\181\129",
      pos = {x = 910.1204885567356, y = 867.7818536852931},
      propsData = {
        QuestId = 20020603,
        QuestDescriptionComment = "\228\184\142\229\183\180\229\133\139\228\186\164\230\181\129",
        QuestDescription = "Description_200206_3",
        QuestDeatil = "Content_200206_3",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Bake_1220036"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "171273213042378641",
            startPort = "QuestStart",
            endQuest = "171273213042378644",
            endPort = "In"
          },
          {
            startQuest = "171273213042378644",
            startPort = "Out",
            endQuest = "17412508470392905887",
            endPort = "Input"
          },
          {
            startQuest = "17412508470392905887",
            startPort = "Out",
            endQuest = "171273213042378642",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171273213042378641"] = {
            key = "171273213042378641",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171273213042378642"] = {
            key = "171273213042378642",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1578.768472906404, y = 301.42857142857144},
            propsData = {ModeType = 0}
          },
          ["171273213042378643"] = {
            key = "171273213042378643",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1295.7142857142858, y = 450.7881773399015},
            propsData = {}
          },
          ["171273213042378644"] = {
            key = "171273213042378644",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1041.991678364336, y = 301.8094127093055},
            propsData = {
              ImpressionTalkTriggerId = 510030,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Bake_1220036",
              GuideStaticCreatorId = 700015
            }
          },
          ["17412508470392905887"] = {
            key = "17412508470392905887",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 1301.3507184898333, y = 300.1508620689656},
            propsData = {
              QuestionIds = {2001},
              OpenToast = true
            }
          }
        },
        commentData = {}
      }
    },
    ["171274608476014661"] = {
      isStoryNode = true,
      key = "171274608476014661",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\173\140\229\137\167\233\153\162\233\153\132\232\191\145",
      pos = {x = 909.9577620925611, y = 1055.8128799698377},
      propsData = {
        QuestId = 20020606,
        QuestDescriptionComment = "\229\175\187\230\137\190\231\186\191\231\180\162",
        QuestDescription = "Description_200206_6",
        QuestDeatil = "Content_200206_6",
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
        StoryGuidePointName = "QuestArea_200206_1"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17407329098547830835",
            startPort = "Out",
            endQuest = "17407329098547830834",
            endPort = "In"
          },
          {
            startQuest = "17407329098547830835",
            startPort = "Out",
            endQuest = "17407329098547830837",
            endPort = "In"
          },
          {
            startQuest = "17407329098547830834",
            startPort = "Out",
            endQuest = "17407329098547830838",
            endPort = "Input"
          },
          {
            startQuest = "17407329098547830837",
            startPort = "Out",
            endQuest = "17407329098547830839",
            endPort = "Input"
          },
          {
            startQuest = "17407329098547830838",
            startPort = "Out",
            endQuest = "17407329098547830836",
            endPort = "Branch_1"
          },
          {
            startQuest = "17407329098547830839",
            startPort = "Out",
            endQuest = "17407329098547830836",
            endPort = "Branch_2"
          },
          {
            startQuest = "17407329098547830835",
            startPort = "Out",
            endQuest = "174073357375913309680",
            endPort = "In"
          },
          {
            startQuest = "174073357375913309680",
            startPort = "Out",
            endQuest = "174073357802313309816",
            endPort = "Input"
          },
          {
            startQuest = "174073357802313309816",
            startPort = "Out",
            endQuest = "17407329098547830836",
            endPort = "Branch_3"
          },
          {
            startQuest = "17407329098547830836",
            startPort = "Out",
            endQuest = "174073377667114093929",
            endPort = "In"
          },
          {
            startQuest = "174073377667114093929",
            startPort = "Out",
            endQuest = "174073404419516442992",
            endPort = "In"
          },
          {
            startQuest = "174073404419516442992",
            startPort = "Out",
            endQuest = "174073383825915659875",
            endPort = "In"
          },
          {
            startQuest = "17407329098547830840",
            startPort = "Out",
            endQuest = "174073421992818009514",
            endPort = "In"
          },
          {
            startQuest = "174073421992818009514",
            startPort = "Out",
            endQuest = "17407329098547830835",
            endPort = "In"
          },
          {
            startQuest = "174073383825915659875",
            startPort = "Out",
            endQuest = "171274608476014666",
            endPort = "Success"
          },
          {
            startQuest = "171274608476014665",
            startPort = "QuestStart",
            endQuest = "17407329098547830840",
            endPort = "In"
          },
          {
            startQuest = "17407329098547830838",
            startPort = "Out",
            endQuest = "17468673319199068",
            endPort = "Input"
          },
          {
            startQuest = "174073357802313309816",
            startPort = "Out",
            endQuest = "17468673422459510",
            endPort = "Input"
          },
          {
            startQuest = "17407329098547830839",
            startPort = "Out",
            endQuest = "17468673418279483",
            endPort = "Input"
          },
          {
            startQuest = "174073404419516442992",
            startPort = "Out",
            endQuest = "17468749991092538013",
            endPort = "In"
          },
          {
            startQuest = "17468749991092538013",
            startPort = "Out",
            endQuest = "17468749903662537808",
            endPort = "In"
          }
        },
        nodeData = {
          ["171274608476014665"] = {
            key = "171274608476014665",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 134.96937487477453, y = 501.55564015227407},
            propsData = {ModeType = 0}
          },
          ["171274608476014666"] = {
            key = "171274608476014666",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2864.825409497779, y = 542.2349528296234},
            propsData = {ModeType = 0}
          },
          ["171274608476014667"] = {
            key = "171274608476014667",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2842.280184331798, y = 724.8516129032257},
            propsData = {}
          },
          ["17225990693852725090"] = {
            key = "17225990693852725090",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 373.701540681022, y = 286.72166742149454},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestArea_200206_1"
            }
          },
          ["17407329098547830834"] = {
            key = "17407329098547830834",
            type = "TalkNode",
            name = "\229\146\140\229\183\180\229\133\139\229\175\185\232\175\157",
            pos = {x = 1328.8750557495862, y = 381.3856682510404},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700080,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_NPC_Anuo_1190329",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51003111,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
          ["17407329098547830835"] = {
            key = "17407329098547830835",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 1080.5793764657285, y = 517.887951430655},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_20020606_2",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_20020606_3",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_20020606_4",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["17407329098547830836"] = {
            key = "17407329098547830836",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 1856.5769322011874, y = 512.0050192473196},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["17407329098547830837"] = {
            key = "17407329098547830837",
            type = "TalkNode",
            name = "\229\146\140\233\134\137\230\177\137\229\175\185\232\175\157",
            pos = {x = 1324.4389013131563, y = 530.184976278083},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700218,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_SSS_BakeDrunk_1191152",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51003115,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
          ["17407329098547830838"] = {
            key = "17407329098547830838",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 1577.2800609853423, y = 380.39237427095384},
            propsData = {
              AnswerIds = {200105}
            }
          },
          ["17407329098547830839"] = {
            key = "17407329098547830839",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 1575.9969388655265, y = 538.173192243304},
            propsData = {
              AnswerIds = {200107}
            }
          },
          ["17407329098547830840"] = {
            key = "17407329098547830840",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 594.3639978365168, y = 501.86363759787343},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191154,
              GuideType = "P",
              GuidePointName = "QuestArea_200206_1"
            }
          },
          ["174073357375913309680"] = {
            key = "174073357375913309680",
            type = "TalkNode",
            name = "\229\146\140\229\176\143\229\165\179\229\173\169\229\175\185\232\175\157",
            pos = {x = 1320.632174277336, y = 675.2609970674489},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700215,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_SSS_BakeGirl_1191153",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51003117,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700219,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700219}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174073357802313309816"] = {
            key = "174073357802313309816",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 1573.73125261835, y = 686.1135316296608},
            propsData = {
              AnswerIds = {200108}
            }
          },
          ["174073377667114093929"] = {
            key = "174073377667114093929",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2102.6140148158315, y = 538.2691457735812},
            propsData = {
              NewDescription = "Description_20020606_5",
              NewDetail = "Content_20020606_5",
              SubTaskTargetIndex = 0
            }
          },
          ["174073383825915659875"] = {
            key = "174073383825915659875",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2600.3216589861763, y = 542.8589861751153},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191156, 1191157}
            }
          },
          ["174073404419516442992"] = {
            key = "174073404419516442992",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 2352.1027230833697, y = 542.24975096588},
            propsData = {
              ResultIds = {20010101}
            }
          },
          ["174073421992818009514"] = {
            key = "174073421992818009514",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 827.5990783410152, y = 518.2396313364056},
            propsData = {
              NewDescription = "Description_20020606_1",
              NewDetail = "Content_20020606_5",
              SubTaskTargetIndex = 0
            }
          },
          ["17468673319199068"] = {
            key = "17468673319199068",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 1870.5533554707495, y = 313.16100141237644},
            propsData = {AnswerId = 200105, AutoOpenDetectiveGameUI = true}
          },
          ["17468673418279483"] = {
            key = "17468673418279483",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 1860.558994266316, y = 706.8440771086102},
            propsData = {AnswerId = 200107, AutoOpenDetectiveGameUI = true}
          },
          ["17468673422459510"] = {
            key = "17468673422459510",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 1844.769520582105, y = 865.8277431703161},
            propsData = {AnswerId = 200108, AutoOpenDetectiveGameUI = true}
          },
          ["17468749903662537808"] = {
            key = "17468749903662537808",
            type = "TalkNode",
            name = "\229\190\151\229\135\186\230\142\168\231\144\134\231\187\147\232\174\186",
            pos = {x = 2708.6409072107735, y = 302.2155003671374},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003113,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17468749991092538013"] = {
            key = "17468749991092538013",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2349.9566966844577, y = 299.05760563029514},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["17141991237953238595"] = {
      isStoryNode = true,
      key = "17141991237953238595",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 645.0156062557043, y = 879.2158286541161},
      propsData = {QuestChainId = 200206},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991237953238596"] = {
      isStoryNode = true,
      key = "17141991237953238596",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1658.2037625648827, y = 1147.1140776166887},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1740577402456786302"] = {
      isStoryNode = true,
      key = "1740577402456786302",
      type = "StoryNode",
      name = "\229\146\140\229\183\180\229\133\139\231\154\132\233\130\187\229\177\133\229\175\185\232\175\157",
      pos = {x = 1659.4972926679998, y = 875.5613910698471},
      propsData = {
        QuestId = 20020609,
        QuestDescriptionComment = "\229\175\187\230\137\190\231\186\191\231\180\162",
        QuestDescription = "Description_20020605_3",
        QuestDeatil = "Content_20020605_3",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_SSS_BakeNeighbour_1191151"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1740577402456786310",
            startPort = "Out",
            endQuest = "1740577402456786308",
            endPort = "Success"
          },
          {
            startQuest = "17479013120679786472",
            startPort = "Out",
            endQuest = "1740577402456786310",
            endPort = "In"
          },
          {
            startQuest = "1740577402456786307",
            startPort = "QuestStart",
            endQuest = "17479013120679786473",
            endPort = "In"
          },
          {
            startQuest = "17479013120679786473",
            startPort = "Out",
            endQuest = "17601869652682209",
            endPort = "In"
          },
          {
            startQuest = "17601869652682209",
            startPort = "true",
            endQuest = "17601869723162329",
            endPort = "In"
          },
          {
            startQuest = "17601869652682209",
            startPort = "true",
            endQuest = "17479013120679786474",
            endPort = "In"
          },
          {
            startQuest = "17601869652682209",
            startPort = "false",
            endQuest = "17479013120679786472",
            endPort = "In"
          },
          {
            startQuest = "17601869652682209",
            startPort = "true",
            endQuest = "17479013120679786472",
            endPort = "In"
          }
        },
        nodeData = {
          ["1740577402456786307"] = {
            key = "1740577402456786307",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 188.61118012422355, y = 536.8608005521049},
            propsData = {ModeType = 0}
          },
          ["1740577402456786308"] = {
            key = "1740577402456786308",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.2486370892443, y = 711.9496701906569},
            propsData = {ModeType = 0}
          },
          ["1740577402456786309"] = {
            key = "1740577402456786309",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1740577402456786310"] = {
            key = "1740577402456786310",
            type = "TalkNode",
            name = "\229\146\140\229\183\180\229\133\139\231\154\132\233\130\187\229\177\133\229\175\185\232\175\157",
            pos = {x = 1158.454348154746, y = 724.6809561411957},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700213,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_SSS_BakeNeighbour_1191151",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003105,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
          ["17479013120679786472"] = {
            key = "17479013120679786472",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 911.6679404834294, y = 721.8721697254305},
            propsData = {
              NewDescription = "Description_200206_9",
              NewDetail = "Content_200206_9",
              SubTaskTargetIndex = 0
            }
          },
          ["17479013120679786473"] = {
            key = "17479013120679786473",
            type = "HasDetectiveAnswerNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 446.20504283303126, y = 537.2815351347958},
            propsData = {
              AnswerIds = {200106}
            }
          },
          ["17479013120679786474"] = {
            key = "17479013120679786474",
            type = "TalkNode",
            name = "\229\190\151\229\135\186\230\142\168\231\144\134\231\187\147\232\174\186",
            pos = {x = 1003.4571653472511, y = 513.8674658235492},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003104,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17601869652682209"] = {
            key = "17601869652682209",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\233\166\150\230\172\161\230\142\168\231\144\134\229\174\140\230\136\144",
            pos = {x = 691.1944444444446, y = 519.263888888889},
            propsData = {
              FunctionName = "Equal",
              VarName = "BakeInferenceFinish",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17601869723162329"] = {
            key = "17601869723162329",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 946.5349462365593, y = 364.2459677419357},
            propsData = {
              VarName = "BakeInferenceFinish",
              VarValue = 1
            }
          }
        },
        commentData = {}
      }
    },
    ["17512708800921485"] = {
      isStoryNode = true,
      key = "17512708800921485",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 769.0832386004802, y = 550.0963581229697},
      propsData = {
        QuestId = 20020600,
        QuestDescriptionComment = "",
        SubRegionId = 101107,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Kamila_1220002"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512708800931493",
            startPort = "Option_1",
            endQuest = "17512708800931494",
            endPort = "In"
          },
          {
            startQuest = "17512708800931493",
            startPort = "Fail",
            endQuest = "17512708800931495",
            endPort = "In"
          },
          {
            startQuest = "17512708800931489",
            startPort = "QuestStart",
            endQuest = "17512708800931496",
            endPort = "In"
          },
          {
            startQuest = "17512708800931496",
            startPort = "Out",
            endQuest = "17512708800931490",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17512708800931489"] = {
            key = "17512708800931489",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512708800931490"] = {
            key = "17512708800931490",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2287.8571428571427, y = 269.9142857142857},
            propsData = {ModeType = 0}
          },
          ["17512708800931491"] = {
            key = "17512708800931491",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1639.953917050691, y = 405.8352534562212},
            propsData = {
              SideQuestChainId = 200206,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512708800931492"] = {
            key = "17512708800931492",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2289.5557522763406, y = 424.16642578407294},
            propsData = {}
          },
          ["17512708800931493"] = {
            key = "17512708800931493",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1419.833042637943, y = 779.67372083257},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200003,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Kamila_1220002",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002901,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0,
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
              OptionType = "check",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              CheckOptions = {
                {
                  OptionText = "510029101",
                  CheckId = 1019,
                  NotCheck = false,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17512708800931494"] = {
            key = "17512708800931494",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1680.175277535532, y = 720.7477211838375},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002912,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
          ["17512708800931495"] = {
            key = "17512708800931495",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1745.5149197445025, y = 884.2426654410322},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002911,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
          ["17512708800931496"] = {
            key = "17512708800931496",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1466.2818517365388, y = 276.0542534746696},
            propsData = {
              ImpressionTalkTriggerId = 510029,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Kamila_1220002",
              GuideStaticCreatorId = 200003
            }
          },
          ["17512708800931497"] = {
            key = "17512708800931497",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1146.292857142857, y = 169.44285714285695},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1220166,
              GuideType = "M",
              GuidePointName = "Mechanism_20020600_1220166"
            }
          },
          ["17512708800931498"] = {
            key = "17512708800931498",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2025.042857142857, y = 503.19285714285706},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NewTargetPoint20020600Fail",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
