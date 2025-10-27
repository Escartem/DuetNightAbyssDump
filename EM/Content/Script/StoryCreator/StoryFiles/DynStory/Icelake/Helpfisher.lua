return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17351236372191",
      startPort = "StoryStart",
      endStory = "1735123688244393",
      endPort = "In"
    },
    {
      startStory = "1735123688244393",
      startPort = "Success",
      endStory = "17351236372205",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17351236372191"] = {
      isStoryNode = true,
      key = "17351236372191",
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
    ["17351236372205"] = {
      isStoryNode = true,
      key = "17351236372205",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1536.0526315789473, y = 302.51644736842104},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1735123688244393"] = {
      isStoryNode = true,
      key = "1735123688244393",
      type = "StoryNode",
      name = "\229\184\174\229\138\169\233\146\147\233\177\188\228\186\186",
      pos = {x = 1208.2932692307693, y = 297.09134615384613},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_Helpfisher_Des",
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
            startQuest = "1735123688244394",
            startPort = "QuestStart",
            endQuest = "1735124024436697447",
            endPort = "In"
          },
          {
            startQuest = "1735124024436697447",
            startPort = "Out",
            endQuest = "17351241012741393921",
            endPort = "In"
          },
          {
            startQuest = "1735124024436697447",
            startPort = "Out",
            endQuest = "1735124035970697658",
            endPort = "In"
          },
          {
            startQuest = "17351245747371396790",
            startPort = "Out",
            endQuest = "17351246102031397243",
            endPort = "In"
          },
          {
            startQuest = "17351244724171396069",
            startPort = "Out",
            endQuest = "1735123688245401",
            endPort = "Success"
          },
          {
            startQuest = "17351246102031397243",
            startPort = "Out",
            endQuest = "1735123688245401",
            endPort = "Success"
          },
          {
            startQuest = "17351258170722791895",
            startPort = "Out",
            endQuest = "17351274028034886722",
            endPort = "In"
          },
          {
            startQuest = "17351274028034886722",
            startPort = "Out",
            endQuest = "17351274086864886883",
            endPort = "In"
          },
          {
            startQuest = "17351274028034886722",
            startPort = "Out",
            endQuest = "17351258353172792285",
            endPort = "In"
          },
          {
            startQuest = "17351258353172792285",
            startPort = "Out",
            endQuest = "17368351534122385",
            endPort = "Input_1"
          },
          {
            startQuest = "17368351534122385",
            startPort = "Out",
            endQuest = "17351964542182805135",
            endPort = "In"
          },
          {
            startQuest = "17368351534122385",
            startPort = "Out",
            endQuest = "17351245747371396790",
            endPort = "In"
          },
          {
            startQuest = "1744352402105548508",
            startPort = "Out",
            endQuest = "1744352425181548770",
            endPort = "In"
          },
          {
            startQuest = "1744352402105548508",
            startPort = "Out",
            endQuest = "1744352427981548847",
            endPort = "In"
          },
          {
            startQuest = "1744352402105548508",
            startPort = "Out",
            endQuest = "1744352428904548871",
            endPort = "In"
          },
          {
            startQuest = "1744352425181548770",
            startPort = "Out",
            endQuest = "17368351534122385",
            endPort = "Input_2"
          },
          {
            startQuest = "1744352427981548847",
            startPort = "Out",
            endQuest = "17368351534122385",
            endPort = "Input_3"
          },
          {
            startQuest = "1744352428904548871",
            startPort = "Out",
            endQuest = "17368351534122385",
            endPort = "Input_4"
          },
          {
            startQuest = "17351258353172792285",
            startPort = "Out",
            endQuest = "1744352558782550594",
            endPort = "In"
          },
          {
            startQuest = "17351258353172792285",
            startPort = "Out",
            endQuest = "1744352558782550595",
            endPort = "In"
          },
          {
            startQuest = "17351258353172792285",
            startPort = "Out",
            endQuest = "1744352558782550596",
            endPort = "In"
          },
          {
            startQuest = "1735124035970697658",
            startPort = "Fail",
            endQuest = "17351244724171396069",
            endPort = "In"
          },
          {
            startQuest = "1735124035970697658",
            startPort = "Out",
            endQuest = "1744352402105548508",
            endPort = "In"
          },
          {
            startQuest = "1735124035970697658",
            startPort = "Out",
            endQuest = "17351258170722791895",
            endPort = "In"
          }
        },
        nodeData = {
          ["1735123688244394"] = {
            key = "1735123688244394",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1735123688245401"] = {
            key = "1735123688245401",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3616.694736842105, y = 349.38947368421054},
            propsData = {ModeType = 0}
          },
          ["1735123688245408"] = {
            key = "1735123688245408",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3011.2, y = 827.1999999999999},
            propsData = {}
          },
          ["1735124024436697447"] = {
            key = "1735124024436697447",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144npc",
            pos = {x = 1254.8000000000002, y = 298.40000000000003},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240424}
            }
          },
          ["1735124035970697658"] = {
            key = "1735124035970697658",
            type = "TalkNode",
            name = "\233\146\147\233\177\188\228\186\186\228\186\164\228\186\146\229\175\185\232\175\157",
            pos = {x = 1697.001534526854, y = 282.94117647058823},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818040,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1240424",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71004902,
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
              OverrideFailBlend = true,
              FailOutType = "FadeOut",
              FailOutTime = 2
            }
          },
          ["17351241012741393921"] = {
            key = "17351241012741393921",
            type = "TalkNode",
            name = "\233\146\147\233\177\188\228\186\186\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1504.4, y = 34.399999999999956},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004901,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17351244506101395576"] = {
            key = "17351244506101395576",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2232.744444444444, y = 435.87777777777774},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1240417,
                1240418,
                1240419
              },
              QuestPickupId = -1,
              UnitId = 80027,
              UnitCount = 3,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17351244724171396069"] = {
            key = "17351244724171396069",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2055.6235294117646, y = 612.6588235294116},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["17351245747371396790"] = {
            key = "17351245747371396790",
            type = "TalkNode",
            name = "\231\187\147\230\157\159\229\175\185\232\175\157",
            pos = {x = 3060.7999999999997, y = 223.9999999999998},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818040,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1240424",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71004907,
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
          ["17351246102031397243"] = {
            key = "17351246102031397243",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3337.9999999999995, y = 222.79999999999995},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17351258170722791895"] = {
            key = "17351258170722791895",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 2227.7368421052624, y = -64.3315789473686},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240420,
                1240421,
                1240422,
                1240422
              }
            }
          },
          ["17351258353172792285"] = {
            key = "17351258353172792285",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2801.4868421052624, y = -235.5815789473686},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240420,
                1240421,
                1240422,
                1240423
              }
            }
          },
          ["17351258594422792735"] = {
            key = "17351258594422792735",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 3107.8757309941507, y = -660.5815789473686},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {
                1240417,
                1240418,
                1240419
              },
              QuestPickupId = -1,
              UnitId = 80027,
              UnitCount = 3,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17351274028034886722"] = {
            key = "17351274028034886722",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2511.4868421052624, y = -258.0815789473686},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240425,
              GuideType = "M",
              GuidePointName = "Mechanism_Dyn_1240425"
            }
          },
          ["17351274086864886883"] = {
            key = "17351274086864886883",
            type = "TalkNode",
            name = "\233\129\135\232\167\129\231\167\189\229\133\189\229\188\128\232\189\166",
            pos = {x = 2786.4868421052624, y = -416.83157894736866},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004905,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17351964542182805135"] = {
            key = "17351964542182805135",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\174\140\230\136\144\229\188\128\232\189\166",
            pos = {x = 3047.9513888888887, y = -31.097222222222285},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004906,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17368351534122385"] = {
            key = "17368351534122385",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2783.7188355227145, y = 145.34752326217819},
            propsData = {ListenCount = 4, NeedFinishCount = 4}
          },
          ["1744352402105548508"] = {
            key = "1744352402105548508",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\142\178\232\141\137",
            pos = {x = 2222.261300309597, y = 216.61664086687315},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240417,
                1240418,
                1240419
              }
            }
          },
          ["1744352425181548770"] = {
            key = "1744352425181548770",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2536.661300309597, y = 22.216640866873103},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240417,
              StateId = 610011,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1744352427981548847"] = {
            key = "1744352427981548847",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2524.261300309597, y = 163.81664086687317},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240418,
              StateId = 610011,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1744352428904548871"] = {
            key = "1744352428904548871",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2536.261300309597, y = 318.6166408668731},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240419,
              StateId = 610011,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1744352558782550594"] = {
            key = "1744352558782550594",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3154.4613003095974, y = -502.7833591331269},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240417,
              StateId = 610011,
              IsGuideEnable = true,
              GuidePointName = "Drop_Dyn_1240417"
            }
          },
          ["1744352558782550595"] = {
            key = "1744352558782550595",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3142.0613003095973, y = -361.1833591331269},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240418,
              StateId = 610011,
              IsGuideEnable = true,
              GuidePointName = "Drop_Dyn_1240418"
            }
          },
          ["1744352558782550596"] = {
            key = "1744352558782550596",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3154.0613003095973, y = -206.38335913312693},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240419,
              StateId = 610011,
              IsGuideEnable = true,
              GuidePointName = "Drop_Dyn_1240419"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
