return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17221464276083051399",
      startPort = "Success",
      endStory = "17221464276083051398",
      endPort = "In"
    },
    {
      startStory = "17221462622692593667",
      startPort = "Success",
      endStory = "17221464276083051399",
      endPort = "In"
    },
    {
      startStory = "17221464276083051398",
      startPort = "Success",
      endStory = "171851537018611649743",
      endPort = "StoryEnd"
    },
    {
      startStory = "1722327008106928200",
      startPort = "Success",
      endStory = "17221462622692593667",
      endPort = "In"
    },
    {
      startStory = "171851537018611649742",
      startPort = "StoryStart",
      endStory = "17512713215858172993",
      endPort = "In"
    },
    {
      startStory = "17512713215858172993",
      startPort = "Success",
      endStory = "1722327008106928200",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["171851537018611649742"] = {
      isStoryNode = true,
      key = "171851537018611649742",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -221.50209972252813, y = 697.982147430621},
      propsData = {QuestChainId = 200213},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851537018611649743"] = {
      isStoryNode = true,
      key = "171851537018611649743",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1136.146810987495, y = 675.5259526710801},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17221462622692593667"] = {
      isStoryNode = true,
      key = "17221462622692593667",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 346.9751359751365, y = 686.0887445887449},
      propsData = {
        QuestId = 20021302,
        QuestDescriptionComment = "\229\174\140\230\136\144\228\184\137\228\184\170\229\173\144\228\187\187\229\138\161",
        QuestDescription = "Description_200213_2",
        QuestDeatil = "Content_200213_2",
        TaskRegionReName = "UI_REGION_NAME_1011",
        TaskSubRegionReName = "UI_TELEPORTPOINT_NAME_101101_1",
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
            startQuest = "17221462622692593668",
            startPort = "QuestStart",
            endQuest = "17221466123273510167",
            endPort = "In"
          },
          {
            startQuest = "17221468343013819250",
            startPort = "Out",
            endQuest = "17221462622692593671",
            endPort = "Success"
          },
          {
            startQuest = "17221468143983818566",
            startPort = "Out",
            endQuest = "17221468343013819250",
            endPort = "Branch_1"
          },
          {
            startQuest = "17221468198463818814",
            startPort = "Out",
            endQuest = "17221468343013819250",
            endPort = "Branch_2"
          },
          {
            startQuest = "17221468228553818905",
            startPort = "Out",
            endQuest = "17221468343013819250",
            endPort = "Branch_3"
          },
          {
            startQuest = "17221466123273510167",
            startPort = "Out",
            endQuest = "17221468143983818566",
            endPort = "In"
          },
          {
            startQuest = "17221466123273510167",
            startPort = "Out",
            endQuest = "17221468198463818814",
            endPort = "In"
          },
          {
            startQuest = "17221466123273510167",
            startPort = "Out",
            endQuest = "17221468228553818905",
            endPort = "In"
          }
        },
        nodeData = {
          ["17221462622692593668"] = {
            key = "17221462622692593668",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 651.9323671497584, y = 314.5833333333333},
            propsData = {ModeType = 0}
          },
          ["17221462622692593671"] = {
            key = "17221462622692593671",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2543.8209800709797, y = 315.15902265902264},
            propsData = {ModeType = 0}
          },
          ["17221462622692593674"] = {
            key = "17221462622692593674",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2407.9279279279276, y = 488.28828828828824},
            propsData = {}
          },
          ["17221466123273510167"] = {
            key = "17221466123273510167",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 940.3408519584996, y = 316.38242802948685},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_20021302_1",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_20021302_2",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_20021302_3",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["17221468143983818566"] = {
            key = "17221468143983818566",
            type = "WaitingCompleteSysGuideNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144\230\140\135\229\188\149",
            pos = {x = 1683.6869590034544, y = 162.69745898422278},
            propsData = {SystemGuideId = 2027}
          },
          ["17221468198463818814"] = {
            key = "17221468198463818814",
            type = "WaitingCompleteSysGuideNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144\230\140\135\229\188\149",
            pos = {x = 1680.0431366096323, y = 309.7968798336436},
            propsData = {SystemGuideId = 2028}
          },
          ["17221468228553818905"] = {
            key = "17221468228553818905",
            type = "WaitingCompleteSysGuideNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144\230\140\135\229\188\149",
            pos = {x = 1681.8819396984354, y = 443.344177130941},
            propsData = {SystemGuideId = 2029}
          },
          ["17221468343013819250"] = {
            key = "17221468343013819250",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 2213.3181195757916, y = 286.30969437232034},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          }
        },
        commentData = {}
      }
    },
    ["17221464276083051398"] = {
      isStoryNode = true,
      key = "17221464276083051398",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 856.8806384360049, y = 683.8751817627243},
      propsData = {
        QuestId = 20021304,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200213_4",
        QuestDeatil = "Content_200213_4",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Maerjie_1190646"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17221464276083051408",
            startPort = "QuestStart",
            endQuest = "17221464276083051411",
            endPort = "In"
          },
          {
            startQuest = "17221464276083051411",
            startPort = "Out",
            endQuest = "17221464276083051409",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17221464276083051408"] = {
            key = "17221464276083051408",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1342.5, y = 273.75},
            propsData = {ModeType = 0}
          },
          ["17221464276083051409"] = {
            key = "17221464276083051409",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2240.050604567846, y = 279.82086878638603},
            propsData = {ModeType = 0}
          },
          ["17221464276083051410"] = {
            key = "17221464276083051410",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17221464276083051411"] = {
            key = "17221464276083051411",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1642.6594623727347, y = 202.8485116719166},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700127,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Maerjie_1190646",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51005201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20021401",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 700127,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700127},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17221464276083051399"] = {
      isStoryNode = true,
      key = "17221464276083051399",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 596.3703328149678, y = 686.2316003440586},
      propsData = {
        QuestId = 20021303,
        QuestDescriptionComment = "\231\148\159\230\136\144\231\142\155\229\176\148\230\180\129",
        QuestDescription = "Description_200213_3",
        QuestDeatil = "Content_200213_3",
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
        StoryGuidePointName = "QuestPoint_20021401"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17221464276093051440",
            startPort = "Out",
            endQuest = "17221464276093051438",
            endPort = "Success"
          },
          {
            startQuest = "17221464276093051437",
            startPort = "QuestStart",
            endQuest = "17221464276093051441",
            endPort = "In"
          },
          {
            startQuest = "17221464276093051441",
            startPort = "Out",
            endQuest = "17221464276093051440",
            endPort = "In"
          }
        },
        nodeData = {
          ["17221464276093051437"] = {
            key = "17221464276093051437",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1482.159090909091, y = 323.8636363636364},
            propsData = {ModeType = 0}
          },
          ["17221464276093051438"] = {
            key = "17221464276093051438",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2587.272727272727, y = 321.8181818181818},
            propsData = {ModeType = 0}
          },
          ["17221464276093051439"] = {
            key = "17221464276093051439",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17221464276093051440"] = {
            key = "17221464276093051440",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2205.367083939452, y = 321.64304482067615},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190646}
            }
          },
          ["17221464276093051441"] = {
            key = "17221464276093051441",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1839.5, y = 322},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021401"
            }
          }
        },
        commentData = {}
      }
    },
    ["1722327008106928200"] = {
      isStoryNode = true,
      key = "1722327008106928200",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 70.3694635366303, y = 692.3324625566005},
      propsData = {
        QuestId = 20021301,
        QuestDescriptionComment = "\231\169\186\228\187\187\229\138\161\232\138\130\231\130\185",
        QuestDescription = "Description_200213_1",
        QuestDeatil = "Content_200213_1",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20021301"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1722327008106928204",
            startPort = "QuestStart",
            endQuest = "17223270573721082139",
            endPort = "In"
          },
          {
            startQuest = "17223270573721082139",
            startPort = "Out",
            endQuest = "1722327008106928205",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1722327008106928204"] = {
            key = "1722327008106928204",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1818.9323671497584, y = 338.5833333333333},
            propsData = {ModeType = 0}
          },
          ["1722327008106928205"] = {
            key = "1722327008106928205",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2446.3209800709797, y = 336.15902265902264},
            propsData = {ModeType = 0}
          },
          ["1722327008106928206"] = {
            key = "1722327008106928206",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2407.9279279279276, y = 488.28828828828824},
            propsData = {}
          },
          ["17223270573721082139"] = {
            key = "17223270573721082139",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 2121.403946295251, y = 338.7979797979798},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021301"
            }
          }
        },
        commentData = {}
      }
    },
    ["17512713215858172993"] = {
      isStoryNode = true,
      key = "17512713215858172993",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 9.234482758620516, y = 431.3060344827586},
      propsData = {
        QuestId = 20021300,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Maerjie_1190523"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512713215858172999",
            startPort = "ApproveOut",
            endQuest = "17512713215858172998",
            endPort = "Success"
          },
          {
            startQuest = "17512713215858172997",
            startPort = "QuestStart",
            endQuest = "17512713215858173001",
            endPort = "In"
          },
          {
            startQuest = "17512713215858172999",
            startPort = "CancelOut",
            endQuest = "17512713215858173000",
            endPort = "Fail"
          },
          {
            startQuest = "17512713215858173001",
            startPort = "Out",
            endQuest = "17512713215858172999",
            endPort = "Input"
          },
          {
            startQuest = "17512713215858173001",
            startPort = "Fail",
            endQuest = "17512713215858173000",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17512713215858172997"] = {
            key = "17512713215858172997",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 243.8461538461538, y = -80.76923076923077},
            propsData = {ModeType = 0}
          },
          ["17512713215858172998"] = {
            key = "17512713215858172998",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1207.1784098254684, y = -160.32643826761475},
            propsData = {ModeType = 0}
          },
          ["17512713215858172999"] = {
            key = "17512713215858172999",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 953.060762766645, y = -87.97349709114415},
            propsData = {
              SideQuestChainId = 200213,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512713215858173000"] = {
            key = "17512713215858173000",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1206.8917251270195, y = 92.97864297864304},
            propsData = {}
          },
          ["17512713215858173001"] = {
            key = "17512713215858173001",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 574.126926727682, y = -91.13712950780705},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700115,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Maerjie_1190523",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005101,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = true,
              FailOutType = "BlendOut",
              FailOutTime = 0.5
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
