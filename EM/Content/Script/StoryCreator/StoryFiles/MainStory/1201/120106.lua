return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17308110058611",
      startPort = "StoryStart",
      endStory = "1730811239880405928",
      endPort = "In"
    },
    {
      startStory = "1730811239880405928",
      startPort = "Success",
      endStory = "17308129774972030410",
      endPort = "In"
    },
    {
      startStory = "17308129774972030410",
      startPort = "Success",
      endStory = "17308136632293657238",
      endPort = "In"
    },
    {
      startStory = "17308136632293657238",
      startPort = "Success",
      endStory = "17308137537874064442",
      endPort = "In"
    },
    {
      startStory = "17308137537874064442",
      startPort = "Success",
      endStory = "173087681291313454010",
      endPort = "In"
    },
    {
      startStory = "173087681291313454010",
      startPort = "Success",
      endStory = "173087741508215085989",
      endPort = "In"
    },
    {
      startStory = "173087741508215085989",
      startPort = "Success",
      endStory = "173087828461117943522",
      endPort = "In"
    },
    {
      startStory = "173087828461117943522",
      startPort = "Success",
      endStory = "17501642334538873706",
      endPort = "In"
    },
    {
      startStory = "17501642334538873706",
      startPort = "Success",
      endStory = "173087937770320392044",
      endPort = "In"
    },
    {
      startStory = "173087937770320392044",
      startPort = "Success",
      endStory = "17308110058615",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17308110058611"] = {
      isStoryNode = true,
      key = "17308110058611",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 120106},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17308110058615"] = {
      isStoryNode = true,
      key = "17308110058615",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3460.6749999999993, y = 286.23686974789916},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1730811239880405928"] = {
      isStoryNode = true,
      key = "1730811239880405928",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\231\153\190\229\185\180\230\152\165",
      pos = {x = 1104.5686274509803, y = 289.264705882353},
      propsData = {
        QuestId = 12010601,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_1",
        QuestDeatil = "Content_120106_1",
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
            startQuest = "17308126725271623979",
            startPort = "Out",
            endQuest = "17308127132391624296",
            endPort = "In"
          },
          {
            startQuest = "17308127132391624296",
            startPort = "Out",
            endQuest = "1730811239880405933",
            endPort = "Success"
          },
          {
            startQuest = "1730811239880405932",
            startPort = "QuestStart",
            endQuest = "17308126725271623979",
            endPort = "In"
          },
          {
            startQuest = "1730811239880405932",
            startPort = "QuestStart",
            endQuest = "17490277680862655",
            endPort = "In"
          },
          {
            startQuest = "17490277680862655",
            startPort = "Out",
            endQuest = "17308116617621217963",
            endPort = "In"
          }
        },
        nodeData = {
          ["1730811239880405932"] = {
            key = "1730811239880405932",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1781.5146853146855, y = 454.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1730811239880405933"] = {
            key = "1730811239880405933",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3056.3590342131856, y = 464.92907971872836},
            propsData = {ModeType = 0}
          },
          ["1730811239880405934"] = {
            key = "1730811239880405934",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1730811389005812260"] = {
            key = "1730811389005812260",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1939.37619047619, y = 216.88571428571422},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Bainianchun"
            }
          },
          ["17308116617621217963"] = {
            key = "17308116617621217963",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 2620.1095238095236, y = 283.5857142857143},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308126725271623979"] = {
            key = "17308126725271623979",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\153\190\229\185\180\230\152\165",
            pos = {x = 2215.8714285714277, y = 450.9218487394957},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930158,
              GuideType = "P",
              GuidePointName = "QuestPoint_Bainianchun"
            }
          },
          ["17308127132391624296"] = {
            key = "17308127132391624296",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\167\152\228\185\166\229\175\185\232\175\157",
            pos = {x = 2605.254621848739, y = 461.779831932773},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_54",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorId = 210022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17490277680862655"] = {
            key = "17490277680862655",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2294.733129338692, y = 299.02142857142854},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    ["17308129774972030410"] = {
      isStoryNode = true,
      key = "17308129774972030410",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\233\187\145\233\190\153\231\165\173\229\157\155",
      pos = {x = 1370.5185463659145, y = 286.2903582485626},
      propsData = {
        QuestId = 12010602,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_2",
        QuestDeatil = "Content_120106_2",
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
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17308129774972030414",
            startPort = "QuestStart",
            endQuest = "17308129774972030419",
            endPort = "In"
          },
          {
            startQuest = "17308129774972030419",
            startPort = "Out",
            endQuest = "17308133971902843282",
            endPort = "In"
          },
          {
            startQuest = "17308135679373250755",
            startPort = "Out",
            endQuest = "17308129774972030415",
            endPort = "Success"
          },
          {
            startQuest = "1749034008639908255",
            startPort = "Out",
            endQuest = "1749034008639908256",
            endPort = "In"
          },
          {
            startQuest = "1749034008639908256",
            startPort = "Out",
            endQuest = "1749034008639908257",
            endPort = "In"
          },
          {
            startQuest = "17308133971902843282",
            startPort = "Out",
            endQuest = "1749034008639908255",
            endPort = "In"
          },
          {
            startQuest = "1749034008639908257",
            startPort = "Out",
            endQuest = "17308135496373250340",
            endPort = "In"
          },
          {
            startQuest = "17308135496373250340",
            startPort = "Out",
            endQuest = "17536992927345023559",
            endPort = "In"
          },
          {
            startQuest = "17536992927345023559",
            startPort = "Out",
            endQuest = "17308135679373250755",
            endPort = "In"
          }
        },
        nodeData = {
          ["17308129774972030414"] = {
            key = "17308129774972030414",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1862.8728248495693, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["17308129774972030415"] = {
            key = "17308129774972030415",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3383.847406306208, y = 435.79419599779817},
            propsData = {ModeType = 0}
          },
          ["17308129774972030416"] = {
            key = "17308129774972030416",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17308129774972030419"] = {
            key = "17308129774972030419",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\233\187\145\233\190\153\230\158\151\228\188\160\233\128\129\231\130\185",
            pos = {x = 2114.381875230712, y = 441.8903654485049},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930162,
              GuideType = "P",
              GuidePointName = "QuestPoint_AltarEntrance"
            }
          },
          ["17308133971902843282"] = {
            key = "17308133971902843282",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2352.321222235415, y = 441.93694923167857},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_AltarStartPoint",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17308134929842843846"] = {
            key = "17308134929842843846",
            type = "TalkNode",
            name = "\227\128\144SC012\227\128\145\230\138\181\232\190\190\233\187\145\233\190\153\231\165\173\229\157\155",
            pos = {x = 2900.65114812348, y = 91.74144705943206},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022522,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["17308135496373250340"] = {
            key = "17308135496373250340",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\165\173\229\157\155",
            pos = {x = 2597.9026175842528, y = 441.2392748130739},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930163,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010602"
            }
          },
          ["17308135679373250755"] = {
            key = "17308135679373250755",
            type = "TalkNode",
            name = "\227\128\14455\227\128\145\229\146\140\230\173\162\230\181\129\228\186\164\232\176\136",
            pos = {x = 3126.7908107863996, y = 419.07673967379446},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_55",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210005},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749034008639908255"] = {
            key = "1749034008639908255",
            type = "GoToNode",
            name = "\230\178\191\233\128\148\229\137\141\229\190\128\233\162\157\233\166\150\229\164\132",
            pos = {x = 2353.1607923730016, y = 726.8144717040066},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930168,
              GuideType = "P",
              GuidePointName = "QuestPoint_120106031"
            }
          },
          ["1749034008639908256"] = {
            key = "1749034008639908256",
            type = "GoToNode",
            name = "\230\178\191\233\128\148\229\137\141\229\190\128\233\162\157\233\166\150\229\164\132",
            pos = {x = 2628.509537297329, y = 723.6470667575319},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930169,
              GuideType = "P",
              GuidePointName = "QuestPoint_120106032"
            }
          },
          ["1749034008639908257"] = {
            key = "1749034008639908257",
            type = "GoToNode",
            name = "\230\178\191\233\128\148\229\137\141\229\190\128\233\162\157\233\166\150\229\164\132",
            pos = {x = 2924.223823011615, y = 724.7184953289604},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930170,
              GuideType = "P",
              GuidePointName = "QuestPoint_120106033"
            }
          },
          ["17536992927345023559"] = {
            key = "17536992927345023559",
            type = "TalkNode",
            name = "\227\128\144SC012\227\128\145\230\138\181\232\190\190\233\187\145\233\190\153\231\165\173\229\157\155E+\229\164\132\229\134\179\233\187\145\233\190\153",
            pos = {x = 2866.1428571428573, y = 415.8690476190477},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC012/SQ_Ver0101_SC012",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
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
    ["17308136632293657238"] = {
      isStoryNode = true,
      key = "17308136632293657238",
      type = "StoryNode",
      name = "\229\164\132\229\134\179\233\187\145\233\190\153",
      pos = {x = 1635.4250340906349, y = 285.79584064626164},
      propsData = {
        QuestId = 12010603,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_3",
        QuestDeatil = "Content_120106_3",
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
        SubRegionId = 104101,
        StoryGuideType = "Point",
        StoryGuidePointName = "RegionPoint_Alt_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17308136632293657242",
            startPort = "QuestStart",
            endQuest = "17308746635907338748",
            endPort = "In"
          },
          {
            startQuest = "17308136632293657242",
            startPort = "QuestStart",
            endQuest = "17527368067116723176",
            endPort = "In"
          },
          {
            startQuest = "17527368067116723176",
            startPort = "Out",
            endQuest = "17308136632293657243",
            endPort = "Success"
          },
          {
            startQuest = "17308746635907338748",
            startPort = "Out",
            endQuest = "17308749773587746737",
            endPort = "In"
          }
        },
        nodeData = {
          ["17308136632293657242"] = {
            key = "17308136632293657242",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1862.8728248495693, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["17308136632293657243"] = {
            key = "17308136632293657243",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2705.7842194930213, y = 458.5689212725235},
            propsData = {ModeType = 0}
          },
          ["17308136632293657244"] = {
            key = "17308136632293657244",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17308746635907338748"] = {
            key = "17308746635907338748",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\131\155\233\152\1801",
            pos = {x = 2120.7142857142876, y = 190.1785714285716},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308749745747746640"] = {
            key = "17308749745747746640",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\131\155\233\152\1802",
            pos = {x = 2054.85576568135, y = 13.244377715308218},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308749773587746737"] = {
            key = "17308749773587746737",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\131\155\233\152\1803",
            pos = {x = 2393.701919527504, y = 202.4476744186049},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17527368067116723176"] = {
            key = "17527368067116723176",
            type = "TalkNode",
            name = "\227\128\144SC013\227\128\145\233\187\145\233\190\153\231\165\173\229\157\155\232\183\145\233\133\183QTE+\229\164\132\229\134\179\233\187\145\233\190\153",
            pos = {x = 2246.769230769231, y = 447.1538461538462},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC013/SQ_Ver0101_SC013",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
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
    ["17308137537874064442"] = {
      isStoryNode = true,
      key = "17308137537874064442",
      type = "StoryNode",
      name = "\229\164\167\233\163\142\228\185\157\231\171\160",
      pos = {x = 1894.9298103215722, y = 284.6400430369037},
      propsData = {
        QuestId = 12010604,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_4",
        QuestDeatil = "Content_120106_4",
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
        SubRegionId = 104101,
        StoryGuideType = "Point",
        StoryGuidePointName = "RegionPoint_Alt_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17308759206959378274",
            startPort = "Out",
            endQuest = "17308759206959378275",
            endPort = "In"
          },
          {
            startQuest = "17308759206959378275",
            startPort = "Out",
            endQuest = "17308757479309377610",
            endPort = "In"
          },
          {
            startQuest = "17308757479309377610",
            startPort = "Out",
            endQuest = "17308759528129379125",
            endPort = "In"
          },
          {
            startQuest = "17308757479309377610",
            startPort = "Out",
            endQuest = "17308761162599786923",
            endPort = "In"
          },
          {
            startQuest = "17308761162599786923",
            startPort = "Out",
            endQuest = "173087624050711416241",
            endPort = "In"
          },
          {
            startQuest = "173087624050711416241",
            startPort = "Out",
            endQuest = "173087626234911416742",
            endPort = "In"
          },
          {
            startQuest = "17308137537874064446",
            startPort = "QuestStart",
            endQuest = "1749034568872915217",
            endPort = "In"
          },
          {
            startQuest = "1749034568872915217",
            startPort = "Out",
            endQuest = "17308137537874064447",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17308137537874064446"] = {
            key = "17308137537874064446",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2736.3252058019502, y = 460.3671328671328},
            propsData = {ModeType = 0}
          },
          ["17308137537874064447"] = {
            key = "17308137537874064447",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3459.561692020494, y = 443.77038647398865},
            propsData = {ModeType = 0}
          },
          ["17308137537874064448"] = {
            key = "17308137537874064448",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3558.356759872987, y = 574.057879240435},
            propsData = {}
          },
          ["17308757479309377610"] = {
            key = "17308757479309377610",
            type = "TalkNode",
            name = "\232\191\155\232\161\140\229\176\129\229\141\176",
            pos = {x = 2493.0952380952403, y = 45.5952380952383},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210023,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Seal_1930171",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 12021203,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17308759206959378274"] = {
            key = "17308759206959378274",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1963.9004469216586, y = 56.094912741827784},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_120106033"
            }
          },
          ["17308759206959378275"] = {
            key = "17308759206959378275",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186NPC",
            pos = {x = 2212.290029268821, y = 57.59556344864882},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930171}
            }
          },
          ["17308759528129379125"] = {
            key = "17308759528129379125",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 2758.809523809525, y = -105.47619047619037},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308761162599786923"] = {
            key = "17308761162599786923",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\169\186NPC",
            pos = {x = 2760.9523809523826, y = 60.5952380952383},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930171}
            }
          },
          ["173087624050711416241"] = {
            key = "173087624050711416241",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \231\142\169\229\174\182\229\157\160\232\144\189",
            pos = {x = 3024.290890269153, y = 49.04244306418224},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021401,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["173087626234911416742"] = {
            key = "173087626234911416742",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\156\186\229\133\179\233\184\159\230\138\181\232\190\190",
            pos = {x = 3293.452380952385, y = 48.80952380952397},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_37",
              BlendInTime = 0,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749034568872915217"] = {
            key = "1749034568872915217",
            type = "TalkNode",
            name = "\229\164\167\233\163\142\228\185\157\231\171\160CG",
            pos = {x = 3093.3198757763976, y = 433.668554378273},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022001,
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
          }
        },
        commentData = {}
      }
    },
    ["173087681291313454010"] = {
      isStoryNode = true,
      key = "173087681291313454010",
      type = "StoryNode",
      name = "\230\136\152\229\137\141\229\175\185\232\175\157",
      pos = {x = 2155.0000000000045, y = 281.42857142857156},
      propsData = {
        QuestId = 12010605,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_5",
        QuestDeatil = "Content_120106_5",
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
        SubRegionId = 104101,
        StoryGuideType = "Point",
        StoryGuidePointName = "RegionPoint_Alt_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173087681291413454022",
            startPort = "Out",
            endQuest = "173087711090614270520",
            endPort = "In"
          },
          {
            startQuest = "173087681291313454014",
            startPort = "QuestStart",
            endQuest = "1749034619046916371",
            endPort = "In"
          },
          {
            startQuest = "1749034619046916371",
            startPort = "Out",
            endQuest = "173087681291313454015",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173087681291313454014"] = {
            key = "173087681291313454014",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2989.9363169130615, y = 481.31951381951376},
            propsData = {ModeType = 0}
          },
          ["173087681291313454015"] = {
            key = "173087681291313454015",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3653.8870888458905, y = 474.84181504541726},
            propsData = {ModeType = 0}
          },
          ["173087681291313454016"] = {
            key = "173087681291313454016",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3725.0234265396534, y = 655.1689903515461},
            propsData = {}
          },
          ["173087681291413454022"] = {
            key = "173087681291413454022",
            type = "TalkNode",
            name = "\230\156\186\229\133\179\230\139\179\230\136\152\230\150\151",
            pos = {x = 2831.944444444446, y = 158.7301587301588},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021903,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["173087681291413454023"] = {
            key = "173087681291413454023",
            type = "TalkNode",
            name = "\229\164\167\233\163\142\228\185\157\231\171\160CG",
            pos = {x = 3286.5476190476234, y = 74.68253968253984},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12021501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_37",
              BlendInTime = 0,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173087711090614270520"] = {
            key = "173087711090614270520",
            type = "TalkNode",
            name = "\229\164\167\233\163\142\228\185\157\231\171\160CG",
            pos = {x = 3095.7539682539727, y = 155.5952380952382},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022017,
              FlowAssetPath = "",
              TalkType = "Black",
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
          ["1749034619046916371"] = {
            key = "1749034619046916371",
            type = "TalkNode",
            name = "\227\128\14456\227\128\145\229\176\143\231\153\189\239\188\140\230\173\162\230\181\129\229\146\140\228\184\187\232\167\146\229\175\185\232\175\157",
            pos = {x = 3297.0680076628364, y = 474.96511393426107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_56",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004}
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
    ["173087741508215085989"] = {
      isStoryNode = true,
      key = "173087741508215085989",
      type = "StoryNode",
      name = "Boss\230\136\152\230\150\151",
      pos = {x = 2418.571428571433, y = 279.2857142857145},
      propsData = {
        QuestId = 12010606,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_6",
        QuestDeatil = "Content_120106_6",
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
        SubRegionId = 104101,
        StoryGuideType = "Point",
        StoryGuidePointName = "RegionPoint_Alt_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173087741508315085993",
            startPort = "QuestStart",
            endQuest = "173087750865415494962",
            endPort = "In"
          },
          {
            startQuest = "173087750865415494962",
            startPort = "Out",
            endQuest = "173087815712117127433",
            endPort = "In"
          },
          {
            startQuest = "173087815712117127433",
            startPort = "Out",
            endQuest = "173087741508315085994",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173087741508315085993"] = {
            key = "173087741508315085993",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2722.1585391352837, y = 454.6528471528471},
            propsData = {ModeType = 0}
          },
          ["173087741508315085994"] = {
            key = "173087741508315085994",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3612.983351006669, y = 455.55098043200206},
            propsData = {ModeType = 0}
          },
          ["173087741508315085995"] = {
            key = "173087741508315085995",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4270.856759872987, y = 694.0578792404351},
            propsData = {}
          },
          ["173087750865415494962"] = {
            key = "173087750865415494962",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3017.0178462598315, y = 454.1279069767445},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_BossFight120106",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["173087815712117127433"] = {
            key = "173087815712117127433",
            type = "TalkNode",
            name = "Boss\230\136\152\230\150\151",
            pos = {x = 3289.7119815668248, y = 438.06451612903254},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023809,
              FlowAssetPath = "",
              TalkType = "Black",
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
          }
        },
        commentData = {}
      }
    },
    ["173087828461117943522"] = {
      isStoryNode = true,
      key = "173087828461117943522",
      type = "StoryNode",
      name = "\230\136\152\229\144\142\229\137\167\230\131\133",
      pos = {x = 2694.9630541871975, y = 281.42857142857173},
      propsData = {
        QuestId = 12010607,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_7",
        QuestDeatil = "Content_120106_7",
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
        SubRegionId = 104101,
        StoryGuideType = "Point",
        StoryGuidePointName = "RegionPoint_Alt_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173087893422119167786",
            startPort = "Out",
            endQuest = "173087828461117943527",
            endPort = "Success"
          },
          {
            startQuest = "1749035641134923908",
            startPort = "Out",
            endQuest = "17527423061497379403",
            endPort = "In"
          },
          {
            startQuest = "17527423061497379403",
            startPort = "Out",
            endQuest = "173087893422119167786",
            endPort = "In"
          },
          {
            startQuest = "173087828461117943526",
            startPort = "QuestStart",
            endQuest = "17538415234463078",
            endPort = "In"
          },
          {
            startQuest = "17538415234463078",
            startPort = "Out",
            endQuest = "1749035653238924174",
            endPort = "In"
          },
          {
            startQuest = "1749035653238924174",
            startPort = "Out",
            endQuest = "17527422987767379318",
            endPort = "In"
          },
          {
            startQuest = "17527422987767379318",
            startPort = "Out",
            endQuest = "1749035641134923908",
            endPort = "In"
          }
        },
        nodeData = {
          ["173087828461117943526"] = {
            key = "173087828461117943526",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2382.343462907164, y = 464.8151848151847},
            propsData = {ModeType = 0}
          },
          ["173087828461117943527"] = {
            key = "173087828461117943527",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3894.5031635924006, y = 454.28798481767404},
            propsData = {ModeType = 0}
          },
          ["173087828461117943528"] = {
            key = "173087828461117943528",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4270.856759872987, y = 694.0578792404351},
            propsData = {}
          },
          ["173087828461117943531"] = {
            key = "173087828461117943531",
            type = "TalkNode",
            name = "\227\128\144SC018\227\128\145\230\173\162\230\181\129\229\144\184\229\143\150\233\187\145\233\190\153\229\138\155\233\135\143",
            pos = {x = 3355.025083612045, y = 773.8162924032492},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022528,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["173087893422119167786"] = {
            key = "173087893422119167786",
            type = "TalkNode",
            name = "\227\128\14459\227\128\145\229\146\140\229\136\187\232\136\159\227\128\129\230\137\182\231\150\143\228\186\164\230\181\129",
            pos = {x = 3624.351409460111, y = 437.9246297181084},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_57",
              BlendInTime = 0,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210021},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749035641134923908"] = {
            key = "1749035641134923908",
            type = "TalkNode",
            name = "\227\128\14458\227\128\145 \229\146\140\230\173\162\230\181\129\228\186\164\230\181\129",
            pos = {x = 3249.822286409243, y = 260.874277896017},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022209,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_58",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210004}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749035653238924174"] = {
            key = "1749035653238924174",
            type = "TalkNode",
            name = "\227\128\14457\227\128\145 \229\146\140\230\173\162\230\181\129\228\186\164\230\181\129",
            pos = {x = 2725.8176606002694, y = 438.36995613082564},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_57",
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210004}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749035667330924583"] = {
            key = "1749035667330924583",
            type = "TalkNode",
            name = "\227\128\144SC016\227\128\145\233\187\145\233\190\153BOSS\230\136\152\229\144\142",
            pos = {x = 2345.9575207401303, y = 136.69163445250422},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022526,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["1749035728973925868"] = {
            key = "1749035728973925868",
            type = "TalkNode",
            name = "\227\128\144SC017\227\128\145\230\173\162\230\181\129\229\155\154\231\166\129\231\142\169\229\174\182",
            pos = {x = 2716.9085696911784, y = 641.3035225643922},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022527,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["17527422987767379318"] = {
            key = "17527422987767379318",
            type = "TalkNode",
            name = "\227\128\144SC017\227\128\145\230\173\162\230\181\129\229\155\154\231\166\129\231\142\169\229\174\182",
            pos = {x = 2996.898901098901, y = 440.3950549450549},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC017/SQ_Ver0101_SC017",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17527423061497379403"] = {
            key = "17527423061497379403",
            type = "TalkNode",
            name = "\227\128\144SC018\227\128\145\230\173\162\230\181\129\229\144\184\229\143\150\233\187\145\233\190\153\229\138\155\233\135\143",
            pos = {x = 3347.6681318681317, y = 424.52967032967035},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC018/SQ_Ver0101_SC018",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17538415234463078"] = {
            key = "17538415234463078",
            type = "TalkNode",
            name = "\227\128\144SC016\227\128\145\233\187\145\233\190\153BOSS\230\136\152\229\144\142",
            pos = {x = 2719.373626373626, y = 214.92307692307688},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC016/SQ_Ver0101_SC016",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
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
    ["173087937770320392044"] = {
      isStoryNode = true,
      key = "173087937770320392044",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\233\187\145\233\190\153\231\165\173\229\157\155",
      pos = {x = 3206.439906832304, y = 276.9694480767139},
      propsData = {
        QuestId = 12010609,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_8",
        QuestDeatil = "Content_120106_8",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
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
            startQuest = "173088005921721211691",
            startPort = "Out",
            endQuest = "173088005921721211690",
            endPort = "In"
          },
          {
            startQuest = "173088005921721211690",
            startPort = "Out",
            endQuest = "173087937770320392049",
            endPort = "Success"
          },
          {
            startQuest = "173087937770320392048",
            startPort = "QuestStart",
            endQuest = "173088005921721211691",
            endPort = "In"
          },
          {
            startQuest = "173087937770320392048",
            startPort = "QuestStart",
            endQuest = "17501642222628873318",
            endPort = "In"
          },
          {
            startQuest = "17501642222628873318",
            startPort = "Out",
            endQuest = "173087985568221210914",
            endPort = "In"
          }
        },
        nodeData = {
          ["173087937770320392048"] = {
            key = "173087937770320392048",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3120.4205465244463, y = 449.5173791725515},
            propsData = {ModeType = 0}
          },
          ["173087937770320392049"] = {
            key = "173087937770320392049",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4048.501357825637, y = 426.9282400102865},
            propsData = {ModeType = 0}
          },
          ["173087937770320392050"] = {
            key = "173087937770320392050",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4270.856759872987, y = 694.0578792404351},
            propsData = {}
          },
          ["173087985568221210914"] = {
            key = "173087985568221210914",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 3617.6296347014945, y = 213.95117628281946},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173088005921721211690"] = {
            key = "173088005921721211690",
            type = "TalkNode",
            name = "\227\128\144SC019\227\128\145\232\162\171\230\173\162\230\181\129\229\130\172\231\156\160",
            pos = {x = 3748.4705729533002, y = 425.64680579364534},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC019/SQ_Ver0101_SC019",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["173088005921721211691"] = {
            key = "173088005921721211691",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\229\177\177\232\132\154\229\164\132",
            pos = {x = 3458.5076619669335, y = 430.1365812547521},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930182,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010608"
            }
          },
          ["17501642222628873318"] = {
            key = "17501642222628873318",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3369.4470398150415, y = 223.73200973581294},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["17501642334538873706"] = {
      isStoryNode = true,
      key = "17501642334538873706",
      type = "StoryNode",
      name = "\228\188\160\233\128\129\229\136\176\230\177\161\231\167\189\228\185\139\229\156\176",
      pos = {x = 2955.272256728778, y = 283.7991718426498},
      propsData = {
        QuestId = 12010608,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120106_8",
        QuestDeatil = "Content_120106_8",
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
        SubRegionId = 104101,
        StoryGuideType = "Point",
        StoryGuidePointName = "RegionPoint_Alt_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17501643455138875148",
            startPort = "Out",
            endQuest = "17501643455138875147",
            endPort = "In"
          },
          {
            startQuest = "17501642334538873707",
            startPort = "QuestStart",
            endQuest = "17501643455138875148",
            endPort = "In"
          },
          {
            startQuest = "17501643455138875147",
            startPort = "Out",
            endQuest = "17501642334538873710",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17501642334538873707"] = {
            key = "17501642334538873707",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17501642334538873710"] = {
            key = "17501642334538873710",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1785.6951871657755, y = 289.73262032085563},
            propsData = {ModeType = 0}
          },
          ["17501642334538873713"] = {
            key = "17501642334538873713",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1800.4545454545455, y = 472.8342245989305},
            propsData = {}
          },
          ["17501643455138875147"] = {
            key = "17501643455138875147",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1465.6128246753278, y = 287.70755012531345},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_AltarLeave",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17501643455138875148"] = {
            key = "17501643455138875148",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1129.6188909774403, y = 297.3006521986783},
            propsData = {
              ModeType = 1,
              Id = 140105,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
