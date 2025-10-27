return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1715927831623311376",
      startPort = "StoryStart",
      endStory = "1715927831624311379",
      endPort = "In"
    },
    {
      startStory = "1715927831624311379",
      startPort = "Success",
      endStory = "17413167906035948",
      endPort = "In"
    },
    {
      startStory = "1741317245436823824",
      startPort = "Success",
      endStory = "1741317276015824163",
      endPort = "In"
    },
    {
      startStory = "1741317276015824163",
      startPort = "Success",
      endStory = "1715927831623311377",
      endPort = "StoryEnd"
    },
    {
      startStory = "17413354689081644598",
      startPort = "Success",
      endStory = "1741317245436823824",
      endPort = "In"
    },
    {
      startStory = "17413167906035948",
      startPort = "\233\128\137\233\161\18512",
      endStory = "17413356261481647572",
      endPort = "In"
    },
    {
      startStory = "17413167906035948",
      startPort = "\233\128\137\233\161\1853",
      endStory = "17413354689081644598",
      endPort = "In"
    },
    {
      startStory = "17413356261481647572",
      startPort = "Success",
      endStory = "1741317245436823824",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1715927831623311376"] = {
      isStoryNode = true,
      key = "1715927831623311376",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 34.9979002774719, y = 699.482147430621},
      propsData = {QuestChainId = 200209},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1715927831623311377"] = {
      isStoryNode = true,
      key = "1715927831623311377",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1294.1122021260257, y = 934.251472906444},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1715927831624311379"] = {
      isStoryNode = true,
      key = "1715927831624311379",
      type = "StoryNode",
      name = "\229\146\140\233\156\178\229\168\156\229\175\185\232\175\157",
      pos = {x = 308.8787008110203, y = 686.185277460673},
      propsData = {
        QuestId = 20020901,
        QuestDescriptionComment = "\229\142\187\229\185\191\229\156\186\230\137\190\233\156\178\229\168\156\229\175\185\232\175\157",
        QuestDescription = "Description_200209_1",
        QuestDeatil = "Content_200209_1",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20020901box_1191209"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1715927831624311384",
            startPort = "QuestStart",
            endQuest = "17413169028007820",
            endPort = "In"
          },
          {
            startQuest = "174765382924017385",
            startPort = "Out",
            endQuest = "1715927831624311385",
            endPort = "Success"
          },
          {
            startQuest = "17413164585834273",
            startPort = "Out",
            endQuest = "17413166140774941",
            endPort = "In"
          },
          {
            startQuest = "17413166140774941",
            startPort = "Out",
            endQuest = "17413164629194378",
            endPort = "In"
          },
          {
            startQuest = "17524835752331930982",
            startPort = "Success",
            endQuest = "174765382924017385",
            endPort = "In"
          },
          {
            startQuest = "17524835752331930982",
            startPort = "Fail",
            endQuest = "17524835925441931590",
            endPort = "In"
          },
          {
            startQuest = "17524835752331930982",
            startPort = "PassiveFail",
            endQuest = "17524835925441931590",
            endPort = "In"
          },
          {
            startQuest = "17524835925441931590",
            startPort = "Out",
            endQuest = "1715927831624311386",
            endPort = "Fail"
          },
          {
            startQuest = "17413164071713740",
            startPort = "Out",
            endQuest = "17413164585834273",
            endPort = "In"
          },
          {
            startQuest = "17413169028007820",
            startPort = "Out",
            endQuest = "17524835752331930982",
            endPort = "In"
          }
        },
        nodeData = {
          ["1715927831624311384"] = {
            key = "1715927831624311384",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 784.4546899841017, y = 302.9739268680445},
            propsData = {ModeType = 0}
          },
          ["1715927831624311385"] = {
            key = "1715927831624311385",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2266.953151697269, y = 467.1458865458867},
            propsData = {ModeType = 0}
          },
          ["1715927831624311386"] = {
            key = "1715927831624311386",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2188.068446979518, y = 613.4845735027222},
            propsData = {}
          },
          ["17413164071713740"] = {
            key = "17413164071713740",
            type = "TalkNode",
            name = "\232\167\166\229\143\145\233\156\178\229\168\156",
            pos = {x = 1454.4885261307481, y = 128.7594797855144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004935,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew20020901",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorId = 700225,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700226,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700227,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700225},
                {TalkActorType = "Npc", TalkActorId = 700226},
                {TalkActorType = "Npc", TalkActorId = 700227}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17413164585834273"] = {
            key = "17413164585834273",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\228\184\128\233\152\159\233\157\162\229\140\133\228\186\186",
            pos = {x = 1699.5056597100765, y = 136.83924110445918},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191210, 1191211}
            }
          },
          ["17413164629194378"] = {
            key = "17413164629194378",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2237.946328623123, y = 155.03366981691877},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1191210, 1191211}
            }
          },
          ["17413166140774941"] = {
            key = "17413166140774941",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1960.1356798573545, y = 78.97021221678511},
            propsData = {
              NewDescription = "Description_200209_7",
              NewDetail = "Content_200209_7",
              SubTaskTargetIndex = 0
            }
          },
          ["17413169028007820"] = {
            key = "17413169028007820",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1064.3797772639118, y = 269.7470425720061},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191209,
              GuideType = "M",
              GuidePointName = "Mechanism_20020901box_1191209"
            }
          },
          ["174765382924017385"] = {
            key = "174765382924017385",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1968.5575924075924, y = 455.5306693306694},
            propsData = {WaitTime = 0.5}
          },
          ["17524835752331930982"] = {
            key = "17524835752331930982",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1591.1692922141106, y = 407.8176831058844},
            propsData = {SpecialConfigId = 20020901, BlackScreenImmediately = false}
          },
          ["17524835925441931590"] = {
            key = "17524835925441931590",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1923.5607528615576, y = 614.7579537865447},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "20020901SP",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17413167906035948"] = {
      isStoryNode = true,
      key = "17413167906035948",
      type = "StoryNode",
      name = "\230\137\147\229\174\140\230\158\182\229\134\141\229\146\140\233\156\178\229\168\156\229\175\185\232\175\157",
      pos = {x = 575.5232551472338, y = 656.2118562736625},
      propsData = {
        QuestId = 20020902,
        QuestDescriptionComment = "\229\142\187\229\185\191\229\156\186\230\137\190\233\156\178\229\168\156\229\175\185\232\175\157",
        QuestDescription = "Description_200209_2",
        QuestDeatil = "Content_200209_2",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Luna_1190435"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17413167906045953",
            startPort = "QuestStart",
            endQuest = "17413376566841653663",
            endPort = "In"
          },
          {
            startQuest = "17413376566841653663",
            startPort = "Fail",
            endQuest = "17413167906045955",
            endPort = "Fail"
          },
          {
            startQuest = "17413376566841653663",
            startPort = "Option_2",
            endQuest = "17413355548411645949",
            endPort = "In"
          },
          {
            startQuest = "17413376566841653663",
            startPort = "Option_1",
            endQuest = "17413355537881645912",
            endPort = "In"
          }
        },
        nodeData = {
          ["17413167906045953"] = {
            key = "17413167906045953",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 633.0522509597113, y = 379.2836442509326},
            propsData = {ModeType = 0}
          },
          ["17413167906045954"] = {
            key = "17413167906045954",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1333.3240376362703, y = 878.6805910124149},
            propsData = {ModeType = 0}
          },
          ["17413167906045955"] = {
            key = "17413167906045955",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1329.294100636204, y = 655.2400231347599},
            propsData = {}
          },
          ["17413355537881645912"] = {
            key = "17413355537881645912",
            type = "QuestConditionNode",
            name = "\233\128\137\233\161\18512",
            pos = {x = 1320.4622736257054, y = 208.51653054142614},
            propsData = {PortName = "\233\128\137\233\161\18512"}
          },
          ["17413355548411645949"] = {
            key = "17413355548411645949",
            type = "QuestConditionNode",
            name = "\233\128\137\233\161\1853",
            pos = {x = 1329.1359880558655, y = 426.0908727417196},
            propsData = {PortName = "\233\128\137\233\161\1853"}
          },
          ["17413376566841653663"] = {
            key = "17413376566841653663",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 916.7125737707346, y = 364.7766401032303},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700010,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Luna_1190435",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004941,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1741317245436823824"] = {
      isStoryNode = true,
      key = "1741317245436823824",
      type = "StoryNode",
      name = "\229\133\187\232\128\129\233\153\162\230\137\190\232\141\175\230\150\185",
      pos = {x = 1155.6680174721264, y = 641.8233498830318},
      propsData = {
        QuestId = 20020905,
        QuestDescriptionComment = "\229\142\187\229\185\191\229\156\186\230\137\190\233\156\178\229\168\156\229\175\185\232\175\157",
        QuestDescription = "Description_200209_5",
        QuestDeatil = "Content_200209_5",
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
        SubRegionId = 101106,
        StoryGuideType = "Point",
        StoryGuidePointName = "1200162point"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17416944619744091957",
            startPort = "Out",
            endQuest = "1741317627147826074",
            endPort = "In"
          },
          {
            startQuest = "17416944618234091951",
            startPort = "Out",
            endQuest = "1741317629229826182",
            endPort = "In"
          },
          {
            startQuest = "17416944608724091897",
            startPort = "Out",
            endQuest = "1741317629444826188",
            endPort = "In"
          },
          {
            startQuest = "1741317245436823829",
            startPort = "QuestStart",
            endQuest = "17416944619744091957",
            endPort = "In"
          },
          {
            startQuest = "1741317627147826074",
            startPort = "Out",
            endQuest = "17416944618234091951",
            endPort = "In"
          },
          {
            startQuest = "1741317629229826182",
            startPort = "Out",
            endQuest = "17416944608724091897",
            endPort = "In"
          },
          {
            startQuest = "17477419095033170340",
            startPort = "Out",
            endQuest = "17477419093373170333",
            endPort = "In"
          },
          {
            startQuest = "1741317629444826188",
            startPort = "Out",
            endQuest = "17477419095033170340",
            endPort = "In"
          },
          {
            startQuest = "17477419093373170333",
            startPort = "Out",
            endQuest = "1741317245437823830",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1741317245436823829"] = {
            key = "1741317245436823829",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 924.4546899841017, y = 327.9739268680445},
            propsData = {ModeType = 0}
          },
          ["1741317245437823830"] = {
            key = "1741317245437823830",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2426.40034391252, y = 824.8598392533063},
            propsData = {ModeType = 0}
          },
          ["1741317245437823831"] = {
            key = "1741317245437823831",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1741317627147826074"] = {
            key = "1741317627147826074",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1717.216681730803, y = 333.8139466582254},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004956,
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
          ["1741317629229826182"] = {
            key = "1741317629229826182",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1749.255474834251, y = 524.3786018306394},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004959,
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
          ["1741317629444826188"] = {
            key = "1741317629444826188",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1679.8007334549404, y = 826.7983919355876},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004962,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17416944608724091897"] = {
            key = "17416944608724091897",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1444.4137072590208, y = 829.8952387830243},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1200160},
              QuestPickupId = -1,
              UnitId = 11014,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "1200163point",
              IsUseCount = false
            }
          },
          ["17416944618234091951"] = {
            key = "17416944618234091951",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1520.0669505674366, y = 536.8627253194761},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1200161},
              QuestPickupId = -1,
              UnitId = 11013,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "1200161point",
              IsUseCount = false
            }
          },
          ["17416944619744091957"] = {
            key = "17416944619744091957",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1453.1663248773373, y = 308.4928933970126},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1200162},
              QuestPickupId = -1,
              UnitId = 11012,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "1200162point",
              IsUseCount = false
            }
          },
          ["17477419093373170333"] = {
            key = "17477419093373170333",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2170.1083656736228, y = 820.5284471998455},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004964,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17477419095033170340"] = {
            key = "17477419095033170340",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1921.6085216960898, y = 823.2268557706795},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004963,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          }
        },
        commentData = {}
      }
    },
    ["1741317276015824163"] = {
      isStoryNode = true,
      key = "1741317276015824163",
      type = "StoryNode",
      name = "\230\139\191\232\141\175\230\150\185\229\155\158\229\164\141\233\156\178\229\168\156",
      pos = {x = 1434.8780252718275, y = 654.1298771087565},
      propsData = {
        QuestId = 20020906,
        QuestDescriptionComment = "\229\142\187\229\185\191\229\156\186\230\137\190\233\156\178\229\168\156\229\175\185\232\175\157",
        QuestDescription = "Description_200209_6",
        QuestDeatil = "Content_200209_6",
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
        StoryGuidePointName = "Npc_Luna_1190435"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1741317276016824168",
            startPort = "QuestStart",
            endQuest = "1741317276016824172",
            endPort = "In"
          },
          {
            startQuest = "1741317276016824172",
            startPort = "Out",
            endQuest = "1741317276016824169",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1741317276016824168"] = {
            key = "1741317276016824168",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 924.4546899841017, y = 327.9739268680445},
            propsData = {ModeType = 0}
          },
          ["1741317276016824169"] = {
            key = "1741317276016824169",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1517.6601163542337, y = 347.5296703296704},
            propsData = {ModeType = 0}
          },
          ["1741317276016824170"] = {
            key = "1741317276016824170",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1741317276016824172"] = {
            key = "1741317276016824172",
            type = "TalkNode",
            name = "\233\156\178\229\168\156",
            pos = {x = 1204.1451893808073, y = 316.69508963716186},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700010,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Luna_1190435",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004965,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          }
        },
        commentData = {}
      }
    },
    ["17413354689081644598"] = {
      isStoryNode = true,
      key = "17413354689081644598",
      type = "StoryNode",
      name = "3\229\134\141\230\172\161\229\146\140\233\156\178\229\168\156\229\175\185\232\175\157",
      pos = {x = 842.9131749417622, y = 768.1055775441671},
      propsData = {
        QuestId = 20020904,
        QuestDescriptionComment = "\229\142\187\229\185\191\229\156\186\230\137\190\233\156\178\229\168\156\229\175\185\232\175\157",
        QuestDescription = "Description_200209_4",
        QuestDeatil = "Content_200209_4",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Luna_1190435"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17413354689081644603",
            startPort = "QuestStart",
            endQuest = "17413354689081644607",
            endPort = "In"
          },
          {
            startQuest = "17413354689081644607",
            startPort = "Out",
            endQuest = "17413354689081644604",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17413354689081644603"] = {
            key = "17413354689081644603",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 924.4546899841017, y = 327.9739268680445},
            propsData = {ModeType = 0}
          },
          ["17413354689081644604"] = {
            key = "17413354689081644604",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1593.0831932773106, y = 404.9142857142858},
            propsData = {ModeType = 0}
          },
          ["17413354689081644605"] = {
            key = "17413354689081644605",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17413354689081644607"] = {
            key = "17413354689081644607",
            type = "TalkNode",
            name = "\232\167\166\229\143\145\233\156\178\229\168\156",
            pos = {x = 1271.0770075626256, y = 357.12690781898004},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700010,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Luna_1190435",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004950,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          }
        },
        commentData = {}
      }
    },
    ["17413356261481647572"] = {
      isStoryNode = true,
      key = "17413356261481647572",
      type = "StoryNode",
      name = "12\229\134\141\230\172\161\229\146\140\233\156\178\229\168\156\229\175\185\232\175\157",
      pos = {x = 826.8133476244022, y = 566.523058993153},
      propsData = {
        QuestId = 20020903,
        QuestDescriptionComment = "\229\142\187\229\185\191\229\156\186\230\137\190\233\156\178\229\168\156\229\175\185\232\175\157",
        QuestDescription = "Description_200209_3",
        QuestDeatil = "Content_200209_3",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Luna_1190435"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17413356261481647577",
            startPort = "QuestStart",
            endQuest = "17413356261481647581",
            endPort = "In"
          },
          {
            startQuest = "17413356261481647581",
            startPort = "Out",
            endQuest = "17413356261481647578",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17413356261481647577"] = {
            key = "17413356261481647577",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 924.4546899841017, y = 327.9739268680445},
            propsData = {ModeType = 0}
          },
          ["17413356261481647578"] = {
            key = "17413356261481647578",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1495.9165266106438, y = 354.2476190476191},
            propsData = {ModeType = 0}
          },
          ["17413356261481647579"] = {
            key = "17413356261481647579",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17413356261481647581"] = {
            key = "17413356261481647581",
            type = "TalkNode",
            name = "\232\167\166\229\143\145\233\156\178\229\168\156",
            pos = {x = 1204.8270075626256, y = 317.37690781898004},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700010,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Luna_1190435",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004945,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
