return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979302206190",
      startPort = "StoryStart",
      endStory = "1722421087595163730",
      endPort = "In"
    },
    {
      startStory = "17309502252793496288",
      startPort = "Success",
      endStory = "1722421087597163736",
      endPort = "In"
    },
    {
      startStory = "1722421087595163730",
      startPort = "Success",
      endStory = "17309502252793496288",
      endPort = "In"
    },
    {
      startStory = "1722421087597163736",
      startPort = "Success",
      endStory = "1742889664571796646",
      endPort = "In"
    },
    {
      startStory = "1742889664571796646",
      startPort = "Success",
      endStory = "1704175979302206191",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175979302206190"] = {
      isStoryNode = true,
      key = "1704175979302206190",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 54.78947368421046, y = -115.77272727272731},
      propsData = {QuestChainId = 110107},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979302206191"] = {
      isStoryNode = true,
      key = "1704175979302206191",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1692.248189413693, y = -110.19207540636616},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722421087595163730"] = {
      isStoryNode = true,
      key = "1722421087595163730",
      type = "StoryNode",
      name = "BOSS\230\136\152",
      pos = {x = 385.49287121325085, y = -121.42743977134064},
      propsData = {
        QuestId = 11010702,
        QuestDescriptionComment = "\229\136\176\232\190\190\228\184\173\230\142\167\229\174\164",
        QuestDescription = "Description_110110_6",
        QuestDeatil = "Content_110110_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102102,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Elevator_Escape",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17229277688621218620",
            startPort = "Success",
            endQuest = "1722421087648163847",
            endPort = "Success"
          },
          {
            startQuest = "17229280017891222476",
            startPort = "Out",
            endQuest = "1722421087649163848",
            endPort = "Fail"
          },
          {
            startQuest = "17229277688621218620",
            startPort = "Fail",
            endQuest = "17284432663408110999",
            endPort = "In"
          },
          {
            startQuest = "17284432663408110999",
            startPort = "Out",
            endQuest = "17229280017891222476",
            endPort = "In"
          },
          {
            startQuest = "173165885057324582097",
            startPort = "Out",
            endQuest = "173165885057324582098",
            endPort = "In"
          },
          {
            startQuest = "173165885057324582098",
            startPort = "Out",
            endQuest = "17229278621251220010",
            endPort = "In"
          },
          {
            startQuest = "17229278621251220010",
            startPort = "Out",
            endQuest = "17229277688621218620",
            endPort = "In"
          },
          {
            startQuest = "1722421087648163846",
            startPort = "QuestStart",
            endQuest = "172854286752423290978",
            endPort = "In"
          },
          {
            startQuest = "1722421087648163846",
            startPort = "QuestStart",
            endQuest = "173165885057324582097",
            endPort = "In"
          },
          {
            startQuest = "17229277688621218620",
            startPort = "PassiveFail",
            endQuest = "17284432663408110999",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722421087648163846"] = {
            key = "1722421087648163846",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1505.0694434994923, y = 393.4484382340773},
            propsData = {ModeType = 0}
          },
          ["1722421087648163847"] = {
            key = "1722421087648163847",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 604.3820243671248, y = 406.47298494695514},
            propsData = {ModeType = 0}
          },
          ["1722421087649163848"] = {
            key = "1722421087649163848",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 606.6051971745079, y = 554.4809321495978},
            propsData = {}
          },
          ["17229277688621218620"] = {
            key = "17229277688621218620",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -212.16315613499125, y = 405.35227744033705},
            propsData = {SpecialConfigId = 1006, BlackScreenImmediately = false}
          },
          ["17229278621251220010"] = {
            key = "17229278621251220010",
            type = "GoToNode",
            name = "GOTO - BOSS\229\135\186\229\156\186",
            pos = {x = -684.6208390368475, y = 400.178619726253},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011005,
              GuideType = "M",
              GuidePointName = "questpoint1111011005"
            }
          },
          ["17229280017891222476"] = {
            key = "17229280017891222476",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 366.59744992561525, y = 537.1568228948822},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_Elevator_Escape",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17284432663408110999"] = {
            key = "17284432663408110999",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 130.77471041265704, y = 530.0664131337537},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["172854286752423290978"] = {
            key = "172854286752423290978",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -1153.1582150215866, y = -63.15243320804109},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0057_scene_ex01_prepare.0057_scene_ex01_prepare'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["173165885057324582097"] = {
            key = "173165885057324582097",
            type = "SwitchMechanismStateNode",
            name = "\230\156\186\229\133\179\230\142\167\229\136\182 - \230\137\147\229\188\128\229\137\141\229\190\128\228\184\173\230\142\167\229\174\164\231\154\132\233\151\168",
            pos = {x = -1216.522875674858, y = 390.2574168520943},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650019},
              StateId = 104011,
              QuestId = 0
            }
          },
          ["173165885057324582098"] = {
            key = "173165885057324582098",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = -962.5700395892251, y = 395.97194331302444},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1650069}
            }
          }
        },
        commentData = {}
      }
    },
    ["1722421087597163736"] = {
      isStoryNode = true,
      key = "1722421087597163736",
      type = "StoryNode",
      name = "\228\184\173\230\142\167\229\174\164\229\144\142\231\187\173\229\137\167\230\131\133",
      pos = {x = 1032.743958659306, y = -136.09490611598827},
      propsData = {
        QuestId = 11010704,
        QuestDescriptionComment = "\232\176\131\230\159\165\228\184\173\230\142\167\229\174\164\231\154\132\231\186\191\231\180\162",
        QuestDescription = "Description_110111_1",
        QuestDeatil = "Content_110111_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = false,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 102102,
        StoryGuideType = "Point",
        StoryGuidePointName = "questpoint1111011006"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17272521340302785298",
            startPort = "Out",
            endQuest = "17272521340302785297",
            endPort = "In"
          },
          {
            startQuest = "17272521340302785297",
            startPort = "Out",
            endQuest = "17272521340302785296",
            endPort = "In"
          },
          {
            startQuest = "1722421087772164116",
            startPort = "Out",
            endQuest = "17272521340302785298",
            endPort = "In"
          },
          {
            startQuest = "1722421087772164116",
            startPort = "Out",
            endQuest = "17283943979645526499",
            endPort = "In"
          },
          {
            startQuest = "17272521340302785298",
            startPort = "Out",
            endQuest = "17283944915565714945",
            endPort = "In"
          },
          {
            startQuest = "1722421087770164111",
            startPort = "QuestStart",
            endQuest = "17283943587925525985",
            endPort = "In"
          },
          {
            startQuest = "1722421087770164111",
            startPort = "QuestStart",
            endQuest = "1723186893100672821",
            endPort = "In"
          },
          {
            startQuest = "17272521340302785296",
            startPort = "Out",
            endQuest = "173165865887123772183",
            endPort = "In"
          },
          {
            startQuest = "1722421087770164111",
            startPort = "QuestStart",
            endQuest = "17477241276131200",
            endPort = "In"
          },
          {
            startQuest = "173165865887123772183",
            startPort = "Out",
            endQuest = "17479158349998359552",
            endPort = "In"
          },
          {
            startQuest = "17479158349998359552",
            startPort = "Out",
            endQuest = "1722421087770164112",
            endPort = "Success"
          },
          {
            startQuest = "1723186893100672821",
            startPort = "Out",
            endQuest = "17507691966235886455",
            endPort = "In"
          },
          {
            startQuest = "17507695020845887091",
            startPort = "Out",
            endQuest = "1722421087772164116",
            endPort = "In"
          },
          {
            startQuest = "17507695065195887257",
            startPort = "Out",
            endQuest = "1722421087772164116",
            endPort = "In"
          },
          {
            startQuest = "17507691966235886455",
            startPort = "false",
            endQuest = "17507695020845887091",
            endPort = "In"
          },
          {
            startQuest = "17507691966235886455",
            startPort = "true",
            endQuest = "17507695065195887257",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722421087770164111"] = {
            key = "1722421087770164111",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -837.5878923970291, y = 223.02013591615315},
            propsData = {ModeType = 0}
          },
          ["1722421087770164112"] = {
            key = "1722421087770164112",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2118.173109699285, y = 235.9502988738114},
            propsData = {ModeType = 0}
          },
          ["1722421087771164113"] = {
            key = "1722421087771164113",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1747.245422738418, y = 618.7425862849364},
            propsData = {}
          },
          ["1722421087772164116"] = {
            key = "1722421087772164116",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-SC008-\229\175\140\229\176\148\231\187\180\230\150\175\231\153\187\229\156\186",
            pos = {x = 348.6015227804994, y = 231.34215836324094},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC008/SQ_OBT0102_SC008",
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
          ["1723186893100672821"] = {
            key = "1723186893100672821",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\229\156\168\230\165\188\228\184\138",
            pos = {x = -566.4827647290036, y = 324.0691451428048},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11013401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_18",
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
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723186893100672822"] = {
            key = "1723186893100672822",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\229\156\168\230\165\188\228\184\139",
            pos = {x = 32.676455170113655, y = -92.68640461238559},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11013408,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_18",
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
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17272521340302785296"] = {
            key = "17272521340302785296",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1371.4630804868423, y = 249.34744292032198},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11013702,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_19",
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
                  TalkActorType = "Npc",
                  TalkActorId = 110012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 110012},
                {TalkActorType = "Npc", TalkActorId = 110011},
                {TalkActorType = "Npc", TalkActorId = 110010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17272521340302785297"] = {
            key = "17272521340302785297",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-SC009-\233\152\191\231\147\166\229\176\148\230\173\187",
            pos = {x = 1059.0582331260982, y = 245.58782541137862},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC009/SQ_OBT0102_SC009",
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
          ["17272521340302785298"] = {
            key = "17272521340302785298",
            type = "TalkNode",
            name = "\229\175\140\229\176\148\231\187\180\230\150\175\229\146\140\233\152\191\231\147\166\229\176\148\229\175\185\229\179\153",
            pos = {x = 738.8747235783941, y = 231.03757838125864},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018819,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_19",
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
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100340,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100341,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100342,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100343,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100344,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100346,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110010},
                {TalkActorType = "Npc", TalkActorId = 110012},
                {TalkActorType = "Npc", TalkActorId = 110011},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 100340},
                {TalkActorType = "Npc", TalkActorId = 100341},
                {TalkActorType = "Npc", TalkActorId = 100342},
                {TalkActorType = "Npc", TalkActorId = 100343},
                {TalkActorType = "Npc", TalkActorId = 100344},
                {TalkActorType = "Npc", TalkActorId = 100346}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17283943587925525985"] = {
            key = "17283943587925525985",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -342.1956764607602, y = 50.69197272931405},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17283943979645526499"] = {
            key = "17283943979645526499",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 720.0398186421885, y = 76.24752828486888},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0043_story_empire.0043_story_empire'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17283944915565714945"] = {
            key = "17283944915565714945",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1130.889433033816, y = 94.43060759732103},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["173165865887123772183"] = {
            key = "173165865887123772183",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1637.59881993512, y = 244.0916121873553},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17477241276131200"] = {
            key = "17477241276131200",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\165\188\228\184\138\233\152\191\231\147\166\229\176\148",
            pos = {x = -361.1111111111111, y = -108.88888888888889},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650062, 1650700}
            }
          },
          ["17479158349998359552"] = {
            key = "17479158349998359552",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1882.4615384615386, y = 273.6923076923077},
            propsData = {
              ActionType = 0,
              Condition = "fort02",
              SaveToServer = true
            }
          },
          ["17507691966235886455"] = {
            key = "17507691966235886455",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = -320.07437070938215, y = 462.00802277432706},
            propsData = {
              FunctionName = "Equal",
              VarName = "KajiaTalk",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17507695020845887091"] = {
            key = "17507695020845887091",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\229\156\168\230\165\188\228\184\138",
            pos = {x = 28.827104068973117, y = 444.86516563146984},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11013420,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_18",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17507695065195887257"] = {
            key = "17507695065195887257",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\229\156\168\230\165\188\228\184\138",
            pos = {x = 51.35420071918926, y = 640.5794513457556},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11013409,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_18",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110010}
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
    ["17309502252793496288"] = {
      isStoryNode = true,
      key = "17309502252793496288",
      type = "StoryNode",
      name = "\228\184\173\230\142\167\229\174\164\230\156\186\229\133\179\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 701.2880140604624, y = -127.91158858493542},
      propsData = {
        QuestId = 11010705,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110110_8",
        QuestDeatil = "Content_110110_8",
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
        SubRegionId = 102102,
        StoryGuideType = "Point",
        StoryGuidePointName = "questpoint1111011006"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17309502252793496289",
            startPort = "QuestStart",
            endQuest = "17349231817402736517",
            endPort = "In"
          },
          {
            startQuest = "17309502252793496289",
            startPort = "QuestStart",
            endQuest = "17349231817402736518",
            endPort = "In"
          },
          {
            startQuest = "17309502479153497087",
            startPort = "Fail",
            endQuest = "173495100941412765114",
            endPort = "In"
          },
          {
            startQuest = "173495100941412765114",
            startPort = "Out",
            endQuest = "17309502252793496295",
            endPort = "Fail"
          },
          {
            startQuest = "17309502252793496289",
            startPort = "QuestStart",
            endQuest = "17352047845822816434",
            endPort = "In"
          },
          {
            startQuest = "17309502479153497087",
            startPort = "PassiveFail",
            endQuest = "173495100941412765114",
            endPort = "In"
          },
          {
            startQuest = "17309502252793496289",
            startPort = "QuestStart",
            endQuest = "17349231817402736519",
            endPort = "In"
          },
          {
            startQuest = "17309502479153497087",
            startPort = "Success",
            endQuest = "17472021382164860590",
            endPort = "In"
          },
          {
            startQuest = "17472021382164860590",
            startPort = "Out",
            endQuest = "17309502252793496292",
            endPort = "Success"
          },
          {
            startQuest = "17349231817402736517",
            startPort = "Out",
            endQuest = "17349232266752737594",
            endPort = "In"
          },
          {
            startQuest = "17349231817402736517",
            startPort = "Out",
            endQuest = "173165787171123364029",
            endPort = "In"
          },
          {
            startQuest = "173165787171123364029",
            startPort = "Out",
            endQuest = "173165787171123364030",
            endPort = "In"
          },
          {
            startQuest = "173165787171123364029",
            startPort = "Out",
            endQuest = "17309502479153497087",
            endPort = "In"
          }
        },
        nodeData = {
          ["17309502252793496289"] = {
            key = "17309502252793496289",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -207.11939862793756, y = 259.54751131221724},
            propsData = {ModeType = 0}
          },
          ["17309502252793496292"] = {
            key = "17309502252793496292",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1388.2760717543376, y = 214.40103374885996},
            propsData = {ModeType = 0}
          },
          ["17309502252793496295"] = {
            key = "17309502252793496295",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1398.6890112176204, y = 425.02888415931994},
            propsData = {}
          },
          ["17309502479153497087"] = {
            key = "17309502479153497087",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 732.1062814490421, y = 260.15181161492586},
            propsData = {SpecialConfigId = 1019, BlackScreenImmediately = false}
          },
          ["173165787171123364029"] = {
            key = "173165787171123364029",
            type = "GoToNode",
            name = "GOTO - \229\136\176\232\190\190\228\184\173\230\142\167\229\174\164",
            pos = {x = 382.18903975672754, y = 264.1532961437912},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011006,
              GuideType = "M",
              GuidePointName = "questpoint1111011006"
            }
          },
          ["173165787171123364030"] = {
            key = "173165787171123364030",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 701.5768735855032, y = 72.86945364920891},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1650069}
            }
          },
          ["17349231817402736517"] = {
            key = "17349231817402736517",
            type = "GoToNode",
            name = "GOTO - \229\136\176\232\190\190\228\184\173\230\142\167\229\174\164\233\151\168\229\137\141",
            pos = {x = 70.12557096803738, y = 259.88402882732794},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011012,
              GuideType = "M",
              GuidePointName = "questpoint1111011012"
            }
          },
          ["17349231817402736518"] = {
            key = "17349231817402736518",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 49.61495961230611, y = 612.9670877979821},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0058_scene_ex01_action.0058_scene_ex01_action'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17349231817402736519"] = {
            key = "17349231817402736519",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\232\175\180\230\131\133\229\134\181\228\184\141\229\175\185",
            pos = {x = 71.54840121552604, y = 107.98095731328337},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012915,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17349232266752737594"] = {
            key = "17349232266752737594",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 382.91218508348703, y = 85.44994438264732},
            propsData = {
              NewDescription = "Description_110111_1",
              NewDetail = "Content_110111_1",
              SubTaskTargetIndex = 0
            }
          },
          ["173495100941412765114"] = {
            key = "173495100941412765114",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1089.5358851674641, y = 398.65550239234466},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_ZhongKongRE",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17352047845822816434"] = {
            key = "17352047845822816434",
            type = "SwitchMechanismStateNode",
            name = "\230\156\186\229\133\179\230\142\167\229\136\182 - \230\137\147\229\188\128\229\137\141\229\190\128\228\184\173\230\142\167\229\174\164\231\154\132\233\151\168",
            pos = {x = 77.45068337469232, y = -61.11616161616175},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650021},
              StateId = 104011,
              QuestId = 0
            }
          },
          ["17472021382164860590"] = {
            key = "17472021382164860590",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1106.4787129382141, y = 212.8181818181818},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["1742889664571796646"] = {
      isStoryNode = true,
      key = "1742889664571796646",
      type = "StoryNode",
      name = "\230\159\165\231\156\139\233\152\191\231\147\166\229\176\148\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 1313.3947368421052, y = -146.33522639249367},
      propsData = {
        QuestId = 11010706,
        QuestDescriptionComment = "\228\184\173\230\142\167\229\174\164\229\175\185\229\179\153\229\137\167\230\131\133",
        QuestDescription = "Description_110111_3",
        QuestDeatil = "Content_110111_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 102102,
        StoryGuideType = "Point",
        StoryGuidePointName = "pAwamove18"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742889664575796665",
            startPort = "Out",
            endQuest = "1742889664571796653",
            endPort = "Fail"
          },
          {
            startQuest = "1742889664571796651",
            startPort = "QuestStart",
            endQuest = "1742889664571796654",
            endPort = "In"
          },
          {
            startQuest = "1742889664571796654",
            startPort = "Fail",
            endQuest = "1742889664575796665",
            endPort = "In"
          },
          {
            startQuest = "1742889664571796654",
            startPort = "PassiveFail",
            endQuest = "1742889664575796667",
            endPort = "In"
          },
          {
            startQuest = "1742889664575796667",
            startPort = "Out",
            endQuest = "1742889664571796653",
            endPort = "Fail"
          },
          {
            startQuest = "1742889664571796654",
            startPort = "Success",
            endQuest = "17472021122354003332",
            endPort = "In"
          },
          {
            startQuest = "17472021122354003332",
            startPort = "Out",
            endQuest = "1742889664571796652",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742889664571796651"] = {
            key = "1742889664571796651",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -3489.204447730018, y = 459.46994371742124},
            propsData = {ModeType = 0}
          },
          ["1742889664571796652"] = {
            key = "1742889664571796652",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -2230.776268085541, y = 226.86895404642834},
            propsData = {ModeType = 0}
          },
          ["1742889664571796653"] = {
            key = "1742889664571796653",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -2272.4303224463065, y = 473.51834111158115},
            propsData = {}
          },
          ["1742889664571796654"] = {
            key = "1742889664571796654",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -2968.1337191082566, y = 448.09239823404806},
            propsData = {SpecialConfigId = 1017, BlackScreenImmediately = true}
          },
          ["1742889664575796665"] = {
            key = "1742889664575796665",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\230\141\174\231\130\185",
            pos = {x = -2650.7836391850515, y = 476.41974460426474},
            propsData = {
              ModeType = 1,
              Id = 210101,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["1742889664575796667"] = {
            key = "1742889664575796667",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -2641.069111318791, y = 645.6853052721057},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "pAwamove18",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17472021122354003332"] = {
            key = "17472021122354003332",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = -2716.884923425422, y = 72},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
