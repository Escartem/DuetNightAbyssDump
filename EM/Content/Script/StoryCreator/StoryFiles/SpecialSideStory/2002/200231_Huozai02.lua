return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17447258370735450535",
      startPort = "Success",
      endStory = "17447258370735450536",
      endPort = "In"
    },
    {
      startStory = "17447258370735450536",
      startPort = "Success",
      endStory = "17447258370735450537",
      endPort = "In"
    },
    {
      startStory = "17448589446675491637",
      startPort = "Success",
      endStory = "17447258370735450534",
      endPort = "StoryEnd"
    },
    {
      startStory = "17447258370735450537",
      startPort = "Success",
      endStory = "174859613777116869268",
      endPort = "In"
    },
    {
      startStory = "174859613777116869268",
      startPort = "Success",
      endStory = "17448589446675491637",
      endPort = "In"
    },
    {
      startStory = "17447258370735450533",
      startPort = "StoryStart",
      endStory = "17512717337712164",
      endPort = "In"
    },
    {
      startStory = "17512717337712164",
      startPort = "Success",
      endStory = "17447258370735450535",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17447258370735450533"] = {
      isStoryNode = true,
      key = "17447258370735450533",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 820, y = 300},
      propsData = {QuestChainId = 200231},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17447258370735450534"] = {
      isStoryNode = true,
      key = "17447258370735450534",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2659.7451883221634, y = 255.1518366642235},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17447258370735450535"] = {
      isStoryNode = true,
      key = "17447258370735450535",
      type = "StoryNode",
      name = "\228\184\142\230\139\137\230\150\175\229\175\185\232\175\157",
      pos = {x = 1076, y = 292.8870967940411},
      propsData = {
        QuestId = 20023101,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_1",
        QuestDeatil = "Content_200231_1",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Lars_SSS_1191533"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447258370735450542",
            startPort = "Out",
            endQuest = "17447258370735450540",
            endPort = "Success"
          },
          {
            startQuest = "17447258370735450539",
            startPort = "QuestStart",
            endQuest = "17447258370735450542",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447258370735450539"] = {
            key = "17447258370735450539",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 920, y = 305.45454545454544},
            propsData = {ModeType = 0}
          },
          ["17447258370735450540"] = {
            key = "17447258370735450540",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1622.9090909090908, y = 306.54545454545456},
            propsData = {ModeType = 0}
          },
          ["17447258370735450541"] = {
            key = "17447258370735450541",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1626, y = 458.63636363636374},
            propsData = {}
          },
          ["17447258370735450542"] = {
            key = "17447258370735450542",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1257.9729206646653, y = 278.60541646226795},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009608,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17447258370735450536"] = {
      isStoryNode = true,
      key = "17447258370735450536",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\176\143\229\183\183&\228\184\142\233\151\168\228\186\164\228\186\146",
      pos = {x = 1340.4002562708563, y = 293.984218058564},
      propsData = {
        QuestId = 20023102,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_2",
        QuestDeatil = "Content_200231_2",
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
        StoryGuidePointName = "QuestPoint_20023102"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447258370735450543",
            startPort = "QuestStart",
            endQuest = "17447258370735450546",
            endPort = "In"
          },
          {
            startQuest = "17447258370735450546",
            startPort = "Out",
            endQuest = "17447258370735450548",
            endPort = "In"
          },
          {
            startQuest = "17447258370735450548",
            startPort = "Out",
            endQuest = "17447258370735450547",
            endPort = "In"
          },
          {
            startQuest = "17447258370735450547",
            startPort = "Out",
            endQuest = "17447258370735450544",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17447258370735450543"] = {
            key = "17447258370735450543",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 798, y = 306},
            propsData = {ModeType = 0}
          },
          ["17447258370735450544"] = {
            key = "17447258370735450544",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2226.2134706924016, y = 300.24539474730364},
            propsData = {ModeType = 0}
          },
          ["17447258370735450545"] = {
            key = "17447258370735450545",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2165.442070508084, y = 570.0762189675626},
            propsData = {}
          },
          ["17447258370735450546"] = {
            key = "17447258370735450546",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1046, y = 304},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191535,
              GuideType = "P",
              GuidePointName = "QuestPoint_20023102"
            }
          },
          ["17447258370735450547"] = {
            key = "17447258370735450547",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\139\137\230\150\175",
            pos = {x = 1701.1229065406822, y = 294.08703968176985},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191536}
            }
          },
          ["17447258370735450548"] = {
            key = "17447258370735450548",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1367.80440262174, y = 299.213347867309},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009610,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20023102",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700303,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700303}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17447258370735450537"] = {
      isStoryNode = true,
      key = "17447258370735450537",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\159\191\229\157\145\233\129\135\232\167\129\229\164\167\229\143\148",
      pos = {x = 1627.1217192516992, y = 292.98121222572524},
      propsData = {
        QuestId = 20023103,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_3",
        QuestDeatil = "Content_200231_3",
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
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "Npc_Donat_SSS_1240916"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "174860570823718649117",
            startPort = "Out",
            endQuest = "174860585748318651336",
            endPort = "In"
          },
          {
            startQuest = "174860590876018652868",
            startPort = "Out",
            endQuest = "174860570823718649117",
            endPort = "In"
          },
          {
            startQuest = "17489381170866244820",
            startPort = "Out",
            endQuest = "17489381170866244821",
            endPort = "In"
          },
          {
            startQuest = "17447258370735450554",
            startPort = "Out",
            endQuest = "17489392903708620960",
            endPort = "In"
          },
          {
            startQuest = "174860585748318651336",
            startPort = "Success",
            endQuest = "17447258370735450550",
            endPort = "Success"
          },
          {
            startQuest = "17489392903708620960",
            startPort = "Out",
            endQuest = "174860590876018652868",
            endPort = "In"
          },
          {
            startQuest = "174860585748318651336",
            startPort = "Fail",
            endQuest = "174910671301941156727",
            endPort = "In"
          },
          {
            startQuest = "174860585748318651336",
            startPort = "PassiveFail",
            endQuest = "174910671301941156727",
            endPort = "In"
          },
          {
            startQuest = "174910671301941156727",
            startPort = "Out",
            endQuest = "17447258370735450551",
            endPort = "Fail"
          },
          {
            startQuest = "17447258370735450549",
            startPort = "QuestStart",
            endQuest = "174928012722754850389",
            endPort = "In"
          },
          {
            startQuest = "174928012722754850389",
            startPort = "Out",
            endQuest = "17447258370735450554",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447258370735450549"] = {
            key = "17447258370735450549",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 736.2830867053601, y = 266.7939816679938},
            propsData = {ModeType = 0}
          },
          ["17447258370735450550"] = {
            key = "17447258370735450550",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2952.9678074428657, y = 210.48965131314304},
            propsData = {ModeType = 0}
          },
          ["17447258370735450551"] = {
            key = "17447258370735450551",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3114.918467000517, y = 431.11690398812914},
            propsData = {}
          },
          ["17447258370735450554"] = {
            key = "17447258370735450554",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1284.584927174211, y = 272.89329253715016},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700301,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Donat_SSS_1240916",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009629,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 1,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174860570823718649117"] = {
            key = "174860570823718649117",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2221.8634645299844, y = 286.7446089366498},
            propsData = {
              NewDescription = "Description_200231_4",
              NewDetail = "Content_200231_4",
              SubTaskTargetIndex = 0
            }
          },
          ["174860585748318651336"] = {
            key = "174860585748318651336",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2503.0474450942793, y = 262.2342057009259},
            propsData = {SpecialConfigId = 1050, BlackScreenImmediately = true}
          },
          ["174860590876018652868"] = {
            key = "174860590876018652868",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1911.9598514288116, y = 280.89487215191855},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_20023104"
            }
          },
          ["17489381170866244820"] = {
            key = "17489381170866244820",
            type = "SetNpcPatrolNode",
            name = "\232\174\190\231\189\174\229\164\154\231\186\179\231\137\185\229\183\161\233\128\1871",
            pos = {x = 1655.360489590483, y = -132.77799970975562},
            propsData = {NpcId = 700301, PatrolId = 2002310401}
          },
          ["17489381170866244821"] = {
            key = "17489381170866244821",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175\239\188\140\232\174\169\229\164\154\231\186\179\231\137\185\228\184\138\232\183\175",
            pos = {x = 1945.8068220354926, y = -123.19298823941185},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "DonatGo1",
              UnitId = 700301
            }
          },
          ["17489392903708620960"] = {
            key = "17489392903708620960",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\164\154\231\186\179\231\137\185",
            pos = {x = 1560.5930505088236, y = 262.5441118433291},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240916}
            }
          },
          ["174910671301941156727"] = {
            key = "174910671301941156727",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2820.7190306441025, y = 435.15095350305086},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_Nvzhu_20023103",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["174928012722754850389"] = {
            key = "174928012722754850389",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\164\154\231\186\179\231\137\185",
            pos = {x = 1022.4673357838676, y = 292.0274152507302},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240916}
            }
          }
        },
        commentData = {}
      }
    },
    ["17448589446675491637"] = {
      isStoryNode = true,
      key = "17448589446675491637",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\229\176\143\229\183\183+\231\186\191\231\180\1621    ",
      pos = {x = 2255.757906971642, y = 308.3599819964297},
      propsData = {
        QuestId = 20023108,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_5",
        QuestDeatil = "Content_200231_5",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20023108"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17448590098465492157",
            startPort = "Out",
            endQuest = "17448590585515492524",
            endPort = "In"
          },
          {
            startQuest = "17448589446685491638",
            startPort = "QuestStart",
            endQuest = "174903285757837562848",
            endPort = "In"
          },
          {
            startQuest = "174903285757837562848",
            startPort = "Out",
            endQuest = "17448590098465492157",
            endPort = "In"
          },
          {
            startQuest = "17448590585515492524",
            startPort = "Out",
            endQuest = "174903320199737565292",
            endPort = "In"
          },
          {
            startQuest = "17501294609933785647",
            startPort = "Out",
            endQuest = "17501294609933785648",
            endPort = "Input"
          },
          {
            startQuest = "17501294609933785645",
            startPort = "true",
            endQuest = "17501294609933785646",
            endPort = "Input"
          },
          {
            startQuest = "17501294609933785646",
            startPort = "Out",
            endQuest = "17501294609933785649",
            endPort = "In"
          },
          {
            startQuest = "17501294609933785649",
            startPort = "Out",
            endQuest = "17501294609933785647",
            endPort = "Input"
          },
          {
            startQuest = "17501294609933785645",
            startPort = "false",
            endQuest = "17501294609933785647",
            endPort = "Input"
          },
          {
            startQuest = "174903320199737565292",
            startPort = "Out",
            endQuest = "17501294609933785645",
            endPort = "In"
          },
          {
            startQuest = "17501294609933785648",
            startPort = "Out",
            endQuest = "17448589446685491641",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17448589446685491638"] = {
            key = "17448589446685491638",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 574.8888965496799, y = 325.55555539857215},
            propsData = {ModeType = 0}
          },
          ["17448589446685491641"] = {
            key = "17448589446685491641",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3571.333330696012, y = 327.5555556811423},
            propsData = {ModeType = 0}
          },
          ["17448589446685491644"] = {
            key = "17448589446685491644",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1976, y = 582},
            propsData = {}
          },
          ["17448590098465492157"] = {
            key = "17448590098465492157",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1110, y = 313.1111110797144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009665,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023108",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700303,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700301,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700303},
                {TalkActorType = "Npc", TalkActorId = 700301}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17448590585515492524"] = {
            key = "17448590585515492524",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1386.2222221594288, y = 311.1111110797144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009713,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 1,
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
          ["174903285757837562848"] = {
            key = "174903285757837562848",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 822.8148246559311, y = 321.77777190659776},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191538,
              GuideType = "P",
              GuidePointName = "QuestPoint_20023108"
            }
          },
          ["174903320199737565292"] = {
            key = "174903320199737565292",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1666.1481313334796, y = 308.44443471147224},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009714,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023108",
              BlendInTime = 0,
              BlendOutTime = 1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700303,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700301,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700303},
                {TalkActorType = "Npc", TalkActorId = 700301}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17501294609933785645"] = {
            key = "17501294609933785645",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "0\230\156\170\232\167\163\233\148\129\230\142\168\231\144\134\233\151\174\233\162\152\239\188\1401\228\184\186\229\183\178\232\167\163\233\148\129",
            pos = {x = 1960.2826900404054, y = 289.5556489161263},
            propsData = {
              FunctionName = "Equal",
              VarName = "Huozai04Side",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17501294609933785646"] = {
            key = "17501294609933785646",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 2313.6350951486756, y = 154.51027877428135},
            propsData = {
              QuestionIds = {2002},
              OpenToast = false
            }
          },
          ["17501294609933785647"] = {
            key = "17501294609933785647",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2802.352506639967, y = 327.48972122571854},
            propsData = {
              AnswerIds = {200201}
            }
          },
          ["17501294609933785648"] = {
            key = "17501294609933785648",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 3119.717309959595, y = 323.47253607842913},
            propsData = {AnswerId = 200201, AutoOpenDetectiveGameUI = false}
          },
          ["17501294609933785649"] = {
            key = "17501294609933785649",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2576.8092005226054, y = 153.82632498785256},
            propsData = {
              VarName = "Huozai04Side",
              VarValue = 1
            }
          }
        },
        commentData = {
          ["17501294751363785918"] = {
            key = "17501294751363785918",
            name = "\232\142\183\229\190\151\231\186\191\231\180\1621",
            position = {x = 1892, y = 62},
            size = {width = 1596, height = 492}
          }
        }
      }
    },
    ["174859613777116869268"] = {
      isStoryNode = true,
      key = "174859613777116869268",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\231\159\191\229\157\145+\231\186\191\231\180\1623    ",
      pos = {x = 1924.0230380874018, y = 289.06668572678444},
      propsData = {
        QuestId = 20023105,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_4",
        QuestDeatil = "Content_200231_4",
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
        SubRegionId = 101301,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20023106"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "174859613777116869269",
            startPort = "QuestStart",
            endQuest = "174859679754616871350",
            endPort = "In"
          },
          {
            startQuest = "174859679754616871350",
            startPort = "Out",
            endQuest = "174894188750513377294",
            endPort = "In"
          },
          {
            startQuest = "174894188750513377294",
            startPort = "Fail",
            endQuest = "174902914413033079622",
            endPort = "In"
          },
          {
            startQuest = "174902914413033079622",
            startPort = "Out",
            endQuest = "174859613777216869275",
            endPort = "Fail"
          },
          {
            startQuest = "174894188750513377294",
            startPort = "PassiveFail",
            endQuest = "174903000203534872838",
            endPort = "In"
          },
          {
            startQuest = "174903000203534872838",
            startPort = "Out",
            endQuest = "174859613777216869275",
            endPort = "Fail"
          },
          {
            startQuest = "17501293839583783822",
            startPort = "Out",
            endQuest = "17501293839583783823",
            endPort = "Input"
          },
          {
            startQuest = "17501293839583783820",
            startPort = "true",
            endQuest = "17501293839583783821",
            endPort = "Input"
          },
          {
            startQuest = "17501293839583783821",
            startPort = "Out",
            endQuest = "17501293839583783824",
            endPort = "In"
          },
          {
            startQuest = "17501293839583783824",
            startPort = "Out",
            endQuest = "17501293839583783822",
            endPort = "Input"
          },
          {
            startQuest = "17501293839583783820",
            startPort = "false",
            endQuest = "17501293839583783822",
            endPort = "Input"
          },
          {
            startQuest = "17501293839583783823",
            startPort = "Out",
            endQuest = "174859613777116869272",
            endPort = "Success"
          },
          {
            startQuest = "174894188750513377294",
            startPort = "Success",
            endQuest = "17501293839583783820",
            endPort = "In"
          }
        },
        nodeData = {
          ["174859613777116869269"] = {
            key = "174859613777116869269",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["174859613777116869272"] = {
            key = "174859613777116869272",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3281.3772209610715, y = 313.20086263792075},
            propsData = {ModeType = 0}
          },
          ["174859613777216869275"] = {
            key = "174859613777216869275",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2227.1028280405103, y = 486.27341865419567},
            propsData = {}
          },
          ["174859679754616871350"] = {
            key = "174859679754616871350",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1147.282051252791, y = 321.28205125279106},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101301,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20023106"
            }
          },
          ["174894188750513377294"] = {
            key = "174894188750513377294",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1446.3767645146415, y = 286.5526493977138},
            propsData = {SpecialConfigId = 1051, BlackScreenImmediately = false}
          },
          ["174895118236916943914"] = {
            key = "174895118236916943914",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2776.572293051789, y = -267.1653654884837},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009646,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174895967132021415095"] = {
            key = "174895967132021415095",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2656.0105618564367, y = -79.98220484870376},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_20023107"
            }
          },
          ["174902914413033079622"] = {
            key = "174902914413033079622",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1903.2862484031293, y = 483.15546555406854},
            propsData = {
              ModeType = 1,
              Id = 101103,
              StartIndex = 9,
              IsWhite = false
            }
          },
          ["174903000203534872838"] = {
            key = "174903000203534872838",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1896.1433913640735, y = 690.2983196866884},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NvzhuPoint_20023106",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17501293839583783820"] = {
            key = "17501293839583783820",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "0\230\156\170\232\167\163\233\148\129\230\142\168\231\144\134\233\151\174\233\162\152\239\188\1401\228\184\186\229\183\178\232\167\163\233\148\129",
            pos = {x = 1776.0402623183984, y = 261.07080271986274},
            propsData = {
              FunctionName = "Equal",
              VarName = "Huozai04Side",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17501293839583783821"] = {
            key = "17501293839583783821",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 2099.3926674266686, y = 126.0254325780179},
            propsData = {
              QuestionIds = {2002},
              OpenToast = false
            }
          },
          ["17501293839583783822"] = {
            key = "17501293839583783822",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2612.11007891796, y = 329.004875029455},
            propsData = {
              AnswerIds = {200203}
            }
          },
          ["17501293839583783823"] = {
            key = "17501293839583783823",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 2918.505185221185, y = 305.0482935374225},
            propsData = {AnswerId = 200203, AutoOpenDetectiveGameUI = false}
          },
          ["17501293839583783824"] = {
            key = "17501293839583783824",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2341.475863849807, y = 146.97784298842248},
            propsData = {
              VarName = "Huozai04Side",
              VarValue = 1
            }
          }
        },
        commentData = {
          ["17501293871323784005"] = {
            key = "17501293871323784005",
            name = "\232\142\183\229\190\151\231\186\191\231\180\1623",
            position = {x = 1695.7575838376815, y = 6.303038313077195},
            size = {width = 1498.4848253888242, height = 474.2424169329646}
          }
        }
      }
    },
    ["17512717337712164"] = {
      isStoryNode = true,
      key = "17512717337712164",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 895.6032608695652, y = 111.79241953698471},
      propsData = {
        QuestId = 20023100,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Lars_SSS_1191533"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512717337712174",
            startPort = "Out",
            endQuest = "17512717337712172",
            endPort = "Input"
          },
          {
            startQuest = "17512717337712178",
            startPort = "Out",
            endQuest = "17512717337712172",
            endPort = "Input"
          },
          {
            startQuest = "17512717337712177",
            startPort = "true",
            endQuest = "17512717337712174",
            endPort = "In"
          },
          {
            startQuest = "17512717337712172",
            startPort = "CancelOut",
            endQuest = "17512717337712180",
            endPort = "In"
          },
          {
            startQuest = "17512717337712180",
            startPort = "Out",
            endQuest = "17512717337712170",
            endPort = "Fail"
          },
          {
            startQuest = "17512717337712168",
            startPort = "QuestStart",
            endQuest = "17512717337712177",
            endPort = "In"
          },
          {
            startQuest = "17512717337712177",
            startPort = "false",
            endQuest = "17512717337712178",
            endPort = "In"
          },
          {
            startQuest = "17512717337712172",
            startPort = "ApproveOut",
            endQuest = "17512717337712169",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17512717337712168"] = {
            key = "17512717337712168",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 517.7901008194377, y = 311.1283564871089},
            propsData = {ModeType = 0}
          },
          ["17512717337712169"] = {
            key = "17512717337712169",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3048.4444366580665, y = 219.33333529248648},
            propsData = {ModeType = 0}
          },
          ["17512717337712170"] = {
            key = "17512717337712170",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3065.111102947973, y = 393.55555859475464},
            propsData = {}
          },
          ["17512717337712171"] = {
            key = "17512717337712171",
            type = "TalkNode",
            name = "\233\187\145\229\185\149",
            pos = {x = 1693.8672117512372, y = 468.7524852092009},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009602,
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
          ["17512717337712172"] = {
            key = "17512717337712172",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 2434.8095163168637, y = 286.16636814671847},
            propsData = {
              SideQuestChainId = 200231,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512717337712173"] = {
            key = "17512717337712173",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1406.2229687635509, y = 737.9084407171574},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191532,
              GuideType = "N",
              GuidePointName = "Npc_Lars_SSS_1191533"
            }
          },
          ["17512717337712174"] = {
            key = "17512717337712174",
            type = "TalkNode",
            name = "\230\139\146\231\187\157\229\144\142\229\134\141\230\172\161\229\175\185\232\175\157",
            pos = {x = 1660.1392908804482, y = -64.53961179666871},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700303,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Lars_SSS_1191533",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009603,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["17512717337712175"] = {
            key = "17512717337712175",
            type = "TalkNode",
            name = "\229\134\141\230\172\161\229\146\140\229\176\143\231\148\183\229\173\169\229\175\185\232\175\157",
            pos = {x = 2051.3766527455678, y = 698.6825990497822},
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
          ["17512717337712176"] = {
            key = "17512717337712176",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1802.3766527455675, y = 716.1825990497822},
            propsData = {WaitTime = 0}
          },
          ["17512717337712177"] = {
            key = "17512717337712177",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "1\228\184\186\230\139\146\231\187\157\228\187\187\229\138\161\239\188\1400\228\184\186\230\142\165\229\143\151\228\187\187\229\138\161",
            pos = {x = 981.8990108026514, y = 297.57575283511767},
            propsData = {
              FunctionName = "Equal",
              VarName = "LarsSide",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17512717337712178"] = {
            key = "17512717337712178",
            type = "TalkNode",
            name = "\229\175\185\232\175\157",
            pos = {x = 1995.2412063711322, y = 367.12457878863415},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700303,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Lars_SSS_1191533",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009602,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["17512717337712180"] = {
            key = "17512717337712180",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2753.399464930915, y = 403.7307648974035},
            propsData = {VarName = "LarsSide", VarValue = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
