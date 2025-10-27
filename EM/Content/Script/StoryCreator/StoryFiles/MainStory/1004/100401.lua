return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17490032984321",
      startPort = "StoryStart",
      endStory = "1749003505043193",
      endPort = "In"
    },
    {
      startStory = "1749003505043193",
      startPort = "Success",
      endStory = "1749004354639594656",
      endPort = "In"
    },
    {
      startStory = "1749004354639594656",
      startPort = "Success",
      endStory = "1749004380253595013",
      endPort = "In"
    },
    {
      startStory = "1749004380253595013",
      startPort = "Success",
      endStory = "1749007428715597153",
      endPort = "In"
    },
    {
      startStory = "17490193612571816",
      startPort = "Success",
      endStory = "17490194435873130",
      endPort = "In"
    },
    {
      startStory = "17490194435873130",
      startPort = "Success",
      endStory = "17490208954254265",
      endPort = "In"
    },
    {
      startStory = "17490208954254265",
      startPort = "Success",
      endStory = "17490331271491546",
      endPort = "In"
    },
    {
      startStory = "17490331271491546",
      startPort = "Success",
      endStory = "1749033341857603904",
      endPort = "In"
    },
    {
      startStory = "1749033341857603904",
      startPort = "Success",
      endStory = "1749033484153605159",
      endPort = "In"
    },
    {
      startStory = "1749033484153605159",
      startPort = "Success",
      endStory = "17490355695012409645",
      endPort = "In"
    },
    {
      startStory = "17490355695012409645",
      startPort = "Success",
      endStory = "17490362257102411475",
      endPort = "In"
    },
    {
      startStory = "17490362257102411475",
      startPort = "Success",
      endStory = "17490370804422415030",
      endPort = "In"
    },
    {
      startStory = "1749007428715597153",
      startPort = "Success",
      endStory = "17490193612571816",
      endPort = "In"
    },
    {
      startStory = "17490370804422415030",
      startPort = "Success",
      endStory = "17490032984325",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17490032984321"] = {
      isStoryNode = true,
      key = "17490032984321",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 858.7301587301586, y = 300.1190476190476},
      propsData = {QuestChainId = 100401},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17490032984325"] = {
      isStoryNode = true,
      key = "17490032984325",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2720.1299166306835, y = 902.0162487129242},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1749003505043193"] = {
      isStoryNode = true,
      key = "1749003505043193",
      type = "StoryNode",
      name = "\233\133\146\233\166\134\233\155\134\229\144\136",
      pos = {x = 1185.398778154213, y = 331.554457619675},
      propsData = {
        QuestId = 10040101,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "1749003505043194",
            startPort = "QuestStart",
            endQuest = "1749108830018917078",
            endPort = "In"
          },
          {
            startQuest = "1749108830018917078",
            startPort = "Out",
            endQuest = "1749108843746917339",
            endPort = "In"
          },
          {
            startQuest = "1749108843746917339",
            startPort = "Out",
            endQuest = "1749003505043201",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749003505043194"] = {
            key = "1749003505043194",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1749003505043201"] = {
            key = "1749003505043201",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1938.5714285714282, y = 321.42857142857144},
            propsData = {ModeType = 0}
          },
          ["1749003505043208"] = {
            key = "1749003505043208",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1749108830018917078"] = {
            key = "1749108830018917078",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1208.607142857143, y = 279.60714285714283},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1220167,
              GuideType = "M",
              GuidePointName = "Mechanism_chap03_1220167"
            }
          },
          ["1749108843746917339"] = {
            key = "1749108843746917339",
            type = "TalkNode",
            name = "\231\172\172\228\184\137\231\171\160\229\136\157\229\167\139\229\175\185\232\175\157",
            pos = {x = 1578.8806390977445, y = 294.1390977443609},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10040101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1749004354639594656"] = {
      isStoryNode = true,
      key = "1749004354639594656",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\232\189\166\231\171\153",
      pos = {x = 1533.6245934372535, y = 323.51794241564085},
      propsData = {
        QuestId = 10040102,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "1749004354639594657",
            startPort = "QuestStart",
            endQuest = "1749004751884595329",
            endPort = "In"
          },
          {
            startQuest = "1749004751884595329",
            startPort = "Out",
            endQuest = "1749005535775597003",
            endPort = "In"
          },
          {
            startQuest = "1749005391746596355",
            startPort = "Out",
            endQuest = "1749004354639594660",
            endPort = "Success"
          },
          {
            startQuest = "1749005535775597003",
            startPort = "Out",
            endQuest = "1749005391746596355",
            endPort = "In"
          }
        },
        nodeData = {
          ["1749004354639594657"] = {
            key = "1749004354639594657",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 852, y = 300},
            propsData = {ModeType = 0}
          },
          ["1749004354639594660"] = {
            key = "1749004354639594660",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2657.5862068965516, y = 374.06130268199234},
            propsData = {ModeType = 0}
          },
          ["1749004354639594663"] = {
            key = "1749004354639594663",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2664.4, y = 653.2},
            propsData = {}
          },
          ["1749004751884595329"] = {
            key = "1749004751884595329",
            type = "GoToNode",
            name = "\230\157\165\229\136\176\232\189\166\231\171\153",
            pos = {x = 1280, y = 330},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280122,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280122"
            }
          },
          ["1749005359894595824"] = {
            key = "1749005359894595824",
            type = "TalkNode",
            name = "\230\151\160\231\188\157\232\189\166\231\171\153\229\133\168\230\153\175",
            pos = {x = 1915.2156862745096, y = 171.12500000000003},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
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
          },
          ["1749005391746596355"] = {
            key = "1749005391746596355",
            type = "TalkNode",
            name = "\232\189\166\231\171\153\229\137\141\229\175\185\232\175\157",
            pos = {x = 2231.1643002028395, y = 345.10719517692144},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10040201,
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
          ["1749005535775597003"] = {
            key = "1749005535775597003",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1597.0220821464416, y = 331.65941690155677},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280123,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280123"
            }
          }
        },
        commentData = {}
      }
    },
    ["1749004380253595013"] = {
      isStoryNode = true,
      key = "1749004380253595013",
      type = "StoryNode",
      name = "\228\185\176\231\165\168\230\163\128\231\165\168",
      pos = {x = 1885.0997487167565, y = 342.4378872051508},
      propsData = {
        QuestId = 10040103,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "1749004380253595014",
            startPort = "QuestStart",
            endQuest = "1749007218067603",
            endPort = "In"
          },
          {
            startQuest = "1749007218067603",
            startPort = "Out",
            endQuest = "17490072562311380",
            endPort = "In"
          },
          {
            startQuest = "17490072562311380",
            startPort = "Out",
            endQuest = "17490072804181781",
            endPort = "In"
          },
          {
            startQuest = "17490072804181781",
            startPort = "Out",
            endQuest = "17490073032202133",
            endPort = "In"
          },
          {
            startQuest = "17490073032202133",
            startPort = "Out",
            endQuest = "1749004380253595017",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749004380253595014"] = {
            key = "1749004380253595014",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1749004380253595017"] = {
            key = "1749004380253595017",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2527.9395604395604, y = 373.84615384615387},
            propsData = {ModeType = 0}
          },
          ["1749004380253595020"] = {
            key = "1749004380253595020",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.0769230769229, y = 641.1538461538462},
            propsData = {}
          },
          ["1749007218067603"] = {
            key = "1749007218067603",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\148\174\231\165\168\231\170\151",
            pos = {x = 1156, y = 306},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280117,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280117"
            }
          },
          ["17490072562311380"] = {
            key = "17490072562311380",
            type = "TalkNode",
            name = "freesimple\228\185\176\231\165\168",
            pos = {x = 1447.837187748313, y = 319.4144980339353},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10040301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17490072804181781"] = {
            key = "17490072804181781",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\163\128\231\165\168\229\143\163",
            pos = {x = 1784.9800448911703, y = 336.2276848471221},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280118,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280118"
            }
          },
          ["17490073032202133"] = {
            key = "17490073032202133",
            type = "TalkNode",
            name = "\229\174\137\230\163\128\233\170\154\228\185\177",
            pos = {x = 2143.111913023039, y = 356.224250781188},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10040401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              EndNewTargetPointName = "BP_TalkEnd01",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
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
    ["1749007428715597153"] = {
      isStoryNode = true,
      key = "1749007428715597153",
      type = "StoryNode",
      name = "\229\135\134\229\164\135\230\189\156\229\133\165\233\128\154\233\163\142\229\143\163",
      pos = {x = 2153.953947368421, y = 342.55242272347544},
      propsData = {
        QuestId = 10040104,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "1749007428715597154",
            startPort = "QuestStart",
            endQuest = "1749007471440597646",
            endPort = "In"
          },
          {
            startQuest = "1749007471440597646",
            startPort = "Out",
            endQuest = "1749007489910597973",
            endPort = "In"
          },
          {
            startQuest = "17490075593751192437",
            startPort = "Out",
            endQuest = "1749007428715597157",
            endPort = "Success"
          },
          {
            startQuest = "1749007489910597973",
            startPort = "Out",
            endQuest = "17491111097956391649",
            endPort = "In"
          },
          {
            startQuest = "17491111097956391649",
            startPort = "Out",
            endQuest = "17490075593751192437",
            endPort = "In"
          }
        },
        nodeData = {
          ["1749007428715597154"] = {
            key = "1749007428715597154",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1749007428715597157"] = {
            key = "1749007428715597157",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2838.75, y = 331.25},
            propsData = {ModeType = 0}
          },
          ["1749007428715597160"] = {
            key = "1749007428715597160",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1749007471440597646"] = {
            key = "1749007471440597646",
            type = "GoToNode",
            name = "\229\184\131\231\189\174\230\156\186\229\133\179",
            pos = {x = 1266.75, y = 296.25},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280119,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280119"
            }
          },
          ["1749007489910597973"] = {
            key = "1749007489910597973",
            type = "GoToNode",
            name = "\230\159\165\231\156\139\233\128\154\233\163\142\229\143\163",
            pos = {x = 1740.625, y = 308.99999999999994},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280120,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280120"
            }
          },
          ["17490075593751192437"] = {
            key = "17490075593751192437",
            type = "GoToNode",
            name = "\230\137\147\229\188\128\233\128\154\233\163\142\229\143\163",
            pos = {x = 2388.125, y = 323.99999999999994},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280121,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2280121"
            }
          },
          ["17491111097956391649"] = {
            key = "17491111097956391649",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2058.128571428572, y = 331.80000000000007},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10040501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17490193612571816"] = {
      isStoryNode = true,
      key = "17490193612571816",
      type = "StoryNode",
      name = "\229\156\176\228\184\139\233\128\154\233\129\147\230\181\129\231\168\139",
      pos = {x = 1212.6093168527375, y = 644.1762645249489},
      propsData = {
        QuestId = 10040105,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490193865012408",
            startPort = "Out",
            endQuest = "17490193612581820",
            endPort = "Success"
          },
          {
            startQuest = "17490193612571817",
            startPort = "QuestStart",
            endQuest = "17491064805452279",
            endPort = "In"
          },
          {
            startQuest = "17491064805452279",
            startPort = "Out",
            endQuest = "17491064912572566",
            endPort = "In"
          },
          {
            startQuest = "17491064912572566",
            startPort = "Out",
            endQuest = "17491064914802582",
            endPort = "In"
          },
          {
            startQuest = "17491064914802582",
            startPort = "Out",
            endQuest = "17491064917382598",
            endPort = "In"
          },
          {
            startQuest = "17491064917382598",
            startPort = "Out",
            endQuest = "17491064919612606",
            endPort = "In"
          },
          {
            startQuest = "17491064919612606",
            startPort = "Out",
            endQuest = "17491064922212627",
            endPort = "In"
          },
          {
            startQuest = "17491064922212627",
            startPort = "Out",
            endQuest = "17491064924462645",
            endPort = "In"
          },
          {
            startQuest = "17491064924462645",
            startPort = "Out",
            endQuest = "17491064926492663",
            endPort = "In"
          },
          {
            startQuest = "17491064926492663",
            startPort = "Out",
            endQuest = "17490193865012408",
            endPort = "In"
          }
        },
        nodeData = {
          ["17490193612571817"] = {
            key = "17490193612571817",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -222.00000000000006, y = 313.20000000000005},
            propsData = {ModeType = 0}
          },
          ["17490193612581820"] = {
            key = "17490193612581820",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.25, y = 994.5},
            propsData = {ModeType = 0}
          },
          ["17490193612581823"] = {
            key = "17490193612581823",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490193865012408"] = {
            key = "17490193865012408",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\187\136\231\130\185",
            pos = {x = 1013.4857142857143, y = 973.7142857142857},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280125,
              GuideType = "M",
              GuidePointName = "Mechanism_EleStart_2280125"
            }
          },
          ["17491064805452279"] = {
            key = "17491064805452279",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 177.47857142857114, y = 356.8},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280127,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare01_2280127"
            }
          },
          ["17491064912572566"] = {
            key = "17491064912572566",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 468.67857142857116, y = 362.8},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280128,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare02_2280128"
            }
          },
          ["17491064914802582"] = {
            key = "17491064914802582",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 749.4785714285713, y = 378.2344827586207},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280129,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare03_2280129"
            }
          },
          ["17491064917382598"] = {
            key = "17491064917382598",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1000.278571428571, y = 390.4},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280130,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare04_2280130"
            }
          },
          ["17491064919612606"] = {
            key = "17491064919612606",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 192.51305418719184, y = 672.4000000000001},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280131,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare05_2280131"
            }
          },
          ["17491064922212627"] = {
            key = "17491064922212627",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 485.47857142857123, y = 679.5999999999998},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280132,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare06_2280132"
            }
          },
          ["17491064924462645"] = {
            key = "17491064924462645",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 733.8785714285714, y = 689.1999999999999},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280133,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare07_2280133"
            }
          },
          ["17491064926492663"] = {
            key = "17491064926492663",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1032.678571428571, y = 697.9310344827586},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280134,
              GuideType = "M",
              GuidePointName = "Mechanism_thoroughfare08_2280134"
            }
          }
        },
        commentData = {}
      }
    },
    ["17490194435873130"] = {
      isStoryNode = true,
      key = "17490194435873130",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\229\156\176\228\184\139\233\128\154\233\129\147",
      pos = {x = 1561.3593168527375, y = 658.819121667806},
      propsData = {
        QuestId = 10040106,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490194435873131",
            startPort = "QuestStart",
            endQuest = "17490194540683348",
            endPort = "In"
          },
          {
            startQuest = "17490194540683348",
            startPort = "Out",
            endQuest = "17490194435873134",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17490194435873131"] = {
            key = "17490194435873131",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 832.5, y = 467.5},
            propsData = {ModeType = 0}
          },
          ["17490194435873134"] = {
            key = "17490194435873134",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.1637931034484, y = 494.0948275862069},
            propsData = {ModeType = 0}
          },
          ["17490194435873137"] = {
            key = "17490194435873137",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490194540683348"] = {
            key = "17490194540683348",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\231\148\181\230\162\175",
            pos = {x = 1236, y = 480},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290001,
              GuideType = "M",
              GuidePointName = "Mechanism_EleEnd_2290001"
            }
          }
        },
        commentData = {}
      }
    },
    ["17490208954254265"] = {
      isStoryNode = true,
      key = "17490208954254265",
      type = "StoryNode",
      name = "\233\146\162\230\158\182\231\142\169\230\179\149\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 1909.765666059087, y = 658.4365819852663},
      propsData = {
        QuestId = 10040107,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490208954254266",
            startPort = "QuestStart",
            endQuest = "17490209204964734",
            endPort = "In"
          },
          {
            startQuest = "17490209204964734",
            startPort = "Out",
            endQuest = "17490209410524853",
            endPort = "In"
          },
          {
            startQuest = "17490209410524853",
            startPort = "Out",
            endQuest = "17490209413394864",
            endPort = "In"
          },
          {
            startQuest = "17490209413394864",
            startPort = "Out",
            endQuest = "17490209416674886",
            endPort = "In"
          },
          {
            startQuest = "17490209416674886",
            startPort = "Out",
            endQuest = "17490209420154897",
            endPort = "In"
          },
          {
            startQuest = "17490209420154897",
            startPort = "Out",
            endQuest = "17490212312851202676",
            endPort = "In"
          },
          {
            startQuest = "17490212312851202676",
            startPort = "Out",
            endQuest = "17490208954264269",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17490208954254266"] = {
            key = "17490208954254266",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 925.2173913043479, y = 352.17391304347825},
            propsData = {ModeType = 0}
          },
          ["17490208954264269"] = {
            key = "17490208954264269",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3138.4130434782605, y = 372.195652173913},
            propsData = {ModeType = 0}
          },
          ["17490208954264272"] = {
            key = "17490208954264272",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490209204964734"] = {
            key = "17490209204964734",
            type = "GoToNode",
            name = "\229\137\141\229\190\12801",
            pos = {x = 1276, y = 360},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290002,
              GuideType = "M",
              GuidePointName = "Mechanism_Steel01_2290002"
            }
          },
          ["17490209410524853"] = {
            key = "17490209410524853",
            type = "GoToNode",
            name = "\229\137\141\229\190\12802",
            pos = {x = 1536, y = 352},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290007,
              GuideType = "M",
              GuidePointName = "Mechanism_Steel02_2290007"
            }
          },
          ["17490209413394864"] = {
            key = "17490209413394864",
            type = "GoToNode",
            name = "\229\137\141\229\190\12803",
            pos = {x = 1844.695652173913, y = 365.1304347826087},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290004,
              GuideType = "M",
              GuidePointName = "Mechanism_Steel03_2290004"
            }
          },
          ["17490209416674886"] = {
            key = "17490209416674886",
            type = "GoToNode",
            name = "\229\137\141\229\190\12804",
            pos = {x = 2092.086956521739, y = 369.5652173913044},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290005,
              GuideType = "M",
              GuidePointName = "Mechanism_Steel04_2290005"
            }
          },
          ["17490209420154897"] = {
            key = "17490209420154897",
            type = "GoToNode",
            name = "\229\137\141\229\190\12805",
            pos = {x = 2389.304347826087, y = 354.69565217391306},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290006,
              GuideType = "M",
              GuidePointName = "Mechanism_SteelEnd_2290006"
            }
          },
          ["17490212312851202676"] = {
            key = "17490212312851202676",
            type = "TalkNode",
            name = "\232\191\155\229\133\165\229\164\167\229\142\133",
            pos = {x = 2740.1825611459476, y = 363.75140420220526},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10040601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17490331271491546"] = {
      isStoryNode = true,
      key = "17490331271491546",
      type = "StoryNode",
      name = "\230\137\147\229\144\172\229\173\144\228\187\187\229\138\161",
      pos = {x = 2223.2629870129867, y = 665.6483253588517},
      propsData = {
        QuestId = 10040108,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490331271491547",
            startPort = "QuestStart",
            endQuest = "17490331399431849",
            endPort = "In"
          },
          {
            startQuest = "17490331271491547",
            startPort = "QuestStart",
            endQuest = "17490332202632203",
            endPort = "In"
          },
          {
            startQuest = "17490332202632203",
            startPort = "Out",
            endQuest = "17490332509502657",
            endPort = "In"
          },
          {
            startQuest = "17490332202632203",
            startPort = "Out",
            endQuest = "17490332330942376",
            endPort = "In"
          },
          {
            startQuest = "17490332202632203",
            startPort = "Out",
            endQuest = "17490332505422635",
            endPort = "In"
          },
          {
            startQuest = "17490332509502657",
            startPort = "Out",
            endQuest = "17490332723873292",
            endPort = "Branch_1"
          },
          {
            startQuest = "17490332330942376",
            startPort = "Out",
            endQuest = "17490332723873292",
            endPort = "Branch_2"
          },
          {
            startQuest = "17490332505422635",
            startPort = "Out",
            endQuest = "17490332723873292",
            endPort = "Branch_3"
          },
          {
            startQuest = "17490332723873292",
            startPort = "Out",
            endQuest = "17490332832603617",
            endPort = "In"
          },
          {
            startQuest = "17490332832603617",
            startPort = "Out",
            endQuest = "17490331271491550",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17490331271491547"] = {
            key = "17490331271491547",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17490331271491550"] = {
            key = "17490331271491550",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3119.5, y = 421.5},
            propsData = {ModeType = 0}
          },
          ["17490331271491553"] = {
            key = "17490331271491553",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3149.5, y = 745},
            propsData = {}
          },
          ["17490331399431849"] = {
            key = "17490331399431849",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1328, y = 178},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2290008,
                2290010,
                2290009
              }
            }
          },
          ["17490332202632203"] = {
            key = "17490332202632203",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 1310, y = 418},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = true,
              IsDifftation = false
            }
          },
          ["17490332330942376"] = {
            key = "17490332330942376",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1844, y = 444},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100408,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10040801,
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
          ["17490332505422635"] = {
            key = "17490332505422635",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1840, y = 692},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100407,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10040901,
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
          ["17490332509502657"] = {
            key = "17490332509502657",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1851.032258064516, y = 190},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100406,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10040701,
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
          ["17490332723873292"] = {
            key = "17490332723873292",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 2296.5, y = 435.5},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["17490332832603617"] = {
            key = "17490332832603617",
            type = "TalkNode",
            name = "\229\184\140\229\176\148\229\166\178\229\135\186\229\156\186",
            pos = {x = 2656.5, y = 482},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10041001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1749033341857603904"] = {
      isStoryNode = true,
      key = "1749033341857603904",
      type = "StoryNode",
      name = "\229\184\140\229\176\148\229\166\178\229\175\185\232\175\157",
      pos = {x = 1224.7765512265507, y = 862.2496240601505},
      propsData = {
        QuestId = 10040109,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "1749033341857603905",
            startPort = "QuestStart",
            endQuest = "1749033353167604271",
            endPort = "In"
          },
          {
            startQuest = "1749033353167604271",
            startPort = "Out",
            endQuest = "1749033383606604573",
            endPort = "In"
          },
          {
            startQuest = "1749033383606604573",
            startPort = "Out",
            endQuest = "1749033341858603908",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749033341857603905"] = {
            key = "1749033341857603905",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 686.6666666666666, y = 581.6666666666667},
            propsData = {ModeType = 0}
          },
          ["1749033341858603908"] = {
            key = "1749033341858603908",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2019.25, y = 565},
            propsData = {ModeType = 0}
          },
          ["1749033341858603911"] = {
            key = "1749033341858603911",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2074, y = 860},
            propsData = {}
          },
          ["1749033353167604271"] = {
            key = "1749033353167604271",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1061.6666666666667, y = 583},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290011,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2290011"
            }
          },
          ["1749033383606604573"] = {
            key = "1749033383606604573",
            type = "TalkNode",
            name = "\229\184\140\229\176\148\229\166\178\229\175\185\232\175\157",
            pos = {x = 1481, y = 602.6666666666667},
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
          }
        },
        commentData = {}
      }
    },
    ["1749033484153605159"] = {
      isStoryNode = true,
      key = "1749033484153605159",
      type = "StoryNode",
      name = "\232\176\131\230\159\165\231\174\161\231\144\134\229\174\164",
      pos = {x = 1562.0130591630584, y = 885.4448621553886},
      propsData = {
        QuestId = 10040110,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "1749033484153605160",
            startPort = "QuestStart",
            endQuest = "17490337238941205246",
            endPort = "In"
          },
          {
            startQuest = "17490337238941205246",
            startPort = "Out",
            endQuest = "17490339963691205679",
            endPort = "In"
          },
          {
            startQuest = "17490337238941205246",
            startPort = "Out",
            endQuest = "17490340166861206001",
            endPort = "In"
          },
          {
            startQuest = "17490340166861206001",
            startPort = "Out",
            endQuest = "17490340336811206227",
            endPort = "In"
          },
          {
            startQuest = "17490340166861206001",
            startPort = "Out",
            endQuest = "17490340461661206480",
            endPort = "In"
          },
          {
            startQuest = "17490340166861206001",
            startPort = "Out",
            endQuest = "17490340463971206485",
            endPort = "In"
          },
          {
            startQuest = "17490337238941205246",
            startPort = "Out",
            endQuest = "17490342387021207073",
            endPort = "In"
          },
          {
            startQuest = "17490340336811206227",
            startPort = "Out",
            endQuest = "17490342541671207396",
            endPort = "Branch_1"
          },
          {
            startQuest = "17490340461661206480",
            startPort = "Out",
            endQuest = "17490342541671207396",
            endPort = "Branch_2"
          },
          {
            startQuest = "17490340463971206485",
            startPort = "Out",
            endQuest = "17490342541671207396",
            endPort = "Branch_3"
          },
          {
            startQuest = "17490342541671207396",
            startPort = "Out",
            endQuest = "17490342657501207773",
            endPort = "In"
          },
          {
            startQuest = "17490342541671207396",
            startPort = "Out",
            endQuest = "17490342717381207989",
            endPort = "In"
          },
          {
            startQuest = "17490342717381207989",
            startPort = "Out",
            endQuest = "1749033484153605163",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749033484153605160"] = {
            key = "1749033484153605160",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1083.5, y = 306},
            propsData = {ModeType = 0}
          },
          ["1749033484153605163"] = {
            key = "1749033484153605163",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3197.777777777778, y = 365.55555555555543},
            propsData = {ModeType = 0}
          },
          ["1749033484153605166"] = {
            key = "1749033484153605166",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2898.8888888888887, y = 828.8888888888889},
            propsData = {}
          },
          ["17490337238941205246"] = {
            key = "17490337238941205246",
            type = "GoToNode",
            name = "\232\191\155\229\133\165\231\174\161\231\144\134\229\174\164",
            pos = {x = 1424.8571428571427, y = 311},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290012,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_2290012"
            }
          },
          ["17490339963691205679"] = {
            key = "17490339963691205679",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1686.250939849624, y = 48.40612986085105},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2290016,
                2290015,
                2290014
              }
            }
          },
          ["17490340166861206001"] = {
            key = "17490340166861206001",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 1745.4731620718464, y = 329.1839076386289},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = true,
              IsDifftation = false
            }
          },
          ["17490340336811206227"] = {
            key = "17490340336811206227",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2146.5842731829575, y = 173.6283520830733},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10040101,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17490340461661206480"] = {
            key = "17490340461661206480",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2134.3620509607354, y = 350.29501874973994},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10040102,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17490340463971206485"] = {
            key = "17490340463971206485",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2125.4731620718467, y = 564.7394631941844},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10040103,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17490342387021207073"] = {
            key = "17490342387021207073",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1705.4731620718462, y = 549.1839076386289},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_GuanLiShiDiaoCha"
            }
          },
          ["17490342541671207396"] = {
            key = "17490342541671207396",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 2533.250939849624, y = 346.9616854164066},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["17490342657501207773"] = {
            key = "17490342657501207773",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2794.3620509607354, y = 583.6283520830733},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_GuanLiShiDiaoCha"
            }
          },
          ["17490342717381207989"] = {
            key = "17490342717381207989",
            type = "TalkNode",
            name = "\232\135\170\229\138\168\229\185\191\230\146\173",
            pos = {x = 2831.028717627402, y = 371.406129860851},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17490355695012409645"] = {
      isStoryNode = true,
      key = "17490355695012409645",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\232\189\166\231\171\153\229\164\167\229\142\133",
      pos = {x = 1880.7717893217891, y = 894.7908939014204},
      propsData = {
        QuestId = 10040111,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490355695012409646",
            startPort = "QuestStart",
            endQuest = "17490359886512410455",
            endPort = "In"
          },
          {
            startQuest = "17490359886512410455",
            startPort = "Out",
            endQuest = "17490360435422410799",
            endPort = "In"
          },
          {
            startQuest = "17490360435422410799",
            startPort = "Out",
            endQuest = "17490355695012409649",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17490355695012409646"] = {
            key = "17490355695012409646",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 850, y = 348},
            propsData = {ModeType = 0}
          },
          ["17490355695012409649"] = {
            key = "17490355695012409649",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2234.090909090909, y = 324.54545454545456},
            propsData = {ModeType = 0}
          },
          ["17490355695012409652"] = {
            key = "17490355695012409652",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490359886512410455"] = {
            key = "17490359886512410455",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1292, y = 364},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290017,
              GuideType = "M",
              GuidePointName = "Mechanism_LeaveSation_2290017"
            }
          },
          ["17490360435422410799"] = {
            key = "17490360435422410799",
            type = "TalkNode",
            name = "\229\184\140\229\176\148\229\166\178\229\134\141\230\172\161\229\135\186\229\156\186",
            pos = {x = 1663.9959893048126, y = 368.40441176470586},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17490362257102411475"] = {
      isStoryNode = true,
      key = "17490362257102411475",
      type = "StoryNode",
      name = "\233\128\131\231\166\187\231\142\169\230\179\149\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 2155.930519480519, y = 896.0210526315793},
      propsData = {
        QuestId = 10040112,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490362257102411476",
            startPort = "QuestStart",
            endQuest = "17490362405502411915",
            endPort = "In"
          },
          {
            startQuest = "17490362405502411915",
            startPort = "Out",
            endQuest = "17490362257102411479",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17490362257102411476"] = {
            key = "17490362257102411476",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 895.1724137931035, y = 298.9655172413793},
            propsData = {ModeType = 0}
          },
          ["17490362257102411479"] = {
            key = "17490362257102411479",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1895.0173335791999, y = 377.7549326940808},
            propsData = {ModeType = 0}
          },
          ["17490362257102411482"] = {
            key = "17490362257102411482",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490362405502411915"] = {
            key = "17490362405502411915",
            type = "GoToNode",
            name = "\229\188\128\229\167\139\233\128\131\231\166\187",
            pos = {x = 1286, y = 309},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2280126,
              GuideType = "M",
              GuidePointName = "Mechanism_LeaveStart_2280126"
            }
          }
        },
        commentData = {}
      }
    },
    ["17490370804422415030"] = {
      isStoryNode = true,
      key = "17490370804422415030",
      type = "StoryNode",
      name = "\232\138\153\231\189\151\230\139\137\229\135\186\229\156\186\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 2441.0098845598836, y = 890.6639097744363},
      propsData = {
        QuestId = 10040113,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
            startQuest = "17490370814832415103",
            startPort = "Out",
            endQuest = "17490370814832415104",
            endPort = "In"
          },
          {
            startQuest = "17490370814832415104",
            startPort = "Out",
            endQuest = "17490370814832415105",
            endPort = "In"
          },
          {
            startQuest = "17490370814832415105",
            startPort = "Out",
            endQuest = "17490370814832415106",
            endPort = "In"
          },
          {
            startQuest = "17490370804422415031",
            startPort = "QuestStart",
            endQuest = "17490370814832415103",
            endPort = "In"
          },
          {
            startQuest = "17490370814832415106",
            startPort = "Out",
            endQuest = "17490370804422415034",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17490370804422415031"] = {
            key = "17490370804422415031",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17490370804422415034"] = {
            key = "17490370804422415034",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17490370804422415037"] = {
            key = "17490370804422415037",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490370814832415103"] = {
            key = "17490370814832415103",
            type = "GoToNode",
            name = "\231\187\147\230\157\159\233\128\131\231\166\187",
            pos = {x = 1445.8731267273347, y = 490.15501892956917},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2290018,
              GuideType = "M",
              GuidePointName = "Mechanism_LeaveEnd_2290018"
            }
          },
          ["17490370814832415104"] = {
            key = "17490370814832415104",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1750.0159287449292, y = 507.9304383417951},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2290019}
            }
          },
          ["17490370814832415105"] = {
            key = "17490370814832415105",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2117.976948235184, y = 510.22429141525834},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {2290019}
            }
          },
          ["17490370814832415106"] = {
            key = "17490370814832415106",
            type = "TalkNode",
            name = "\232\138\153\231\189\151\230\139\137\229\135\186\229\156\186",
            pos = {x = 2530.1268732726653, y = 513.8449810704308},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              EndNewTargetPointName = "BP_100401End",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
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
    }
  },
  commentData = {}
}
