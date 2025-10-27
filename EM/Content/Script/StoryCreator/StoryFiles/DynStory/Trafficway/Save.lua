return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17189628637812656",
      startPort = "StoryStart",
      endStory = "17189628764052923",
      endPort = "In"
    },
    {
      startStory = "17189628764052923",
      startPort = "Success",
      endStory = "17189628637822659",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17189628637812656"] = {
      isStoryNode = true,
      key = "17189628637812656",
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
    ["17189628637822659"] = {
      isStoryNode = true,
      key = "17189628637822659",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1503.1, y = 297},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17189628764052923"] = {
      isStoryNode = true,
      key = "17189628764052923",
      type = "StoryNode",
      name = "\230\139\175\230\149\145\231\154\142\231\154\142",
      pos = {x = 1204.7446807949157, y = 301.9483087204144},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_VillageSave_Des",
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
            startQuest = "17189629773724696",
            startPort = "Out",
            endQuest = "17189631195655361",
            endPort = "In"
          },
          {
            startQuest = "17189629773724696",
            startPort = "Out",
            endQuest = "17189631668215776",
            endPort = "In"
          },
          {
            startQuest = "17189632786227222",
            startPort = "Out",
            endQuest = "17189633183747710",
            endPort = "In"
          },
          {
            startQuest = "17189633183747710",
            startPort = "Out",
            endQuest = "17189628764052927",
            endPort = "Success"
          },
          {
            startQuest = "17189631668215776",
            startPort = "Out",
            endQuest = "172216060453619050",
            endPort = "In"
          },
          {
            startQuest = "172216060453619050",
            startPort = "Out",
            endQuest = "172216062738419363",
            endPort = "In"
          },
          {
            startQuest = "172216062738419363",
            startPort = "Out",
            endQuest = "17189632786227222",
            endPort = "In"
          },
          {
            startQuest = "172216066407019974",
            startPort = "Out",
            endQuest = "172216067171520183",
            endPort = "In"
          },
          {
            startQuest = "1725265135294166973",
            startPort = "Out",
            endQuest = "1725265371621170332",
            endPort = "In"
          },
          {
            startQuest = "1725265135294166973",
            startPort = "Out",
            endQuest = "1725265394661170719",
            endPort = "In"
          },
          {
            startQuest = "172216060453619050",
            startPort = "Out",
            endQuest = "172216066407019974",
            endPort = "In"
          },
          {
            startQuest = "17189628764052924",
            startPort = "QuestStart",
            endQuest = "17259491215521502",
            endPort = "In"
          },
          {
            startQuest = "17259491215521502",
            startPort = "WeightBranch_1",
            endQuest = "17189629773724696",
            endPort = "In"
          },
          {
            startQuest = "17259491215521502",
            startPort = "WeightBranch_2",
            endQuest = "1725265135294166973",
            endPort = "In"
          },
          {
            startQuest = "1725265554054171899",
            startPort = "Out",
            endQuest = "17189628764052927",
            endPort = "Success"
          },
          {
            startQuest = "1725265394661170719",
            startPort = "Out",
            endQuest = "1725265554054171899",
            endPort = "In"
          }
        },
        nodeData = {
          ["17189628764052924"] = {
            key = "17189628764052924",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 389.2207792207792, y = 441.42857142857144},
            propsData = {ModeType = 0}
          },
          ["17189628764052927"] = {
            key = "17189628764052927",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2704.3757575757577, y = 352.60202020202007},
            propsData = {ModeType = 0}
          },
          ["17189628764052930"] = {
            key = "17189628764052930",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2602.2727272727275, y = 615.4545454545455},
            propsData = {}
          },
          ["17189629773724696"] = {
            key = "17189629773724696",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\154\142\231\154\142\229\146\140\230\128\170\231\137\169",
            pos = {x = 1040.7707491810693, y = 299.0311828839854},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180342,
                1180343,
                1180344,
                1180341
              }
            }
          },
          ["17189631195655361"] = {
            key = "17189631195655361",
            type = "TalkNode",
            name = "\229\188\185\230\151\129\231\153\189",
            pos = {x = 1346.0358285461487, y = 139.17880193160445},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000501,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17189631668215776"] = {
            key = "17189631668215776",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1355.1548761651961, y = 367.34546859827117},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180342,
                1180343,
                1180344
              }
            }
          },
          ["17189632786227222"] = {
            key = "17189632786227222",
            type = "TalkNode",
            name = "\232\161\168\232\190\190\230\132\159\232\176\162",
            pos = {x = 2139.3802729905933, y = 348.94388129668397},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000512,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Dyn_71000512",
              BlendInTime = 0.2,
              BlendOutTime = 2,
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
                  TalkActorId = 800005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 800005},
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
          ["17189633183747710"] = {
            key = "17189633183747710",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2434.7691618794825, y = 354.9994368522393},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["172216060453619050"] = {
            key = "172216060453619050",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1617.8807303560636, y = 363.3931981672952},
            propsData = {WaitTime = 2}
          },
          ["172216062738419363"] = {
            key = "172216062738419363",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1868.6807303560638, y = 365.7931981672952},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180341}
            }
          },
          ["172216066407019974"] = {
            key = "172216066407019974",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1879.0807303560644, y = 558.9931981672953},
            propsData = {WaitTime = 2}
          },
          ["172216067171520183"] = {
            key = "172216067171520183",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2143.4807303560647, y = 557.7931981672951},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Dyn_targetpoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1725265135294166973"] = {
            key = "1725265135294166973",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\154\142\231\154\142\227\128\129\231\139\169\230\156\136\228\186\186\228\184\142\231\167\189\229\133\189\229\176\184\228\189\147",
            pos = {x = 1058.573987571567, y = 872.3418144579437},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180494,
                1180490,
                1180491,
                1180492,
                1180493
              }
            }
          },
          ["1725265371621170332"] = {
            key = "1725265371621170332",
            type = "TalkNode",
            name = "\231\139\169\230\156\136\228\186\186\229\188\128\232\189\166",
            pos = {x = 1350.4456453255782, y = 640.5236326397619},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000503,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1725265394661170719"] = {
            key = "1725265394661170719",
            type = "TalkNode",
            name = "\230\142\162\233\153\169\231\153\189\228\184\142\231\139\169\230\156\136\228\186\186\231\154\132\230\151\129\231\153\189",
            pos = {x = 1357.7077538053338, y = 868.542425611496},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818014,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180490",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 71000504,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 818015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 818015},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1725265554054171899"] = {
            key = "1725265554054171899",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 1834.710351207931, y = 848.4781780943074},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 2
            }
          },
          ["17259491215521502"] = {
            key = "17259491215521502",
            type = "WeightBranchNode",
            name = "\230\157\131\233\135\141\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 712.3018175373013, y = 433.85217363281873},
            propsData = {
              RandomTriggerBranchCount = 1,
              WeightBranchArray = {3, 1}
            }
          },
          ["17267277549422278"] = {
            key = "17267277549422278",
            type = "ChangeStaticCreatorNode",
            name = "\231\139\169\230\156\136\228\186\186\231\166\187\229\188\128",
            pos = {x = 1625.1515151515143, y = 1036.4108780108784},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180490}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
