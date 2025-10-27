return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991238033239129",
      startPort = "Success",
      endStory = "17141991238033239132",
      endPort = "In"
    },
    {
      startStory = "17141991238033239132",
      startPort = "Success",
      endStory = "17141991238033239130",
      endPort = "In"
    },
    {
      startStory = "1715050359570407763",
      startPort = "Success",
      endStory = "17141991238033239128",
      endPort = "StoryEnd"
    },
    {
      startStory = "17141991238033239130",
      startPort = "Success",
      endStory = "17141991238033239133",
      endPort = "In"
    },
    {
      startStory = "17141991238033239133",
      startPort = "Success",
      endStory = "173952618866920958436",
      endPort = "In"
    },
    {
      startStory = "173952618866920958436",
      startPort = "Success",
      endStory = "1715050359570407763",
      endPort = "In"
    },
    {
      startStory = "17141991238033239127",
      startPort = "StoryStart",
      endStory = "17512711700494251989",
      endPort = "In"
    },
    {
      startStory = "17512711700494251989",
      startPort = "Success",
      endStory = "17141991238033239129",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17141991238033239127"] = {
      isStoryNode = true,
      key = "17141991238033239127",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 127.0668657947133, y = 689.1373198444142},
      propsData = {QuestChainId = 200207},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991238033239128"] = {
      isStoryNode = true,
      key = "17141991238033239128",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1206.4256001134308, y = 842.344206912943},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991238033239129"] = {
      isStoryNode = true,
      key = "17141991238033239129",
      type = "StoryNode",
      name = "\228\184\142\232\137\190\231\142\155\229\175\185\232\175\157",
      pos = {x = 380.01557372682896, y = 677.1880555307981},
      propsData = {
        QuestId = 20020702,
        QuestDescriptionComment = "\228\184\142\232\137\190\231\142\155\229\175\185\232\175\157",
        QuestDescription = "Description_200207_2",
        QuestDeatil = "Content_200207_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        StoryGuidePointName = "Npc_Aima_1190090"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17141991238033239135",
            startPort = "QuestStart",
            endQuest = "17141991238033239138",
            endPort = "In"
          },
          {
            startQuest = "17141991238033239138",
            startPort = "Out",
            endQuest = "17141991238033239136",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991238033239135"] = {
            key = "17141991238033239135",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 966.0434782608696, y = 295.5869565217391},
            propsData = {ModeType = 0}
          },
          ["17141991238033239136"] = {
            key = "17141991238033239136",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1449.285714285714, y = 294.69734613212876},
            propsData = {ModeType = 0}
          },
          ["17141991238033239137"] = {
            key = "17141991238033239137",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1457.8205659075222, y = 415.31608005521053},
            propsData = {}
          },
          ["17141991238033239138"] = {
            key = "17141991238033239138",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1200.904721842597, y = 297.5920214049577},
            propsData = {
              ImpressionTalkTriggerId = 510035,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Aima_1190090",
              GuideStaticCreatorId = 700016
            }
          }
        },
        commentData = {}
      }
    },
    ["17141991238033239130"] = {
      isStoryNode = true,
      key = "17141991238033239130",
      type = "StoryNode",
      name = "\229\146\140\229\169\134\229\169\134\229\175\185\232\175\157",
      pos = {x = 908.2497849408192, y = 676.2687885388364},
      propsData = {
        QuestId = 20020704,
        QuestDescriptionComment = "\229\146\140\229\169\134\229\169\134\229\175\185\232\175\157",
        QuestDescription = "Description_200207_4",
        QuestDeatil = "Content_200207_4",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        StoryGuidePointName = "Npc_NPC_Beilinda_1190330"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17141991238033239139",
            startPort = "QuestStart",
            endQuest = "17141965385832749917",
            endPort = "In"
          },
          {
            startQuest = "17141965385832749917",
            startPort = "Out",
            endQuest = "17141991238033239140",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141965385832749917"] = {
            key = "17141965385832749917",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1059.2023649823757, y = 296.91661242813433},
            propsData = {
              ImpressionTalkTriggerId = 510036,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_NPC_Beilinda_1190330",
              GuideStaticCreatorId = 700081
            }
          },
          ["17141991238033239139"] = {
            key = "17141991238033239139",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17141991238033239140"] = {
            key = "17141991238033239140",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1323.6571428571428, y = 294.7142857142857},
            propsData = {ModeType = 0}
          },
          ["17141991238033239141"] = {
            key = "17141991238033239141",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["17141991238033239132"] = {
      isStoryNode = true,
      key = "17141991238033239132",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\229\169\134\229\169\134",
      pos = {x = 645.0506160030218, y = 676.0681306645732},
      propsData = {
        QuestId = 20020703,
        QuestDescriptionComment = "\229\175\187\230\137\190\229\169\134\229\169\134",
        QuestDescription = "Description_200207_3",
        QuestDeatil = "Content_200207_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        StoryGuidePointName = "Mechanism_QuestTrigger_1190430"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17141870714881044935",
            startPort = "Out",
            endQuest = "17141874294201347122",
            endPort = "In"
          },
          {
            startQuest = "17141874294201347122",
            startPort = "Out",
            endQuest = "17141991238033239149",
            endPort = "Success"
          },
          {
            startQuest = "17141991238033239148",
            startPort = "QuestStart",
            endQuest = "1714186932026845522",
            endPort = "In"
          },
          {
            startQuest = "1714186932026845522",
            startPort = "Out",
            endQuest = "17141878701401745404",
            endPort = "In"
          },
          {
            startQuest = "17141878701401745404",
            startPort = "Out",
            endQuest = "1714186931226845515",
            endPort = "In"
          },
          {
            startQuest = "1714186931226845515",
            startPort = "Out",
            endQuest = "17141870714881044935",
            endPort = "In"
          },
          {
            startQuest = "17141870714881044935",
            startPort = "Out",
            endQuest = "1714976415905315721",
            endPort = "In"
          }
        },
        nodeData = {
          ["1714186931226845515"] = {
            key = "1714186931226845515",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 875.92474668669, y = 300.7877106400257},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190430,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190430"
            }
          },
          ["1714186932026845522"] = {
            key = "1714186932026845522",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 399.1722433928824, y = 288.04041156229175},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17141870714881044935"] = {
            key = "17141870714881044935",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1116.9819052286316, y = 283.8237448956251},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20020702",
              BlendInTime = 0.5,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 700081,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700087,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700087},
                {TalkActorType = "Npc", TalkActorId = 700081}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17141874294201347122"] = {
            key = "17141874294201347122",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1356.279039254026, y = 274.9702547866996},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003630,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17141878701401745404"] = {
            key = "17141878701401745404",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 637.4582223897307, y = 296.59080814638344},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190400}
            }
          },
          ["17141991238033239148"] = {
            key = "17141991238033239148",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 147.1770007770009, y = 293.9706293706294},
            propsData = {ModeType = 0}
          },
          ["17141991238033239149"] = {
            key = "17141991238033239149",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1607.9874051069703, y = 293.8440303657695},
            propsData = {ModeType = 0}
          },
          ["17141991238033239150"] = {
            key = "17141991238033239150",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1421.9642857142858, y = 587.8571428571429},
            propsData = {}
          },
          ["1714976415905315721"] = {
            key = "1714976415905315721",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1355.1716387058036, y = 158.19155701052478},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190400}
            }
          }
        },
        commentData = {}
      }
    },
    ["17141991238033239133"] = {
      isStoryNode = true,
      key = "17141991238033239133",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\233\147\129\229\153\168",
      pos = {x = 380.23205800321375, y = 826.1436743711718},
      propsData = {
        QuestId = 20020705,
        QuestDescriptionComment = "\229\175\187\230\137\190\233\147\129\229\153\168",
        QuestDescription = "Description_200207_5",
        QuestDeatil = "Content_200207_5",
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
        SubRegionId = 101305,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Tiesi"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17141991238033239151",
            startPort = "QuestStart",
            endQuest = "17150507536531226888",
            endPort = "In"
          },
          {
            startQuest = "1715415851413727714",
            startPort = "Out",
            endQuest = "1715415851413727716",
            endPort = "In"
          },
          {
            startQuest = "1715415851413727715",
            startPort = "Out",
            endQuest = "1715415851413727714",
            endPort = "In"
          },
          {
            startQuest = "17150507536531226888",
            startPort = "Out",
            endQuest = "1715415851413727715",
            endPort = "In"
          },
          {
            startQuest = "1715415851413727716",
            startPort = "Out",
            endQuest = "17141991238033239152",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991238033239151"] = {
            key = "17141991238033239151",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 885.3413238934979, y = 597.8162924032489},
            propsData = {ModeType = 0}
          },
          ["17141991238033239152"] = {
            key = "17141991238033239152",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2249.557707751186, y = 613.9319163927859},
            propsData = {ModeType = 0}
          },
          ["17141991238033239153"] = {
            key = "17141991238033239153",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17150507536531226888"] = {
            key = "17150507536531226888",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1126.3345654345646, y = 604.4777222777217},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101305,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Tiesi"
            }
          },
          ["1715415851413727714"] = {
            key = "1715415851413727714",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1649.4912917438767, y = 605.2424178963031},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700095,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Tiesi_1380108",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51003705,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_51003705",
              BlendInTime = 1,
              BlendOutTime = 2,
              InType = "FadeIn",
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700206,
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
                {TalkActorType = "Npc", TalkActorId = 700206},
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
          ["1715415851413727715"] = {
            key = "1715415851413727715",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\147\129\228\184\157",
            pos = {x = 1376.902123367496, y = 617.7753524525115},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1380108}
            }
          },
          ["1715415851413727716"] = {
            key = "1715415851413727716",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\147\129\228\184\157",
            pos = {x = 1915.0716064342696, y = 613.687533794518},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1380108}
            }
          }
        },
        commentData = {}
      }
    },
    ["1715050359570407763"] = {
      isStoryNode = true,
      key = "1715050359570407763",
      type = "StoryNode",
      name = "\229\134\141\230\172\161\229\146\140\229\169\134\229\169\134\229\175\185\232\175\157",
      pos = {x = 915.3004607858264, y = 825.9272949272948},
      propsData = {
        QuestId = 20020706,
        QuestDescriptionComment = "\229\175\187\230\137\190\233\147\129\229\153\168",
        QuestDescription = "Description_200207_6",
        QuestDeatil = "Content_200207_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = false,
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
        StoryGuidePointName = "Npc_NPC_Beilinda_1190330"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1715050359570407767",
            startPort = "QuestStart",
            endQuest = "1715050359571407771",
            endPort = "In"
          },
          {
            startQuest = "1715050359571407771",
            startPort = "Out",
            endQuest = "1715050359570407768",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1715050359570407767"] = {
            key = "1715050359570407767",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1199.6797854319593, y = 575.3459627329192},
            propsData = {ModeType = 0}
          },
          ["1715050359570407768"] = {
            key = "1715050359570407768",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1844.027570255831, y = 567.9539156495679},
            propsData = {ModeType = 0}
          },
          ["1715050359570407769"] = {
            key = "1715050359570407769",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1715050359571407771"] = {
            key = "1715050359571407771",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1487.9222727515723, y = 571.1022061694949},
            propsData = {
              ImpressionTalkTriggerId = 510037,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_NPC_Beilinda_1190330",
              GuideStaticCreatorId = 700081
            }
          }
        },
        commentData = {}
      }
    },
    ["173952618866920958436"] = {
      isStoryNode = true,
      key = "173952618866920958436",
      type = "StoryNode",
      name = "\229\135\187\232\180\165\230\137\147\229\138\171\231\154\142\231\154\142",
      pos = {x = 648.242424242424, y = 824.9940836940839},
      propsData = {
        QuestId = 20020707,
        QuestDescriptionComment = "\229\135\187\232\180\165\230\137\147\229\138\171\231\154\142\231\154\142",
        QuestDescription = "Description_200207_7",
        QuestDeatil = "Content_200207_7",
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
        SubRegionId = 101305,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_DJ"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173952618866920958445",
            startPort = "Out",
            endQuest = "173952618866920958444",
            endPort = "In"
          },
          {
            startQuest = "173952618866920958444",
            startPort = "Out",
            endQuest = "173952618866920958446",
            endPort = "In"
          },
          {
            startQuest = "173952618866920958446",
            startPort = "Out",
            endQuest = "173952618866920958447",
            endPort = "In"
          },
          {
            startQuest = "173952618866920958447",
            startPort = "Out",
            endQuest = "173952618866920958442",
            endPort = "Success"
          },
          {
            startQuest = "173952618866920958441",
            startPort = "QuestStart",
            endQuest = "173952618866920958448",
            endPort = "In"
          },
          {
            startQuest = "173952618866920958448",
            startPort = "Out",
            endQuest = "173952618866920958445",
            endPort = "In"
          },
          {
            startQuest = "173952618866920958445",
            startPort = "Out",
            endQuest = "17484165012581326",
            endPort = "In"
          },
          {
            startQuest = "17484165012581326",
            startPort = "Out",
            endQuest = "17484165120821545",
            endPort = "In"
          },
          {
            startQuest = "173952618866920958444",
            startPort = "Out",
            endQuest = "17484165012581326",
            endPort = "Stop"
          },
          {
            startQuest = "17484165120821545",
            startPort = "Out",
            endQuest = "17484165452092236",
            endPort = "In"
          },
          {
            startQuest = "17484165452092236",
            startPort = "Out",
            endQuest = "173952618866920958443",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["173952618866920958441"] = {
            key = "173952618866920958441",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 614.7058823529412, y = 301.7647058823529},
            propsData = {ModeType = 0}
          },
          ["173952618866920958442"] = {
            key = "173952618866920958442",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2230.9625668449194, y = 269.1670094611271},
            propsData = {ModeType = 0}
          },
          ["173952618866920958443"] = {
            key = "173952618866920958443",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2358.75, y = 458.7499999999999},
            propsData = {}
          },
          ["173952618866920958444"] = {
            key = "173952618866920958444",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1429.661694342809, y = 280.51646495918936},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1380107}
            }
          },
          ["173952618866920958445"] = {
            key = "173952618866920958445",
            type = "ChangeStaticCreatorNode",
            name = "\230\137\147\229\138\171\231\154\142\231\154\142\229\135\186\231\142\176",
            pos = {x = 1156.8753166338302, y = 301.62960878131156},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1380107}
            }
          },
          ["173952618866920958446"] = {
            key = "173952618866920958446",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1687.379679144385, y = 284.12299465240636},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003711,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_51003711",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "FadeIn",
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700206,
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
                {TalkActorType = "Npc", TalkActorId = 700206},
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
          ["173952618866920958447"] = {
            key = "173952618866920958447",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1951.2032085561498, y = 279.71122994652404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003712,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
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
          ["173952618866920958448"] = {
            key = "173952618866920958448",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 889.7326203208556, y = 290.2994652406416},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101305,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_DJ"
            }
          },
          ["17484165012581326"] = {
            key = "17484165012581326",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1801.3713974197847, y = 568.4185645518414},
            propsData = {
              StaticCreatorId = 1380107,
              DestroyReason = "MonsterInitiate"
            }
          },
          ["17484165120821545"] = {
            key = "17484165120821545",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2083.830262084532, y = 581.402835844936},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003721,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
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
          ["17484165452092236"] = {
            key = "17484165452092236",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2343.703853862773, y = 608.5518894811815},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_DJMove",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17512711700494251989"] = {
      isStoryNode = true,
      key = "17512711700494251989",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 283.5043478260868, y = 421.25},
      propsData = {
        QuestId = 20020700,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Teacher_1190399"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512711700494251995",
            startPort = "ApproveOut",
            endQuest = "17512711700494251994",
            endPort = "Success"
          },
          {
            startQuest = "17512711700494251998",
            startPort = "Out",
            endQuest = "17512711700494251999",
            endPort = "In"
          },
          {
            startQuest = "17512711700494251997",
            startPort = "Out",
            endQuest = "17512711700494251998",
            endPort = "In"
          },
          {
            startQuest = "17512711700494251993",
            startPort = "QuestStart",
            endQuest = "17512711700494251997",
            endPort = "In"
          },
          {
            startQuest = "17512711700494251999",
            startPort = "Out",
            endQuest = "17512711700494251995",
            endPort = "Input"
          },
          {
            startQuest = "17512711700494251995",
            startPort = "CancelOut",
            endQuest = "17512711700494251996",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17512711700494251993"] = {
            key = "17512711700494251993",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1046.3789473684212, y = 235.4526315789474},
            propsData = {ModeType = 0}
          },
          ["17512711700494251994"] = {
            key = "17512711700494251994",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2587.8571428571427, y = 250.71428571428572},
            propsData = {ModeType = 0}
          },
          ["17512711700494251995"] = {
            key = "17512711700494251995",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 2287.8571428571427, y = 250.71428571428572},
            propsData = {
              SideQuestChainId = 200207,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512711700494251996"] = {
            key = "17512711700494251996",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2613.1913731913733, y = 395.4572754572755},
            propsData = {}
          },
          ["17512711700494251997"] = {
            key = "17512711700494251997",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1393.7679169508513, y = 237.28563831909491},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700086,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Teacher_1190399",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51003501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20020701",
              BlendInTime = 0.5,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700086},
                {TalkActorType = "Npc", TalkActorId = 700016},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17512711700494251998"] = {
            key = "17512711700494251998",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1718.3484736734065, y = 238.96286861528097},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 510035031,
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
          ["17512711700494251999"] = {
            key = "17512711700494251999",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2009.109389952772, y = 261.39190781897696},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003504,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20020701",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorId = 700086,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700086},
                {TalkActorType = "Npc", TalkActorId = 700016},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
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
