return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170470269924233329",
      startPort = "Success",
      endStory = "170470270226733453",
      endPort = "In"
    },
    {
      startStory = "169814285142312195",
      startPort = "Success",
      endStory = "17046968464071509",
      endPort = "In"
    },
    {
      startStory = "17283855998447428",
      startPort = "\227\128\144\229\136\134\230\148\1752.1\227\128\145\239\188\136\233\154\144\231\158\146\229\156\168\231\159\191\229\157\145\228\184\173\229\190\151\229\136\176\231\154\132\230\151\165\232\174\176\239\188\137",
      endStory = "17283864755168710",
      endPort = "In"
    },
    {
      startStory = "17283855998447428",
      startPort = "\227\128\144\229\136\134\230\148\1752.2\227\128\145\239\188\136\228\186\164\229\135\186\229\156\168\231\159\191\229\157\145\228\184\173\229\190\151\229\136\176\231\154\132\230\151\165\232\174\176\239\188\137",
      endStory = "172838672257412659",
      endPort = "In"
    },
    {
      startStory = "17046968464071509",
      startPort = "Success",
      endStory = "17283855998447428",
      endPort = "In"
    },
    {
      startStory = "172838672257412659",
      startPort = "Success",
      endStory = "16981394987185365",
      endPort = "StoryEnd"
    },
    {
      startStory = "17283864755168710",
      startPort = "Success",
      endStory = "16981394987185365",
      endPort = "StoryEnd"
    },
    {
      startStory = "16981394987185362",
      startPort = "StoryStart",
      endStory = "17512711273063271444",
      endPort = "In"
    },
    {
      startStory = "17512711273063271444",
      startPort = "Success",
      endStory = "169814285142312195",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["16981394987185362"] = {
      isStoryNode = true,
      key = "16981394987185362",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 750.7500000000001, y = 330.25},
      propsData = {QuestChainId = 200201},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["16981394987185365"] = {
      isStoryNode = true,
      key = "16981394987185365",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2258.1626984126983, y = 88.93253968253941},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["169814285142312195"] = {
      isStoryNode = true,
      key = "169814285142312195",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1048.26370458058, y = 319.28813604393315},
      propsData = {
        QuestId = 20020102,
        QuestDescriptionComment = "\229\146\140\229\184\140\231\144\179\229\164\171\228\186\186\228\186\164\230\181\129",
        QuestDescription = "Description_200201_2",
        QuestDeatil = "Content_200201_2",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979504220665",
            startPort = "QuestStart",
            endQuest = "1704175979504220668",
            endPort = "In"
          },
          {
            startQuest = "1704175979504220668",
            startPort = "Out",
            endQuest = "1704175979504220666",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979504220665"] = {
            key = "1704175979504220665",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175979504220666"] = {
            key = "1704175979504220666",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1581.25, y = 313.125},
            propsData = {ModeType = 0}
          },
          ["1704175979504220667"] = {
            key = "1704175979504220667",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1759.375, y = 752.5},
            propsData = {}
          },
          ["1704175979504220668"] = {
            key = "1704175979504220668",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1175.6944444444443, y = 315.27777777777777},
            propsData = {
              ImpressionTalkTriggerId = 510002,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Xilin_1190094",
              GuideStaticCreatorId = 700019
            }
          }
        },
        commentData = {}
      }
    },
    ["17046968464071509"] = {
      isStoryNode = true,
      key = "17046968464071509",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1320.1298701298701, y = 315.39610389610397},
      propsData = {
        QuestId = 20020104,
        QuestDescriptionComment = "\229\175\187\230\137\190\230\151\165\232\174\176",
        QuestDescription = "Description_200201_4",
        QuestDeatil = "Content_200201_4",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17046968464071510",
            startPort = "QuestStart",
            endQuest = "17049703108437618",
            endPort = "In"
          },
          {
            startQuest = "17049703108437618",
            startPort = "Out",
            endQuest = "1724483965222372038",
            endPort = "Input"
          },
          {
            startQuest = "1724483965222372038",
            startPort = "Out",
            endQuest = "17046968464071512",
            endPort = "Success"
          },
          {
            startQuest = "17046968464071510",
            startPort = "QuestStart",
            endQuest = "1724485124638548554",
            endPort = "Input"
          },
          {
            startQuest = "1724485124638548554",
            startPort = "Out",
            endQuest = "17046968464071512",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17046968464071510"] = {
            key = "17046968464071510",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 607.1428571428571, y = 285.65714285714284},
            propsData = {ModeType = 0}
          },
          ["17046968464071512"] = {
            key = "17046968464071512",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1382.7428571428588, y = 282.2142857142859},
            propsData = {ModeType = 0}
          },
          ["17046968464071514"] = {
            key = "17046968464071514",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1602.6086956521758, y = 393.8043478260872},
            propsData = {}
          },
          ["170470370023438889"] = {
            key = "170470370023438889",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\142\137\232\144\189\231\137\169",
            pos = {x = 1406.2557639764154, y = 41.35092974583563},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1440065}
            }
          },
          ["170470370937039239"] = {
            key = "170470370937039239",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1105.382334024724, y = 61.24934244424833},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1440065},
              QuestPickupId = -1,
              UnitId = 2000018,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_200201",
              IsUseCount = false
            }
          },
          ["17049703108437618"] = {
            key = "17049703108437618",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 866.011904761904, y = 281.9761904761908},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101304,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_200201"
            }
          },
          ["1724483965222372038"] = {
            key = "1724483965222372038",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 1116.3101148339415, y = 282.66338663318277},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 2000019,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_200201"
            }
          },
          ["1724485124638548554"] = {
            key = "1724485124638548554",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 990.7545592783861, y = 471.2348152046114},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 2000019,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["170470269924233329"] = {
      isStoryNode = true,
      key = "170470269924233329",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1592.013320912232, y = 675.7320891661258},
      propsData = {
        QuestId = 20020105,
        QuestDescriptionComment = "\232\191\148\229\155\158\229\184\140\231\144\179\229\164\171\228\186\186\229\164\132",
        QuestDescription = "Description_200201_5",
        QuestDeatil = "Content_200201_5",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "170470269924333333",
            startPort = "QuestStart",
            endQuest = "170470513740049152",
            endPort = "In"
          },
          {
            startQuest = "170470513740049152",
            startPort = "Out",
            endQuest = "170470269924333334",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170470269924333333"] = {
            key = "170470269924333333",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["170470269924333334"] = {
            key = "170470269924333334",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1533.1130434782613, y = 300.5739130434783},
            propsData = {ModeType = 0}
          },
          ["170470269924333335"] = {
            key = "170470269924333335",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1614.347826086957, y = 510.86956521739137},
            propsData = {}
          },
          ["170470513740049152"] = {
            key = "170470513740049152",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1170.2717750185138, y = 304.7748082827583},
            propsData = {
              ImpressionTalkTriggerId = 510003,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Xilin_1190094",
              GuideStaticCreatorId = 700019
            }
          }
        },
        commentData = {}
      }
    },
    ["170470270226733453"] = {
      isStoryNode = true,
      key = "170470270226733453",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1900.4931690833844, y = 645.8124549356219},
      propsData = {
        QuestId = 20020106,
        QuestDescriptionComment = "\229\146\140\232\142\142\232\142\137\228\186\164\232\176\136",
        QuestDescription = "Description_200201_6",
        QuestDeatil = "Content_200201_6",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "170470270226733457",
            startPort = "QuestStart",
            endQuest = "170470523929851119",
            endPort = "In"
          },
          {
            startQuest = "170470523929851119",
            startPort = "Out",
            endQuest = "170470270226833458",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170470270226733457"] = {
            key = "170470270226733457",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["170470270226833458"] = {
            key = "170470270226833458",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1453.9130434782612, y = 230.8695652173913},
            propsData = {ModeType = 0}
          },
          ["170470270226833459"] = {
            key = "170470270226833459",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1678.2608695652177, y = 526.5217391304349},
            propsData = {}
          },
          ["170470523929851119"] = {
            key = "170470523929851119",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1121.4282967576446, y = 297.80089523927967},
            propsData = {
              ImpressionTalkTriggerId = 510023,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Shali_1190095",
              GuideStaticCreatorId = 700020
            }
          }
        },
        commentData = {}
      }
    },
    ["17283855998447428"] = {
      isStoryNode = true,
      key = "17283855998447428",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1608.0438163157667, y = 278.7384696009849},
      propsData = {
        QuestId = 20020105,
        QuestDescriptionComment = "\232\191\148\229\155\158\229\184\140\231\144\179\229\164\171\228\186\186\229\164\132",
        QuestDescription = "Description_200201_5",
        QuestDeatil = "Content_200201_5",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17283855998457429",
            startPort = "QuestStart",
            endQuest = "1728456093371549789",
            endPort = "In"
          },
          {
            startQuest = "1728456093371549789",
            startPort = "Out",
            endQuest = "17283864605148068",
            endPort = "In"
          },
          {
            startQuest = "17283864605148068",
            startPort = "Option_1",
            endQuest = "172838666696411637",
            endPort = "In"
          },
          {
            startQuest = "17283864605148068",
            startPort = "Option_2",
            endQuest = "172838666193211436",
            endPort = "In"
          }
        },
        nodeData = {
          ["17283855998457429"] = {
            key = "17283855998457429",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17283855998457432"] = {
            key = "17283855998457432",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2156.175548589342, y = 110.97178683385567},
            propsData = {ModeType = 0}
          },
          ["17283855998457435"] = {
            key = "17283855998457435",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1662.7272727272727, y = 705.4545454545455},
            propsData = {}
          },
          ["17283864605148068"] = {
            key = "17283864605148068",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1365.5253496543783, y = 283.9445281824518},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700019,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Xilin_1190094",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51002301,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "",
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
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["172838666193211436"] = {
            key = "172838666193211436",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 1732.511603703748, y = 464.61943306983176},
            propsData = {
              PortName = "\227\128\144\229\136\134\230\148\1752.1\227\128\145\239\188\136\233\154\144\231\158\146\229\156\168\231\159\191\229\157\145\228\184\173\229\190\151\229\136\176\231\154\132\230\151\165\232\174\176\239\188\137"
            }
          },
          ["172838666696411637"] = {
            key = "172838666696411637",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 1736.7836343550887, y = 194.35602310814602},
            propsData = {
              PortName = "\227\128\144\229\136\134\230\148\1752.2\227\128\145\239\188\136\228\186\164\229\135\186\229\156\168\231\159\191\229\157\145\228\184\173\229\190\151\229\136\176\231\154\132\230\151\165\232\174\176\239\188\137"
            }
          },
          ["1728456093371549789"] = {
            key = "1728456093371549789",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1060.5067691474596, y = 292.86489698873424},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Xilin_51002301"
            }
          }
        },
        commentData = {}
      }
    },
    ["17283864755168710"] = {
      isStoryNode = true,
      key = "17283864755168710",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1972.525332817248, y = -48.21793364911598},
      propsData = {
        QuestId = 20020106,
        QuestDescriptionComment = "\229\146\140\232\142\142\232\142\137\228\186\164\232\176\136",
        QuestDescription = "Description_200201_6",
        QuestDeatil = "Content_200201_7",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "172838661090410099",
            startPort = "Option_1",
            endQuest = "172838661090410100",
            endPort = "In"
          },
          {
            startQuest = "172838661090410100",
            startPort = "Option_1",
            endQuest = "172838661090410101",
            endPort = "In"
          },
          {
            startQuest = "172838661090410101",
            startPort = "Out",
            endQuest = "172839288288525135",
            endPort = "In"
          },
          {
            startQuest = "172839288288525135",
            startPort = "Out",
            endQuest = "17283864755168714",
            endPort = "Success"
          },
          {
            startQuest = "17283864755168711",
            startPort = "QuestStart",
            endQuest = "1728456238923551212",
            endPort = "In"
          },
          {
            startQuest = "1728456238923551212",
            startPort = "Out",
            endQuest = "172838661090410099",
            endPort = "In"
          }
        },
        nodeData = {
          ["17283864755168711"] = {
            key = "17283864755168711",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17283864755168714"] = {
            key = "17283864755168714",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1979.9999999999998, y = 295},
            propsData = {ModeType = 0}
          },
          ["17283864755168717"] = {
            key = "17283864755168717",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1979.9999999999998, y = 695},
            propsData = {}
          },
          ["172838661090410099"] = {
            key = "172838661090410099",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1119.5592459671932, y = 262.25935186199894},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Shali_1190095",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002320,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {
                {
                  OptionText = "510024031",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["172838661090410100"] = {
            key = "172838661090410100",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1390.828816674264, y = 282.155670820818},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002404,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {
                {
                  OptionText = "510024141",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["172838661090410101"] = {
            key = "172838661090410101",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1681.6368974823447, y = 278.7213273864745},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002415,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172839288288525135"] = {
            key = "172839288288525135",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1836.435025875446, y = 88.38289776605436},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002419,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1728456238923551212"] = {
            key = "1728456238923551212",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 998.1990768397675, y = 463.2495123733498},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Shali_51002320"
            }
          }
        },
        commentData = {}
      }
    },
    ["172838672257412659"] = {
      isStoryNode = true,
      key = "172838672257412659",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1973.789764623288, y = 223.27819059583052},
      propsData = {
        QuestId = 20020107,
        QuestDescriptionComment = "\229\146\140\232\142\142\232\142\137\228\186\164\232\176\136",
        QuestDescription = "Description_200201_6",
        QuestDeatil = "Content_200201_6",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "172839296321226620",
            startPort = "Option_1",
            endQuest = "172839296321226621",
            endPort = "In"
          },
          {
            startQuest = "172839296321226621",
            startPort = "Option_1",
            endQuest = "172839296321226622",
            endPort = "In"
          },
          {
            startQuest = "172839296321226622",
            startPort = "Out",
            endQuest = "172839296321226623",
            endPort = "In"
          },
          {
            startQuest = "172839296321226623",
            startPort = "Out",
            endQuest = "172838672257512665",
            endPort = "Success"
          },
          {
            startQuest = "172838672257512664",
            startPort = "QuestStart",
            endQuest = "1728459636288729313",
            endPort = "In"
          },
          {
            startQuest = "1728459636288729313",
            startPort = "Out",
            endQuest = "172839296321226620",
            endPort = "In"
          }
        },
        nodeData = {
          ["172838672257512664"] = {
            key = "172838672257512664",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172838672257512665"] = {
            key = "172838672257512665",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1979.9999999999998, y = 295},
            propsData = {ModeType = 0}
          },
          ["172838672257512666"] = {
            key = "172838672257512666",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1979.9999999999998, y = 695},
            propsData = {}
          },
          ["172839296321226620"] = {
            key = "172839296321226620",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1088.5196803756571, y = 284.4876419591624},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Shali_1190095",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {
                {
                  OptionText = "510024031",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["172839296321226621"] = {
            key = "172839296321226621",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1392.090387446364, y = 285.19471266623316},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002404,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {
                {
                  OptionText = "510024141",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = -1
                }
              },
              OverrideFailBlend = false
            }
          },
          ["172839296321226622"] = {
            key = "172839296321226622",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1681.5348318908086, y = 280.39673286825325},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002415,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172839296321226623"] = {
            key = "172839296321226623",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1837.53296028391, y = 90.0583032478331},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002425,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1728459636288729313"] = {
            key = "1728459636288729313",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1012.217782099221, y = 499.8462467547286},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Shali_51002320"
            }
          }
        },
        commentData = {}
      }
    },
    ["17512711273063271444"] = {
      isStoryNode = true,
      key = "17512711273063271444",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 1001.1138107604904, y = 128.40435547193158},
      propsData = {
        QuestId = 20020100,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Shali_1190095"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512711273063271450",
            startPort = "ApproveOut",
            endQuest = "17512711273063271449",
            endPort = "Success"
          },
          {
            startQuest = "17512711273063271450",
            startPort = "CancelOut",
            endQuest = "17512711273063271451",
            endPort = "Fail"
          },
          {
            startQuest = "17512711273063271448",
            startPort = "QuestStart",
            endQuest = "17512711273063271452",
            endPort = "In"
          },
          {
            startQuest = "17512711273063271452",
            startPort = "Out",
            endQuest = "17512711273063271450",
            endPort = "Input"
          }
        },
        nodeData = {
          ["17512711273063271448"] = {
            key = "17512711273063271448",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512711273063271449"] = {
            key = "17512711273063271449",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1763.5515873015877, y = 276.68650793650795},
            propsData = {ModeType = 0}
          },
          ["17512711273063271450"] = {
            key = "17512711273063271450",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1463.5515873015877, y = 276.68650793650795},
            propsData = {
              SideQuestChainId = 200201,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512711273063271451"] = {
            key = "17512711273063271451",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1646.762801762802, y = 476.231084981085},
            propsData = {}
          },
          ["17512711273063271452"] = {
            key = "17512711273063271452",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1139.2819785848328, y = 295.33663544423297},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Shali_1190095",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000101,
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
    }
  },
  commentData = {}
}
