return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17217183020031",
      startPort = "StoryStart",
      endStory = "1721718367137243",
      endPort = "In"
    },
    {
      startStory = "1721718367137243",
      startPort = "Success",
      endStory = "17217183020045",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17217183020031"] = {
      isStoryNode = true,
      key = "17217183020031",
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
    ["17217183020045"] = {
      isStoryNode = true,
      key = "17217183020045",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1474.7826086956522, y = 262.17391304347825},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721718367137243"] = {
      isStoryNode = true,
      key = "1721718367137243",
      type = "StoryNode",
      name = "\228\184\142\229\163\171\229\133\181\229\175\185\232\175\157\228\191\174\230\156\186\229\133\179",
      pos = {x = 1108.6593406593408, y = 276.5934065934066},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityJianxiu_Des",
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
            startQuest = "1721718367137244",
            startPort = "QuestStart",
            endQuest = "1721718394849891",
            endPort = "In"
          },
          {
            startQuest = "1721718367137244",
            startPort = "QuestStart",
            endQuest = "17217184707692428",
            endPort = "In"
          },
          {
            startQuest = "17217201023419555",
            startPort = "Out",
            endQuest = "172172015502110563",
            endPort = "In"
          },
          {
            startQuest = "172172015502110563",
            startPort = "Out",
            endQuest = "172172067859712593",
            endPort = "In"
          },
          {
            startQuest = "172172015502110563",
            startPort = "Out",
            endQuest = "172172073119013430",
            endPort = "In"
          },
          {
            startQuest = "172172073119013430",
            startPort = "Out",
            endQuest = "172172078276514156",
            endPort = "In"
          },
          {
            startQuest = "172172073119013430",
            startPort = "Out",
            endQuest = "172172079701414449",
            endPort = "In"
          },
          {
            startQuest = "172172086324815577",
            startPort = "Out",
            endQuest = "172172110158917398",
            endPort = "In"
          },
          {
            startQuest = "172172128321419251",
            startPort = "Out",
            endQuest = "172172128894919453",
            endPort = "In"
          },
          {
            startQuest = "172172110158917398",
            startPort = "Out",
            endQuest = "1721718367138250",
            endPort = "Success"
          },
          {
            startQuest = "172172128894919453",
            startPort = "Out",
            endQuest = "1721718367138250",
            endPort = "Success"
          },
          {
            startQuest = "17217184707692428",
            startPort = "Out",
            endQuest = "17218750111354147",
            endPort = "In"
          },
          {
            startQuest = "172172108071016772",
            startPort = "Out",
            endQuest = "172172126917318875",
            endPort = "In"
          },
          {
            startQuest = "172172125526918491",
            startPort = "Out",
            endQuest = "172172128321419251",
            endPort = "In"
          },
          {
            startQuest = "172172078276514156",
            startPort = "Out",
            endQuest = "172172086324815577",
            endPort = "In"
          },
          {
            startQuest = "17217201023419555",
            startPort = "Out",
            endQuest = "172172081966914963",
            endPort = "In"
          },
          {
            startQuest = "17218750111354147",
            startPort = "Option_3",
            endQuest = "172197835903618950",
            endPort = "In"
          },
          {
            startQuest = "17218750111354147",
            startPort = "Option_1",
            endQuest = "172172095144816342",
            endPort = "In"
          },
          {
            startQuest = "17218750111354147",
            startPort = "Option_1",
            endQuest = "172172108071016772",
            endPort = "In"
          },
          {
            startQuest = "17218750111354147",
            startPort = "Option_2",
            endQuest = "17217201023419555",
            endPort = "In"
          },
          {
            startQuest = "172172108071016772",
            startPort = "Out",
            endQuest = "17235471948392145",
            endPort = "In"
          },
          {
            startQuest = "17235471948392145",
            startPort = "Out",
            endQuest = "172172125526918491",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721718367137244"] = {
            key = "1721718367137244",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721718367138250"] = {
            key = "1721718367138250",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4369.624674842065, y = 239.0932738758825},
            propsData = {ModeType = 0}
          },
          ["1721718367138256"] = {
            key = "1721718367138256",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1721718394849891"] = {
            key = "1721718394849891",
            type = "TalkNode",
            name = "\229\163\171\229\133\181\229\175\185\231\157\128\229\141\161\228\189\143\231\154\132\230\156\186\229\133\179\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1149.043956043956, y = 76.97802197802196},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001501,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17217184707692428"] = {
            key = "17217184707692428",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181\228\184\142\230\156\186\229\133\179",
            pos = {x = 1155.0354090354092, y = 293.9010989010989},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190715, 1190716}
            }
          },
          ["17217201023419555"] = {
            key = "17217201023419555",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 1862.0697191697193, y = 171.12545787545773},
            propsData = {
              StaticCreatorIdList = {1190716},
              ManualItemIdList = {},
              StateId = 780031,
              QuestId = 0
            }
          },
          ["172172015502110563"] = {
            key = "172172015502110563",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2159.3713064713056, y = 162.23656898656884},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190716,
              StateId = 780032,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172172067859712593"] = {
            key = "172172067859712593",
            type = "TalkNode",
            name = "\230\130\160\231\157\128\231\130\1851",
            pos = {x = 2563.8157509157504, y = -91.09676434676425},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001507,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172172073119013430"] = {
            key = "172172073119013430",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2565.7205128205123, y = 163.66514041514046},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190716,
              StateId = 780034,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172172078276514156"] = {
            key = "172172078276514156",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2930.482417582417, y = 161.12545787545787},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190716,
              StateId = 780036,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172172079701414449"] = {
            key = "172172079701414449",
            type = "TalkNode",
            name = "\230\130\160\231\157\128\231\130\1852",
            pos = {x = 2904.926862026861, y = -92.20787545787542},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001508,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172172081966914963"] = {
            key = "172172081966914963",
            type = "TalkNode",
            name = "\232\175\149\232\175\149\239\188\159",
            pos = {x = 2169.569719169718, y = -93.51739926739924},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001506,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172172086324815577"] = {
            key = "172172086324815577",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\229\165\150\229\138\177",
            pos = {x = 3576.0379731379717, y = 113.00045787545788},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190715",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001509,
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
          ["172172095144816342"] = {
            key = "172172095144816342",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\135\187\230\137\147\230\156\186\229\133\179",
            pos = {x = 1880.0375554270274, y = 391.2257085020244},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190716}
            }
          },
          ["172172108071016772"] = {
            key = "172172108071016772",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\167\163\229\175\134\230\156\186\229\133\179",
            pos = {x = 1873.0379731379714, y = 530.1095848595847},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190717}
            }
          },
          ["172172110158917398"] = {
            key = "172172110158917398",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3910.9586080586078, y = 100.80799755799762},
            propsData = {
              DialogueId = 71001509,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["172172125526918491"] = {
            key = "172172125526918491",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2526.037973137973, y = 352.23656898656907},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190717,
              StateId = 780042,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172172126917318875"] = {
            key = "172172126917318875",
            type = "TalkNode",
            name = "\230\132\159\232\176\162",
            pos = {x = 2529.0033411033396, y = 539.0150682650683},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001504,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172172128321419251"] = {
            key = "172172128321419251",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\229\165\150\229\138\177",
            pos = {x = 3202.0601953601945, y = 328.90323565323564},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190715",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001505,
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
          ["172172128894919453"] = {
            key = "172172128894919453",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3551.5935286935287, y = 318.9032356532356},
            propsData = {
              DialogueId = 71001505,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["17218750111354147"] = {
            key = "17218750111354147",
            type = "TalkNode",
            name = "\228\184\142\229\163\171\229\133\181\228\186\164\228\186\146\228\191\174\231\144\134",
            pos = {x = 1492.0285714285712, y = 296.05714285714276},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190715",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001502,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              NormalOptions = {
                {
                  OptionText = "710015031",
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = -1
                },
                {
                  OptionText = "710015032",
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710015033",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["172197835903618950"] = {
            key = "172197835903618950",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1877.6705626400983, y = 769.7254987603055},
            propsData = {UseTalkFadeOut = true, TalkFadeOutTime = 1}
          },
          ["17235471948392145"] = {
            key = "17235471948392145",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2262.717391304348, y = 355.1600790513833},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190717,
              StateId = 780040,
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
