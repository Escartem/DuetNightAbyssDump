return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742969086843523404",
      startPort = "\233\128\137\233\161\1852",
      endStory = "1742969119483524170",
      endPort = "In"
    },
    {
      startStory = "1742968913475522973",
      startPort = "StoryStart",
      endStory = "1742969086843523404",
      endPort = "In"
    },
    {
      startStory = "1742969119483524170",
      startPort = "Success",
      endStory = "1742968913476522976",
      endPort = "StoryEnd"
    },
    {
      startStory = "1742969086843523404",
      startPort = "\233\128\137\233\161\1851",
      endStory = "17430656948292907039",
      endPort = "In"
    },
    {
      startStory = "17430656948292907039",
      startPort = "Success",
      endStory = "1742968913476522976",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1742968913475522973"] = {
      isStoryNode = true,
      key = "1742968913475522973",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1030.6323529411766, y = 335.39191176470587},
      propsData = {QuestChainId = 200227},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742968913476522976"] = {
      isStoryNode = true,
      key = "1742968913476522976",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1977.0980392156862, y = 360.5686274509804},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742969086843523404"] = {
      isStoryNode = true,
      key = "1742969086843523404",
      type = "StoryNode",
      name = "\229\146\140\229\137\167\233\153\162\230\136\144\229\145\152\229\175\185\232\175\157",
      pos = {x = 1330.910692036012, y = 298.3382597794362},
      propsData = {
        QuestId = 20022701,
        QuestDescriptionComment = "\228\184\142\231\131\173\230\131\133\231\154\132\229\137\167\229\155\162\230\136\144\229\145\152\229\175\185\232\175\157",
        QuestDescription = "Description_200227_1",
        QuestDeatil = "Content_200227_1",
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
        StoryGuidePointName = "Npc_Juyuan01_SSS_1191279"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742969139749524550",
            startPort = "Option_1",
            endQuest = "1742969141595524634",
            endPort = "In"
          },
          {
            startQuest = "1742969139749524550",
            startPort = "Option_2",
            endQuest = "1742969176870525052",
            endPort = "In"
          },
          {
            startQuest = "1742969141595524634",
            startPort = "Out",
            endQuest = "1742969386967528509",
            endPort = "In"
          },
          {
            startQuest = "1742969176870525052",
            startPort = "Out",
            endQuest = "1742969396207528775",
            endPort = "In"
          },
          {
            startQuest = "1742969086843523405",
            startPort = "QuestStart",
            endQuest = "17429868967833922693",
            endPort = "In"
          },
          {
            startQuest = "17429868967833922693",
            startPort = "Out",
            endQuest = "1742969139749524550",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742969086843523405"] = {
            key = "1742969086843523405",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 705.7954545454545, y = 285},
            propsData = {ModeType = 0}
          },
          ["1742969086843523408"] = {
            key = "1742969086843523408",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1808.9740082079343, y = 612.7633378932968},
            propsData = {ModeType = 0}
          },
          ["1742969086843523411"] = {
            key = "1742969086843523411",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1812.5034199726401, y = 763.9398084815322},
            propsData = {}
          },
          ["1742969139749524550"] = {
            key = "1742969139749524550",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1206.5714285714287, y = 255.85714285714286},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700240,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Juyuan01_SSS_1191279",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51009001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022701",
              BlendInTime = 1,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700240,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700240}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {
                {
                  OptionText = "510090051",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510090052",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1742969141595524634"] = {
            key = "1742969141595524634",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1493.9800959909653, y = 207.67052512704686},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009006,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022701",
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
                  TalkActorId = 700240,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700240}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742969176870525052"] = {
            key = "1742969176870525052",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1486.048385757465, y = 446.7786146078986},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009007,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022701",
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
                  TalkActorId = 700240,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700240}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742969386967528509"] = {
            key = "1742969386967528509",
            type = "QuestConditionNode",
            name = "\233\128\137\233\161\1851\239\188\154\230\156\137\231\169\186",
            pos = {x = 1804.4055230787967, y = 213.09736938253573},
            propsData = {PortName = "\233\128\137\233\161\1851"}
          },
          ["1742969396207528775"] = {
            key = "1742969396207528775",
            type = "QuestConditionNode",
            name = "\233\128\137\233\161\1852\239\188\154\230\178\161\231\169\186",
            pos = {x = 1805.526641091219, y = 453.9627329192548},
            propsData = {PortName = "\233\128\137\233\161\1852"}
          },
          ["17429868967833922693"] = {
            key = "17429868967833922693",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 965.8545870605365, y = 292.22529644268764},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191279}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742969119483524170"] = {
      isStoryNode = true,
      key = "1742969119483524170",
      type = "StoryNode",
      name = "\230\139\146\231\187\157\229\144\142\229\134\141\230\172\161\229\146\140\229\137\167\233\153\162\230\136\144\229\145\152\229\175\185\232\175\157",
      pos = {x = 1677.2345642422367, y = 487.99299251473184},
      propsData = {
        QuestId = 20022702,
        QuestDescriptionComment = "\228\184\142\231\131\173\230\131\133\231\154\132\229\137\167\229\155\162\230\136\144\229\145\152\229\175\185\232\175\157",
        QuestDescription = "Description_200227_1",
        QuestDeatil = "Content_200227_1",
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
        StoryGuidePointName = "Npc_Juyuan01_SSS_1191279"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742969119483524171",
            startPort = "QuestStart",
            endQuest = "1742969539722531915",
            endPort = "In"
          },
          {
            startQuest = "1742969539722531915",
            startPort = "Option_1",
            endQuest = "1742969542192532020",
            endPort = "In"
          },
          {
            startQuest = "1742969539722531915",
            startPort = "Option_2",
            endQuest = "1742969544891532051",
            endPort = "In"
          },
          {
            startQuest = "1742969542192532020",
            startPort = "Out",
            endQuest = "1742969119483524174",
            endPort = "Success"
          },
          {
            startQuest = "1742969544891532051",
            startPort = "Out",
            endQuest = "1742969119483524177",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1742969119483524171"] = {
            key = "1742969119483524171",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1005.3214285714286, y = 368.67857142857144},
            propsData = {ModeType = 0}
          },
          ["1742969119483524174"] = {
            key = "1742969119483524174",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2008.5833333333335, y = 247.41666666666669},
            propsData = {ModeType = 0}
          },
          ["1742969119483524177"] = {
            key = "1742969119483524177",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2011.4544513457556, y = 453.4321946169773},
            propsData = {}
          },
          ["1742969539722531915"] = {
            key = "1742969539722531915",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1325.570512820513, y = 332.26282051282055},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700240,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Juyuan01_SSS_1191279",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51009008,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022701",
              BlendInTime = 1,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700240,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700240}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {
                {
                  OptionText = "510090081",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510090082",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1742969542192532020"] = {
            key = "1742969542192532020",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1702.9375, y = 251.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009009,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022701",
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
                  TalkActorId = 700240,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700240}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742969544891532051"] = {
            key = "1742969544891532051",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1704.0576923076924, y = 457.62087912087907},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009010,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022701",
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
                  TalkActorId = 700240,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700240}
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
    ["17430656948292907039"] = {
      isStoryNode = true,
      key = "17430656948292907039",
      type = "StoryNode",
      name = "\228\188\170\232\138\130\231\130\185",
      pos = {x = 1674.7467518503502, y = 241.3662398015402},
      propsData = {
        QuestId = 20022703,
        QuestDescriptionComment = "\231\148\168\228\186\142\231\187\147\230\157\159\228\187\187\229\138\161",
        QuestDescription = "Description_200227_1",
        QuestDeatil = "Content_200227_1",
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
        StoryGuidePointName = "Npc_Juyuan01_SSS_1191279"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17430656948292907040",
            startPort = "QuestStart",
            endQuest = "17430657013732907191",
            endPort = "In"
          },
          {
            startQuest = "17430657013732907191",
            startPort = "Out",
            endQuest = "17430656948292907043",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17430656948292907040"] = {
            key = "17430656948292907040",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17430656948292907043"] = {
            key = "17430656948292907043",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1614, y = 342},
            propsData = {ModeType = 0}
          },
          ["17430656948292907046"] = {
            key = "17430656948292907046",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17430657013732907191"] = {
            key = "17430657013732907191",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1162.5714285714287, y = 344},
            propsData = {WaitTime = 0.1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
