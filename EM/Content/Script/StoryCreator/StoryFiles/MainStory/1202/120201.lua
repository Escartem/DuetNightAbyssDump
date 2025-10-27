return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17428991219543149559",
      startPort = "StoryStart",
      endStory = "17428991219543149549",
      endPort = "In"
    },
    {
      startStory = "17428991219543149549",
      startPort = "Success",
      endStory = "17428991219543149550",
      endPort = "In"
    },
    {
      startStory = "17428991219543149551",
      startPort = "Success",
      endStory = "17428991219543149552",
      endPort = "In"
    },
    {
      startStory = "17428991219543149552",
      startPort = "Success",
      endStory = "17428991219543149553",
      endPort = "In"
    },
    {
      startStory = "17428991219543149553",
      startPort = "Success",
      endStory = "17428991219543149554",
      endPort = "In"
    },
    {
      startStory = "17428991219543149554",
      startPort = "Success",
      endStory = "17428991219543149555",
      endPort = "In"
    },
    {
      startStory = "17428991219543149555",
      startPort = "Success",
      endStory = "17428991219543149556",
      endPort = "In"
    },
    {
      startStory = "17428991219543149556",
      startPort = "Success",
      endStory = "17428991219543149557",
      endPort = "In"
    },
    {
      startStory = "17428991219543149557",
      startPort = "Success",
      endStory = "17428991219543149561",
      endPort = "In"
    },
    {
      startStory = "17428991219543149558",
      startPort = "Success",
      endStory = "17428991219543149562",
      endPort = "In"
    },
    {
      startStory = "17428991219543149562",
      startPort = "Success",
      endStory = "17428991219543149560",
      endPort = "StoryEnd"
    },
    {
      startStory = "17428991219543149561",
      startPort = "Success",
      endStory = "17428991219543149558",
      endPort = "In"
    },
    {
      startStory = "17428991219543149550",
      startPort = "Success",
      endStory = "17497107286966504159",
      endPort = "In"
    },
    {
      startStory = "17497107286966504159",
      startPort = "Success",
      endStory = "17428991219543149551",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17428991219543149549"] = {
      isStoryNode = true,
      key = "17428991219543149549",
      type = "StoryNode",
      name = "\232\191\155\228\184\156\229\155\189\228\186\140",
      pos = {x = 2079.266443701226, y = 276.144370122631},
      propsData = {
        QuestId = 12020101,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_1",
        QuestDeatil = "Content_120201_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
        IsFairyLand = true,
        SubRegionId = 105601,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020101_2010001",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149567",
            startPort = "Out",
            endQuest = "17428991219553149568",
            endPort = "In"
          },
          {
            startQuest = "17428991219543149563",
            startPort = "QuestStart",
            endQuest = "1752737376003643633",
            endPort = "In"
          },
          {
            startQuest = "1752737376003643633",
            startPort = "Out",
            endQuest = "17428991219553149567",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149568",
            startPort = "Out",
            endQuest = "17428991219543149564",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17428903536122980"] = {
            key = "17428903536122980",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\191\155\229\176\143\233\187\145\229\177\139",
            pos = {x = 2202.7743372468594, y = 75.39785973040262},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BlackhousePoint1",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17428903727283603"] = {
            key = "17428903727283603",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\135\186\229\176\143\233\187\145\229\177\139",
            pos = {x = 2810.1111793521222, y = 81.55575446724475},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_NewTargetPoint12020101",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17428991219543149563"] = {
            key = "17428991219543149563",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1857.8146853146854, y = 400.8671328671328},
            propsData = {ModeType = 0}
          },
          ["17428991219543149564"] = {
            key = "17428991219543149564",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3010.4519383193465, y = 406.948785416119},
            propsData = {ModeType = 0}
          },
          ["17428991219553149565"] = {
            key = "17428991219553149565",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17428991219553149566"] = {
            key = "17428991219553149566",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3085.4614759763504, y = 81.6515541730073},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020101"
            }
          },
          ["17428991219553149567"] = {
            key = "17428991219553149567",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \229\176\143\233\187\145\229\177\139",
            pos = {x = 2403.9193363844397, y = 397.9570938215102},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
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
          ["17428991219553149568"] = {
            key = "17428991219553149568",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\229\175\185\232\175\157",
            pos = {x = 2688.7248283752865, y = 403.51773455377565},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12020001",
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
              EndNewTargetPointName = "EndPoint_12020001",
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
          },
          ["17497104130764648957"] = {
            key = "17497104130764648957",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\229\176\143\233\187\145\229\177\139\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2500.458288289856, y = 57.0440993153767},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          },
          ["17497105785474649753"] = {
            key = "17497105785474649753",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1936.9436449160926, y = 74.51017253224535},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010001,
              GuideType = "M",
              GuidePointName = "Mechanism_12020101_2010001"
            }
          },
          ["1752737376003643633"] = {
            key = "1752737376003643633",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2125.0214285714283, y = 403.2226175831495},
            propsData = {
              ModeType = 1,
              Id = 105601,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149550"] = {
      isStoryNode = true,
      key = "17428991219543149550",
      type = "StoryNode",
      name = "\229\159\142\229\140\186\229\133\165\229\143\163",
      pos = {x = 2359.560019990005, y = 275.07587071848695},
      propsData = {
        QuestId = 12020102,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_2",
        QuestDeatil = "Content_120201_2",
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
        SubRegionId = 104501,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020101_2010001"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149573",
            startPort = "Out",
            endQuest = "17428991219553149574",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149576",
            startPort = "Out",
            endQuest = "17428991219553149575",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149574",
            startPort = "Out",
            endQuest = "17428991219553149570",
            endPort = "Success"
          },
          {
            startQuest = "17428991219553149569",
            startPort = "QuestStart",
            endQuest = "17527376976442561324",
            endPort = "In"
          },
          {
            startQuest = "17527376976442561324",
            startPort = "Out",
            endQuest = "17428991219553149573",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428991219553149569"] = {
            key = "17428991219553149569",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2205.216163147198, y = 802.9040786799408},
            propsData = {ModeType = 0}
          },
          ["17428991219553149570"] = {
            key = "17428991219553149570",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3320.1532806274186, y = 805.9347309778345},
            propsData = {ModeType = 0}
          },
          ["17428991219553149571"] = {
            key = "17428991219553149571",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3174.864797870795, y = 1012.9215986412389},
            propsData = {}
          },
          ["17428991219553149572"] = {
            key = "17428991219553149572",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\144\172\232\191\144\229\183\165\229\146\140\230\173\162\230\181\129",
            pos = {x = 2558.78021978022, y = 572.4175824175825},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090013, 2090016}
            }
          },
          ["17428991219553149573"] = {
            key = "17428991219553149573",
            type = "GoToNode",
            name = "\229\142\159\229\156\176\231\155\146\229\173\144",
            pos = {x = 2760.9330238726798, y = 806.9846532777567},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010001,
              GuideType = "M",
              GuidePointName = "Mechanism_12020101_2010001"
            }
          },
          ["17428991219553149574"] = {
            key = "17428991219553149574",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\229\176\143\231\153\189\229\175\185\232\175\157-\231\156\169\230\153\149",
            pos = {x = 3039.206043956044, y = 805.2197802197802},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020102",
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
                  TalkActorId = 210030,
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
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210030}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149575"] = {
            key = "17428991219553149575",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\144\172\232\191\144\229\183\165\229\146\140\230\173\162\230\181\129",
            pos = {x = 3301.2435897435903, y = 600.2884615384618},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090013, 2090016}
            }
          },
          ["17428991219553149576"] = {
            key = "17428991219553149576",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\144\172\232\191\144\229\183\165\229\175\185\232\175\157",
            pos = {x = 3039.801282051283, y = 593.3653846153848},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020106,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12020101",
              BlendInTime = -1,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210004,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210030,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210030}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17527376976442561324"] = {
            key = "17527376976442561324",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2482.9219092355634, y = 806.4314449917896},
            propsData = {
              ModeType = 1,
              Id = 104501,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149551"] = {
      isStoryNode = true,
      key = "17428991219543149551",
      type = "StoryNode",
      name = "\229\142\187\228\188\145\230\129\175",
      pos = {x = 2921.5072463768115, y = 274.3056653491436},
      propsData = {
        QuestId = 12020103,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_3",
        QuestDeatil = "Content_120201_3",
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
        SubRegionId = 104501,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020103_2010003"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149577",
            startPort = "QuestStart",
            endQuest = "17428991219553149580",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149580",
            startPort = "Out",
            endQuest = "17428908778856452",
            endPort = "In"
          },
          {
            startQuest = "17428908778856452",
            startPort = "Out",
            endQuest = "17497112693528360610",
            endPort = "In"
          },
          {
            startQuest = "17497112693528360610",
            startPort = "Out",
            endQuest = "17428991219553149578",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17428908778856452"] = {
            key = "17428908778856452",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\229\141\160\229\186\167",
            pos = {x = 2999.9407791130625, y = 902.2194558698732},
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
          },
          ["17428991219553149577"] = {
            key = "17428991219553149577",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2500.3146853146854, y = 790.00999000999},
            propsData = {ModeType = 0}
          },
          ["17428991219553149578"] = {
            key = "17428991219553149578",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3297.7601708636184, y = 790.326388171216},
            propsData = {ModeType = 0}
          },
          ["17428991219553149579"] = {
            key = "17428991219553149579",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2946.650512156509, y = 1190.7787414983818},
            propsData = {}
          },
          ["17428991219553149580"] = {
            key = "17428991219553149580",
            type = "GoToNode",
            name = "\229\142\187\228\188\145\230\129\175\229\186\167\228\189\141",
            pos = {x = 2729.8416289592756, y = 884.6774402068522},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010003,
              GuideType = "M",
              GuidePointName = "Mechanism_12020103_2010003"
            }
          },
          ["17428991219553149581"] = {
            key = "17428991219553149581",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\160\129\229\164\180",
            pos = {x = 3027.664835164835, y = 641.9285714285716},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090019,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090019"
            }
          },
          ["17497112693528360610"] = {
            key = "17497112693528360610",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\141\175\229\186\151\232\128\129\230\157\191",
            pos = {x = 3251.548360917461, y = 930.7710140492786},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2010004}
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149552"] = {
      isStoryNode = true,
      key = "17428991219543149552",
      type = "StoryNode",
      name = "\229\142\187\228\185\176\232\141\175",
      pos = {x = 1802.4970609101044, y = 476.47833775419986},
      propsData = {
        QuestId = 12020104,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_4",
        QuestDeatil = "Content_120201_4",
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
        SubRegionId = 104501,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_12020104yaodianlb_2010004"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149585",
            startPort = "Out",
            endQuest = "17428991219553149586",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149585",
            startPort = "Out",
            endQuest = "17428991219553149590",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149585",
            startPort = "Out",
            endQuest = "17428991219553149588",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149586",
            startPort = "Out",
            endQuest = "17428991219553149587",
            endPort = "Branch_1"
          },
          {
            startQuest = "17428991219553149590",
            startPort = "Out",
            endQuest = "17428991219553149587",
            endPort = "Branch_2"
          },
          {
            startQuest = "17428991219553149588",
            startPort = "Out",
            endQuest = "17428991219553149587",
            endPort = "Branch_3"
          },
          {
            startQuest = "17428991219553149591",
            startPort = "Out",
            endQuest = "17428991219553149583",
            endPort = "Success"
          },
          {
            startQuest = "17428911203598241",
            startPort = "Option_1",
            endQuest = "17428911832308815",
            endPort = "In"
          },
          {
            startQuest = "17428911203598241",
            startPort = "Option_2",
            endQuest = "17428911852628942",
            endPort = "In"
          },
          {
            startQuest = "17428911832308815",
            startPort = "Out",
            endQuest = "17428912020959282",
            endPort = "In"
          },
          {
            startQuest = "17428912020959282",
            startPort = "Out",
            endQuest = "17428991219553149591",
            endPort = "In"
          },
          {
            startQuest = "17428911852628942",
            startPort = "Out",
            endQuest = "17428912352469899",
            endPort = "In"
          },
          {
            startQuest = "17428912352469899",
            startPort = "Out",
            endQuest = "17428991219553149591",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149582",
            startPort = "QuestStart",
            endQuest = "17428911203598241",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428911203598241"] = {
            key = "17428911203598241",
            type = "TalkNode",
            name = "\232\141\175\229\186\151\232\128\129\230\157\191\229\175\185\232\175\157",
            pos = {x = 2480.0609307077325, y = 832.7211808893692},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100001,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_12020104yaodianlb_2010004",
              DelayShowGuideTime = 0,
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
              NormalOptions = {
                {
                  OptionText = "",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17428911832308815"] = {
            key = "17428911832308815",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\231\173\137\230\173\162\230\181\129",
            pos = {x = 2982.336901473528, y = 917.6705159103972},
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
          },
          ["17428911852628942"] = {
            key = "17428911852628942",
            type = "TalkNode",
            name = "\230\137\190\232\141\175\229\186\151\232\128\129\230\157\191",
            pos = {x = 2980.815162343093, y = 1083.3226898234404},
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
          },
          ["17428912020959282"] = {
            key = "17428912020959282",
            type = "TalkNode",
            name = "\230\173\162\230\181\129\229\155\158\230\157\165",
            pos = {x = 3233.2064666909196, y = 939.8444289538755},
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
          },
          ["17428912352469899"] = {
            key = "17428912352469899",
            type = "TalkNode",
            name = "\229\155\158\229\142\187\230\137\190\230\173\162\230\181\129",
            pos = {x = 3263.0281696663505, y = 1093.5566784998111},
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
          },
          ["17428991219553149582"] = {
            key = "17428991219553149582",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2137.2598413081173, y = 860.2860710171055},
            propsData = {ModeType = 0}
          },
          ["17428991219553149583"] = {
            key = "17428991219553149583",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3750.338073578928, y = 965.2201936494293},
            propsData = {ModeType = 0}
          },
          ["17428991219553149584"] = {
            key = "17428991219553149584",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3744.2700428673443, y = 1097.9235881226887},
            propsData = {}
          },
          ["17428991219553149585"] = {
            key = "17428991219553149585",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 2519.309392922587, y = 426.9758657467802},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_120201_4_1",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_120201_4_2",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_120201_4_3",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["17428991219553149586"] = {
            key = "17428991219553149586",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 2802.5789581399777, y = 353.14977879025844},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Bai_2090020",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 12020131,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149587"] = {
            key = "17428991219553149587",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 3116.839627805145, y = 419.0614229681697},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = false},
                {IsNeedFinish = false},
                {IsNeedFinish = true}
              }
            }
          },
          ["17428991219553149588"] = {
            key = "17428991219553149588",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\173\162\230\181\129\229\176\143\232\180\169\229\175\185\232\175\157",
            pos = {x = 2798.174281690324, y = 645.1983666175571},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Zhiliu_2090022",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12020113,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_12020113",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210031,
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
                {TalkActorType = "Npc", TalkActorId = 210031},
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
          ["17428991219553149590"] = {
            key = "17428991219553149590",
            type = "TalkNode",
            name = "\231\130\185\233\166\153\228\187\170\229\188\143",
            pos = {x = 2799.70062832093, y = 498.68495665587136},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210008,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MerchantA_2090025",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 12020134,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149591"] = {
            key = "17428991219553149591",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189",
            pos = {x = 3476.2447647208346, y = 1015.1900170187719},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2010005}
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149553"] = {
      isStoryNode = true,
      key = "17428991219543149553",
      type = "StoryNode",
      name = "\229\155\158\229\142\187\230\137\190\229\176\143\231\153\189",
      pos = {x = 2079.925382801342, y = 475.20533430763606},
      propsData = {
        QuestId = 12020105,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_5",
        QuestDeatil = "Content_120201_5",
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
        SubRegionId = 104501,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020103_2010003"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149595",
            startPort = "Out",
            endQuest = "17428991219553149596",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149595",
            startPort = "Out",
            endQuest = "17428991219553149597",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149597",
            startPort = "Out",
            endQuest = "17428991219553149598",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149600",
            startPort = "Out",
            endQuest = "17428991219553149601",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149601",
            startPort = "Out",
            endQuest = "17428991219553149602",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149602",
            startPort = "Out",
            endQuest = "17428991219553149593",
            endPort = "Success"
          },
          {
            startQuest = "17428991219553149592",
            startPort = "QuestStart",
            endQuest = "17428991219553149600",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428991219553149592"] = {
            key = "17428991219553149592",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1961.48053096329, y = 799.2929675688297},
            propsData = {ModeType = 0}
          },
          ["17428991219553149593"] = {
            key = "17428991219553149593",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3483.86749339283, y = 830.8620929378802},
            propsData = {ModeType = 0}
          },
          ["17428991219553149594"] = {
            key = "17428991219553149594",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3585.2733269395935, y = 954.377337438507},
            propsData = {}
          },
          ["17428991219553149595"] = {
            key = "17428991219553149595",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2230.0569501600107, y = 516.8900004543184},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020101"
            }
          },
          ["17428991219553149596"] = {
            key = "17428991219553149596",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\142\187\229\147\170\233\135\140\228\186\134",
            pos = {x = 2540.7466053324238, y = 449.38042191025704},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020130,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17428991219553149597"] = {
            key = "17428991219553149597",
            type = "GoToNode",
            name = "\229\142\187\229\176\143\231\153\189\228\185\139\229\137\141\229\156\168\231\154\132\229\156\176\230\150\185",
            pos = {x = 2555.305992305604, y = 655.3574334045101},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2090026,
              GuideType = "P",
              GuidePointName = ""
            }
          },
          ["17428991219553149598"] = {
            key = "17428991219553149598",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\228\185\139\229\137\141\229\156\168\231\154\132",
            pos = {x = 2827.9879846427693, y = 664.591149879606},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020136,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17428991219553149600"] = {
            key = "17428991219553149600",
            type = "GoToNode",
            name = "\229\155\158\229\176\143\231\153\189\233\153\132\232\191\145",
            pos = {x = 2659.614863511027, y = 856.5702244448871},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010003,
              GuideType = "M",
              GuidePointName = "Mechanism_12020103_2010003"
            }
          },
          ["17428991219553149601"] = {
            key = "17428991219553149601",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\231\153\189npc\229\175\185\232\175\157",
            pos = {x = 2933.100597897762, y = 849.1416951198062},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020103",
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
                  TalkActorId = 210003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
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
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210003},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149602"] = {
            key = "17428991219553149602",
            type = "ChangeStaticCreatorNode",
            name = "\230\182\136\233\153\164\229\176\143\231\153\189",
            pos = {x = 3192.2264903898954, y = 852.2396173125559},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2010005}
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149554"] = {
      isStoryNode = true,
      key = "17428991219543149554",
      type = "StoryNode",
      name = "\228\184\138\230\161\165\239\188\140\230\186\156\232\190\190\232\183\175\232\191\135\230\137\167\229\190\139\233\152\129",
      pos = {x = 2361.0402208022474, y = 474.969144460028},
      propsData = {
        QuestId = 12020106,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_6",
        QuestDeatil = "Content_120201_6",
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
        SubRegionId = 104501,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020106_2010006"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149610",
            startPort = "Out",
            endQuest = "17428991219553149611",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149608",
            startPort = "Out",
            endQuest = "17428991219553149609",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149611",
            startPort = "Out",
            endQuest = "17428991219553149612",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149609",
            startPort = "Out",
            endQuest = "17428991219553149604",
            endPort = "Success"
          },
          {
            startQuest = "17428991219553149603",
            startPort = "QuestStart",
            endQuest = "174971197776811144910",
            endPort = "In"
          },
          {
            startQuest = "174971197776811144910",
            startPort = "Out",
            endQuest = "17428991219553149608",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428991219553149603"] = {
            key = "17428991219553149603",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1968.7778282605873, y = 799.2929675688297},
            propsData = {ModeType = 0}
          },
          ["17428991219553149604"] = {
            key = "17428991219553149604",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3263.6771415990306, y = 883.3229950625754},
            propsData = {ModeType = 0}
          },
          ["17428991219553149605"] = {
            key = "17428991219553149605",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3872.5303802311296, y = 962.7002214510461},
            propsData = {}
          },
          ["17428991219553149608"] = {
            key = "17428991219553149608",
            type = "GoToNode",
            name = "\232\183\175\232\191\135\230\137\167\229\190\139\233\152\129\231\155\146\229\173\144\239\188\140\230\161\165\228\184\138",
            pos = {x = 2597.290141511614, y = 805.2288082075697},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010007,
              GuideType = "M",
              GuidePointName = "Mechanism_12020106_2_2010007"
            }
          },
          ["17428991219553149609"] = {
            key = "17428991219553149609",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\156\139\228\184\128\231\156\188\230\137\167\229\190\139\233\152\129",
            pos = {x = 2906.980867744821, y = 821.8922621150986},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020106",
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
                  TalkActorId = 210001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210001},
                {TalkActorType = "Npc", TalkActorId = 210002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149610"] = {
            key = "17428991219553149610",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \231\139\180\231\138\180\231\142\176\232\186\171",
            pos = {x = 3171.0357041467614, y = 526.1138459241909},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020225,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = -1,
              BlendOutTime = -1,
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
          ["17428991219553149611"] = {
            key = "17428991219553149611",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\138\171\229\144\142\228\189\153\230\179\162 Fixsimple02",
            pos = {x = 3340.6717174660325, y = 534.6222986783333},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020227,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12020215",
              BlendInTime = -1,
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
          },
          ["17428991219553149612"] = {
            key = "17428991219553149612",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\173\162\230\181\129",
            pos = {x = 3479.9880295056983, y = 539.6739697084524},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090031}
            }
          },
          ["174971197776811144910"] = {
            key = "174971197776811144910",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\137\167\229\190\139\233\152\129\231\155\146\229\173\144",
            pos = {x = 2287.641164309642, y = 819.4274270089487},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010006,
              GuideType = "M",
              GuidePointName = "Mechanism_12020106_2010006"
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149555"] = {
      isStoryNode = true,
      key = "17428991219543149555",
      type = "StoryNode",
      name = "\229\142\187\230\136\183\233\131\168",
      pos = {x = 2641.002147943677, y = 474.56017412539165},
      propsData = {
        QuestId = 12020107,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_7",
        QuestDeatil = "Content_120201_7",
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
        SubRegionId = 104502,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020107_2010008"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428920310011630743",
            startPort = "Out",
            endQuest = "17428991219553149618",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149618",
            startPort = "Out",
            endQuest = "17428920788281631485",
            endPort = "In"
          },
          {
            startQuest = "17428920788281631485",
            startPort = "Out",
            endQuest = "17428920789891631491",
            endPort = "In"
          },
          {
            startQuest = "17428920789891631491",
            startPort = "Out",
            endQuest = "17428991219553149614",
            endPort = "Success"
          },
          {
            startQuest = "17428991219553149613",
            startPort = "QuestStart",
            endQuest = "17428920310011630743",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428920310011630743"] = {
            key = "17428920310011630743",
            type = "GoToNode",
            name = "\230\136\183\233\131\168\233\151\168\229\143\163\231\155\146\229\173\144",
            pos = {x = 2359.573662533396, y = 752.6644981030688},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010008,
              GuideType = "M",
              GuidePointName = "Mechanism_12020107_2010008"
            }
          },
          ["17428920788281631485"] = {
            key = "17428920788281631485",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\187\145\229\177\143\231\173\137\230\173\162\230\181\129",
            pos = {x = 2860.391918508597, y = 761.8584875706533},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210032,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Duli_2090041",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020107",
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
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210032,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210032}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428920789891631491"] = {
            key = "17428920789891631491",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\173\162\230\181\129\229\135\186\230\157\165",
            pos = {x = 3144.128182244861, y = 757.652693364859},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020107",
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
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210032,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210032}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149613"] = {
            key = "17428991219553149613",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1961.48053096329, y = 799.2929675688297},
            propsData = {ModeType = 0}
          },
          ["17428991219553149614"] = {
            key = "17428991219553149614",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3376.2953963157574, y = 817.9401045186003},
            propsData = {ModeType = 0}
          },
          ["17428991219553149615"] = {
            key = "17428991219553149615",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2362.0868318440325, y = 1163.5873182252396},
            propsData = {}
          },
          ["17428991219553149617"] = {
            key = "17428991219553149617",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\157\156\231\171\139",
            pos = {x = 2576.1090984135885, y = 1081.2065991905977},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090041}
            }
          },
          ["17428991219553149618"] = {
            key = "17428991219553149618",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\173\162\230\181\129\232\191\155\229\142\187",
            pos = {x = 2610.1767020753714, y = 752.7967179498078},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020107",
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
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210032,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210032}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149619"] = {
            key = "17428991219553149619",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\157\156\231\171\139",
            pos = {x = 3007.9926412854543, y = 961.0525606032447},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090041}
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149556"] = {
      isStoryNode = true,
      key = "17428991219543149556",
      type = "StoryNode",
      name = "\233\128\129\232\180\167\231\142\169\230\179\149",
      pos = {x = 2921.889359709378, y = 472.58992450468446},
      propsData = {
        QuestId = 12020108,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_8",
        QuestDeatil = "Content_120201_8",
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
        SubRegionId = 104502,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020108songhuo_2010010"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149620",
            startPort = "QuestStart",
            endQuest = "17428991219553149624",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149625",
            startPort = "Out",
            endQuest = "17428991219553149626",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149623",
            startPort = "Out",
            endQuest = "17428991219553149621",
            endPort = "Success"
          },
          {
            startQuest = "17428991219553149626",
            startPort = "Out",
            endQuest = "17428991219553149627",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149624",
            startPort = "Out",
            endQuest = "17428991219553149623",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428991219553149620"] = {
            key = "17428991219553149620",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1961.48053096329, y = 799.2929675688297},
            propsData = {ModeType = 0}
          },
          ["17428991219553149621"] = {
            key = "17428991219553149621",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3492.009682030043, y = 819.0115330900288},
            propsData = {ModeType = 0}
          },
          ["17428991219553149622"] = {
            key = "17428991219553149622",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3374.3090540662547, y = 951.3650960030174},
            propsData = {}
          },
          ["17428991219553149623"] = {
            key = "17428991219553149623",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\128\129\229\174\140",
            pos = {x = 3009.291521607198, y = 836.3665643156743},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East02_12020108",
              BlendInTime = 1,
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
                  TalkActorId = 210003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210003}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149624"] = {
            key = "17428991219553149624",
            type = "GoToNode",
            name = "\233\128\129\232\180\167",
            pos = {x = 2201.9137164621525, y = 804.3272922850227},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010010,
              GuideType = "M",
              GuidePointName = "Mechanism_12020108songhuo_2010010"
            }
          },
          ["17428991219553149625"] = {
            key = "17428991219553149625",
            type = "GoToNode",
            name = "\233\128\129\232\180\167",
            pos = {x = 2433.6949231977196, y = 658.5375051057832},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090043,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090043"
            }
          },
          ["17428991219553149626"] = {
            key = "17428991219553149626",
            type = "GoToNode",
            name = "\233\128\129\232\180\167",
            pos = {x = 2673.6038062911866, y = 622.871031619837},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090044,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090044"
            }
          },
          ["17428991219553149627"] = {
            key = "17428991219553149627",
            type = "GoToNode",
            name = "\233\128\129\232\180\167",
            pos = {x = 2926.694657574229, y = 609.5948073370207},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090068,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090068"
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149557"] = {
      isStoryNode = true,
      key = "17428991219543149557",
      type = "StoryNode",
      name = "\233\166\153\233\152\129",
      pos = {x = 1803.8313187388458, y = 675.2651418920782},
      propsData = {
        QuestId = 12020109,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_9",
        QuestDeatil = "Content_120201_9",
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
        SubRegionId = 104503,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020109xiangge_2010011"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149632",
            startPort = "Out",
            endQuest = "17428991219553149631",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149631",
            startPort = "Out",
            endQuest = "17428991219553149633",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149628",
            startPort = "QuestStart",
            endQuest = "17428925678451634178",
            endPort = "In"
          },
          {
            startQuest = "17428925678451634178",
            startPort = "Out",
            endQuest = "17428926202241634688",
            endPort = "In"
          },
          {
            startQuest = "17428926202241634688",
            startPort = "Out",
            endQuest = "17428926200961634683",
            endPort = "In"
          },
          {
            startQuest = "17428926200961634683",
            startPort = "Out",
            endQuest = "17428927590851635481",
            endPort = "In"
          },
          {
            startQuest = "17428927590851635481",
            startPort = "Out",
            endQuest = "17428991219553149629",
            endPort = "Success"
          },
          {
            startQuest = "17428927810611636099",
            startPort = "Out",
            endQuest = "17428991219553149630",
            endPort = "Fail"
          },
          {
            startQuest = "17428991219553149628",
            startPort = "QuestStart",
            endQuest = "17428927810611636099",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428925678451634178"] = {
            key = "17428925678451634178",
            type = "GoToNode",
            name = "\232\183\179\232\183\179",
            pos = {x = 1881.350346973802, y = 1004.0160157627038},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010011,
              GuideType = "M",
              GuidePointName = "Mechanism_12020109xiangge_2010011"
            }
          },
          ["17428926200961634683"] = {
            key = "17428926200961634683",
            type = "GoToNode",
            name = "\232\183\179\232\183\179",
            pos = {x = 2441.8340205266472, y = 1000.265791300449},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090042,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090042"
            }
          },
          ["17428926202241634688"] = {
            key = "17428926202241634688",
            type = "GoToNode",
            name = "\232\183\179\232\183\179",
            pos = {x = 2160.3724820651096, y = 999.8042528389107},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090042,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090042"
            }
          },
          ["17428927590851635481"] = {
            key = "17428927590851635481",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\167\166\230\145\184\231\159\179\231\162\145",
            pos = {x = 2718.0691974464303, y = 1002.5565115322465},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Investigate_2090048",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_12020427",
              BlendInTime = 1,
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
                  TalkActorId = 210003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210003}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428927810611636099"] = {
            key = "17428927810611636099",
            type = "GoToNode",
            name = "\232\144\189\229\156\176",
            pos = {x = 1883.6560780484965, y = 1206.4985992892155},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090042,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090042"
            }
          },
          ["17428991219553149628"] = {
            key = "17428991219553149628",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1600.497624980384, y = 1006.8741641500262},
            propsData = {ModeType = 0}
          },
          ["17428991219553149629"] = {
            key = "17428991219553149629",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3002.872596892958, y = 996.1854147639104},
            propsData = {ModeType = 0}
          },
          ["17428991219553149630"] = {
            key = "17428991219553149630",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2196.6184837669894, y = 1206.446970650109},
            propsData = {}
          },
          ["17428991219553149631"] = {
            key = "17428991219553149631",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\167\166\230\145\184\231\159\179\231\162\145",
            pos = {x = 2126.09475094491, y = 785.1503628925764},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Investigate_2090048",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12020427,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_12020427",
              BlendInTime = 1,
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
                  TalkActorId = 210003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210003}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17428991219553149632"] = {
            key = "17428991219553149632",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186NPC",
            pos = {x = 1877.332846183006, y = 797.1503628925764},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090048}
            }
          },
          ["17428991219553149633"] = {
            key = "17428991219553149633",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186NPC",
            pos = {x = 2381.9360207861805, y = 794.3884581306714},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090048}
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149558"] = {
      isStoryNode = true,
      key = "17428991219543149558",
      type = "StoryNode",
      name = "\233\146\159\229\163\176\229\147\141\232\181\183",
      pos = {x = 2359.824409052685, y = 675.4177119536521},
      propsData = {
        QuestId = 12020111,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_11",
        QuestDeatil = "Content_120201_11",
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
        SubRegionId = 104503,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020111hezi_2010015"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149638",
            startPort = "Out",
            endQuest = "17428991219553149635",
            endPort = "Success"
          },
          {
            startQuest = "17428991219553149634",
            startPort = "QuestStart",
            endQuest = "17497376213063203",
            endPort = "Input"
          },
          {
            startQuest = "17497376213063203",
            startPort = "Out",
            endQuest = "17428991219553149638",
            endPort = "In"
          }
        },
        nodeData = {
          ["17428991219553149634"] = {
            key = "17428991219553149634",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2519.7728133935034, y = 867.1774776947192},
            propsData = {ModeType = 0}
          },
          ["17428991219553149635"] = {
            key = "17428991219553149635",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3434.7552447552443, y = 845.1539743781124},
            propsData = {ModeType = 0}
          },
          ["17428991219553149636"] = {
            key = "17428991219553149636",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3632.690884827317, y = 1061.1824682064564},
            propsData = {}
          },
          ["17428991219553149638"] = {
            key = "17428991219553149638",
            type = "TalkNode",
            name = "\231\171\153\230\161\169-\233\146\159\229\163\176\229\147\141\232\181\183",
            pos = {x = 3163.1056341577123, y = 850.1006907260655},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020111",
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
              EndNewTargetPointName = "QuestPoint_YushengTalkEP",
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
                  TalkActorId = 210003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210033,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210003},
                {TalkActorType = "Npc", TalkActorId = 210033}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749730650953937409"] = {
            key = "1749730650953937409",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2861.5849571450253, y = 1003.8721024398942},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010015,
              GuideType = "M",
              GuidePointName = "Mechanism_12020111hezi_2010015"
            }
          },
          ["17497376213063203"] = {
            key = "17497376213063203",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 2866.6904761904766, y = 839.8519014406111},
            propsData = {
              ResourceType = "Resource",
              ResourceId = -1,
              ResourceSType = "None",
              NeedCount = 0,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149559"] = {
      isStoryNode = true,
      key = "17428991219543149559",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1803, y = 295.8333333333333},
      propsData = {QuestChainId = 120201},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17428991219543149560"] = {
      isStoryNode = true,
      key = "17428991219543149560",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2920.9791278170833, y = 699.2071174363733},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17428991219543149561"] = {
      isStoryNode = true,
      key = "17428991219543149561",
      type = "StoryNode",
      name = "\229\183\165\233\128\160\229\177\128",
      pos = {x = 2079.0367693244484, y = 675.6766940933425},
      propsData = {
        QuestId = 12020110,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_10",
        QuestDeatil = "Content_120201_10",
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
        SubRegionId = 104503,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020110gongzaoju_2010012"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149639",
            startPort = "PassiveFail",
            endQuest = "17428991219553149640",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149639",
            startPort = "Fail",
            endQuest = "17428991219553149641",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149642",
            startPort = "Out",
            endQuest = "17428991219553149639",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149643",
            startPort = "QuestStart",
            endQuest = "17428991219553149646",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149647",
            startPort = "Out",
            endQuest = "17428991219553149648",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149648",
            startPort = "Out",
            endQuest = "17428991219553149642",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149646",
            startPort = "Out",
            endQuest = "174971787257915979032",
            endPort = "In"
          },
          {
            startQuest = "174971787257915979032",
            startPort = "Out",
            endQuest = "17428928965942446103",
            endPort = "In"
          },
          {
            startQuest = "174971787257915979032",
            startPort = "Out",
            endQuest = "174971850902016906685",
            endPort = "In"
          },
          {
            startQuest = "174971787257915979032",
            startPort = "Out",
            endQuest = "174971850887716906678",
            endPort = "In"
          },
          {
            startQuest = "17428928965942446103",
            startPort = "Out",
            endQuest = "174971854723216907035",
            endPort = "Branch_1"
          },
          {
            startQuest = "174971850902016906685",
            startPort = "Out",
            endQuest = "174971854723216907035",
            endPort = "Branch_2"
          },
          {
            startQuest = "174971850887716906678",
            startPort = "Out",
            endQuest = "174971854723216907035",
            endPort = "Branch_3"
          },
          {
            startQuest = "174971854723216907035",
            startPort = "Out",
            endQuest = "17428929789682446437",
            endPort = "In"
          },
          {
            startQuest = "17428929789682446437",
            startPort = "Out",
            endQuest = "1749730616128936901",
            endPort = "In"
          },
          {
            startQuest = "1749730616128936901",
            startPort = "Out",
            endQuest = "17428991219553149644",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17428928965942446103"] = {
            key = "17428928965942446103",
            type = "TalkNode",
            name = "\231\153\189\229\142\187\230\139\191\228\184\156\232\165\191",
            pos = {x = 1567.5864320461772, y = 809.5351693731999},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100001,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_12020110npc1_2010014",
              DelayShowGuideTime = 0,
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
          },
          ["17428929789682446437"] = {
            key = "17428929789682446437",
            type = "TalkNode",
            name = "npc\229\175\185\232\175\157\232\128\129\229\164\167\231\136\183\232\174\178\230\149\133\228\186\139",
            pos = {x = 2095.341950919178, y = 924.2165448043746},
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
          },
          ["17428991219553149639"] = {
            key = "17428991219553149639",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2048.553767102237, y = 600.7903883215406},
            propsData = {SpecialConfigId = 2004, BlackScreenImmediately = false}
          },
          ["17428991219553149640"] = {
            key = "17428991219553149640",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2403.774925410368, y = 718.7921020214812},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_HeilangSP",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17428991219553149641"] = {
            key = "17428991219553149641",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2405.237853895848, y = 569.1992938748631},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_HeilangSP",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17428991219553149642"] = {
            key = "17428991219553149642",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1758.626742784737, y = 604.2973330905495},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090053,
              GuideType = "P",
              GuidePointName = "QuestPoint_Heilang"
            }
          },
          ["17428991219553149643"] = {
            key = "17428991219553149643",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 918.4591844936675, y = 787.4935696487422},
            propsData = {ModeType = 0}
          },
          ["17428991219553149644"] = {
            key = "17428991219553149644",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2443.4427524798766, y = 918.5613869352748},
            propsData = {ModeType = 0}
          },
          ["17428991219553149645"] = {
            key = "17428991219553149645",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2446.3510375222304, y = 1108.6750357056978},
            propsData = {}
          },
          ["17428991219553149646"] = {
            key = "17428991219553149646",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\232\128\129\229\164\167\231\136\183",
            pos = {x = 1213.8300492610838, y = 802.5459770114942},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010012,
              GuideType = "M",
              GuidePointName = "Mechanism_12020110gongzaoju_2010012"
            }
          },
          ["17428991219553149647"] = {
            key = "17428991219553149647",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1197.6688311688313, y = 597.2532467532468},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090083,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090083"
            }
          },
          ["17428991219553149648"] = {
            key = "17428991219553149648",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1478.8928571428573, y = 603},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090084,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090084"
            }
          },
          ["174971787257915979032"] = {
            key = "174971787257915979032",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 1273.629334781264, y = 1000.0886699507389},
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
          ["174971850887716906678"] = {
            key = "174971850887716906678",
            type = "TalkNode",
            name = "\231\153\189\229\142\187\230\139\191\228\184\156\232\165\191",
            pos = {x = 1562.1293347812646, y = 1130.0714285714284},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100001,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_12020110npc1_2010014",
              DelayShowGuideTime = 0,
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
          },
          ["174971850902016906685"] = {
            key = "174971850902016906685",
            type = "TalkNode",
            name = "\231\153\189\229\142\187\230\139\191\228\184\156\232\165\191",
            pos = {x = 1567.8189899536783, y = 957.6372592924315},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100001,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_12020110npc1_2010014",
              DelayShowGuideTime = 0,
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
          },
          ["174971854723216907035"] = {
            key = "174971854723216907035",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 1828.911935349411, y = 925.8128078817734},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["1749730616128936901"] = {
            key = "1749730616128936901",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\139\191\233\166\153\231\130\137",
            pos = {x = 2094.1818667472103, y = 1105.3999596125386},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          }
        },
        commentData = {}
      }
    },
    ["17428991219543149562"] = {
      isStoryNode = true,
      key = "17428991219543149562",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\145\138\231\164\186\230\157\191",
      pos = {x = 2640.7213324004306, y = 673.5871941089566},
      propsData = {
        QuestId = 12020112,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120201_12",
        QuestDeatil = "Content_120201_12",
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
        SubRegionId = 104503,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_guangchang12020112_2010017"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17428991219553149651",
            startPort = "QuestStart",
            endQuest = "17428991219553149655",
            endPort = "In"
          },
          {
            startQuest = "17428991219553149655",
            startPort = "Out",
            endQuest = "17497378010264708",
            endPort = "In"
          },
          {
            startQuest = "17497378010264708",
            startPort = "Out",
            endQuest = "1749737911770935171",
            endPort = "In"
          },
          {
            startQuest = "1749737911770935171",
            startPort = "Out",
            endQuest = "17428991219553149652",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17428991219553149651"] = {
            key = "17428991219553149651",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1399.0691366604412, y = 804.6057111970155},
            propsData = {ModeType = 0}
          },
          ["17428991219553149652"] = {
            key = "17428991219553149652",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2528.5384050184307, y = 806.2664135502317},
            propsData = {ModeType = 0}
          },
          ["17428991219553149653"] = {
            key = "17428991219553149653",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2528.614797870795, y = 1006.3938208634611},
            propsData = {}
          },
          ["17428991219553149655"] = {
            key = "17428991219553149655",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\145\138\231\164\186\230\157\1911",
            pos = {x = 1680.2883590462836, y = 804.3281907433379},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010017,
              GuideType = "M",
              GuidePointName = "Mechanism_guangchang12020112_2010017"
            }
          },
          ["17497378010264708"] = {
            key = "17497378010264708",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\145\138\231\164\186\230\157\1912",
            pos = {x = 1965.608460332344, y = 808.2559907345092},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010016,
              GuideType = "M",
              GuidePointName = "Mechanism_guangchang12020112_2_2010016"
            }
          },
          ["1749737911770935171"] = {
            key = "1749737911770935171",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2244.1867915609105, y = 807.8777218221967},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020112",
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
                  TalkActorId = 0,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749794999146935810"] = {
            key = "1749794999146935810",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\191\153\228\184\170\232\138\130\231\130\185\229\164\135\230\179\168\228\184\128\228\184\139\239\188\140\228\188\160\233\128\129\229\143\152\232\186\171\229\136\187\232\136\159\230\148\190\229\156\168\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 2605.5313774033057, y = 610.3267039669026},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
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
    ["17497107286966504159"] = {
      isStoryNode = true,
      key = "17497107286966504159",
      type = "StoryNode",
      name = "\229\159\142\229\140\186\228\187\139\231\187\141",
      pos = {x = 2639.2465328452668, y = 274.8594915595019},
      propsData = {
        QuestId = 12020113,
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
        SubRegionId = 104501,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12020113_2010002"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17497107286966504160",
            startPort = "QuestStart",
            endQuest = "17497109007616504665",
            endPort = "In"
          },
          {
            startQuest = "17497109007616504665",
            startPort = "Out",
            endQuest = "17497109068996504848",
            endPort = "In"
          },
          {
            startQuest = "17497109068996504848",
            startPort = "Out",
            endQuest = "17497107286966504163",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17497107286966504160"] = {
            key = "17497107286966504160",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 790, y = 301},
            propsData = {ModeType = 0}
          },
          ["17497107286966504163"] = {
            key = "17497107286966504163",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1720, y = 294},
            propsData = {ModeType = 0}
          },
          ["17497107286966504166"] = {
            key = "17497107286966504166",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17497109007616504665"] = {
            key = "17497109007616504665",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1047.695652173913, y = 310.0380434782608},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010002,
              GuideType = "M",
              GuidePointName = "Mechanism_12020113_2010002"
            }
          },
          ["17497109068996504848"] = {
            key = "17497109068996504848",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1382.695652173913, y = 317.0380434782609},
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
    }
  },
  commentData = {}
}
