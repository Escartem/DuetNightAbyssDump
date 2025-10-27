return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17258481248851675",
      startPort = "Success",
      endStory = "1725848042063974",
      endPort = "In"
    },
    {
      startStory = "1725848042063974",
      startPort = "Success",
      endStory = "17258483154674514",
      endPort = "In"
    },
    {
      startStory = "17258483154674514",
      startPort = "Success",
      endStory = "172561443346016",
      endPort = "StoryEnd"
    },
    {
      startStory = "172561443346013",
      startPort = "StoryStart",
      endStory = "172586474608819173",
      endPort = "In"
    },
    {
      startStory = "172586474608819173",
      startPort = "Success",
      endStory = "172586479670420169",
      endPort = "In"
    },
    {
      startStory = "172586479670420169",
      startPort = "Success",
      endStory = "17258481248851675",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["172561443346013"] = {
      isStoryNode = true,
      key = "172561443346013",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 617.9310344827587, y = 283.2709359605911},
      propsData = {QuestChainId = 200221},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172561443346016"] = {
      isStoryNode = true,
      key = "172561443346016",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1365.2758620689656, y = 535.551724137931},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1725848042063974"] = {
      isStoryNode = true,
      key = "1725848042063974",
      type = "StoryNode",
      name = "\232\128\131\229\143\164\227\128\129\229\134\176\230\185\150\229\159\142\229\162\153\228\184\138\233\155\170\232\142\137\227\128\129\229\141\176\232\177\161",
      pos = {x = 1578.1891656072783, y = 273.32961291582},
      propsData = {
        QuestId = 20022103,
        QuestDescriptionComment = "\232\128\131\229\143\164\227\128\129\229\134\176\230\185\150\229\159\142\229\162\153\228\184\138\233\155\170\232\142\137\227\128\129\229\141\176\232\177\161",
        QuestDescription = "Description_200221_3",
        QuestDeatil = "Content_200221_3",
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
            startQuest = "1725848042063975",
            startPort = "QuestStart",
            endQuest = "172586295995013904",
            endPort = "In"
          },
          {
            startQuest = "172586298492514673",
            startPort = "Out",
            endQuest = "1725848042064982",
            endPort = "Success"
          },
          {
            startQuest = "172586600166126039",
            startPort = "Out",
            endQuest = "172586298492514673",
            endPort = "In"
          },
          {
            startQuest = "172586295995013904",
            startPort = "Out",
            endQuest = "172586600166126039",
            endPort = "In"
          }
        },
        nodeData = {
          ["1725848042063975"] = {
            key = "1725848042063975",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1725848042064982"] = {
            key = "1725848042064982",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1306.0000000000002, y = 514},
            propsData = {ModeType = 0}
          },
          ["1725848042064989"] = {
            key = "1725848042064989",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172586295995013904"] = {
            key = "172586295995013904",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1054.1500707951927, y = 303.2658724009886},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Xueli_510076"
            }
          },
          ["172586298492514673"] = {
            key = "172586298492514673",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1634.0636127396247, y = 294.1642047845629},
            propsData = {
              ImpressionTalkTriggerId = 510076,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_1190781",
              GuideStaticCreatorId = 700173
            }
          },
          ["172586600166126039"] = {
            key = "172586600166126039",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1364.9598316618803, y = 305.4801885429109},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\229\159\142\229\162\153\228\184\138\233\155\170\232\142\137",
              StaticCreatorIdList = {1190781}
            }
          }
        },
        commentData = {}
      }
    },
    ["17258481248851675"] = {
      isStoryNode = true,
      key = "17258481248851675",
      type = "StoryNode",
      name = "\232\128\131\229\143\164\227\128\129\229\134\176\230\185\150\229\159\142\228\184\139\230\176\180\233\129\147\233\155\170\232\142\137\227\128\129\230\153\174\233\128\154\229\175\185\232\175\157\239\188\137",
      pos = {x = 1339.315154069814, y = 275.12918188133733},
      propsData = {
        QuestId = 20022102,
        QuestDescriptionComment = "\232\128\131\229\143\164\227\128\129\229\134\176\230\185\150\229\159\142\228\184\139\230\176\180\233\129\147\233\155\170\232\142\137\227\128\129\230\153\174\233\128\154\229\175\185\232\175\157\239\188\137",
        QuestDescription = "Description_200221_2",
        QuestDeatil = "Content_200221_2",
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
            startQuest = "17258481248851679",
            startPort = "QuestStart",
            endQuest = "172586226252011391",
            endPort = "In"
          },
          {
            startQuest = "172586226252011391",
            startPort = "Out",
            endQuest = "17259763631341157418",
            endPort = "In"
          },
          {
            startQuest = "17259763631341157418",
            startPort = "Out",
            endQuest = "172586226251911390",
            endPort = "In"
          },
          {
            startQuest = "172586226251911390",
            startPort = "Out",
            endQuest = "17259764242241159560",
            endPort = "In"
          },
          {
            startQuest = "17259764242241159560",
            startPort = "Out",
            endQuest = "17258481248851680",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17258481248851679"] = {
            key = "17258481248851679",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17258481248851680"] = {
            key = "17258481248851680",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.881977671449, y = 332.12918660287113},
            propsData = {ModeType = 0}
          },
          ["17258481248851681"] = {
            key = "17258481248851681",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172586226251911390"] = {
            key = "172586226251911390",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1553.998502272065, y = 139.80315334797595},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700172,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1720184",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007317,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = false,
              HideAllBattleEntity = false,
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
          ["172586226252011391"] = {
            key = "172586226252011391",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1063.23965331451, y = 311.1989470608128},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101701,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_51007317"
            }
          },
          ["17259763631341157418"] = {
            key = "17259763631341157418",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1275.8021673816268, y = 146.7669629858473},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\228\184\139\230\176\180\233\129\147\233\155\170\232\142\137",
              StaticCreatorIdList = {1720184}
            }
          },
          ["17259764242241159560"] = {
            key = "17259764242241159560",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1387.6499016906619, y = 337.49592442688305},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\228\184\139\230\176\180\233\129\147\233\155\170\232\142\137",
              StaticCreatorIdList = {1720184}
            }
          }
        },
        commentData = {}
      }
    },
    ["17258483154674514"] = {
      isStoryNode = true,
      key = "17258483154674514",
      type = "StoryNode",
      name = "\232\128\131\229\143\164\227\128\129\229\134\176\230\185\150\229\159\142\233\151\168\229\143\163\233\155\170\232\142\137\227\128\129\230\153\174\233\128\154\229\175\185\232\175\157\239\188\137",
      pos = {x = 1127.9652515902603, y = 528.7805757460932},
      propsData = {
        QuestId = 20022104,
        QuestDescriptionComment = "\232\128\131\229\143\164\227\128\129\229\134\176\230\185\150\229\159\142\233\151\168\229\143\163\233\155\170\232\142\137\227\128\129\230\153\174\233\128\154\229\175\185\232\175\157\239\188\137",
        QuestDescription = "Description_200221_4",
        QuestDeatil = "Content_200221_4",
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
            startQuest = "17258483154674518",
            startPort = "QuestStart",
            endQuest = "172586306817415334",
            endPort = "In"
          },
          {
            startQuest = "172586603522227098",
            startPort = "Out",
            endQuest = "172586603539127102",
            endPort = "In"
          },
          {
            startQuest = "172586603539127102",
            startPort = "Out",
            endQuest = "172586306817415333",
            endPort = "In"
          },
          {
            startQuest = "172586306817415333",
            startPort = "Out",
            endQuest = "172586606208127830",
            endPort = "In"
          },
          {
            startQuest = "172586606208127830",
            startPort = "Out",
            endQuest = "17258483154674519",
            endPort = "Success"
          },
          {
            startQuest = "172586306817415334",
            startPort = "Out",
            endQuest = "172586603522227098",
            endPort = "In"
          }
        },
        nodeData = {
          ["17258483154674518"] = {
            key = "17258483154674518",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17258483154674519"] = {
            key = "17258483154674519",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1820.6024667931702, y = 512.0683111954457},
            propsData = {ModeType = 0}
          },
          ["17258483154674520"] = {
            key = "17258483154674520",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172586306817415333"] = {
            key = "172586306817415333",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1821.1904925962162, y = 297.38858500743964},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700174,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1190780",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007345,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = false,
              HideAllBattleEntity = false,
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
          ["172586306817415334"] = {
            key = "172586306817415334",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1057.4773737998412, y = 307.261774096547},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Xueli70007703"
            }
          },
          ["172586603522227098"] = {
            key = "172586603522227098",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1307.6054329207843, y = 311.73805207426886},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\229\159\142\229\162\153\228\184\138\233\155\170\232\142\137",
              StaticCreatorIdList = {1190781}
            }
          },
          ["172586603539127102"] = {
            key = "172586603539127102",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1566.1098317477638, y = 322.50051541737736},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\229\159\142\233\151\168\229\143\163\233\155\170\232\142\137",
              StaticCreatorIdList = {1190780}
            }
          },
          ["172586606208127830"] = {
            key = "172586606208127830",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1535.9581397428249, y = 511.53368990418085},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\229\159\142\233\151\168\229\143\163\233\155\170\232\142\137",
              StaticCreatorIdList = {1190780}
            }
          }
        },
        commentData = {}
      }
    },
    ["172586474608819173"] = {
      isStoryNode = true,
      key = "172586474608819173",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\233\133\146\233\166\134",
      pos = {x = 857.5429242908141, y = 270.18942497710486},
      propsData = {
        QuestId = 20022105,
        QuestDescriptionComment = "\232\191\155\229\133\165\233\133\146\233\166\134",
        QuestDescription = "Description_200221_5",
        QuestDeatil = "Content_200221_5",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "172586474608819177",
            startPort = "QuestStart",
            endQuest = "172586474608819180",
            endPort = "In"
          },
          {
            startQuest = "172586474608819180",
            startPort = "Out",
            endQuest = "172586474608819178",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172586474608819177"] = {
            key = "172586474608819177",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1001.2608695652175, y = 163.8478260869565},
            propsData = {ModeType = 0}
          },
          ["172586474608819178"] = {
            key = "172586474608819178",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1508.4930074133438, y = 164.6227318263784},
            propsData = {ModeType = 0}
          },
          ["172586474608819179"] = {
            key = "172586474608819179",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1769.8012422360248, y = 301.59627329192546},
            propsData = {}
          },
          ["172586474608819180"] = {
            key = "172586474608819180",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\229\142\187\233\133\146\233\166\134",
            pos = {x = 1257.7859913069312, y = 164.71827934072147},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Npc_Xueli_1220096"
            }
          }
        },
        commentData = {}
      }
    },
    ["172586479670420169"] = {
      isStoryNode = true,
      key = "172586479670420169",
      type = "StoryNode",
      name = "\232\128\131\229\143\164\227\128\129\233\155\170\232\142\137\230\142\165\228\187\187\229\138\161\227\128\129\229\141\176\232\177\161",
      pos = {x = 1094.919547667437, y = 273.61799640567614},
      propsData = {
        QuestId = 20022101,
        QuestDescriptionComment = "\232\128\131\229\143\164\227\128\129\233\155\170\232\142\137\230\142\165\228\187\187\229\138\161\227\128\129\229\141\176\232\177\161",
        QuestDescription = "Description_200221_1",
        QuestDeatil = "Content_200221_1",
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
            startQuest = "172586479670420176",
            startPort = "Out",
            endQuest = "172586479670420174",
            endPort = "Success"
          },
          {
            startQuest = "172586479670420173",
            startPort = "QuestStart",
            endQuest = "172586479670420176",
            endPort = "In"
          }
        },
        nodeData = {
          ["172586479670420173"] = {
            key = "172586479670420173",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172586479670420174"] = {
            key = "172586479670420174",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1404.8739495798318, y = 300.9579831932773},
            propsData = {ModeType = 0}
          },
          ["172586479670420175"] = {
            key = "172586479670420175",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1370.5882352941176, y = 643.5294117647059},
            propsData = {}
          },
          ["172586479670420176"] = {
            key = "172586479670420176",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1100.8574908911032, y = 322.2151690287173},
            propsData = {
              ImpressionTalkTriggerId = 510075,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Xueli_1220096",
              GuideStaticCreatorId = 700077
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
