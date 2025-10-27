return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171569144991191",
      startPort = "StoryStart",
      endStory = "1715691453193136",
      endPort = "In"
    },
    {
      startStory = "1715691453193136",
      startPort = "Success",
      endStory = "171569144991194",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171569144991191"] = {
      isStoryNode = true,
      key = "171569144991191",
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
    ["171569144991194"] = {
      isStoryNode = true,
      key = "171569144991194",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1978, y = 354},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1715691453193136"] = {
      isStoryNode = true,
      key = "1715691453193136",
      type = "StoryNode",
      name = "\229\150\130\231\140\171",
      pos = {x = 1382, y = 322},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityCat_Des",
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
            startQuest = "1715691459118425",
            startPort = "Out",
            endQuest = "17156917380651005",
            endPort = "In"
          },
          {
            startQuest = "1715691453193137",
            startPort = "QuestStart",
            endQuest = "17156919054002074",
            endPort = "In"
          },
          {
            startQuest = "17156919054002074",
            startPort = "Out",
            endQuest = "1715691459118425",
            endPort = "In"
          },
          {
            startQuest = "17156918800071843",
            startPort = "Out",
            endQuest = "17156929075144954",
            endPort = "In"
          },
          {
            startQuest = "17156929075144954",
            startPort = "Out",
            endQuest = "171569331151411139",
            endPort = "In"
          },
          {
            startQuest = "171569331151411139",
            startPort = "Out",
            endQuest = "17173824485852897",
            endPort = "In"
          },
          {
            startQuest = "17156917380651005",
            startPort = "Option_1",
            endQuest = "17156918800071843",
            endPort = "In"
          },
          {
            startQuest = "172103665524710696",
            startPort = "Out",
            endQuest = "172103676512011795",
            endPort = "In"
          },
          {
            startQuest = "172103676512011795",
            startPort = "Out",
            endQuest = "172103678380012285",
            endPort = "In"
          },
          {
            startQuest = "17210340765524620",
            startPort = "Out",
            endQuest = "17213870372102792",
            endPort = "In"
          },
          {
            startQuest = "17156917380651005",
            startPort = "Option_2",
            endQuest = "17213865207671169",
            endPort = "In"
          },
          {
            startQuest = "17213865207671169",
            startPort = "Out",
            endQuest = "1721451472167856",
            endPort = "In"
          },
          {
            startQuest = "1721451472167856",
            startPort = "Out",
            endQuest = "17210353525025752",
            endPort = "In"
          },
          {
            startQuest = "17213870372102792",
            startPort = "Out",
            endQuest = "17214568526422386",
            endPort = "In"
          },
          {
            startQuest = "17214568880553729",
            startPort = "Out",
            endQuest = "17214568880553730",
            endPort = "In"
          },
          {
            startQuest = "17210365735059258",
            startPort = "Out",
            endQuest = "17214568880553729",
            endPort = "In"
          },
          {
            startQuest = "17214568880553730",
            startPort = "Out",
            endQuest = "172103663043210325",
            endPort = "In"
          },
          {
            startQuest = "172103678380012285",
            startPort = "Out",
            endQuest = "1715691453193143",
            endPort = "Success"
          },
          {
            startQuest = "17156917380651005",
            startPort = "Option_3",
            endQuest = "17220737219235212",
            endPort = "In"
          },
          {
            startQuest = "17173824485852897",
            startPort = "Out",
            endQuest = "1715691453193143",
            endPort = "Success"
          },
          {
            startQuest = "1721451472167856",
            startPort = "Out",
            endQuest = "17210340765524620",
            endPort = "In"
          },
          {
            startQuest = "17214568526422386",
            startPort = "Out",
            endQuest = "17210354719227627",
            endPort = "In"
          },
          {
            startQuest = "17214568526422386",
            startPort = "Out",
            endQuest = "17210365735059258",
            endPort = "In"
          },
          {
            startQuest = "17214568880553730",
            startPort = "Out",
            endQuest = "172103665524710696",
            endPort = "In"
          }
        },
        nodeData = {
          ["1715691453193137"] = {
            key = "1715691453193137",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 393.3333333333333, y = 305},
            propsData = {ModeType = 0}
          },
          ["1715691453193143"] = {
            key = "1715691453193143",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3691.895093337885, y = 571.8367622715446},
            propsData = {ModeType = 0}
          },
          ["1715691453193149"] = {
            key = "1715691453193149",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3886.1270396270397, y = 1207.1993006993002},
            propsData = {}
          },
          ["1715691459118425"] = {
            key = "1715691459118425",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1066.8235294117646, y = 278.44367706596813},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000000,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17156917380651005"] = {
            key = "17156917380651005",
            type = "TalkNode",
            name = "\229\146\140\231\140\171\229\175\185\232\175\157",
            pos = {x = 1380.052036199095, y = 271.8924847530986},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190435",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 71000100,
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
                  OptionText = "710001001",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                },
                {
                  OptionText = "710001002",
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710001003",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17156918800071843"] = {
            key = "17156918800071843",
            type = "TalkNode",
            name = "\229\146\140\229\149\134\228\186\1861\229\175\185\232\175\157",
            pos = {x = 1752.5303030303044, y = 279.77056277056283},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700107,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_LuRenMaiCai2_1190527",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000200,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17156919054002074"] = {
            key = "17156919054002074",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\229\135\186800002",
            pos = {x = 780.0877192982456, y = 296.9523809523809},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190435}
            }
          },
          ["17156929075144954"] = {
            key = "17156929075144954",
            type = "TalkNode",
            name = "\229\146\140\229\149\134\228\186\1862\229\175\185\232\175\157",
            pos = {x = 2068.089748463571, y = 277.4054914193363},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700106,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_LuRenMaiCai_1190528",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000210,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171569331151411139"] = {
            key = "171569331151411139",
            type = "TalkNode",
            name = "\229\146\140\231\140\171\229\175\185\232\175\157",
            pos = {x = 2475.6721500504077, y = 290.49472572604463},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190435",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 71000220,
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
          ["17173824485852897"] = {
            key = "17173824485852897",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2858, y = 292},
            propsData = {
              DialogueId = 71000220,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["17210340765524620"] = {
            key = "17210340765524620",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2524.5368547356534, y = 610.7719694493148},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190683,
              GuideType = "M",
              GuidePointName = "Mechanism_DynTrigger_1190683"
            }
          },
          ["17210353525025752"] = {
            key = "17210353525025752",
            type = "TalkNode",
            name = "\231\140\171\229\136\176\232\190\190",
            pos = {x = 2529.1135089671407, y = 445.9941008648101},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000300,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17210354719227627"] = {
            key = "17210354719227627",
            type = "TalkNode",
            name = "\231\140\171\229\136\176\232\190\190",
            pos = {x = 2498.441603019406, y = 740.0664284228357},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000310,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17210365735059258"] = {
            key = "17210365735059258",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2495.9858576777924, y = 891.1937576153822},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190684,
              GuideType = "M",
              GuidePointName = "Mechanism_DynTrigger_1190684"
            }
          },
          ["172103663043210325"] = {
            key = "172103663043210325",
            type = "TalkNode",
            name = "\231\140\171\229\136\176\232\190\190",
            pos = {x = 2363.2532913310943, y = 1020.9568152099615},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000320,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172103665524710696"] = {
            key = "172103665524710696",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2371.6088108116132, y = 1190.3837632619095},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190685,
              GuideType = "M",
              GuidePointName = "Mechanism_DynTrigger_1190685"
            }
          },
          ["172103676512011795"] = {
            key = "172103676512011795",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3038.7922523700563, y = 1005.6110359891825},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000330,
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
          ["172103678380012285"] = {
            key = "172103678380012285",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3449.99571557352, y = 994.9032437813901},
            propsData = {
              DialogueId = 71000330,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["17213865207671169"] = {
            key = "17213865207671169",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1790.6275083612043, y = 585.8160535117057},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 800002
            }
          },
          ["17213870372102792"] = {
            key = "17213870372102792",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1808.2561370413691, y = 821.1748830255203},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 800002
            }
          },
          ["1721451472167856"] = {
            key = "1721451472167856",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2042.0551242236027, y = 576.2608695652174},
            propsData = {SendMessage = "", FinishCondition = "End"}
          },
          ["17214568526422386"] = {
            key = "17214568526422386",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2066.0059788217345, y = 814.1492686319377},
            propsData = {SendMessage = "", FinishCondition = "End"}
          },
          ["17214568880553729"] = {
            key = "17214568880553729",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1810.7917722172663, y = 1019.6085044001575},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Goto",
              UnitId = 800002
            }
          },
          ["17214568880553730"] = {
            key = "17214568880553730",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2070.5416139976314, y = 1032.5828900065749},
            propsData = {SendMessage = "", FinishCondition = "End"}
          },
          ["17220737219235212"] = {
            key = "17220737219235212",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1814, y = 1306},
            propsData = {UseTalkFadeOut = true, TalkFadeOutTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
