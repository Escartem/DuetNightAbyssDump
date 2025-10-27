return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17241346362596053",
      startPort = "StoryStart",
      endStory = "17241346416036221",
      endPort = "In"
    },
    {
      startStory = "17241346416036221",
      startPort = "Success",
      endStory = "17241346362596056",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17241346362596053"] = {
      isStoryNode = true,
      key = "17241346362596053",
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
    ["17241346362596056"] = {
      isStoryNode = true,
      key = "17241346362596056",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1490.9090909090908, y = 275.45454545454544},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17241346416036221"] = {
      isStoryNode = true,
      key = "17241346416036221",
      type = "StoryNode",
      name = "\230\137\190\231\140\171",
      pos = {x = 1134.0252408066654, y = 288.5240095683011},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityFindcat_Des",
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
            startQuest = "17241346416036222",
            startPort = "QuestStart",
            endQuest = "17241346764827302",
            endPort = "In"
          },
          {
            startQuest = "17241346627226999",
            startPort = "Out",
            endQuest = "17241353468208032",
            endPort = "In"
          },
          {
            startQuest = "17241353468208032",
            startPort = "Option_2",
            endQuest = "17241355685419318",
            endPort = "In"
          },
          {
            startQuest = "17241355685419318",
            startPort = "Out",
            endQuest = "17241346416046228",
            endPort = "Fail"
          },
          {
            startQuest = "172413611355912048",
            startPort = "Out",
            endQuest = "172413614772112431",
            endPort = "In"
          },
          {
            startQuest = "172413611355912048",
            startPort = "Out",
            endQuest = "172413615336812657",
            endPort = "In"
          },
          {
            startQuest = "172413615336812657",
            startPort = "Out",
            endQuest = "172413616667212888",
            endPort = "In"
          },
          {
            startQuest = "172413615336812657",
            startPort = "Out",
            endQuest = "172413617495213130",
            endPort = "In"
          },
          {
            startQuest = "172413665949716261",
            startPort = "Out",
            endQuest = "172413641796814495",
            endPort = "In"
          },
          {
            startQuest = "172413619232913665",
            startPort = "Option_1",
            endQuest = "172413665949716261",
            endPort = "In"
          },
          {
            startQuest = "172413619232913665",
            startPort = "Option_2",
            endQuest = "172413667528216618",
            endPort = "In"
          },
          {
            startQuest = "172413667528216618",
            startPort = "Out",
            endQuest = "172413657492915390",
            endPort = "In"
          },
          {
            startQuest = "172413641796814495",
            startPort = "Out",
            endQuest = "17241346416036225",
            endPort = "Success"
          },
          {
            startQuest = "172413657492915390",
            startPort = "Out",
            endQuest = "17241346416036225",
            endPort = "Success"
          },
          {
            startQuest = "172413619232913665",
            startPort = "Option_1",
            endQuest = "17258718980331233",
            endPort = "In"
          },
          {
            startQuest = "172413565303010381",
            startPort = "Out",
            endQuest = "1725963745696165963",
            endPort = "In"
          },
          {
            startQuest = "172413619232913665",
            startPort = "Option_1",
            endQuest = "1725963745696165963",
            endPort = "Stop"
          },
          {
            startQuest = "172413619232913665",
            startPort = "Option_2",
            endQuest = "1725963745696165963",
            endPort = "Stop"
          },
          {
            startQuest = "172413565303010381",
            startPort = "Out",
            endQuest = "172413619232913665",
            endPort = "In"
          },
          {
            startQuest = "17241353468208032",
            startPort = "Option_1",
            endQuest = "17274226098911050",
            endPort = "In"
          },
          {
            startQuest = "17241346416036222",
            startPort = "QuestStart",
            endQuest = "17241346627226999",
            endPort = "In"
          },
          {
            startQuest = "17291577308071326287",
            startPort = "WeightBranch_1",
            endQuest = "172413565303010381",
            endPort = "In"
          },
          {
            startQuest = "17291653419155639",
            startPort = "Option_1",
            endQuest = "17291653419155644",
            endPort = "In"
          },
          {
            startQuest = "17291653419155638",
            startPort = "Out",
            endQuest = "17291653419155645",
            endPort = "In"
          },
          {
            startQuest = "17291653419155639",
            startPort = "Option_1",
            endQuest = "17291653419155645",
            endPort = "Stop"
          },
          {
            startQuest = "17291653419155639",
            startPort = "Option_2",
            endQuest = "17291653419155645",
            endPort = "Stop"
          },
          {
            startQuest = "17291653419155638",
            startPort = "Out",
            endQuest = "17291653419155639",
            endPort = "In"
          },
          {
            startQuest = "17291577308071326287",
            startPort = "WeightBranch_2",
            endQuest = "17291653419155638",
            endPort = "In"
          },
          {
            startQuest = "17291653482045937",
            startPort = "Option_1",
            endQuest = "17291653482045942",
            endPort = "In"
          },
          {
            startQuest = "17291653482045936",
            startPort = "Out",
            endQuest = "17291653482045943",
            endPort = "In"
          },
          {
            startQuest = "17291653482045937",
            startPort = "Option_1",
            endQuest = "17291653482045943",
            endPort = "Stop"
          },
          {
            startQuest = "17291653482045937",
            startPort = "Option_2",
            endQuest = "17291653482045943",
            endPort = "Stop"
          },
          {
            startQuest = "17291653482045936",
            startPort = "Out",
            endQuest = "17291653482045937",
            endPort = "In"
          },
          {
            startQuest = "17291653514126073",
            startPort = "Option_1",
            endQuest = "17291653514136078",
            endPort = "In"
          },
          {
            startQuest = "17291653514126072",
            startPort = "Out",
            endQuest = "17291653514136079",
            endPort = "In"
          },
          {
            startQuest = "17291653514126073",
            startPort = "Option_1",
            endQuest = "17291653514136079",
            endPort = "Stop"
          },
          {
            startQuest = "17291653514126073",
            startPort = "Option_2",
            endQuest = "17291653514136079",
            endPort = "Stop"
          },
          {
            startQuest = "17291653514126072",
            startPort = "Out",
            endQuest = "17291653514126073",
            endPort = "In"
          },
          {
            startQuest = "17291577308071326287",
            startPort = "WeightBranch_3",
            endQuest = "17291653482045936",
            endPort = "In"
          },
          {
            startQuest = "17291577308071326287",
            startPort = "WeightBranch_4",
            endQuest = "17291653514126072",
            endPort = "In"
          },
          {
            startQuest = "17274226098911050",
            startPort = "Out",
            endQuest = "17291577308071326287",
            endPort = "In"
          },
          {
            startQuest = "17291653419155639",
            startPort = "Option_1",
            endQuest = "172413665949716261",
            endPort = "In"
          },
          {
            startQuest = "17291653419155639",
            startPort = "Option_2",
            endQuest = "172413667528216618",
            endPort = "In"
          },
          {
            startQuest = "17291653482045937",
            startPort = "Option_1",
            endQuest = "172413665949716261",
            endPort = "In"
          },
          {
            startQuest = "17291653482045937",
            startPort = "Option_2",
            endQuest = "172413667528216618",
            endPort = "In"
          },
          {
            startQuest = "17291653514126073",
            startPort = "Option_1",
            endQuest = "172413665949716261",
            endPort = "In"
          },
          {
            startQuest = "17291653514126073",
            startPort = "Option_2",
            endQuest = "172413667528216618",
            endPort = "In"
          }
        },
        nodeData = {
          ["17241346416036222"] = {
            key = "17241346416036222",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 458.75, y = 298.75},
            propsData = {ModeType = 0}
          },
          ["17241346416036225"] = {
            key = "17241346416036225",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4927.468275515334, y = 1196.112619406737},
            propsData = {ModeType = 0}
          },
          ["17241346416046228"] = {
            key = "17241346416046228",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2091.9823232323233, y = 666.7550505050506},
            propsData = {}
          },
          ["17241346627226999"] = {
            key = "17241346627226999",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\175\187\231\140\171NPC",
            pos = {x = 1135.3541840856085, y = 297.9796869826742},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190776}
            }
          },
          ["17241346764827302"] = {
            key = "17241346764827302",
            type = "TalkNode",
            name = "\229\175\187\231\140\171NPC\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 788.5486285300531, y = 92.60270285569004},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002001,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17241353468208032"] = {
            key = "17241353468208032",
            type = "TalkNode",
            name = "\228\184\142NPC\229\175\185\232\175\157\233\128\137\230\139\169\230\152\175\229\144\166\230\137\190\231\140\171",
            pos = {x = 1463.1319618633863, y = 262.741591744579},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818017,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190776",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002002,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
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
              NormalOptions = {
                {
                  OptionText = "710020021",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = -1
                },
                {
                  OptionText = "710020022",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17241355685419318"] = {
            key = "17241355685419318",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1735.1142850957094, y = 667.2744200274072},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 1}
          },
          ["172413565303010381"] = {
            key = "172413565303010381",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\140\171",
            pos = {x = 2436.2946602760844, y = -12.255883002895587},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190779}
            }
          },
          ["172413611355912048"] = {
            key = "172413611355912048",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 901.919840651266, y = -230.74325674026935},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 0,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["172413614772112431"] = {
            key = "172413614772112431",
            type = "TalkNode",
            name = "\231\140\171\229\143\171\229\188\128\232\189\166",
            pos = {x = 1183.0309517623773, y = -465.1877011847138},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10010101,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172413615336812657"] = {
            key = "172413615336812657",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1209.6976184290438, y = -230.7432567402693},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 0,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["172413616667212888"] = {
            key = "172413616667212888",
            type = "TalkNode",
            name = "\231\140\171\229\143\171\229\188\128\232\189\166",
            pos = {x = 1496.0612547926798, y = -464.12709512410777},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10010101,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172413617495213130"] = {
            key = "172413617495213130",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1629.6976184290434, y = -234.07659007360272},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["172413619232913665"] = {
            key = "172413619232913665",
            type = "TalkNode",
            name = "\230\137\190\229\136\176\231\140\171\229\144\142\231\154\132\230\138\137\230\139\169",
            pos = {x = 3288.766882498308, y = -22.0058830028957},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818018,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Dyn_FindCatRange",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002003,
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
              NormalOptions = {
                {
                  OptionText = "710020031",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710020032",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["172413641796814495"] = {
            key = "172413641796814495",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4521.159885103757, y = 1007.6480810241335},
            propsData = {
              DialogueId = 71002004,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["172413657492915390"] = {
            key = "172413657492915390",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4499.375697069568, y = 1330.7250041010566},
            propsData = {
              DialogueId = 71002006,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["172413665949716261"] = {
            key = "172413665949716261",
            type = "TalkNode",
            name = "\229\184\166\231\140\171\229\155\158\229\142\187\230\137\190NPC",
            pos = {x = 4166.213303907174, y = 1014.9985083745607},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818017,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190776",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002004,
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
          ["172413667528216618"] = {
            key = "172413667528216618",
            type = "TalkNode",
            name = "\230\148\190\231\140\171\232\181\176\230\137\190NPC",
            pos = {x = 4160.556738250608, y = 1341.3368922129446},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818017,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190776",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002006,
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
          ["17258718980331233"] = {
            key = "17258718980331233",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\140\171",
            pos = {x = 3839.1578144078153, y = -322.67864973191075},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190779}
            }
          },
          ["1725963745696165963"] = {
            key = "1725963745696165963",
            type = "DistanceDetectionNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173\232\183\157\231\166\187\230\163\128\230\181\139\232\138\130\231\130\185",
            pos = {x = 3647.5268620268616, y = -30.83333333333337},
            propsData = {
              PointType1 = "StaticCreator",
              PointId1 = 1190779,
              PointType2 = "Player",
              PointId2 = 0
            }
          },
          ["17274226098911050"] = {
            key = "17274226098911050",
            type = "TalkNode",
            name = "\233\128\137\233\161\185\229\144\142\232\161\165\229\133\133\229\175\185\232\175\157",
            pos = {x = 1786.235294117647, y = 263.57894736842127},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002007,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
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
          ["17291577308071326287"] = {
            key = "17291577308071326287",
            type = "WeightBranchNode",
            name = "\233\154\143\230\156\186\229\135\186\231\142\176\231\140\171\231\154\132\228\189\141\231\189\174",
            pos = {x = 2079.3133217401796, y = 169.92517892324366},
            propsData = {
              RandomTriggerBranchCount = 1,
              WeightBranchArray = {
                1,
                1,
                1,
                1
              }
            }
          },
          ["17291653419155638"] = {
            key = "17291653419155638",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\140\171",
            pos = {x = 2423.912523023481, y = 676.3970871172388},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190796}
            }
          },
          ["17291653419155639"] = {
            key = "17291653419155639",
            type = "TalkNode",
            name = "\230\137\190\229\136\176\231\140\171\229\144\142\231\154\132\230\138\137\230\139\169",
            pos = {x = 3276.3847452457044, y = 666.6470871172388},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818018,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Dyn_FindCatRange",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002003,
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
              NormalOptions = {
                {
                  OptionText = "710020031",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710020032",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17291653419155644"] = {
            key = "17291653419155644",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\140\171",
            pos = {x = 3660.9862034710013, y = 539.6585309145395},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190796}
            }
          },
          ["17291653419155645"] = {
            key = "17291653419155645",
            type = "DistanceDetectionNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173\232\183\157\231\166\187\230\163\128\230\181\139\232\138\130\231\130\185",
            pos = {x = 3635.144724774258, y = 657.8196367868011},
            propsData = {
              PointType1 = "StaticCreator",
              PointId1 = 1190796,
              PointType2 = "Player",
              PointId2 = 0
            }
          },
          ["17291653482045936"] = {
            key = "17291653482045936",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\140\171",
            pos = {x = 2472.926744096526, y = 1384.1992849194362},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190797}
            }
          },
          ["17291653482045937"] = {
            key = "17291653482045937",
            type = "TalkNode",
            name = "\230\137\190\229\136\176\231\140\171\229\144\142\231\154\132\230\138\137\230\139\169",
            pos = {x = 3325.3989663187494, y = 1374.4492849194362},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818018,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Dyn_FindCatRange",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002003,
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
              NormalOptions = {
                {
                  OptionText = "710020031",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710020032",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17291653482045942"] = {
            key = "17291653482045942",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\140\171",
            pos = {x = 3675.263582438783, y = 1260.0923076641052},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190797}
            }
          },
          ["17291653482045943"] = {
            key = "17291653482045943",
            type = "DistanceDetectionNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173\232\183\157\231\166\187\230\163\128\230\181\139\232\138\130\231\130\185",
            pos = {x = 3684.158945847303, y = 1365.6218345889988},
            propsData = {
              PointType1 = "StaticCreator",
              PointId1 = 1190797,
              PointType2 = "Player",
              PointId2 = 0
            }
          },
          ["17291653514126072"] = {
            key = "17291653514126072",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\140\171",
            pos = {x = 2433.6959748657564, y = 2051.122361842513},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190798}
            }
          },
          ["17291653514126073"] = {
            key = "17291653514126073",
            type = "TalkNode",
            name = "\230\137\190\229\136\176\231\140\171\229\144\142\231\154\132\230\138\137\230\139\169",
            pos = {x = 3287.932902970333, y = 2041.3723618425129},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818018,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Dyn_FindCatRange",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71002003,
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
              NormalOptions = {
                {
                  OptionText = "710020031",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710020032",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17291653514136078"] = {
            key = "17291653514136078",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\140\171",
            pos = {x = 3651.822286892224, y = 1922.2785424819187},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190798}
            }
          },
          ["17291653514136079"] = {
            key = "17291653514136079",
            type = "DistanceDetectionNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173\232\183\157\231\166\187\230\163\128\230\181\139\232\138\130\231\130\185",
            pos = {x = 3644.9281766165336, y = 2032.544911512075},
            propsData = {
              PointType1 = "StaticCreator",
              PointId1 = 1190798,
              PointType2 = "Player",
              PointId2 = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
