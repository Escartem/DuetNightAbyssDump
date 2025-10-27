return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721493152772712166",
      startPort = "Success",
      endStory = "1721493152772712167",
      endPort = "In"
    },
    {
      startStory = "1721493152772712167",
      startPort = "Success",
      endStory = "1728397209556847",
      endPort = "In"
    },
    {
      startStory = "1721493080081572084",
      startPort = "StoryStart",
      endStory = "1741784860815773",
      endPort = "In"
    },
    {
      startStory = "1741784860815773",
      startPort = "Success",
      endStory = "1721493152772712166",
      endPort = "In"
    },
    {
      startStory = "17418657005486809643",
      startPort = "Success",
      endStory = "1721493080081572087",
      endPort = "StoryEnd"
    },
    {
      startStory = "17418656635856808981",
      startPort = "Success",
      endStory = "17418657005486809643",
      endPort = "In"
    },
    {
      startStory = "1728397209556847",
      startPort = "Success",
      endStory = "17418656635856808981",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1721493080081572084"] = {
      isStoryNode = true,
      key = "1721493080081572084",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1177.391304347826, y = 261.7391304347826},
      propsData = {QuestChainId = 200219},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721493080081572087"] = {
      isStoryNode = true,
      key = "1721493080081572087",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2391.7412513255567, y = 242.45917285259807},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721493152772712166"] = {
      isStoryNode = true,
      key = "1721493152772712166",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\148\174\231\165\168\231\171\153",
      pos = {x = 1476.0662326803622, y = 253.54918776875303},
      propsData = {
        QuestId = 20021901,
        QuestDescriptionComment = "\229\137\141\229\190\128\229\148\174\231\165\168\231\171\153",
        QuestDescription = "Description_200219_1",
        QuestDeatil = "Content_200219_1",
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
        StoryGuidePointName = "QuestPoint_20021901"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17214942914361415627",
            startPort = "Out",
            endQuest = "17214943209371416230",
            endPort = "In"
          },
          {
            startQuest = "17214943209371416230",
            startPort = "Out",
            endQuest = "17214943727731557167",
            endPort = "In"
          },
          {
            startQuest = "17214943727731557167",
            startPort = "Out",
            endQuest = "17214944201061698016",
            endPort = "In"
          },
          {
            startQuest = "17214944201061698016",
            startPort = "Out",
            endQuest = "1721493152774712187",
            endPort = "Success"
          },
          {
            startQuest = "1721493152774712186",
            startPort = "QuestStart",
            endQuest = "17214942914361415627",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721493152774712186"] = {
            key = "1721493152774712186",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 400.22742474916384, y = 303.95652173913044},
            propsData = {ModeType = 0}
          },
          ["1721493152774712187"] = {
            key = "1721493152774712187",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2244.643597706641, y = 315.44988055422846},
            propsData = {ModeType = 0}
          },
          ["1721493152774712188"] = {
            key = "1721493152774712188",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17214935074201414958"] = {
            key = "17214935074201414958",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 744.5830494890798, y = 82.3386094970949},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021901"
            }
          },
          ["17214942914361415627"] = {
            key = "17214942914361415627",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1020.4596273291918, y = 306.65838509316785},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190706}
            }
          },
          ["17214943209371416230"] = {
            key = "17214943209371416230",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1333.5031055900615, y = 308.3975155279504},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190708,
              GuideType = "P",
              GuidePointName = "QuestPoint_20021901"
            }
          },
          ["17214943727731557167"] = {
            key = "17214943727731557167",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1624.8074534161483, y = 292.3105590062115},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51006901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20021901",
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
                  TalkActorId = 700148,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700147,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700148},
                {TalkActorType = "Npc", TalkActorId = 700147},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17214944201061698016"] = {
            key = "17214944201061698016",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1930.8944099378873, y = 314.91925465838546},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190706}
            }
          }
        },
        commentData = {}
      }
    },
    ["1721493152772712167"] = {
      isStoryNode = true,
      key = "1721493152772712167",
      type = "StoryNode",
      name = "\229\146\140\230\157\142\229\174\137\229\190\183\229\175\185\232\175\157",
      pos = {x = 1737.3245938843754, y = 251.2327998088866},
      propsData = {
        QuestId = 20021902,
        QuestDescriptionComment = "\229\146\140\229\149\134\228\186\186\229\175\185\232\175\157",
        QuestDescription = "Description_200219_2",
        QuestDeatil = "Content_200219_2",
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
        StoryGuidePointName = "QuestPoint_20021902"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17214945057311838691",
            startPort = "Out",
            endQuest = "1721493152775712197",
            endPort = "In"
          },
          {
            startQuest = "1721493152775712197",
            startPort = "Out",
            endQuest = "17214945203871839025",
            endPort = "In"
          },
          {
            startQuest = "17214945203871839025",
            startPort = "Out",
            endQuest = "1721647188719423731",
            endPort = "In"
          },
          {
            startQuest = "1721647188719423731",
            startPort = "Out",
            endQuest = "1721493152775712199",
            endPort = "Success"
          },
          {
            startQuest = "1721493152775712198",
            startPort = "QuestStart",
            endQuest = "17214945057311838691",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721493152775712197"] = {
            key = "1721493152775712197",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1033.0827920068295, y = 297.1751036552621},
            propsData = {
              ImpressionTalkTriggerId = 510070,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_ForeignMerchant_1190709",
              GuideStaticCreatorId = 700149
            }
          },
          ["1721493152775712198"] = {
            key = "1721493152775712198",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 62.730313165095836, y = 297.737501628806},
            propsData = {ModeType = 0}
          },
          ["1721493152775712199"] = {
            key = "1721493152775712199",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1901.1403618121012, y = 297.9902966598619},
            propsData = {ModeType = 0}
          },
          ["1721493152775712200"] = {
            key = "1721493152775712200",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17214945057311838691"] = {
            key = "17214945057311838691",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 710.8944099378875, y = 299.7018633540379},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190709}
            }
          },
          ["17214945203871839025"] = {
            key = "17214945203871839025",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1329.5944538553226, y = 296.16431394692324},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190709}
            }
          },
          ["1721647188719423731"] = {
            key = "1721647188719423731",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1623.5454545454543, y = 296.27272727272725},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190711}
            }
          }
        },
        commentData = {}
      }
    },
    ["1728397209556847"] = {
      isStoryNode = true,
      key = "1728397209556847",
      type = "StoryNode",
      name = "\229\146\140\230\157\142\229\174\137\229\190\183\229\175\185\232\175\157",
      pos = {x = 2020.4473684210527, y = 243.83333333333334},
      propsData = {
        QuestId = 20021903,
        QuestDescriptionComment = "\229\146\140\229\149\134\228\186\186\229\175\185\232\175\157",
        QuestDescription = "Description_200219_3",
        QuestDeatil = "Content_200219_3",
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
        StoryGuidePointName = "Npc_Conductor_1190705"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1728397209556852",
            startPort = "QuestStart",
            endQuest = "17418649844084359005",
            endPort = "In"
          },
          {
            startQuest = "17418649844084359005",
            startPort = "Out",
            endQuest = "1728397209556853",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1728397209556852"] = {
            key = "1728397209556852",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 62.730313165095836, y = 297.737501628806},
            propsData = {ModeType = 0}
          },
          ["1728397209556853"] = {
            key = "1728397209556853",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 654.4736951454347, y = 297.9902966598619},
            propsData = {ModeType = 0}
          },
          ["1728397209556854"] = {
            key = "1728397209556854",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1728397272693181044"] = {
            key = "1728397272693181044",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 367.4160259025618, y = 60.25438596491233},
            propsData = {
              ImpressionTalkTriggerId = 510074,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Conductor_1190705",
              GuideStaticCreatorId = 700147
            }
          },
          ["17418649844084359005"] = {
            key = "17418649844084359005",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 329.02873601138236, y = 297.58769975199715},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700147,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Conductor_1190705",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007101,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700148,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700147,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700148},
                {TalkActorType = "Npc", TalkActorId = 700147}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1741784860815773"] = {
      isStoryNode = true,
      key = "1741784860815773",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\158\131\229\156\190\231\174\177",
      pos = {x = 1492.6122996036788, y = 74.83608922402024},
      propsData = {
        QuestId = 20021904,
        QuestDescriptionComment = "\229\137\141\229\190\128\229\148\174\231\165\168\231\171\153",
        QuestDescription = "Description_200219_4",
        QuestDeatil = "Content_200219_4",
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
        StoryGuidePointName = "Npc_daye20021904_1191720"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1741784860815784",
            startPort = "Out",
            endQuest = "1741784860815779",
            endPort = "Success"
          },
          {
            startQuest = "1741784860815778",
            startPort = "QuestStart",
            endQuest = "17418577971553542034",
            endPort = "In"
          },
          {
            startQuest = "17418577971553542034",
            startPort = "Out",
            endQuest = "1741784860815784",
            endPort = "In"
          }
        },
        nodeData = {
          ["1741784860815778"] = {
            key = "1741784860815778",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 779.0845676063062, y = 313.3850931677018},
            propsData = {ModeType = 0}
          },
          ["1741784860815779"] = {
            key = "1741784860815779",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1701.9163249793683, y = 319.5407896451375},
            propsData = {ModeType = 0}
          },
          ["1741784860815780"] = {
            key = "1741784860815780",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1741784860815784"] = {
            key = "1741784860815784",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1276.3788819875772, y = 308.7423771880297},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700231,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_daye20021904_1191720",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51006921,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["17418577971553542034"] = {
            key = "17418577971553542034",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1056.5292041287607, y = 219.138696336844},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191258, 1191720}
            }
          }
        },
        commentData = {}
      }
    },
    ["17418656635856808981"] = {
      isStoryNode = true,
      key = "17418656635856808981",
      type = "StoryNode",
      name = "\229\174\140\230\136\144\230\156\186\229\133\179",
      pos = {x = 2031.082387492924, y = 440.48361547012803},
      propsData = {
        QuestId = 20021905,
        QuestDescriptionComment = "\229\146\140\229\149\134\228\186\186\229\175\185\232\175\157",
        QuestDescription = "Description_200219_5",
        QuestDeatil = "Content_200219_5",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20021906xingxing_1191262"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17422017188813288796",
            startPort = "Out",
            endQuest = "17422017188813288795",
            endPort = "In"
          },
          {
            startQuest = "17418656635856808986",
            startPort = "QuestStart",
            endQuest = "17422017188813288796",
            endPort = "In"
          },
          {
            startQuest = "17422017188813288795",
            startPort = "Out",
            endQuest = "17418656635856808987",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17418656635856808986"] = {
            key = "17418656635856808986",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 260.0987342177274, y = 325.36908057617444},
            propsData = {ModeType = 0}
          },
          ["17418656635856808987"] = {
            key = "17418656635856808987",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 615.7894846191189, y = 335.0955598177566},
            propsData = {ModeType = 0}
          },
          ["17418656635856808988"] = {
            key = "17418656635856808988",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17418656635866808989"] = {
            key = "17418656635866808989",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 367.4160259025618, y = 60.25438596491233},
            propsData = {
              ImpressionTalkTriggerId = 510074,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Conductor_1190705",
              GuideStaticCreatorId = 700147
            }
          },
          ["17422017188813288795"] = {
            key = "17422017188813288795",
            type = "WaitingMechanismEnterStateNode",
            name = "\230\138\152\230\152\159\230\152\159",
            pos = {x = 599.6948956038366, y = 475.52239454879},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1191262,
              StateId = 572,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_20021906xingxing_1191262"
            }
          },
          ["17422017188813288796"] = {
            key = "17422017188813288796",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 308.4718492675795, y = 488.51707097087615},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Mechanism_20021906xingxing_1191262",
              StaticCreatorIdList = {1191262}
            }
          }
        },
        commentData = {}
      }
    },
    ["17418657005486809643"] = {
      isStoryNode = true,
      key = "17418657005486809643",
      type = "StoryNode",
      name = "\229\146\140\230\157\142\229\174\137\229\190\183\229\175\185\232\175\157",
      pos = {x = 2349.055397780621, y = 452.45649607132276},
      propsData = {
        QuestId = 20021906,
        QuestDescriptionComment = "\229\146\140\229\149\134\228\186\186\229\175\185\232\175\157",
        QuestDescription = "Description_200219_3",
        QuestDeatil = "Content_200219_3",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_20021906xingxing_1191262"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17418657005486809652",
            startPort = "Out",
            endQuest = "17418657005486809649",
            endPort = "Success"
          },
          {
            startQuest = "17418657005486809648",
            startPort = "QuestStart",
            endQuest = "17418657005486809652",
            endPort = "In"
          }
        },
        nodeData = {
          ["17418657005486809648"] = {
            key = "17418657005486809648",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -106.57862992433493, y = 264.607420327993},
            propsData = {ModeType = 0}
          },
          ["17418657005486809649"] = {
            key = "17418657005486809649",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 654.4736951454347, y = 297.9902966598619},
            propsData = {ModeType = 0}
          },
          ["17418657005486809650"] = {
            key = "17418657005486809650",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17418657005486809651"] = {
            key = "17418657005486809651",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 367.4160259025618, y = 60.25438596491233},
            propsData = {
              ImpressionTalkTriggerId = 510074,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Conductor_1190705",
              GuideStaticCreatorId = 700147
            }
          },
          ["17418657005486809652"] = {
            key = "17418657005486809652",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 329.02873601138236, y = 297.58769975199715},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700147,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Conductor_1190705",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007190,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
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
                  TalkActorType = "Npc",
                  TalkActorId = 700148,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700147,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700148},
                {TalkActorType = "Npc", TalkActorId = 700147}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17421155508847229"] = {
            key = "17421155508847229",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 124.58905915712468, y = 56.46821376560348},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_20021906xingxing_1191262"
            }
          },
          ["17421984461582467444"] = {
            key = "17421984461582467444",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 547.5396988602843, y = 465.57806352188345},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1220118,
              StateId = 572,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_20020405"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
