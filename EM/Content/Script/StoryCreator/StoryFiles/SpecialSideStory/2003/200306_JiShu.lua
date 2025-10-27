return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17524799552681856",
      startPort = "Success",
      endStory = "17524633788695",
      endPort = "StoryEnd"
    },
    {
      startStory = "17524633788681",
      startPort = "StoryStart",
      endStory = "1752463393192102",
      endPort = "In"
    },
    {
      startStory = "1752463403168440",
      startPort = "Success",
      endStory = "17524799552681856",
      endPort = "In"
    },
    {
      startStory = "1752463393192102",
      startPort = "Success",
      endStory = "1755757322327936561",
      endPort = "In"
    },
    {
      startStory = "1755757322327936561",
      startPort = "Success",
      endStory = "1752463403168440",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17524633788681"] = {
      isStoryNode = true,
      key = "17524633788681",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 839.170436820527, y = 300},
      propsData = {QuestChainId = 200306},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17524633788695"] = {
      isStoryNode = true,
      key = "17524633788695",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2249, y = 292},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1752463393192102"] = {
      isStoryNode = true,
      key = "1752463393192102",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 1123.9462365392924, y = 275.95852539142},
      propsData = {
        QuestId = 20030600,
        QuestDescriptionComment = "",
        SubRegionId = 104107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20030600_2080079"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1752463393192103",
            startPort = "QuestStart",
            endQuest = "17533452608171327678",
            endPort = "In"
          },
          {
            startQuest = "17533452608171327678",
            startPort = "Out",
            endQuest = "17533452671141327789",
            endPort = "In"
          },
          {
            startQuest = "17533452671141327789",
            startPort = "Out",
            endQuest = "1752463393193117",
            endPort = "Input"
          },
          {
            startQuest = "1752463393193117",
            startPort = "ApproveOut",
            endQuest = "1752463393193110",
            endPort = "Success"
          },
          {
            startQuest = "1752463393193117",
            startPort = "CancelOut",
            endQuest = "1752463393193123",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1752463393192103"] = {
            key = "1752463393192103",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1752463393193110"] = {
            key = "1752463393193110",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2405.909090909091, y = 294.54545454545456},
            propsData = {ModeType = 0}
          },
          ["1752463393193117"] = {
            key = "1752463393193117",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 2002.7272732877423, y = 267.1212119343889},
            propsData = {
              SideQuestChainId = 200306,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["1752463393193123"] = {
            key = "1752463393193123",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2407.272727272727, y = 605.9090909090909},
            propsData = {}
          },
          ["17533452608171327678"] = {
            key = "17533452608171327678",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1205.1818181818182, y = 277.27272727272725},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080079,
              GuideType = "M",
              GuidePointName = "Mechanism_20030600_2080079"
            }
          },
          ["17533452671141327789"] = {
            key = "17533452671141327789",
            type = "TalkNode",
            name = "\228\184\142\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 1603.4848495590818, y = 270.060606317488},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51103001,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
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
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          }
        },
        commentData = {}
      }
    },
    ["1752463403168440"] = {
      isStoryNode = true,
      key = "1752463403168440",
      type = "StoryNode",
      name = "\230\156\186\229\133\179",
      pos = {x = 1679.3333333333333, y = 274.68969006957616},
      propsData = {
        QuestId = 20030602,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200306_1",
        QuestDeatil = "Content_200306_1",
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
        SubRegionId = 104107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20030601_2080080"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17540161998261316532",
            startPort = "Out",
            endQuest = "17533467848891330634",
            endPort = "In"
          },
          {
            startQuest = "17557453372342796",
            startPort = "Out",
            endQuest = "17557453372342798",
            endPort = "In"
          },
          {
            startQuest = "17557453372342799",
            startPort = "Out",
            endQuest = "17557453372342796",
            endPort = "In"
          },
          {
            startQuest = "17557456730894693",
            startPort = "Out",
            endQuest = "17557456730894691",
            endPort = "In"
          },
          {
            startQuest = "1752463403168441",
            startPort = "QuestStart",
            endQuest = "17557453777223804",
            endPort = "In"
          },
          {
            startQuest = "17557453777223804",
            startPort = "Out",
            endQuest = "1755831411713938883",
            endPort = "In"
          },
          {
            startQuest = "1755831411713938883",
            startPort = "true",
            endQuest = "17540161998261316532",
            endPort = "In"
          },
          {
            startQuest = "1755831312053936237",
            startPort = "Out",
            endQuest = "17557456953285294",
            endPort = "Branch_1"
          },
          {
            startQuest = "1755831411713938883",
            startPort = "false",
            endQuest = "17557456953285294",
            endPort = "Branch_1"
          },
          {
            startQuest = "17533467848891330634",
            startPort = "Out",
            endQuest = "17533468478091331950",
            endPort = "In"
          },
          {
            startQuest = "17533468478091331950",
            startPort = "Out",
            endQuest = "1755831312053936237",
            endPort = "In"
          },
          {
            startQuest = "17557456953285294",
            startPort = "Out",
            endQuest = "1752463403168444",
            endPort = "Success"
          },
          {
            startQuest = "1755831840673946300",
            startPort = "true",
            endQuest = "17557453372342799",
            endPort = "In"
          },
          {
            startQuest = "1755831840673946300",
            startPort = "false",
            endQuest = "17557456953285294",
            endPort = "Branch_2"
          },
          {
            startQuest = "17557453777223804",
            startPort = "Out",
            endQuest = "1755831840673946300",
            endPort = "In"
          },
          {
            startQuest = "17557453777223804",
            startPort = "Out",
            endQuest = "1755831871030947037",
            endPort = "In"
          },
          {
            startQuest = "1755831871030947037",
            startPort = "true",
            endQuest = "17557456730894693",
            endPort = "In"
          },
          {
            startQuest = "1755831871030947037",
            startPort = "false",
            endQuest = "17557456953285294",
            endPort = "Branch_3"
          },
          {
            startQuest = "17557453372342798",
            startPort = "Out",
            endQuest = "1755831899160947808",
            endPort = "In"
          },
          {
            startQuest = "1755831899160947808",
            startPort = "Out",
            endQuest = "17557456953285294",
            endPort = "Branch_2"
          },
          {
            startQuest = "17557456730894691",
            startPort = "Out",
            endQuest = "1755831902029947888",
            endPort = "In"
          },
          {
            startQuest = "1755831902029947888",
            startPort = "Out",
            endQuest = "17557456953285294",
            endPort = "Branch_3"
          }
        },
        nodeData = {
          ["1752463403168441"] = {
            key = "1752463403168441",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 402.88461538461536, y = 610.8076923076923},
            propsData = {ModeType = 0}
          },
          ["1752463403168444"] = {
            key = "1752463403168444",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3117.279149074435, y = 615.4710588562657},
            propsData = {ModeType = 0}
          },
          ["1752463403168447"] = {
            key = "1752463403168447",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3146.3392857142853, y = 1191.25},
            propsData = {}
          },
          ["17533467848891330634"] = {
            key = "17533467848891330634",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1806.0679606840856, y = 206.80623009862083},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103028,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17533468197691331208"] = {
            key = "17533468197691331208",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1227.6551720660402, y = 1402.4367803542611},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17533468478091331950"] = {
            key = "17533468478091331950",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2121.7386209802025, y = 208.29810606879659},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103029,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17540161998261316532"] = {
            key = "17540161998261316532",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1486.2627357931171, y = 208.08397981551514},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080080,
              GuideType = "M",
              GuidePointName = "Mechanism_20030601_2080080"
            }
          },
          ["17557453372342796"] = {
            key = "17557453372342796",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1801.716328692706, y = 601.3783954053251},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103030,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17557453372342797"] = {
            key = "17557453372342797",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1511.363116135647, y = 1410.6112846772342},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17557453372342798"] = {
            key = "17557453372342798",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2127.7130615209635, y = 600.7236477713082},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103031,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17557453372342799"] = {
            key = "17557453372342799",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1516.6863192839899, y = 607.1212146316495},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080083,
              GuideType = "M",
              GuidePointName = "Mechanism_20030602_2080083"
            }
          },
          ["17557453777223804"] = {
            key = "17557453777223804",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 804, y = 608},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = true,
              AllDiffGuideOptions = {
                {
                  OptionElements = {
                    {
                      TargetIndicatorKey = "17540161998261316532",
                      IsShowOptional = false
                    }
                  }
                },
                {
                  OptionElements = {
                    {
                      TargetIndicatorKey = "17557453372342799",
                      IsShowOptional = false
                    }
                  }
                },
                {
                  OptionElements = {
                    {
                      TargetIndicatorKey = "17557456730894693",
                      IsShowOptional = false
                    }
                  }
                }
              }
            }
          },
          ["17557456730894691"] = {
            key = "17557456730894691",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1803.4519599159787, y = 1005.8087983368193},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103032,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17557456730894692"] = {
            key = "17557456730894692",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1775.8387783460832, y = 1409.8965512251882},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17557456730894693"] = {
            key = "17557456730894693",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1525.6625911676126, y = 1004.3387428924589},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080084,
              GuideType = "M",
              GuidePointName = "Mechanism_20030603_2080084"
            }
          },
          ["17557456953285294"] = {
            key = "17557456953285294",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 2785.5535714285716, y = 600.75},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["1755831312053936237"] = {
            key = "1755831312053936237",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2411.4103683983717, y = 203.5112413386405},
            propsData = {VarName = "JiShuvar1", VarValue = 1}
          },
          ["1755831411713938883"] = {
            key = "1755831411713938883",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1205.216685662119, y = 211.9933473389356},
            propsData = {
              FunctionName = "Equal",
              VarName = "JiShuvar1",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1755831840673946300"] = {
            key = "1755831840673946300",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1203.2564726295366, y = 608.628660168521},
            propsData = {
              FunctionName = "Equal",
              VarName = "JiShuvar2",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1755831871030947037"] = {
            key = "1755831871030947037",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1206.7858843942429, y = 1007.4521895802859},
            propsData = {
              FunctionName = "Equal",
              VarName = "JiShuvar3",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1755831899160947808"] = {
            key = "1755831899160947808",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2405.109413806007, y = 599.3639542861681},
            propsData = {VarName = "JiShuvar2", VarValue = 1}
          },
          ["1755831902029947888"] = {
            key = "1755831902029947888",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2124.609413806007, y = 1007.3639542861681},
            propsData = {VarName = "JiShuvar3", VarValue = 1}
          }
        },
        commentData = {}
      }
    },
    ["1752463421655875"] = {
      isStoryNode = true,
      key = "1752463421655875",
      type = "StoryNode",
      name = "\230\139\168\229\188\149\231\159\179\229\157\151",
      pos = {x = 1484.9999999999998, y = 1025.0000000000002},
      propsData = {
        QuestId = 20030602,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200306_2",
        QuestDeatil = "Content_200306_2",
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
        SubRegionId = 104107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20030602_2080083"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17533472598941333190",
            startPort = "Out",
            endQuest = "1752463421656879",
            endPort = "Success"
          },
          {
            startQuest = "17533472598931333188",
            startPort = "Out",
            endQuest = "17533472598941333190",
            endPort = "In"
          },
          {
            startQuest = "1752463421655876",
            startPort = "QuestStart",
            endQuest = "17540162106021316826",
            endPort = "In"
          },
          {
            startQuest = "17540162106021316826",
            startPort = "Out",
            endQuest = "17533472598931333188",
            endPort = "In"
          }
        },
        nodeData = {
          ["1752463421655876"] = {
            key = "1752463421655876",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1752463421656879"] = {
            key = "1752463421656879",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2430, y = 306},
            propsData = {ModeType = 0}
          },
          ["1752463421656882"] = {
            key = "1752463421656882",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17533472598931333188"] = {
            key = "17533472598931333188",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1690.423198263205, y = 271.60083402444957},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103030,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17533472598931333189"] = {
            key = "17533472598931333189",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1693.4012550559917, y = 446.15673671225125},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17533472598941333190"] = {
            key = "17533472598941333190",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2066.076277840689, y = 302.8965507867174},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103031,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17540162106021316826"] = {
            key = "17540162106021316826",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1290, y = 274},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080083,
              GuideType = "N",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["1752463425345993"] = {
      isStoryNode = true,
      key = "1752463425345993",
      type = "StoryNode",
      name = "\230\151\139\232\189\172\230\137\135\229\143\182",
      pos = {x = 1854.1904761385756, y = 1005.6666666666669},
      propsData = {
        QuestId = 20030603,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200306_3",
        QuestDeatil = "Content_200306_3",
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
        SubRegionId = 104107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20030603_2080084"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17533473747862324262",
            startPort = "Out",
            endQuest = "1752463425345997",
            endPort = "Success"
          },
          {
            startQuest = "1752463425345994",
            startPort = "QuestStart",
            endQuest = "17540162180101317066",
            endPort = "In"
          },
          {
            startQuest = "17540162180101317066",
            startPort = "Out",
            endQuest = "17533473747862324262",
            endPort = "In"
          }
        },
        nodeData = {
          ["1752463425345994"] = {
            key = "1752463425345994",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1752463425345997"] = {
            key = "1752463425345997",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2314, y = 358},
            propsData = {ModeType = 0}
          },
          ["17524634253451000"] = {
            key = "17524634253451000",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17533473747862324262"] = {
            key = "17533473747862324262",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1846.2413811322674, y = 296.20689754962353},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51103032,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17533473747862324263"] = {
            key = "17533473747862324263",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1816.3103461051999, y = 459.79310245037647},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17540162180101317066"] = {
            key = "17540162180101317066",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1334, y = 296},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080084,
              GuideType = "N",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17524799552681856"] = {
      isStoryNode = true,
      key = "17524799552681856",
      type = "StoryNode",
      name = "\228\184\142\229\133\172\229\176\154\229\175\185\232\175\157",
      pos = {x = 1962.7311827956987, y = 273.6153845861244},
      propsData = {
        QuestId = 20030603,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200306_4",
        QuestDeatil = "Content_200306_4",
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
        SubRegionId = 104107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20030604_2080085"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17524799552681861",
            startPort = "QuestStart",
            endQuest = "17533475473817274838",
            endPort = "In"
          },
          {
            startQuest = "17533475473817274838",
            startPort = "Out",
            endQuest = "17533475392537274615",
            endPort = "In"
          },
          {
            startQuest = "17533475392537274615",
            startPort = "Out",
            endQuest = "17524799552681862",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17524799552681861"] = {
            key = "17524799552681861",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17524799552681862"] = {
            key = "17524799552681862",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2150.0000079985584, y = 314.5161288536302},
            propsData = {ModeType = 0}
          },
          ["17524799552681863"] = {
            key = "17524799552681863",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2204.838717001162, y = 590.3225819947941},
            propsData = {}
          },
          ["17533475392537274615"] = {
            key = "17533475392537274615",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1579.9999993847262, y = 289.677420466301},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51103034,
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
          ["17533475473817274838"] = {
            key = "17533475473817274838",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1217.9354870465743, y = 289.4838699158223},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080085,
              GuideType = "N",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["1755757322327936561"] = {
      isStoryNode = true,
      key = "1755757322327936561",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\229\133\172\229\176\154",
      pos = {x = 1401.9448621553884, y = 273.96616541353376},
      propsData = {
        QuestId = 20030601,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200306_1",
        QuestDeatil = "Content_200306_1",
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
        SubRegionId = 104107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20030601_2080080"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1755757322327936566",
            startPort = "QuestStart",
            endQuest = "1755757322327936577",
            endPort = "In"
          },
          {
            startQuest = "1755757322327936577",
            startPort = "Out",
            endQuest = "1755757322327936572",
            endPort = "In"
          },
          {
            startQuest = "1755757322327936577",
            startPort = "Out",
            endQuest = "1755757322327936576",
            endPort = "In"
          },
          {
            startQuest = "1755757322327936577",
            startPort = "Out",
            endQuest = "1755757322327936580",
            endPort = "In"
          },
          {
            startQuest = "1755757322327936572",
            startPort = "Out",
            endQuest = "1755757463351938919",
            endPort = "In"
          },
          {
            startQuest = "1755757322327936576",
            startPort = "Out",
            endQuest = "17557580313381861122",
            endPort = "In"
          },
          {
            startQuest = "1755757322327936580",
            startPort = "Out",
            endQuest = "17557580365681861253",
            endPort = "In"
          },
          {
            startQuest = "1755757463351938919",
            startPort = "Out",
            endQuest = "1755757322327936567",
            endPort = "Success"
          },
          {
            startQuest = "17557580313381861122",
            startPort = "Out",
            endQuest = "1755757322327936567",
            endPort = "Success"
          },
          {
            startQuest = "17557580365681861253",
            startPort = "Out",
            endQuest = "1755757322327936567",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1755757322327936566"] = {
            key = "1755757322327936566",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 602.1052631578948, y = 608.7368421052631},
            propsData = {ModeType = 0}
          },
          ["1755757322327936567"] = {
            key = "1755757322327936567",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2004.640051330074, y = 609.1590287810777},
            propsData = {ModeType = 0}
          },
          ["1755757322327936568"] = {
            key = "1755757322327936568",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2805.625, y = 1011.25},
            propsData = {}
          },
          ["1755757322327936572"] = {
            key = "1755757322327936572",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1281.393319605589, y = 406.1685662816805},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080080,
              GuideType = "M",
              GuidePointName = "Mechanism_20030601_2080080"
            }
          },
          ["1755757322327936576"] = {
            key = "1755757322327936576",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1280.6723873954452, y = 605.5422672632285},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080083,
              GuideType = "M",
              GuidePointName = "Mechanism_20030602_2080083"
            }
          },
          ["1755757322327936577"] = {
            key = "1755757322327936577",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 892.421052631579, y = 609.5789473684209},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = true,
              AllDiffGuideOptions = {}
            }
          },
          ["1755757322327936580"] = {
            key = "1755757322327936580",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\186\229\133\179",
            pos = {x = 1278.826677854919, y = 806.1034487748118},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080084,
              GuideType = "M",
              GuidePointName = "Mechanism_20030603_2080084"
            }
          },
          ["1755757463351938919"] = {
            key = "1755757463351938919",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1603.7916666666665, y = 409.79166666666674},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51103013,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["17557580313381861122"] = {
            key = "17557580313381861122",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1606.272186147186, y = 603.5903679653679},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51103055,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["17557580365681861253"] = {
            key = "17557580365681861253",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1607.772186147186, y = 807.5903679653679},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51103056,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
