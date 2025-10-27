return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210758532488",
      startPort = "Success",
      endStory = "17331304326576008",
      endPort = "In"
    },
    {
      startStory = "17331304326576008",
      startPort = "Success",
      endStory = "17331304353946175",
      endPort = "In"
    },
    {
      startStory = "173313058531414974",
      startPort = "Success",
      endStory = "173313061135516892",
      endPort = "In"
    },
    {
      startStory = "173313061135516892",
      startPort = "Success",
      endStory = "173313063371018107",
      endPort = "In"
    },
    {
      startStory = "173313063371018107",
      startPort = "Success",
      endStory = "173313065608419523",
      endPort = "In"
    },
    {
      startStory = "173313065608419523",
      startPort = "Success",
      endStory = "173313071970323055",
      endPort = "In"
    },
    {
      startStory = "173313078770026699",
      startPort = "Success",
      endStory = "173313080459528313",
      endPort = "In"
    },
    {
      startStory = "173158426406615286",
      startPort = "Success",
      endStory = "1732783210758532487",
      endPort = "StoryEnd"
    },
    {
      startStory = "173313072240423254",
      startPort = "Success",
      endStory = "173313078770026699",
      endPort = "In"
    },
    {
      startStory = "173313080459528313",
      startPort = "Success",
      endStory = "173313081633729374",
      endPort = "In"
    },
    {
      startStory = "173313071970323055",
      startPort = "Success",
      endStory = "173158426406615286",
      endPort = "In"
    },
    {
      startStory = "1732783210758532486",
      startPort = "StoryStart",
      endStory = "17452255389874116",
      endPort = "In"
    },
    {
      startStory = "17452255389874116",
      startPort = "Success",
      endStory = "1732783210758532488",
      endPort = "In"
    },
    {
      startStory = "17331304353946175",
      startPort = "Success",
      endStory = "173313058531414974",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["173158426406615286"] = {
      isStoryNode = true,
      key = "173158426406615286",
      type = "StoryNode",
      name = "boss\230\136\152\229\144\142",
      pos = {x = 1681.8669552669553, y = 268.62133422133434},
      propsData = {
        QuestId = 10030214,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030214",
        QuestDeatil = "QuestDesc_10030214",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173158426406615287",
            startPort = "QuestStart",
            endQuest = "173158426521715406",
            endPort = "In"
          },
          {
            startQuest = "173158426521715406",
            startPort = "Out",
            endQuest = "174851483001410763610",
            endPort = "In"
          },
          {
            startQuest = "174851483001410763610",
            startPort = "Out",
            endQuest = "173158426521715407",
            endPort = "In"
          },
          {
            startQuest = "173158426521715407",
            startPort = "Out",
            endQuest = "174851483555410764077",
            endPort = "In"
          },
          {
            startQuest = "174851483555410764077",
            startPort = "Out",
            endQuest = "173158426406615290",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173158426406615287"] = {
            key = "173158426406615287",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173158426406615290"] = {
            key = "173158426406615290",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 298},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["173158426406715293"] = {
            key = "173158426406715293",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173158426521715406"] = {
            key = "173158426521715406",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1674.8000000000002, y = 321.34453781512616},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720432,
              GuideType = "M",
              GuidePointName = "Mechanism_1720432"
            }
          },
          ["173158426521715407"] = {
            key = "173158426521715407",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2209.364705882353, y = 304.255462184874},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple23",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174851483001410763610"] = {
            key = "174851483001410763610",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1936.2721445221441, y = 78.9166666666667},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101701},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851483555410764077"] = {
            key = "174851483555410764077",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2513.272144522144, y = 111.6666666666667},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["1732783210758532486"] = {
      isStoryNode = true,
      key = "1732783210758532486",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 336.3999999999998, y = 296.40000000000003},
      propsData = {QuestChainId = 100302},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210758532487"] = {
      isStoryNode = true,
      key = "1732783210758532487",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2363.7152292152296, y = 281.0054390054391},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210758532488"] = {
      isStoryNode = true,
      key = "1732783210758532488",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 982.7520018027312, y = 284.2448766052241},
      propsData = {
        QuestId = 10030201,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030201",
        QuestDeatil = "QuestDesc_10030201",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17453080107897966",
            startPort = "Out",
            endQuest = "17453260106323428",
            endPort = "In"
          },
          {
            startQuest = "17453260106323428",
            startPort = "Out",
            endQuest = "1732783210758532491",
            endPort = "Success"
          },
          {
            startQuest = "17295106481407075",
            startPort = "Out",
            endQuest = "17453080107897966",
            endPort = "In"
          },
          {
            startQuest = "17453358946954937",
            startPort = "Out",
            endQuest = "17295106481407075",
            endPort = "In"
          },
          {
            startQuest = "1732783210758532490",
            startPort = "QuestStart",
            endQuest = "17470579305485175125",
            endPort = "In"
          },
          {
            startQuest = "17470579305485175125",
            startPort = "Out",
            endQuest = "17453358946954937",
            endPort = "In"
          }
        },
        nodeData = {
          ["17295106481407075"] = {
            key = "17295106481407075",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1187.5275530455099, y = 352.82650404291286},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730081,
              GuideType = "M",
              GuidePointName = "Mechanism_1730081"
            }
          },
          ["1732783210758532490"] = {
            key = "1732783210758532490",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -350.5080091533181, y = 290.48054919908463},
            propsData = {ModeType = 0}
          },
          ["1732783210758532491"] = {
            key = "1732783210758532491",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2387.0545454545454, y = 351.1515151515157},
            propsData = {ModeType = 0}
          },
          ["1732783210758532492"] = {
            key = "1732783210758532492",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3197.6, y = 1525.3333333333337},
            propsData = {}
          },
          ["17453080107897966"] = {
            key = "17453080107897966",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1538.75, y = 467},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720681,
                1720682,
                1720683,
                1720684,
                1720685,
                1720686,
                1720687,
                1720688,
                1720689,
                1720690,
                1720691,
                1720692,
                1720714,
                1720715,
                1720716,
                1720717,
                1720721,
                1720722,
                1720723
              }
            }
          },
          ["17453260106323428"] = {
            key = "17453260106323428",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1854.5, y = 546.25},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew01monsteract",
              UnitId = -1
            }
          },
          ["17453358946954937"] = {
            key = "17453358946954937",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 869.7532467532469, y = 360},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730182,
                1730183,
                1730184,
                1730185,
                1730186,
                1730187,
                1730189,
                1730190,
                1730191,
                1730193
              }
            }
          },
          ["17470579305485175125"] = {
            key = "17470579305485175125",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 98, y = 302},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101702,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew2_2_IcelakeCity"
            }
          }
        },
        commentData = {}
      }
    },
    ["17331304326576008"] = {
      isStoryNode = true,
      key = "17331304326576008",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 988.7363747363747, y = 476.0155400155399},
      propsData = {
        QuestId = 10030202,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030202",
        QuestDeatil = "QuestDesc_10030202",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17331304326576009",
            startPort = "QuestStart",
            endQuest = "173313050636910537",
            endPort = "In"
          },
          {
            startQuest = "173313050636910537",
            startPort = "Out",
            endQuest = "17331304326576012",
            endPort = "Success"
          },
          {
            startQuest = "17331304326576009",
            startPort = "QuestStart",
            endQuest = "17442667284856041",
            endPort = "In"
          }
        },
        nodeData = {
          ["17331304326576009"] = {
            key = "17331304326576009",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17331304326576012"] = {
            key = "17331304326576012",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17331304326576015"] = {
            key = "17331304326576015",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313050636910537"] = {
            key = "173313050636910537",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1299.2469261388771, y = 309.0761643928826},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730083,
              GuideType = "M",
              GuidePointName = "Mechanism_1730083"
            }
          },
          ["17442667284856041"] = {
            key = "17442667284856041",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1292, y = 592},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032901,
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
    ["17331304353946175"] = {
      isStoryNode = true,
      key = "17331304353946175",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 981.3857253857254, y = 689.9246309246312},
      propsData = {
        QuestId = 10030203,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030203",
        QuestDeatil = "QuestDesc_10030203",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313054432312511",
            startPort = "Fail",
            endQuest = "17358092544123689704",
            endPort = "In"
          },
          {
            startQuest = "173313054432312511",
            startPort = "PassiveFail",
            endQuest = "17358092727053690455",
            endPort = "In"
          },
          {
            startQuest = "17331304353946176",
            startPort = "QuestStart",
            endQuest = "17399500569873111007",
            endPort = "In"
          },
          {
            startQuest = "17358092544123689704",
            startPort = "Out",
            endQuest = "17331304353946182",
            endPort = "Fail"
          },
          {
            startQuest = "17358092727053690455",
            startPort = "Out",
            endQuest = "17331304353946182",
            endPort = "Fail"
          },
          {
            startQuest = "17454923759595197",
            startPort = "Out",
            endQuest = "173313054432312509",
            endPort = "In"
          },
          {
            startQuest = "1739952832742520664",
            startPort = "Out",
            endQuest = "17331304353946179",
            endPort = "Success"
          },
          {
            startQuest = "17331304353946176",
            startPort = "QuestStart",
            endQuest = "17470574917474301130",
            endPort = "In"
          },
          {
            startQuest = "17470574917474301130",
            startPort = "Out",
            endQuest = "17454923759595197",
            endPort = "In"
          },
          {
            startQuest = "173313054432312511",
            startPort = "Success",
            endQuest = "1739952832742520664",
            endPort = "In"
          },
          {
            startQuest = "173313054432312509",
            startPort = "Out",
            endQuest = "17491973888393727",
            endPort = "In"
          },
          {
            startQuest = "17491973888393727",
            startPort = "Out",
            endQuest = "173313054432312511",
            endPort = "In"
          }
        },
        nodeData = {
          ["17331304353946176"] = {
            key = "17331304353946176",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17331304353946179"] = {
            key = "17331304353946179",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3112, y = 342},
            propsData = {ModeType = 0}
          },
          ["17331304353946182"] = {
            key = "17331304353946182",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3040, y = 674},
            propsData = {}
          },
          ["173313054432312509"] = {
            key = "173313054432312509",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1371.75, y = 371.24999999999994},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100321,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1730088",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10033001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple19",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100321,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100321}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173313054432312511"] = {
            key = "173313054432312511",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2045.75, y = 290.75},
            propsData = {SpecialConfigId = 1035, BlackScreenImmediately = false}
          },
          ["17358092544123689704"] = {
            key = "17358092544123689704",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2414.5930363753896, y = 405.14553093964844},
            propsData = {
              ModeType = 1,
              Id = 101702,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17358092727053690455"] = {
            key = "17358092727053690455",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2418.5930363753896, y = 575.8121976063152},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew1passivefailpoint1",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17399497513771559230"] = {
            key = "17399497513771559230",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 2230, y = -212},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1730164}
            }
          },
          ["17399500569873111007"] = {
            key = "17399500569873111007",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1066, y = 138},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032909,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1739952832742520664"] = {
            key = "1739952832742520664",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2750.4444444444443, y = 245.77777777777777},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730088}
            }
          },
          ["17454923759595197"] = {
            key = "17454923759595197",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1063.3399345752293, y = 501.67993281228604},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730088}
            }
          },
          ["17470574917474301130"] = {
            key = "17470574917474301130",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 782, y = 628},
            propsData = {
              RegionType = 2,
              IsEnter = "Enter",
              RegionId = 1017,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew2_2_IcelakeCity"
            }
          },
          ["17491973888393727"] = {
            key = "17491973888393727",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 1722, y = 348},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          }
        },
        commentData = {}
      }
    },
    ["173313058531414974"] = {
      isStoryNode = true,
      key = "173313058531414974",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 981.5123487623493, y = 903.2774447774448},
      propsData = {
        QuestId = 10030205,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030205",
        QuestDeatil = "QuestDesc_10030205",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313058531414975",
            startPort = "QuestStart",
            endQuest = "173313059040115167",
            endPort = "In"
          },
          {
            startQuest = "173313059040115167",
            startPort = "Out",
            endQuest = "173313058531414978",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173313058531414975"] = {
            key = "173313058531414975",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313058531414978"] = {
            key = "173313058531414978",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313058531414981"] = {
            key = "173313058531414981",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313059040115167"] = {
            key = "173313059040115167",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1295.807220638271, y = 331.9788783719103},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720201,
              GuideType = "M",
              GuidePointName = "Mechanism_1720201"
            }
          }
        },
        commentData = {}
      }
    },
    ["173313061135516892"] = {
      isStoryNode = true,
      key = "173313061135516892",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 1331.4236973597588, y = 274.0953719483133},
      propsData = {
        QuestId = 10030206,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030206",
        QuestDeatil = "QuestDesc_10030206",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101701,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_1720203"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17362179085341885310",
            startPort = "Fail",
            endQuest = "17362180329252824054",
            endPort = "In"
          },
          {
            startQuest = "17362179085341885310",
            startPort = "PassiveFail",
            endQuest = "17362181027442825314",
            endPort = "In"
          },
          {
            startQuest = "17362179085341885310",
            startPort = "Success",
            endQuest = "1739949663093781285",
            endPort = "In"
          },
          {
            startQuest = "1739949663093781285",
            startPort = "Out",
            endQuest = "173313061135516896",
            endPort = "Success"
          },
          {
            startQuest = "17363260410663296253",
            startPort = "Out",
            endQuest = "17362179085341885310",
            endPort = "In"
          },
          {
            startQuest = "17362180329252824054",
            startPort = "Out",
            endQuest = "173313061135516899",
            endPort = "Fail"
          },
          {
            startQuest = "17362181027442825314",
            startPort = "Out",
            endQuest = "173313061135516899",
            endPort = "Fail"
          },
          {
            startQuest = "173313061135516893",
            startPort = "QuestStart",
            endQuest = "17470575386294302740",
            endPort = "In"
          },
          {
            startQuest = "17470575386294302740",
            startPort = "Out",
            endQuest = "1758188364790930112",
            endPort = "In"
          },
          {
            startQuest = "1758188364790930112",
            startPort = "Out",
            endQuest = "17455519400135618",
            endPort = "In"
          },
          {
            startQuest = "17455519400135618",
            startPort = "Out",
            endQuest = "17363260410663296253",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313061135516893"] = {
            key = "173313061135516893",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 670, y = 294},
            propsData = {ModeType = 0}
          },
          ["173313061135516896"] = {
            key = "173313061135516896",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313061135516899"] = {
            key = "173313061135516899",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17362179085341885310"] = {
            key = "17362179085341885310",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1952, y = 310},
            propsData = {SpecialConfigId = 1036, BlackScreenImmediately = false}
          },
          ["17362180329252824054"] = {
            key = "17362180329252824054",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2376, y = 443.4117647058824},
            propsData = {
              ModeType = 1,
              Id = 101702,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17362181027442825314"] = {
            key = "17362181027442825314",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2374, y = 626},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew1passivefailpoint2",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17363260410663296253"] = {
            key = "17363260410663296253",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1680.3964164941779, y = 295.0138450502152},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720203,
              GuideType = "M",
              GuidePointName = "Mechanism_1720203"
            }
          },
          ["1739949663093781285"] = {
            key = "1739949663093781285",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2361.6, y = 159.91111111111084},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720446, 1720724}
            }
          },
          ["1739949714506783891"] = {
            key = "1739949714506783891",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 2503.6000000000004, y = -135.20000000000022},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1720531}
            }
          },
          ["17455519400135618"] = {
            key = "17455519400135618",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1461.75, y = 430.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720446, 1720724}
            }
          },
          ["17470575386294302740"] = {
            key = "17470575386294302740",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1030, y = 300},
            propsData = {
              RegionType = 2,
              IsEnter = "Enter",
              RegionId = 1017,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew2_2_IcelakeCity"
            }
          },
          ["17479921937054225"] = {
            key = "17479921937054225",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1880.904925943442, y = 72.76190476190497},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033111,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1758186341322929969"] = {
            key = "1758186341322929969",
            type = "OpenSytstemUINode",
            name = "\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185",
            pos = {x = 753.7170329670329, y = 1061.0521978021977},
            propsData = {UIName = 0}
          },
          ["1758188364790930112"] = {
            key = "1758188364790930112",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1250.6401098901097, y = 127.59065934065863},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew2room2Init",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["173313063371018107"] = {
      isStoryNode = true,
      key = "173313063371018107",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 1331.6876097758454, y = 481.2947607947608},
      propsData = {
        QuestId = 10030207,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030207",
        QuestDeatil = "QuestDesc_10030207",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17434953889921568646",
            startPort = "Out",
            endQuest = "173313063371018111",
            endPort = "Success"
          },
          {
            startQuest = "17358858453619778",
            startPort = "Out",
            endQuest = "17444489711952420974",
            endPort = "In"
          },
          {
            startQuest = "17444489711952420974",
            startPort = "Out",
            endQuest = "17363205587713128",
            endPort = "In"
          },
          {
            startQuest = "17363205587713128",
            startPort = "Out",
            endQuest = "17453925639145233",
            endPort = "In"
          },
          {
            startQuest = "17453925639145233",
            startPort = "Out",
            endQuest = "17434953889921568646",
            endPort = "In"
          },
          {
            startQuest = "173313063371018108",
            startPort = "QuestStart",
            endQuest = "17470575553634303963",
            endPort = "In"
          },
          {
            startQuest = "17470575553634303963",
            startPort = "Out",
            endQuest = "1744448829269809282",
            endPort = "In"
          },
          {
            startQuest = "1744448829269809282",
            startPort = "Out",
            endQuest = "17358858453619778",
            endPort = "In"
          },
          {
            startQuest = "17358858453619778",
            startPort = "Out",
            endQuest = "17568827059111907062",
            endPort = "In"
          },
          {
            startQuest = "17363205587713128",
            startPort = "Out",
            endQuest = "17569881028816152",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313063371018108"] = {
            key = "173313063371018108",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 533.75, y = 293.75},
            propsData = {ModeType = 0}
          },
          ["173313063371018111"] = {
            key = "173313063371018111",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2676, y = 304},
            propsData = {ModeType = 0}
          },
          ["173313063371018114"] = {
            key = "173313063371018114",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2690, y = 684},
            propsData = {}
          },
          ["17358858453619778"] = {
            key = "17358858453619778",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1442.714705882353, y = 292.80882352941177},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple20",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100322,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100321,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100321},
                {TalkActorType = "Npc", TalkActorId = 100322}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17363205587713128"] = {
            key = "17363205587713128",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2080.1470588235293, y = 312.07352941176475},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew2mech3start",
              UnitId = -1
            }
          },
          ["17434953889921568646"] = {
            key = "17434953889921568646",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2382.995798319328, y = 301.04876496052947},
            propsData = {
              CreateType = "ManualItem",
              CreateId = 172008,
              StateId = 7040311,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_ShuiFa_1720220"
            }
          },
          ["1744448829269809282"] = {
            key = "1744448829269809282",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1116.2954545454547, y = 304.2803030303032},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720429,
                1720430,
                1720431
              }
            }
          },
          ["17444489711952420974"] = {
            key = "17444489711952420974",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1747.5454545454545, y = 301.78030303030306},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720429,
                1720430,
                1720431
              }
            }
          },
          ["17453925639145233"] = {
            key = "17453925639145233",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2216.4615384615386, y = 516.3076923076924},
            propsData = {
              NewDescription = "QuestName_1003plus13",
              NewDetail = "QuestDesc_1003plus13",
              SubTaskTargetIndex = 0
            }
          },
          ["17470575553634303963"] = {
            key = "17470575553634303963",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 847.2500000000002, y = 282.9999999999999},
            propsData = {
              RegionType = 2,
              IsEnter = "Enter",
              RegionId = 1017,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew2_2_IcelakeCity"
            }
          },
          ["17568827059111907062"] = {
            key = "17568827059111907062",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1768.7083333333333, y = 136.2847222222223},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew1passivefailpoint2",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17569881028816152"] = {
            key = "17569881028816152",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2338.934782608696, y = 104.24247491638772},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033301,
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
    ["173313065608419523"] = {
      isStoryNode = true,
      key = "173313065608419523",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 1335.3933011433012, y = 687.7070984570987},
      propsData = {
        QuestId = 10030208,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030208",
        QuestDeatil = "QuestDesc_10030208",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313065608419524",
            startPort = "QuestStart",
            endQuest = "173313066349119803",
            endPort = "In"
          },
          {
            startQuest = "1756888394951957852",
            startPort = "Out",
            endQuest = "1756888394951957853",
            endPort = "In"
          },
          {
            startQuest = "1756888394951957853",
            startPort = "Out",
            endQuest = "173313065608419527",
            endPort = "Success"
          },
          {
            startQuest = "173313066349119803",
            startPort = "Out",
            endQuest = "1756888394951957852",
            endPort = "In"
          },
          {
            startQuest = "173313065608419524",
            startPort = "QuestStart",
            endQuest = "173313066349119804",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313065608419524"] = {
            key = "173313065608419524",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313065608419527"] = {
            key = "173313065608419527",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3432, y = 398},
            propsData = {ModeType = 0}
          },
          ["173313065608419530"] = {
            key = "173313065608419530",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313066349119803"] = {
            key = "173313066349119803",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1858.9999999999995, y = 307.6666666666665},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720207,
              GuideType = "M",
              GuidePointName = "Mechanism_1720207"
            }
          },
          ["173313066349119804"] = {
            key = "173313066349119804",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1424.238095238095, y = 469.4761904761906},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033304,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173588619850217419"] = {
            key = "173588619850217419",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1432, y = 81.99999999999994},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1756888394951957852"] = {
            key = "1756888394951957852",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2629.84177870409, y = 371.32108779966825},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720208,
              GuideType = "M",
              GuidePointName = "Mechanism_1720208"
            }
          },
          ["1756888394951957853"] = {
            key = "1756888394951957853",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3036.15822129591, y = 422.67891220033175},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033311,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
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
    ["173313071970323055"] = {
      isStoryNode = true,
      key = "173313071970323055",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 1334.1595349095353, y = 897.1885728650434},
      propsData = {
        QuestId = 10030209,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030208",
        QuestDeatil = "QuestDesc_10030208",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313073996623539",
            startPort = "Out",
            endQuest = "173588627805218617",
            endPort = "In"
          },
          {
            startQuest = "17363233508691411832",
            startPort = "Out",
            endQuest = "173313073996623540",
            endPort = "In"
          },
          {
            startQuest = "173313073996623540",
            startPort = "Fail",
            endQuest = "17363235928421414458",
            endPort = "In"
          },
          {
            startQuest = "173313073996623540",
            startPort = "PassiveFail",
            endQuest = "17363236467201417060",
            endPort = "In"
          },
          {
            startQuest = "17363235928421414458",
            startPort = "Out",
            endQuest = "173313071970323062",
            endPort = "Fail"
          },
          {
            startQuest = "17363236467201417060",
            startPort = "Out",
            endQuest = "173313071970323062",
            endPort = "Fail"
          },
          {
            startQuest = "173313073996623541",
            startPort = "Out",
            endQuest = "17485147477829893934",
            endPort = "In"
          },
          {
            startQuest = "17485147477829893934",
            startPort = "Out",
            endQuest = "173313073996623542",
            endPort = "In"
          },
          {
            startQuest = "173313073996623540",
            startPort = "Success",
            endQuest = "17491976280673614",
            endPort = "In"
          },
          {
            startQuest = "17491976280673614",
            startPort = "Out",
            endQuest = "173313073996623541",
            endPort = "In"
          },
          {
            startQuest = "173313073996623542",
            startPort = "Option_1",
            endQuest = "175213583299213332",
            endPort = "In"
          },
          {
            startQuest = "175213583299213332",
            startPort = "Out",
            endQuest = "173313071970323059",
            endPort = "Success"
          },
          {
            startQuest = "173313073996623542",
            startPort = "Option_2",
            endQuest = "173313071970323059",
            endPort = "Success"
          },
          {
            startQuest = "173313071970323056",
            startPort = "QuestStart",
            endQuest = "17363233508691411832",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313071970323056"] = {
            key = "173313071970323056",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313071970323059"] = {
            key = "173313071970323059",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3142.1052631578946, y = 368.42105263157896},
            propsData = {ModeType = 0}
          },
          ["173313071970323062"] = {
            key = "173313071970323062",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313073996623539"] = {
            key = "173313073996623539",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1200.4835574081792, y = 65.84217559933646},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720208,
              GuideType = "M",
              GuidePointName = "Mechanism_1720208"
            }
          },
          ["173313073996623540"] = {
            key = "173313073996623540",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1697.9502240748448, y = 286.37550893266996},
            propsData = {SpecialConfigId = 1037, BlackScreenImmediately = false}
          },
          ["173313073996623541"] = {
            key = "173313073996623541",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2208.3164425918208, y = 301.6244910673296},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple21-22",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100321,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100311,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100321},
                {TalkActorType = "Npc", TalkActorId = 100311}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173313073996623542"] = {
            key = "173313073996623542",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2482.316442591821, y = 298.17185948838255},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033505,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple21-22",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100321,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100311,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100321},
                {TalkActorType = "Npc", TalkActorId = 100311}
              },
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["173588627805218617"] = {
            key = "173588627805218617",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1620.8, y = 39.19999999999996},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033311,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17363233508691411832"] = {
            key = "17363233508691411832",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1426, y = 292},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1730130,
              GuideType = "M",
              GuidePointName = "Mechanism_1730130"
            }
          },
          ["17363235928421414458"] = {
            key = "17363235928421414458",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1961, y = 554.9166666666667},
            propsData = {
              ModeType = 1,
              Id = 101702,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17363236467201417060"] = {
            key = "17363236467201417060",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1956.5, y = 763.75},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew1passivefailpoint3",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17485147477829893934"] = {
            key = "17485147477829893934",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2347.3314136843546, y = 85.32236391059942},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17491976280673614"] = {
            key = "17491976280673614",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 1964, y = 282},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          },
          ["175213583299213332"] = {
            key = "175213583299213332",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2786.0076277650646, y = 239.04123230782272},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew01telepoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["173313072240423254"] = {
      isStoryNode = true,
      key = "173313072240423254",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 1674.857586857587, y = 476.4830724830726},
      propsData = {
        QuestId = 10030210,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030210",
        QuestDeatil = "QuestDesc_10030210",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313075215924317",
            startPort = "Out",
            endQuest = "173313075215924318",
            endPort = "In"
          },
          {
            startQuest = "173313075215924318",
            startPort = "Out",
            endQuest = "173313072240423258",
            endPort = "Success"
          },
          {
            startQuest = "173313072240423255",
            startPort = "QuestStart",
            endQuest = "173313075215924317",
            endPort = "In"
          },
          {
            startQuest = "173313072240423255",
            startPort = "QuestStart",
            endQuest = "1747465214589881874",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313072240423255"] = {
            key = "173313072240423255",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 848, y = 302},
            propsData = {ModeType = 0}
          },
          ["173313072240423258"] = {
            key = "173313072240423258",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313072240423261"] = {
            key = "173313072240423261",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313075215924317"] = {
            key = "173313075215924317",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2165.3999999999996, y = 290},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720215,
              GuideType = "M",
              GuidePointName = "Mechanism_1720215"
            }
          },
          ["173313075215924318"] = {
            key = "173313075215924318",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2484.6000000000004, y = 288},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720216,
              GuideType = "M",
              GuidePointName = "Mechanism_1720216"
            }
          },
          ["17388970238254118"] = {
            key = "17388970238254118",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1320, y = 824},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720497,
                1720498,
                1720499,
                1720500,
                1720501,
                1720502
              }
            }
          },
          ["1747465214589881874"] = {
            key = "1747465214589881874",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1278, y = 590},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["173313078770026699"] = {
      isStoryNode = true,
      key = "173313078770026699",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147boss\230\136\152\229\144\142",
      pos = {x = 1676.0523920523924, y = 688.5350205350205},
      propsData = {
        QuestId = 10030211,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030211",
        QuestDeatil = "QuestDesc_10030211",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313078770026700",
            startPort = "QuestStart",
            endQuest = "173313079438527289",
            endPort = "In"
          },
          {
            startQuest = "173313079438527289",
            startPort = "Out",
            endQuest = "173313078770026703",
            endPort = "Success"
          },
          {
            startQuest = "173313078770026700",
            startPort = "QuestStart",
            endQuest = "1747465221046882316",
            endPort = "In"
          },
          {
            startQuest = "173313079438527289",
            startPort = "Out",
            endQuest = "173313079438527290",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313078770026700"] = {
            key = "173313078770026700",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313078770026703"] = {
            key = "173313078770026703",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313078770026706"] = {
            key = "173313078770026706",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313079438527289"] = {
            key = "173313079438527289",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1704.9176470588234, y = 312.0088235294117},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720217,
              GuideType = "M",
              GuidePointName = "Mechanism_1720217"
            }
          },
          ["173313079438527290"] = {
            key = "173313079438527290",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1715.0823529411764, y = 110.74117647058821},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1747465221046882316"] = {
            key = "1747465221046882316",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1238, y = 602},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["173313080459528313"] = {
      isStoryNode = true,
      key = "173313080459528313",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147boss\230\136\152\229\144\142",
      pos = {x = 1686.3381063381066, y = 884.1041572806282},
      propsData = {
        QuestId = 10030212,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030212",
        QuestDeatil = "QuestDesc_10030212",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313080459528314",
            startPort = "QuestStart",
            endQuest = "173313080656528458",
            endPort = "In"
          },
          {
            startQuest = "173313080656528458",
            startPort = "Out",
            endQuest = "173313080459528317",
            endPort = "Success"
          },
          {
            startQuest = "173313080459528314",
            startPort = "QuestStart",
            endQuest = "1747465226791882737",
            endPort = "In"
          },
          {
            startQuest = "173313080656528458",
            startPort = "Out",
            endQuest = "173313080656528459",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313080459528314"] = {
            key = "173313080459528314",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313080459528317"] = {
            key = "173313080459528317",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313080459528320"] = {
            key = "173313080459528320",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313080656528458"] = {
            key = "173313080656528458",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1722.5764705882352, y = 444.59999999999997},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720219,
              GuideType = "M",
              GuidePointName = "Mechanism_1720219"
            }
          },
          ["173313080656528459"] = {
            key = "173313080656528459",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1729.4235294117648, y = 239.39999999999998},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033605,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1747465226791882737"] = {
            key = "1747465226791882737",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1212, y = 636},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["173313081633729374"] = {
      isStoryNode = true,
      key = "173313081633729374",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147boss\230\136\152\229\144\142",
      pos = {x = 1690.5597513597513, y = 1093.8064236417176},
      propsData = {
        QuestId = 10030213,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030213",
        QuestDeatil = "QuestDesc_10030213",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173313081818629501",
            startPort = "Out",
            endQuest = "173313081818629500",
            endPort = "In"
          },
          {
            startQuest = "173313081633729375",
            startPort = "QuestStart",
            endQuest = "173313081818629501",
            endPort = "In"
          },
          {
            startQuest = "173313081818629501",
            startPort = "Out",
            endQuest = "173313081633729378",
            endPort = "Success"
          },
          {
            startQuest = "173313081633729375",
            startPort = "QuestStart",
            endQuest = "1747465236609883451",
            endPort = "In"
          }
        },
        nodeData = {
          ["173313081633729375"] = {
            key = "173313081633729375",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313081633729378"] = {
            key = "173313081633729378",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173313081633729381"] = {
            key = "173313081633729381",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173313081818629500"] = {
            key = "173313081818629500",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1732.129411764706, y = 148.27058823529404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033611,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173313081818629501"] = {
            key = "173313081818629501",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1723.870588235294, y = 379.72941176470596},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720218,
              GuideType = "M",
              GuidePointName = "Mechanism_1720218"
            }
          },
          ["1747465236609883451"] = {
            key = "1747465236609883451",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1314, y = 666},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17452255389874116"] = {
      isStoryNode = true,
      key = "17452255389874116",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 655.8860368389779, y = 146.03232323232314},
      propsData = {
        QuestId = 10030299,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus12",
        QuestDeatil = "QuestDesc_1003plus12",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
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
        StoryGuidePointName = "",
        QuestUIId = 100302
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17452255389874117",
            startPort = "QuestStart",
            endQuest = "17452255403294256",
            endPort = "In"
          },
          {
            startQuest = "17452255403294256",
            startPort = "Out",
            endQuest = "17452255389874120",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17452255389874117"] = {
            key = "17452255389874117",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17452255389874120"] = {
            key = "17452255389874120",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17452255389874123"] = {
            key = "17452255389874123",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17452255403294256"] = {
            key = "17452255403294256",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1668.2393048128342, y = 293.3228609625669},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101702,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew2_2_IcelakeCity"
            }
          },
          ["17470580285866029451"] = {
            key = "17470580285866029451",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2212, y = 642},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/cp2UIopen02",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
