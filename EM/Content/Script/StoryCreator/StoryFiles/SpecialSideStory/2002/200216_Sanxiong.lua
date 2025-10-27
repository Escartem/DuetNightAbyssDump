return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17519769369175680064",
      startPort = "StoryStart",
      endStory = "17519769369175680066",
      endPort = "In"
    },
    {
      startStory = "17519769369175680066",
      startPort = "Success",
      endStory = "17519769369175680062",
      endPort = "In"
    },
    {
      startStory = "17519769369175680062",
      startPort = "Success",
      endStory = "17519769369175680067",
      endPort = "In"
    },
    {
      startStory = "17519769369175680067",
      startPort = "Success",
      endStory = "17519769369175680063",
      endPort = "In"
    },
    {
      startStory = "17519769369175680063",
      startPort = "Success",
      endStory = "17519769369175680065",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17519769369175680062"] = {
      isStoryNode = true,
      key = "17519769369175680062",
      type = "StoryNode",
      name = "\229\188\128\231\174\177\229\141\176\232\177\161\229\138\160\229\128\188\229\175\185\232\175\157",
      pos = {x = 1033.6604062604058, y = 298.334332334332},
      propsData = {
        QuestId = 20021602,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200216_2",
        QuestDeatil = "Content_200216_2",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_200216Chest_1180537"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17519769369175680071",
            startPort = "Out",
            endQuest = "17585288186972669",
            endPort = "In"
          },
          {
            startQuest = "17585288186972669",
            startPort = "Out",
            endQuest = "17519769369175680069",
            endPort = "Success"
          },
          {
            startQuest = "17519769369175680068",
            startPort = "QuestStart",
            endQuest = "17519769369175680071",
            endPort = "In"
          }
        },
        nodeData = {
          ["17519769369175680068"] = {
            key = "17519769369175680068",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 996, y = 276},
            propsData = {ModeType = 0}
          },
          ["17519769369175680069"] = {
            key = "17519769369175680069",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1919.1999999999998, y = 289.1142857142857},
            propsData = {ModeType = 0}
          },
          ["17519769369175680070"] = {
            key = "17519769369175680070",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1517.7142857142858, y = 473.8},
            propsData = {}
          },
          ["17519769369175680071"] = {
            key = "17519769369175680071",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1356.2459057712151, y = 271.2095539427137},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700122,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_200216Chest_1180537",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51005801,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200216510058",
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
                  TalkActorId = 700123,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700124,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700126,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700125,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700123},
                {TalkActorType = "Npc", TalkActorId = 700124},
                {TalkActorType = "Npc", TalkActorId = 700125}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17585288186972669"] = {
            key = "17585288186972669",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1642.5, y = 295.9632352941177},
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
    ["17519769369175680063"] = {
      isStoryNode = true,
      key = "17519769369175680063",
      type = "StoryNode",
      name = "\228\186\139\229\144\142\229\141\176\232\177\161\229\138\160\229\128\188\229\175\185\232\175\157",
      pos = {x = 1563.9704541072958, y = 298.96120700764635},
      propsData = {
        QuestId = 20021604,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200216_4",
        QuestDeatil = "Content_200216_4",
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_20021651005901Dage_1180542"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17519769369175680075",
            startPort = "Option_1",
            endQuest = "17519760482243803043",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680075",
            startPort = "Option_2",
            endQuest = "17519760482243803043",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680075",
            startPort = "Option_1",
            endQuest = "17519760482243803041",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680075",
            startPort = "Option_2",
            endQuest = "17519760482243803042",
            endPort = "In"
          },
          {
            startQuest = "17519760482243803041",
            startPort = "Out",
            endQuest = "17519769369175680076",
            endPort = "In"
          },
          {
            startQuest = "17519760482243803042",
            startPort = "Out",
            endQuest = "17519769369175680076",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680076",
            startPort = "Out",
            endQuest = "1758529202459934249",
            endPort = "In"
          },
          {
            startQuest = "1758529202459934249",
            startPort = "Out",
            endQuest = "17519769369175680073",
            endPort = "Success"
          },
          {
            startQuest = "17519769369175680072",
            startPort = "QuestStart",
            endQuest = "17519769369175680075",
            endPort = "In"
          }
        },
        nodeData = {
          ["17519760482243803041"] = {
            key = "17519760482243803041",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1204.1438492824752, y = 289.74906356027026},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51005905,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200216510059",
              BlendInTime = 0,
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
                  TalkActorId = 700123,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700124,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700125,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700126,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700124},
                {TalkActorType = "Npc", TalkActorId = 700125},
                {TalkActorType = "Npc", TalkActorId = 700123},
                {TalkActorType = "Npc", TalkActorId = 700126}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17519760482243803042"] = {
            key = "17519760482243803042",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1205.9944064444169, y = 472.71555477059957},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51005909,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200216510059",
              BlendInTime = 0,
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
                  TalkActorId = 700123,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700124,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700125,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700126,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700124},
                {TalkActorType = "Npc", TalkActorId = 700125},
                {TalkActorType = "Npc", TalkActorId = 700123},
                {TalkActorType = "Npc", TalkActorId = 700126}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17519760482243803043"] = {
            key = "17519760482243803043",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1201.9168573127956, y = 645.4386144448295},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180539,
                1180540,
                1180541
              }
            }
          },
          ["17519769369175680072"] = {
            key = "17519769369175680072",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 511.1491370471633, y = 306.4889781271361},
            propsData = {ModeType = 0}
          },
          ["17519769369175680073"] = {
            key = "17519769369175680073",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1852.4081265035502, y = 370.9633749926657},
            propsData = {ModeType = 0}
          },
          ["17519769369175680074"] = {
            key = "17519769369175680074",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1982.2692601067888, y = 607.081998474447},
            propsData = {}
          },
          ["17519769369175680075"] = {
            key = "17519769369175680075",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 882.5294087583605, y = 300.29895012607915},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700199,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_20021651005901Dage_1180542",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51005901,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20021651005901",
              BlendInTime = 1,
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
                  TalkActorId = 700123,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700124,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700125,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700126,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700124},
                {TalkActorType = "Npc", TalkActorId = 700125},
                {TalkActorType = "Npc", TalkActorId = 700123},
                {TalkActorType = "Npc", TalkActorId = 700126}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlusOptions = {
                {
                  OptionText = "510059041",
                  PlusId = 1004,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510059042",
                  PlusId = 1005,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17519769369175680076"] = {
            key = "17519769369175680076",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1554.6125063342467, y = 318.56592682679604},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180538, 1180542}
            }
          },
          ["1758529202459934249"] = {
            key = "1758529202459934249",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1557.3126934984523, y = 472.3842105263157},
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
    ["17519769369175680064"] = {
      isStoryNode = true,
      key = "17519769369175680064",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 491.92307692307685, y = 308.2775919732441},
      propsData = {QuestChainId = 200216},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17519769369175680065"] = {
      isStoryNode = true,
      key = "17519769369175680065",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1862.8321678321681, y = 290.909090909091},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17519769369175680066"] = {
      isStoryNode = true,
      key = "17519769369175680066",
      type = "StoryNode",
      name = "\229\136\183\231\174\177\229\173\144",
      pos = {x = 759.7210013614506, y = 296.06166939467874},
      propsData = {
        QuestId = 20021601,
        QuestDescriptionComment = "\229\136\183\231\174\177\229\173\144",
        QuestDescription = "Description_200216_1",
        QuestDeatil = "Content_200216_1",
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
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Sanxiongdi"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17519769369175680079",
            startPort = "QuestStart",
            endQuest = "17519769369175680077",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680082",
            startPort = "Out",
            endQuest = "17519769369175680080",
            endPort = "Success"
          },
          {
            startQuest = "17519769369175680077",
            startPort = "Out",
            endQuest = "17519769369175680078",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680078",
            startPort = "Out",
            endQuest = "17519769369175680082",
            endPort = "In"
          }
        },
        nodeData = {
          ["17519769369175680077"] = {
            key = "17519769369175680077",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 853.0863802863802, y = 293.7346209346207},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Sanxiongdi"
            }
          },
          ["17519769369175680078"] = {
            key = "17519769369175680078",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1141.3041282389108, y = 297.22837066315304},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190654,
              GuideType = "P",
              GuidePointName = "QuestPoint_Sanxiongdi"
            }
          },
          ["17519769369175680079"] = {
            key = "17519769369175680079",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 528.9230769230769, y = 297},
            propsData = {ModeType = 0}
          },
          ["17519769369175680080"] = {
            key = "17519769369175680080",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1964.8609890109894, y = 309.30857620640234},
            propsData = {ModeType = 0}
          },
          ["17519769369175680081"] = {
            key = "17519769369175680081",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17519769369175680082"] = {
            key = "17519769369175680082",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1450.9073541697383, y = 300.63928817140857},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180538, 1180537}
            }
          }
        },
        commentData = {}
      }
    },
    ["17519769369175680067"] = {
      isStoryNode = true,
      key = "17519769369175680067",
      type = "StoryNode",
      name = "\229\135\187\230\157\128\228\184\137\229\133\132\229\188\159",
      pos = {x = 1301.9540386521544, y = 299.3702658325658},
      propsData = {
        QuestId = 20021603,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200216_3",
        QuestDeatil = "Content_200216_3",
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
        StoryGuidePointName = "QuestPoint_Sanxiongdi"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17519769369175680087",
            startPort = "QuestStart",
            endQuest = "17519769369175680083",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680083",
            startPort = "Out",
            endQuest = "17519769369175680085",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680085",
            startPort = "Out",
            endQuest = "17519769369175680084",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680084",
            startPort = "Out",
            endQuest = "17519769369175680086",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680086",
            startPort = "Out",
            endQuest = "17519769369175680090",
            endPort = "In"
          },
          {
            startQuest = "17519769369175680090",
            startPort = "Out",
            endQuest = "17519769369175680088",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17519769369175680083"] = {
            key = "17519769369175680083",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1485.173895257164, y = 333.3535440251864},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Sanxiongdi"
            }
          },
          ["17519769369175680084"] = {
            key = "17519769369175680084",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1990.3250914294133, y = 327.07507512566485},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1190660,
                1190661,
                1190662
              }
            }
          },
          ["17519769369175680085"] = {
            key = "17519769369175680085",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1722.5479249011858, y = 332.92164031620547},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190660,
                1190661,
                1190662
              }
            }
          },
          ["17519769369175680086"] = {
            key = "17519769369175680086",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2278.1090909090904, y = 322.6484848484843},
            propsData = {WaitTime = 2}
          },
          ["17519769369175680087"] = {
            key = "17519769369175680087",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1182.6518218623482, y = 316.88259109311736},
            propsData = {ModeType = 0}
          },
          ["17519769369175680088"] = {
            key = "17519769369175680088",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2833.739456081676, y = 320.56896798853325},
            propsData = {ModeType = 0}
          },
          ["17519769369175680089"] = {
            key = "17519769369175680089",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17519769369175680090"] = {
            key = "17519769369175680090",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2535.428571428571, y = 321.1428571428572},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180539,
                1180542,
                1180540,
                1180541
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
