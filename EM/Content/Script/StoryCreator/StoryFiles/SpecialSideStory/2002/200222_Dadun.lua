return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17393483863623614",
      startPort = "Success",
      endStory = "17393490608795441",
      endPort = "In"
    },
    {
      startStory = "17393490608795441",
      startPort = "Success",
      endStory = "17393490612155479",
      endPort = "In"
    },
    {
      startStory = "17393490612155479",
      startPort = "Success",
      endStory = "17393490614815518",
      endPort = "In"
    },
    {
      startStory = "17393490614815518",
      startPort = "Success",
      endStory = "17266609314465",
      endPort = "StoryEnd"
    },
    {
      startStory = "17266609314451",
      startPort = "StoryStart",
      endStory = "175127146180510460724",
      endPort = "In"
    },
    {
      startStory = "175127146180510460724",
      startPort = "Success",
      endStory = "17393483863623614",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17266609314451"] = {
      isStoryNode = true,
      key = "17266609314451",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 855.0679347826087, y = 292.6766304347826},
      propsData = {QuestChainId = 200222},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17266609314465"] = {
      isStoryNode = true,
      key = "17266609314465",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2310.505357685793, y = 336.1918820310124},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17393483863623614"] = {
      isStoryNode = true,
      key = "17393483863623614",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1206.6939725764053, y = 292.921491556853},
      propsData = {
        QuestId = 20022202,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200222_1",
        QuestDeatil = "Content_200222_1",
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
        SubRegionId = 101701,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_dadun_1720518"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17393483863623615",
            startPort = "QuestStart",
            endQuest = "17393483933813804",
            endPort = "In"
          },
          {
            startQuest = "17393483933813804",
            startPort = "Out",
            endQuest = "17393485560544292",
            endPort = "In"
          },
          {
            startQuest = "17393490415885088",
            startPort = "Out",
            endQuest = "17393483863623618",
            endPort = "Success"
          },
          {
            startQuest = "17393485560544292",
            startPort = "Fail",
            endQuest = "17394283970242157",
            endPort = "In"
          },
          {
            startQuest = "17393485560544292",
            startPort = "Out",
            endQuest = "17394284222952509",
            endPort = "In"
          },
          {
            startQuest = "17394284222952509",
            startPort = "Out",
            endQuest = "17393490415885088",
            endPort = "In"
          },
          {
            startQuest = "17394283970242157",
            startPort = "Out",
            endQuest = "17394285933503589",
            endPort = "In"
          },
          {
            startQuest = "17394285933503589",
            startPort = "Out",
            endQuest = "17393483863623621",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17393483863623615"] = {
            key = "17393483863623615",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17393483863623618"] = {
            key = "17393483863623618",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2229.6634615384614, y = 291.85096153846155},
            propsData = {ModeType = 0}
          },
          ["17393483863623621"] = {
            key = "17393483863623621",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2249.276018099548, y = 528.552036199095},
            propsData = {}
          },
          ["17393483933813804"] = {
            key = "17393483933813804",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1138, y = 312},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720518}
            }
          },
          ["17393485560544292"] = {
            key = "17393485560544292",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1433.7777777777778, y = 309.1111111111111},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700193,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_dadun_1720518",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007908,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["17393490415885088"] = {
            key = "17393490415885088",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1968.8820701357465, y = 280.77988310708906},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720518}
            }
          },
          ["17394283970242157"] = {
            key = "17394283970242157",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1704.519167104647, y = 470.7297490749816},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007914,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
                  TalkActorType = "Npc",
                  TalkActorId = 700069,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700069}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17394284222952509"] = {
            key = "17394284222952509",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1698.715485492142, y = 263.9098390013949},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007915,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
                  TalkActorType = "Npc",
                  TalkActorId = 700069,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700069}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17394285933503589"] = {
            key = "17394285933503589",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1993.8502758449972, y = 509.16478169248063},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720518}
            }
          }
        },
        commentData = {}
      }
    },
    ["17393490608795441"] = {
      isStoryNode = true,
      key = "17393490608795441",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1490.6564086377866, y = 329.3723118197984},
      propsData = {
        QuestId = 20022203,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200222_2",
        QuestDeatil = "Content_200222_2",
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
        SubRegionId = 101701,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_side_dadun_1720517"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17393490608795446",
            startPort = "QuestStart",
            endQuest = "1739349166861259701",
            endPort = "In"
          },
          {
            startQuest = "1739349166861259701",
            startPort = "Out",
            endQuest = "1739349198032512843",
            endPort = "In"
          },
          {
            startQuest = "1739349218129513204",
            startPort = "Out",
            endQuest = "17393490608795447",
            endPort = "Success"
          },
          {
            startQuest = "1739349198032512843",
            startPort = "Out",
            endQuest = "17393515832991022301",
            endPort = "In"
          },
          {
            startQuest = "1739349204570513013",
            startPort = "Out",
            endQuest = "17394382729931278941",
            endPort = "In"
          },
          {
            startQuest = "17394382729931278941",
            startPort = "Out",
            endQuest = "1739349218129513204",
            endPort = "In"
          },
          {
            startQuest = "1739349198032512843",
            startPort = "Out",
            endQuest = "1739349204570513013",
            endPort = "In"
          }
        },
        nodeData = {
          ["17393490608795446"] = {
            key = "17393490608795446",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17393490608795447"] = {
            key = "17393490608795447",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2618.187134502924, y = 297.1345029239766},
            propsData = {ModeType = 0}
          },
          ["17393490608795448"] = {
            key = "17393490608795448",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1739349166861259701"] = {
            key = "1739349166861259701",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1092.9592760180994, y = 288.20361990950227},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720517,
              GuideType = "M",
              GuidePointName = "Mechanism_side_dadun_1720517"
            }
          },
          ["1739349198032512843"] = {
            key = "1739349198032512843",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1349.1943149729527, y = 300.85952437655214},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720520,
                1720521,
                1720522,
                1720523
              }
            }
          },
          ["1739349204570513013"] = {
            key = "1739349204570513013",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1660.032648466085, y = 273.0281452293836},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720520,
                1720521,
                1720522,
                1720523
              }
            }
          },
          ["1739349218129513204"] = {
            key = "1739349218129513204",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2361.1193670450634, y = 290.3873409012727},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007918,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17393515832991022301"] = {
            key = "17393515832991022301",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1561.3276429452903, y = 107.96926602808949},
            propsData = {
              NewDescription = "Description_200222_3",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          },
          ["17394382729931278941"] = {
            key = "17394382729931278941",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1995.0724106811065, y = 298.0070074852685},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    ["17393490612155479"] = {
      isStoryNode = true,
      key = "17393490612155479",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1759.8336057535141, y = 342.98992608958656},
      propsData = {
        QuestId = 20022204,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200222_4",
        QuestDeatil = "Content_200222_3",
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
        SubRegionId = 101701,
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_Drop_dadun_1720516"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17393490612155488",
            startPort = "Out",
            endQuest = "17393490612155485",
            endPort = "Success"
          },
          {
            startQuest = "17393490612155484",
            startPort = "QuestStart",
            endQuest = "1739349267808514170",
            endPort = "In"
          },
          {
            startQuest = "1739349267808514170",
            startPort = "Out",
            endQuest = "1739349273673514290",
            endPort = "In"
          },
          {
            startQuest = "1739349273673514290",
            startPort = "Out",
            endQuest = "17393490612155488",
            endPort = "In"
          }
        },
        nodeData = {
          ["17393490612155484"] = {
            key = "17393490612155484",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 822, y = 224},
            propsData = {ModeType = 0}
          },
          ["17393490612155485"] = {
            key = "17393490612155485",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2130, y = 330},
            propsData = {ModeType = 0}
          },
          ["17393490612155486"] = {
            key = "17393490612155486",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17393490612155488"] = {
            key = "17393490612155488",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1742, y = 230},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007920,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1739349267808514170"] = {
            key = "1739349267808514170",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1132, y = 244},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720516}
            }
          },
          ["1739349273673514290"] = {
            key = "1739349273673514290",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1426, y = 218},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11011,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_Drop_dadun_1720516",
              IsUseCount = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17393490614815518"] = {
      isStoryNode = true,
      key = "17393490614815518",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2032.6803966437838, y = 338.7498093058732},
      propsData = {
        QuestId = 20022205,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200222_5",
        QuestDeatil = "Content_200222_4",
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
        SubRegionId = 101701,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_side_dadun_1720519"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1739349381553767982",
            startPort = "Out",
            endQuest = "1739349430923768232",
            endPort = "In"
          },
          {
            startQuest = "1739349490912769300",
            startPort = "Out",
            endQuest = "1739349449334768487",
            endPort = "In"
          },
          {
            startQuest = "1739349449334768487",
            startPort = "Out",
            endQuest = "1739349487890769231",
            endPort = "In"
          },
          {
            startQuest = "17394382893741279575",
            startPort = "Out",
            endQuest = "1739349527330770138",
            endPort = "In"
          },
          {
            startQuest = "1739349487890769231",
            startPort = "Out",
            endQuest = "17394382893741279575",
            endPort = "In"
          },
          {
            startQuest = "17394428468853324155",
            startPort = "Out",
            endQuest = "17393490614815527",
            endPort = "In"
          },
          {
            startQuest = "1739349527330770138",
            startPort = "Out",
            endQuest = "17395022578201788358",
            endPort = "In"
          },
          {
            startQuest = "17395022578201788358",
            startPort = "Out",
            endQuest = "17393490614815524",
            endPort = "Success"
          },
          {
            startQuest = "17393490614815523",
            startPort = "QuestStart",
            endQuest = "17394428468853324155",
            endPort = "In"
          },
          {
            startQuest = "17393490614815527",
            startPort = "Out",
            endQuest = "1739349490912769300",
            endPort = "In"
          }
        },
        nodeData = {
          ["17393490614815523"] = {
            key = "17393490614815523",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1069.89010989011, y = 262.43956043956047},
            propsData = {ModeType = 0}
          },
          ["17393490614815524"] = {
            key = "17393490614815524",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3619.982608695652, y = 261.82608695652175},
            propsData = {ModeType = 0}
          },
          ["17393490614815525"] = {
            key = "17393490614815525",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17393490614815527"] = {
            key = "17393490614815527",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1655.9254658385094, y = 249.31546256946714},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007921,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1739349381553767982"] = {
            key = "1739349381553767982",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 887.5054945054945, y = 26.142857142857082},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720519,
              GuideType = "M",
              GuidePointName = "Mechanism_side_dadun_1720519"
            }
          },
          ["1739349430923768232"] = {
            key = "1739349430923768232",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1066.6938234179615, y = -106.93626373626381},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720514,
              GuideType = "M",
              GuidePointName = "Mechanism_side_dadun_1720514"
            }
          },
          ["1739349449334768487"] = {
            key = "1739349449334768487",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2168.634482758621, y = 262},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720524,
                1720525,
                1720529,
                1720527,
                1720528
              }
            }
          },
          ["1739349487890769231"] = {
            key = "1739349487890769231",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2456, y = 248},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720524,
                1720525,
                1720529,
                1720527,
                1720528
              }
            }
          },
          ["1739349490912769300"] = {
            key = "1739349490912769300",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1911.7142857142858, y = 252},
            propsData = {
              NewDescription = "Description_200222_6",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          },
          ["1739349527330770138"] = {
            key = "1739349527330770138",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3026.894409937888, y = 233.56521739130434},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007922,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Fixsimple_dadun",
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
                  TalkActorId = 700191,
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
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700191}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17394382893741279575"] = {
            key = "17394382893741279575",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2732.3329816636447, y = 237.44958245415913},
            propsData = {WaitTime = 2}
          },
          ["17394428468853324155"] = {
            key = "17394428468853324155",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1411.6493696235111, y = 265.6464051966342},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720530,
              GuideType = "M",
              GuidePointName = "Mechanism_side_dadun_1720530"
            }
          },
          ["17395022578201788358"] = {
            key = "17395022578201788358",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 3303.3304953560373, y = 268.014705882353},
            propsData = {VarName = "DaDunStage", VarValue = 1}
          }
        },
        commentData = {}
      }
    },
    ["175127146180510460724"] = {
      isStoryNode = true,
      key = "175127146180510460724",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 1035.367316341829, y = 125.93703148425786},
      propsData = {
        QuestId = 20022200,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_NPC_Dadun1_1190264"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175127146180510460728",
            startPort = "QuestStart",
            endQuest = "175127146180510460732",
            endPort = "In"
          },
          {
            startQuest = "175127146180510460732",
            startPort = "Out",
            endQuest = "175127146180510460730",
            endPort = "Input"
          },
          {
            startQuest = "175127146180510460730",
            startPort = "ApproveOut",
            endQuest = "175127146180510460733",
            endPort = "In"
          },
          {
            startQuest = "175127146180510460733",
            startPort = "Out",
            endQuest = "175127146180510460729",
            endPort = "Success"
          },
          {
            startQuest = "175127146180510460730",
            startPort = "CancelOut",
            endQuest = "175127146180510460731",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["175127146180510460728"] = {
            key = "175127146180510460728",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 840.5882352941177, y = 261.1764705882353},
            propsData = {ModeType = 0}
          },
          ["175127146180510460729"] = {
            key = "175127146180510460729",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2250.9340659340655, y = 227.63736263736263},
            propsData = {ModeType = 0}
          },
          ["175127146180510460730"] = {
            key = "175127146180510460730",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1565.3277310924368, y = 243.65546218487395},
            propsData = {
              SideQuestChainId = 200222,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["175127146180510460731"] = {
            key = "175127146180510460731",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2187.321589380413, y = 431.8021723904078},
            propsData = {}
          },
          ["175127146180510460732"] = {
            key = "175127146180510460732",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1188.8975957628709, y = 254.11356006422432},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700069,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_NPC_Dadun1_1190264",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007902,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["175127146180510460733"] = {
            key = "175127146180510460733",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1939.2986652815878, y = 221.62692904818144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007904,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
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
