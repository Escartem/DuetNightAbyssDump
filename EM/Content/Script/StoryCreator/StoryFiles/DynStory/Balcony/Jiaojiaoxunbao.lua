return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17339851690871",
      startPort = "StoryStart",
      endStory = "1733985203312131",
      endPort = "In"
    },
    {
      startStory = "1733985203312131",
      startPort = "Success",
      endStory = "17339851690875",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17339851690871"] = {
      isStoryNode = true,
      key = "17339851690871",
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
    ["17339851690875"] = {
      isStoryNode = true,
      key = "17339851690875",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1477.975, y = 302.4},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1733985203312131"] = {
      isStoryNode = true,
      key = "1733985203312131",
      type = "StoryNode",
      name = "\231\154\142\231\154\142\229\175\187\229\174\157",
      pos = {x = 1142.6, y = 290.5},
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
            startQuest = "1733985203312132",
            startPort = "QuestStart",
            endQuest = "1733985235308907",
            endPort = "In"
          },
          {
            startQuest = "1733985235308907",
            startPort = "Out",
            endQuest = "17339853912771355",
            endPort = "In"
          },
          {
            startQuest = "1733985235308907",
            startPort = "Out",
            endQuest = "17339854854482439",
            endPort = "In"
          },
          {
            startQuest = "17339855316072878",
            startPort = "Out",
            endQuest = "17339858070495933",
            endPort = "In"
          },
          {
            startQuest = "17339858697986849",
            startPort = "Out",
            endQuest = "17339858858827134",
            endPort = "In"
          },
          {
            startQuest = "17339858858827134",
            startPort = "Out",
            endQuest = "17339858936717322",
            endPort = "In"
          },
          {
            startQuest = "17339858858827134",
            startPort = "Out",
            endQuest = "17339859093427739",
            endPort = "In"
          },
          {
            startQuest = "17339858936717322",
            startPort = "Out",
            endQuest = "17339859268628057",
            endPort = "In"
          },
          {
            startQuest = "17339859268628057",
            startPort = "Out",
            endQuest = "17339859335508257",
            endPort = "In"
          },
          {
            startQuest = "17339859335508257",
            startPort = "Out",
            endQuest = "1733985203313139",
            endPort = "Success"
          },
          {
            startQuest = "17339855670633453",
            startPort = "Out",
            endQuest = "1733985203313146",
            endPort = "Fail"
          },
          {
            startQuest = "17339858070495933",
            startPort = "Out",
            endQuest = "17339858188436151",
            endPort = "In"
          },
          {
            startQuest = "17339858188436151",
            startPort = "Out",
            endQuest = "17339855790523828",
            endPort = "In"
          },
          {
            startQuest = "17339858070495933",
            startPort = "Out",
            endQuest = "17339857752195069",
            endPort = "In"
          },
          {
            startQuest = "17339858070495933",
            startPort = "Out",
            endQuest = "17339858697986849",
            endPort = "In"
          },
          {
            startQuest = "17339854854482439",
            startPort = "Option_1",
            endQuest = "17339855316072878",
            endPort = "In"
          },
          {
            startQuest = "17339854854482439",
            startPort = "Option_2",
            endQuest = "17339855670633453",
            endPort = "In"
          }
        },
        nodeData = {
          ["1733985203312132"] = {
            key = "1733985203312132",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1733985203313139"] = {
            key = "1733985203313139",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4311.612903225807, y = 109.59677419354838},
            propsData = {ModeType = 0}
          },
          ["1733985203313146"] = {
            key = "1733985203313146",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2343.928571428571, y = 653.0357142857142},
            propsData = {}
          },
          ["1733985235308907"] = {
            key = "1733985235308907",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\154\142\231\154\142",
            pos = {x = 1133.8989247311827, y = 298.89032258064515},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570145}
            }
          },
          ["17339853912771355"] = {
            key = "17339853912771355",
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
          ["17339854854482439"] = {
            key = "17339854854482439",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1486.0394777265744, y = 279.5289528047036},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818038,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1570145",
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
          ["17339855316072878"] = {
            key = "17339855316072878",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1998.8217357910908, y = 175.0128237724455},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1570152,
                1570153,
                1570154,
                1570155
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
          ["17339855670633453"] = {
            key = "17339855670633453",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1912.8136712749617, y = 629.851533449865},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["17339855790523828"] = {
            key = "17339855790523828",
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
                1570147,
                1570148,
                1570149,
                1570150
              }
            }
          },
          ["17339857752195069"] = {
            key = "17339857752195069",
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
          ["17339858070495933"] = {
            key = "17339858070495933",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\156\176\228\184\138\231\154\142\231\154\142",
            pos = {x = 2290.0661740558307, y = 168.47222310503724},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570145}
            }
          },
          ["17339858188436151"] = {
            key = "17339858188436151",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\178\169\231\159\179\228\184\138\230\150\185\231\154\142\231\154\142",
            pos = {x = 2289.343148471848, y = -22.758310821547752},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570146}
            }
          },
          ["17339858697986849"] = {
            key = "17339858697986849",
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
                1570147,
                1570148,
                1570149,
                1570150
              }
            }
          },
          ["17339858858827134"] = {
            key = "17339858858827134",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3139.910445468511, y = 146.94830764341333},
            propsData = {WaitTime = 1}
          },
          ["17339858936717322"] = {
            key = "17339858936717322",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\156\176\228\184\138\231\154\142\231\154\142",
            pos = {x = 3390.5556067588336, y = 149.85153344986492},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570145}
            }
          },
          ["17339859093427739"] = {
            key = "17339859093427739",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\178\169\231\159\179\228\184\138\230\150\185\231\154\142\231\154\142",
            pos = {x = 3387.32980030722, y = 5.657985062768091},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570146}
            }
          },
          ["17339859268628057"] = {
            key = "17339859268628057",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\231\187\147\230\157\159",
            pos = {x = 3710.878187403994, y = 127.31121086921974},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818038,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1570145",
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
          ["17339859335508257"] = {
            key = "17339859335508257",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4032.168509984639, y = 115.9805657079294},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
