return {
  storyName = "\229\155\158\230\141\174\231\130\185",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991237123234482",
      startPort = "StoryStart",
      endStory = "17141991237123234484",
      endPort = "In"
    },
    {
      startStory = "story_168500150638414",
      startPort = "Success",
      endStory = "story_1687149301525822",
      endPort = "In"
    },
    {
      startStory = "17141991237123234484",
      startPort = "Success",
      endStory = "171939979544412877",
      endPort = "In"
    },
    {
      startStory = "171939979544412877",
      startPort = "Success",
      endStory = "story_168500150638414",
      endPort = "In"
    },
    {
      startStory = "story_1687149301525822",
      startPort = "Success",
      endStory = "17194029896931769257",
      endPort = "In"
    },
    {
      startStory = "17194029896931769257",
      startPort = "Success",
      endStory = "17141991237123234483",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_168500150638414 = {
      isStoryNode = true,
      key = "story_168500150638414",
      type = "StoryNode",
      name = "\229\155\158\230\141\174\231\130\185",
      pos = {x = 893.418893861095, y = 131.56860325525375},
      propsData = {
        QuestId = 20010103,
        QuestDescriptionComment = "\232\191\148\229\155\158\230\141\174\231\130\185",
        QuestDescription = "Description_200101_3",
        QuestDeatil = "Content_200101_3",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
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
            startQuest = "1719399822764159295",
            startPort = "Out",
            endQuest = "quest_168500150638420",
            endPort = "Success"
          },
          {
            startQuest = "17349427252613272",
            startPort = "Out",
            endQuest = "1719399822764159295",
            endPort = "In"
          },
          {
            startQuest = "quest_168500150638418",
            startPort = "QuestStart",
            endQuest = "17466889943015936",
            endPort = "In"
          },
          {
            startQuest = "17466889943015936",
            startPort = "Out",
            endQuest = "17349427252613272",
            endPort = "In"
          }
        },
        nodeData = {
          quest_168500150638418 = {
            key = "quest_168500150638418",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -11.111111111111128, y = 142.22222222222223},
            propsData = {ModeType = 0}
          },
          quest_168500150638420 = {
            key = "quest_168500150638420",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          quest_168500150638422 = {
            key = "quest_168500150638422",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1719399822764159295"] = {
            key = "1719399822764159295",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 NPC",
            pos = {x = 847.0768410704843, y = 136.61938306089263},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190151}
            }
          },
          ["17349427252613272"] = {
            key = "17349427252613272",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 532.4444444444443, y = 138},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["17466889943015936"] = {
            key = "17466889943015936",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 268.2639437856831, y = 131.91414141414143},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          }
        },
        commentData = {}
      }
    },
    story_1687149301525822 = {
      isStoryNode = true,
      key = "story_1687149301525822",
      type = "StoryNode",
      name = "\233\148\187\233\128\160\229\144\142\232\135\170\229\138\168\232\191\155\229\175\185\232\175\157\229\174\140\230\136\144\239\188\136\231\155\174\229\137\141\230\151\160\233\148\187\233\128\160\239\188\137",
      pos = {x = 348.9795582478554, y = 325.6586878974306},
      propsData = {
        QuestId = 20010104,
        QuestDescriptionComment = "\229\142\187\231\156\139\231\156\139\233\147\129\229\140\160\231\154\142\231\154\142",
        QuestDescription = "Description_200101_4_0",
        QuestDeatil = "Content_200101_4",
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
            startQuest = "quest_168500150871928",
            startPort = "QuestStart",
            endQuest = "quest_1687149389274860",
            endPort = "In"
          },
          {
            startQuest = "17482677101146042423",
            startPort = "Out",
            endQuest = "quest_168500150871930",
            endPort = "Success"
          },
          {
            startQuest = "quest_1687149389274860",
            startPort = "Out",
            endQuest = "1753439904414348760",
            endPort = "In"
          },
          {
            startQuest = "17536735624651001000",
            startPort = "Out",
            endQuest = "17482677101146042423",
            endPort = "In"
          },
          {
            startQuest = "1753439904414348760",
            startPort = "Out",
            endQuest = "17536917548511001228",
            endPort = "In"
          },
          {
            startQuest = "17536917548511001228",
            startPort = "false",
            endQuest = "1753442504350349957",
            endPort = "Input"
          },
          {
            startQuest = "17536917548511001228",
            startPort = "true",
            endQuest = "17536735624651001000",
            endPort = "Branch_1"
          },
          {
            startQuest = "1753442504350349957",
            startPort = "Out",
            endQuest = "17536941129641005386",
            endPort = "In"
          },
          {
            startQuest = "17536941129641005386",
            startPort = "Out",
            endQuest = "17536735624651001000",
            endPort = "Branch_1"
          },
          {
            startQuest = "1753439904414348760",
            startPort = "Out",
            endQuest = "17536940326501004027",
            endPort = "In"
          },
          {
            startQuest = "17536940326501004027",
            startPort = "true",
            endQuest = "17536735624651001000",
            endPort = "Branch_2"
          },
          {
            startQuest = "17536940326501004027",
            startPort = "false",
            endQuest = "1753442514601350199",
            endPort = "Input"
          },
          {
            startQuest = "1753442514601350199",
            startPort = "Out",
            endQuest = "17536941800271007687",
            endPort = "In"
          },
          {
            startQuest = "17536941800271007687",
            startPort = "Out",
            endQuest = "17536735624651001000",
            endPort = "Branch_2"
          }
        },
        nodeData = {
          quest_168500150871928 = {
            key = "quest_168500150871928",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -535.331411396214, y = 45.66457566739655},
            propsData = {ModeType = 0}
          },
          quest_168500150871930 = {
            key = "quest_168500150871930",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1934.2690763471157, y = 24.039198879914437},
            propsData = {ModeType = 0}
          },
          quest_168500150871932 = {
            key = "quest_168500150871932",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1769.6438691843396, y = 434.18803342928095},
            propsData = {}
          },
          quest_1687149389274860 = {
            key = "quest_1687149389274860",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\230\141\174\231\130\185",
            pos = {x = -235.7, y = 65.14999999999999},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "200006Point1"
            }
          },
          quest_1687149628473991 = {
            key = "quest_1687149628473991",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 127.6, y = -215.20000000000002},
            propsData = {WaitTime = 1}
          },
          ["17016591378622122"] = {
            key = "17016591378622122",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = -222.50151888061419, y = -441.04129794089596},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 40001,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "200006Point1"
            }
          },
          ["17482677101146042423"] = {
            key = "17482677101146042423",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1673.4593597479254, y = 29.65053491230313},
            propsData = {WaitTime = 1}
          },
          ["1753439904414348760"] = {
            key = "1753439904414348760",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 94.73064844434145, y = 59.076792336479514},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_200101_4_1",
                  TargetBranchQuestKey = "1753442504350349957"
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "Description_200101_4_2",
                  TargetBranchQuestKey = "1753442514601350199"
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["1753442504350349957"] = {
            key = "1753442504350349957",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 729.1705354447898, y = -74.38000529852327},
            propsData = {
              ResourceType = "Weapon",
              ResourceId = 20503,
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "200006Point1"
            }
          },
          ["1753442514601350199"] = {
            key = "1753442514601350199",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 753.7181470639747, y = 243.2400191586911},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 40003,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "200006Point1"
            }
          },
          ["17536735624651001000"] = {
            key = "17536735624651001000",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 1408.5471046159275, y = 8.454268326324964},
            propsData = {
              InputBranchQuestNumber = 2,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["17536917548511001228"] = {
            key = "17536917548511001228",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "1\228\184\186\229\183\178\233\148\187\233\128\160\239\188\1400\228\184\186\230\156\170\233\148\187\233\128\160",
            pos = {x = 409.4764286289258, y = -304.6910628415909},
            propsData = {
              FunctionName = "Equal",
              VarName = "ForgePenhuo",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17536940326501004027"] = {
            key = "17536940326501004027",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "1\228\184\186\229\183\178\233\148\187\233\128\160\239\188\1400\228\184\186\230\156\170\233\148\187\233\128\160",
            pos = {x = 403.9690017497096, y = 115.81566241561069},
            propsData = {
              FunctionName = "Equal",
              VarName = "ForgeDanyao",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17536941129641005386"] = {
            key = "17536941129641005386",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 972.1748181697401, y = -17.154766772493822},
            propsData = {
              VarName = "ForgePenhuo",
              VarValue = 1
            }
          },
          ["17536941800271007687"] = {
            key = "17536941800271007687",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1028.2501428656508, y = 245.21703899334557},
            propsData = {
              VarName = "ForgeDanyao",
              VarValue = 1
            }
          }
        },
        commentData = {}
      }
    },
    story_1693462537490110 = {
      isStoryNode = true,
      key = "story_1693462537490110",
      type = "StoryNode",
      name = "\229\188\185\228\187\187\229\138\161\229\138\168\230\149\136\239\188\140\229\146\140\233\147\129\229\140\160\229\175\185\232\175\157",
      pos = {x = 478.0849378881987, y = -150.7714285714286},
      propsData = {
        QuestId = 20010102,
        QuestDescriptionComment = "\231\156\139\231\156\139\229\143\171\228\189\143\232\135\170\229\183\177\231\154\132\228\186\186",
        QuestDescription = "Description_200101_2",
        QuestDeatil = "Content_200101_2",
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
            startQuest = "1704175979493220478",
            startPort = "QuestStart",
            endQuest = "quest_168507084274974",
            endPort = "In"
          },
          {
            startQuest = "quest_168507084274974",
            startPort = "Out",
            endQuest = "1704175979493220479",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_168507084274974 = {
            key = "quest_168507084274974",
            type = "TalkNode",
            name = "Npc\229\175\185\232\175\157\232\138\130\231\130\185 \228\184\142\233\147\129\229\140\160\228\186\164\228\186\146Fix200005",
            pos = {x = 494.4728085721299, y = 151.30136762352586},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200024,
              GuideUIEnable = 20000501,
              GuideType = "N",
              GuidePointName = "Npc_200005DuanzaoTiejiang_1190151",
              DelayShowGuideTime = 0,
              FirstDialogueId = 20000501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200005",
              BlendInTime = 0.5,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175979493220478"] = {
            key = "1704175979493220478",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -127, y = 171},
            propsData = {ModeType = 0}
          },
          ["1704175979493220479"] = {
            key = "1704175979493220479",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175979493220480"] = {
            key = "1704175979493220480",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["17016594559924892"] = {
      isStoryNode = true,
      key = "17016594559924892",
      type = "StoryNode",
      name = "\233\148\187\233\128\160\229\144\142\232\135\170\229\138\168\232\191\155\229\175\185\232\175\157\229\174\140\230\136\144\239\188\136\231\155\174\229\137\141\230\151\160\233\148\187\233\128\160\239\188\137",
      pos = {x = 789.0981242895039, y = -124.24495073891615},
      propsData = {
        QuestId = 20010105,
        QuestDescriptionComment = "\229\142\187\231\156\139\231\156\139\233\147\129\229\140\160\231\154\142\231\154\142",
        QuestDescription = "Description_200101_4",
        QuestDeatil = "Content_200101_4",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = false,
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
            startQuest = "quest_168500369376063",
            startPort = "Out",
            endQuest = "1704175979493220482",
            endPort = "Success"
          },
          {
            startQuest = "1704175979493220481",
            startPort = "QuestStart",
            endQuest = "1704175979493220484",
            endPort = "In"
          },
          {
            startQuest = "1704175979493220484",
            startPort = "Out",
            endQuest = "quest_168500369376063",
            endPort = "In"
          },
          {
            startQuest = "17194029779911623525",
            startPort = "Option_1",
            endQuest = "17194029779911623526",
            endPort = "In"
          },
          {
            startQuest = "17194029779911623525",
            startPort = "Option_2",
            endQuest = "17194029779911623527",
            endPort = "In"
          }
        },
        nodeData = {
          quest_168500369376063 = {
            key = "quest_168500369376063",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 177.776143584775, y = 33.551988113800206},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200006",
              BlendInTime = 0.3,
              BlendOutTime = 0.3,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175979493220481"] = {
            key = "1704175979493220481",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -410.6439113962139, y = 45.66457566739655},
            propsData = {ModeType = 0}
          },
          ["1704175979493220482"] = {
            key = "1704175979493220482",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175979493220483"] = {
            key = "1704175979493220483",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175979493220484"] = {
            key = "1704175979493220484",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -148.2, y = 61.39999999999999},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1704175979493220485"] = {
            key = "1704175979493220485",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 127.6, y = -215.20000000000002},
            propsData = {WaitTime = 1}
          },
          ["17194029779911623525"] = {
            key = "17194029779911623525",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 266.9176299130705, y = 277.0389452616531},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200006",
              BlendInTime = 0.3,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200024,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {
                {
                  OptionText = "200006151",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "200006152",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17194029779911623526"] = {
            key = "17194029779911623526",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 565.833195438166, y = 189.1414796830058},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000616,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20000616",
              BlendInTime = 0,
              BlendOutTime = 0.3,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200024,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17194029779911623527"] = {
            key = "17194029779911623527",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 547.2755031304738, y = 367.98763352915967},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000618,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20000616",
              BlendInTime = 0,
              BlendOutTime = 0.3,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200024,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
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
    ["17141991237123234482"] = {
      isStoryNode = true,
      key = "17141991237123234482",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 99, y = 140},
      propsData = {QuestChainId = 200101},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991237123234483"] = {
      isStoryNode = true,
      key = "17141991237123234483",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1176, y = 176},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991237123234484"] = {
      isStoryNode = true,
      key = "17141991237123234484",
      type = "StoryNode",
      name = "\233\151\168\233\153\132\232\191\145\229\136\183\233\147\129\229\140\160\227\128\129\230\146\173\229\188\128\232\189\166",
      pos = {x = 352.35, y = 142.2},
      propsData = {
        QuestId = 20010101,
        QuestDescriptionComment = "\229\165\189\229\131\143\230\156\137\228\187\128\228\185\136\228\186\186",
        QuestDescription = "Description_200101_1",
        QuestDeatil = "Content_200101_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "UI_TELEPORTPOINT_NAME_101101_1",
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
            startQuest = "17141991237123234485",
            startPort = "QuestStart",
            endQuest = "17141991237123234489",
            endPort = "In"
          },
          {
            startQuest = "17141991237123234489",
            startPort = "Out",
            endQuest = "17141991237123234488",
            endPort = "In"
          },
          {
            startQuest = "17141991237123234488",
            startPort = "Out",
            endQuest = "quest_169345056987494",
            endPort = "In"
          },
          {
            startQuest = "quest_169345056987494",
            startPort = "Out",
            endQuest = "quest_168507126927673",
            endPort = "In"
          },
          {
            startQuest = "quest_169345056987494",
            startPort = "Out",
            endQuest = "17174923500492107",
            endPort = "In"
          },
          {
            startQuest = "17174923500492107",
            startPort = "Out",
            endQuest = "17141991237123234486",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_168507126927673 = {
            key = "quest_168507126927673",
            type = "TalkNode",
            name = "\230\151\160\229\164\180\229\131\143\229\188\128\232\189\166200007",
            pos = {x = 949.9665071770335, y = -41.014311712657545},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_169345056987494 = {
            key = "quest_169345056987494",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 661.4, y = 174},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190078,
              GuideType = "M",
              GuidePointName = "Mechanism_200005QuestTrigger_1190078"
            }
          },
          ["17141991237123234485"] = {
            key = "17141991237123234485",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -127, y = 171},
            propsData = {ModeType = 0}
          },
          ["17141991237123234486"] = {
            key = "17141991237123234486",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["17141991237123234487"] = {
            key = "17141991237123234487",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17141991237123234488"] = {
            key = "17141991237123234488",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 NPC",
            pos = {x = 354.24362399053666, y = 168.6152284619033},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190151}
            }
          },
          ["17141991237123234489"] = {
            key = "17141991237123234489",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 106.8, y = 164},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          },
          ["17174923500492107"] = {
            key = "17174923500492107",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1034.1050637958529, y = 166.95944406470733},
            propsData = {WaitTime = 0.2}
          }
        },
        commentData = {}
      }
    },
    ["171939979544412877"] = {
      isStoryNode = true,
      key = "171939979544412877",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 630.7871585308017, y = 135.7906065742214},
      propsData = {
        QuestId = 20010102,
        QuestDescriptionComment = "\231\156\139\231\156\139\229\143\171\228\189\143\232\135\170\229\183\177\231\154\132\228\186\186",
        QuestDescription = "Description_200101_2",
        QuestDeatil = "Content_200101_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "UI_TELEPORTPOINT_NAME_101101_1",
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
            startQuest = "171939979746913006",
            startPort = "Out",
            endQuest = "171939979544512881",
            endPort = "Success"
          },
          {
            startQuest = "171939979746913007",
            startPort = "Out",
            endQuest = "171939979544512881",
            endPort = "Success"
          },
          {
            startQuest = "171939979746913010",
            startPort = "Option_1",
            endQuest = "171939979746913004",
            endPort = "In"
          },
          {
            startQuest = "171939979746913010",
            startPort = "Option_2",
            endQuest = "171939979746913005",
            endPort = "In"
          },
          {
            startQuest = "171939979746913004",
            startPort = "Option_1",
            endQuest = "171939979746913006",
            endPort = "In"
          },
          {
            startQuest = "171939979746913004",
            startPort = "Option_2",
            endQuest = "171939979746913007",
            endPort = "In"
          },
          {
            startQuest = "171939979746913005",
            startPort = "Option_2",
            endQuest = "1719903468776154264",
            endPort = "In"
          },
          {
            startQuest = "171939979746913005",
            startPort = "Option_1",
            endQuest = "1719903471793154386",
            endPort = "In"
          },
          {
            startQuest = "1719903471793154386",
            startPort = "Out",
            endQuest = "171939979544512881",
            endPort = "Success"
          },
          {
            startQuest = "1719903468776154264",
            startPort = "Out",
            endQuest = "171939979544512881",
            endPort = "Success"
          },
          {
            startQuest = "171939979544412878",
            startPort = "QuestStart",
            endQuest = "17466889769425285",
            endPort = "In"
          },
          {
            startQuest = "17466889769425285",
            startPort = "Out",
            endQuest = "171939979746913010",
            endPort = "In"
          }
        },
        nodeData = {
          ["171939979544412878"] = {
            key = "171939979544412878",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 544.5714285714286, y = 303.42857142857144},
            propsData = {ModeType = 0}
          },
          ["171939979544512881"] = {
            key = "171939979544512881",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171939979544512884"] = {
            key = "171939979544512884",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171939979746913004"] = {
            key = "171939979746913004",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1364.7652573027017, y = 166.53483456844936},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000508,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {
                {
                  OptionText = "200005261",
                  PlusId = 1001,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "200005262",
                  PlusId = 1003,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["171939979746913005"] = {
            key = "171939979746913005",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1388.6923828087747, y = 418.88012086110405},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000509,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {
                {
                  OptionText = "200005261",
                  PlusId = 1001,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "200005262",
                  PlusId = 1003,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["171939979746913006"] = {
            key = "171939979746913006",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1667.9300325627387, y = 57.79610107971587},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000533,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171939979746913007"] = {
            key = "171939979746913007",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1665.622340255046, y = 264.3345626181775},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000528,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171939979746913010"] = {
            key = "171939979746913010",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1107.087507942088, y = 275.22582207064954},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200024,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_200005DuanzaoTiejiang_1190151",
              DelayShowGuideTime = 0,
              FirstDialogueId = 20000501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {
                {
                  OptionText = "2000050601",
                  PlusId = 1002,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "2000050602",
                  PlusId = 1005,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1719903468776154264"] = {
            key = "1719903468776154264",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1682.5263157894735, y = 587.3684210526316},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000528,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1719903471793154386"] = {
            key = "1719903471793154386",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1674.6315789473683, y = 432.63157894736827},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000533,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200005",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200024},
                {TalkActorType = "Npc", TalkActorId = 200025}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17466889769425285"] = {
            key = "17466889769425285",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 827.909986565159, y = 298.97828034034933},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          }
        },
        commentData = {}
      }
    },
    ["17194029896931769257"] = {
      isStoryNode = true,
      key = "17194029896931769257",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 645.1254126756182, y = 327.31455660608276},
      propsData = {
        QuestId = 20010105,
        QuestDescriptionComment = "\229\142\187\231\156\139\231\156\139\233\147\129\229\140\160\231\154\142\231\154\142",
        QuestDescription = "Description_200101_4",
        QuestDeatil = "Content_200101_4",
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
            startQuest = "17421920869363642",
            startPort = "Out",
            endQuest = "17194029896931769261",
            endPort = "Success"
          },
          {
            startQuest = "17194030419601770673",
            startPort = "Out",
            endQuest = "17421920869363642",
            endPort = "In"
          },
          {
            startQuest = "17194029896931769258",
            startPort = "QuestStart",
            endQuest = "17466889052394173",
            endPort = "In"
          },
          {
            startQuest = "17466889052394173",
            startPort = "Out",
            endQuest = "17194030419601770673",
            endPort = "In"
          }
        },
        nodeData = {
          ["17194029896931769258"] = {
            key = "17194029896931769258",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 418, y = 306},
            propsData = {ModeType = 0}
          },
          ["17194029896931769261"] = {
            key = "17194029896931769261",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2104.285714285714, y = 295.7142857142857},
            propsData = {ModeType = 0}
          },
          ["17194029896931769264"] = {
            key = "17194029896931769264",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17194030419601770673"] = {
            key = "17194030419601770673",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1330.4326675070556, y = 284.04082496090143},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000601,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_200006",
              BlendInTime = 0.3,
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
                  TalkActorId = 200024,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17194030419601770674"] = {
            key = "17194030419601770674",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1498.157756841675, y = 108.8417720806668},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000619,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20000616",
              BlendInTime = 0,
              BlendOutTime = 0.3,
              InType = "BlendIn",
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
              TalkActors = {},
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17194030419601770675"] = {
            key = "17194030419601770675",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1441.822286756205, y = 435.46570370459847},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000618,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20000616",
              BlendInTime = 0,
              BlendOutTime = 0.3,
              InType = "BlendIn",
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
              TalkActors = {},
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200024}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17421920869363642"] = {
            key = "17421920869363642",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1837.7142857142853, y = 296.00000000000006},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["17466889052394173"] = {
            key = "17466889052394173",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\230\141\174\231\130\185",
            pos = {x = 916.7214285714283, y = 286.0714285714286},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "200006Point1"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
