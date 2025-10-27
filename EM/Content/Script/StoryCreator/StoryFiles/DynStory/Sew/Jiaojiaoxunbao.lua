return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17411679522891",
      startPort = "StoryStart",
      endStory = "174116795662757",
      endPort = "In"
    },
    {
      startStory = "174116795662757",
      startPort = "Success",
      endStory = "17411679522905",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17411679522891"] = {
      isStoryNode = true,
      key = "17411679522891",
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
    ["17411679522905"] = {
      isStoryNode = true,
      key = "17411679522905",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1508.344827586207, y = 287.58620689655174},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["174116795662757"] = {
      isStoryNode = true,
      key = "174116795662757",
      type = "StoryNode",
      name = "\231\154\142\231\154\142\229\175\187\229\174\157",
      pos = {x = 1163.7413793103449, y = 291.58620689655174},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_Jiaojiaoxunbao_Des",
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
            startQuest = "174116795662762",
            startPort = "QuestStart",
            endQuest = "174116795662765",
            endPort = "In"
          },
          {
            startQuest = "174116795662765",
            startPort = "Out",
            endQuest = "174116795662766",
            endPort = "In"
          },
          {
            startQuest = "174116795662765",
            startPort = "Out",
            endQuest = "174116795662767",
            endPort = "In"
          },
          {
            startQuest = "174116795662768",
            startPort = "Out",
            endQuest = "174116795662972",
            endPort = "In"
          },
          {
            startQuest = "174116795662974",
            startPort = "Out",
            endQuest = "174116795662975",
            endPort = "In"
          },
          {
            startQuest = "174116795662975",
            startPort = "Out",
            endQuest = "174116795662976",
            endPort = "In"
          },
          {
            startQuest = "174116795662975",
            startPort = "Out",
            endQuest = "174116795662977",
            endPort = "In"
          },
          {
            startQuest = "174116795662976",
            startPort = "Out",
            endQuest = "174116795662978",
            endPort = "In"
          },
          {
            startQuest = "174116795662978",
            startPort = "Out",
            endQuest = "174116795662979",
            endPort = "In"
          },
          {
            startQuest = "174116795662979",
            startPort = "Out",
            endQuest = "174116795662763",
            endPort = "Success"
          },
          {
            startQuest = "174116795662869",
            startPort = "Out",
            endQuest = "174116795662764",
            endPort = "Fail"
          },
          {
            startQuest = "174116795662972",
            startPort = "Out",
            endQuest = "174116795662973",
            endPort = "In"
          },
          {
            startQuest = "174116795662973",
            startPort = "Out",
            endQuest = "174116795662970",
            endPort = "In"
          },
          {
            startQuest = "174116795662972",
            startPort = "Out",
            endQuest = "174116795662971",
            endPort = "In"
          },
          {
            startQuest = "174116795662972",
            startPort = "Out",
            endQuest = "174116795662974",
            endPort = "In"
          },
          {
            startQuest = "174116795662765",
            startPort = "Out",
            endQuest = "1741171846320528576",
            endPort = "In"
          },
          {
            startQuest = "174116795662767",
            startPort = "Option_1",
            endQuest = "174116795662768",
            endPort = "In"
          },
          {
            startQuest = "174116795662767",
            startPort = "Option_2",
            endQuest = "174116795662869",
            endPort = "In"
          }
        },
        nodeData = {
          ["174116795662762"] = {
            key = "174116795662762",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["174116795662763"] = {
            key = "174116795662763",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4311.612903225807, y = 109.59677419354838},
            propsData = {ModeType = 0}
          },
          ["174116795662764"] = {
            key = "174116795662764",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2343.928571428571, y = 653.0357142857142},
            propsData = {}
          },
          ["174116795662765"] = {
            key = "174116795662765",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\154\142\231\154\142",
            pos = {x = 1133.8989247311827, y = 298.89032258064515},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720661}
            }
          },
          ["174116795662766"] = {
            key = "174116795662766",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\229\188\128\232\189\166",
            pos = {x = 1448.9707540239096, y = 32.83891072896717},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004201,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174116795662767"] = {
            key = "174116795662767",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1486.0394777265744, y = 279.5289528047036},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818038,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1720661",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71004202,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["174116795662768"] = {
            key = "174116795662768",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1998.8217357910908, y = 175.0128237724455},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1720666,
                1720667,
                1720668,
                1720669
              },
              QuestPickupId = -1,
              UnitId = 80023,
              UnitCount = 4,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["174116795662869"] = {
            key = "174116795662869",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1912.8136712749617, y = 629.851533449865},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["174116795662970"] = {
            key = "174116795662970",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\149\140\228\186\186",
            pos = {x = 2536.9116589380224, y = -25.243016049578998},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720672,
                1720673,
                1720674,
                1720675
              }
            }
          },
          ["174116795662971"] = {
            key = "174116795662971",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\229\188\128\232\189\166",
            pos = {x = 2614.5419805074434, y = 329.4844589226125},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004205,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174116795662972"] = {
            key = "174116795662972",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\156\176\228\184\138\231\154\142\231\154\142",
            pos = {x = 2290.0661740558307, y = 168.47222310503724},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720661}
            }
          },
          ["174116795662973"] = {
            key = "174116795662973",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\178\169\231\159\179\228\184\138\230\150\185\231\154\142\231\154\142",
            pos = {x = 2289.343148471848, y = -22.758310821547752},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720670}
            }
          },
          ["174116795662974"] = {
            key = "174116795662974",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2882.491090629802, y = 138.23863022405843},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720672,
                1720673,
                1720674,
                1720675
              }
            }
          },
          ["174116795662975"] = {
            key = "174116795662975",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3139.910445468511, y = 146.94830764341333},
            propsData = {WaitTime = 1}
          },
          ["174116795662976"] = {
            key = "174116795662976",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\156\176\228\184\138\231\154\142\231\154\142",
            pos = {x = 3390.5556067588336, y = 149.85153344986492},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720661}
            }
          },
          ["174116795662977"] = {
            key = "174116795662977",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\178\169\231\159\179\228\184\138\230\150\185\231\154\142\231\154\142",
            pos = {x = 3387.32980030722, y = 5.657985062768091},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720670}
            }
          },
          ["174116795662978"] = {
            key = "174116795662978",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\231\187\147\230\157\159",
            pos = {x = 3710.878187403994, y = 127.31121086921974},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818038,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1720661",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71004206,
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
          ["174116795662979"] = {
            key = "174116795662979",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4032.168509984639, y = 115.9805657079294},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1741171846320528576"] = {
            key = "1741171846320528576",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189\229\176\184\228\189\147",
            pos = {x = 1467.0441157775085, y = 536.5535663540779},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720662,
                1720663,
                1720664,
                1720665,
                1720678
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
