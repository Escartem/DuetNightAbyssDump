return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17527196648361260296",
      startPort = "StoryStart",
      endStory = "17527196648361260299",
      endPort = "In"
    },
    {
      startStory = "17527196648361260299",
      startPort = "Success",
      endStory = "17527196648361260298",
      endPort = "In"
    },
    {
      startStory = "17527196648361260298",
      startPort = "Success",
      endStory = "17526690107823111",
      endPort = "In"
    },
    {
      startStory = "17526690107823111",
      startPort = "Success",
      endStory = "17526690155513311",
      endPort = "In"
    },
    {
      startStory = "17526690155513311",
      startPort = "Success",
      endStory = "17526690222653616",
      endPort = "In"
    },
    {
      startStory = "17526690222653616",
      startPort = "Success",
      endStory = "17526690272133868",
      endPort = "In"
    },
    {
      startStory = "17526690272133868",
      startPort = "Success",
      endStory = "17526690292964001",
      endPort = "In"
    },
    {
      startStory = "17526690292964001",
      startPort = "Success",
      endStory = "17526690329524169",
      endPort = "In"
    },
    {
      startStory = "17526690329524169",
      startPort = "Success",
      endStory = "17526690358164345",
      endPort = "In"
    },
    {
      startStory = "17526690358164345",
      startPort = "Success",
      endStory = "17526690390324518",
      endPort = "In"
    },
    {
      startStory = "17526690390324518",
      startPort = "Success",
      endStory = "17527196648361260297",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17526690107823111"] = {
      isStoryNode = true,
      key = "17526690107823111",
      type = "StoryNode",
      name = "\228\186\164\228\186\146\229\175\185\232\175\157",
      pos = {x = 1578.475, y = 380.1571428571428},
      propsData = {
        QuestId = 20030402,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_3",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_LiHuan_2090160"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17526690107823112",
            startPort = "QuestStart",
            endQuest = "17528320403981286393",
            endPort = "In"
          },
          {
            startQuest = "17528320403981286393",
            startPort = "Fail",
            endQuest = "17526690107823118",
            endPort = "Fail"
          },
          {
            startQuest = "17528320403981286393",
            startPort = "Out",
            endQuest = "17528319166051284208",
            endPort = "In"
          },
          {
            startQuest = "17528319166051284208",
            startPort = "Out",
            endQuest = "17526690107823115",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690107823112"] = {
            key = "17526690107823112",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1306.0526315789473, y = 314.3233082706767},
            propsData = {ModeType = 0}
          },
          ["17526690107823115"] = {
            key = "17526690107823115",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17526690107823118"] = {
            key = "17526690107823118",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17528319166051284208"] = {
            key = "17528319166051284208",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2395.71248106226, y = 326.74599652153796},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_LiHuan_2090160",
              StaticCreatorIdList = {
                2090158,
                2090159,
                2090160
              }
            }
          },
          ["17528320403981286393"] = {
            key = "17528320403981286393",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1720.9057177772356, y = 322.4602822358237},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700328,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_LiHuan_2090160",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51104031,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20030402",
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
                  TalkActorId = 700328,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700332,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700324,
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
                {TalkActorType = "Npc", TalkActorId = 700328},
                {TalkActorType = "Npc", TalkActorId = 700332},
                {TalkActorType = "Npc", TalkActorId = 700324},
                {TalkActorType = "Npc", TalkActorId = 100001}
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
    ["17526690155513311"] = {
      isStoryNode = true,
      key = "17526690155513311",
      type = "StoryNode",
      name = "\229\175\187\232\183\175",
      pos = {x = 1889.3249999999998, y = 375.44603174603174},
      propsData = {
        QuestId = 20030403,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_4",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090244"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17526690155513312",
            startPort = "QuestStart",
            endQuest = "17530680107271289689",
            endPort = "In"
          },
          {
            startQuest = "17530680107271289689",
            startPort = "Out",
            endQuest = "17530679921451289397",
            endPort = "In"
          },
          {
            startQuest = "17530679921451289397",
            startPort = "Out",
            endQuest = "17530680683581290822",
            endPort = "In"
          },
          {
            startQuest = "17530680683581290822",
            startPort = "Out",
            endQuest = "17526690155523315",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690155513312"] = {
            key = "17526690155513312",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1026.8461538461538, y = 252},
            propsData = {ModeType = 0}
          },
          ["17526690155523315"] = {
            key = "17526690155523315",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2208.076923076923, y = 259.61538461538464},
            propsData = {ModeType = 0}
          },
          ["17526690155523318"] = {
            key = "17526690155523318",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2301.5384615384614, y = 436.9230769230769},
            propsData = {}
          },
          ["17530679921451289397"] = {
            key = "17530679921451289397",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1677.4615384615383, y = 260.6153846153846},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090244,
              GuideType = "M",
              GuidePointName = "Mechanism_2090244"
            }
          },
          ["17530680107271289689"] = {
            key = "17530680107271289689",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1350.9230769230767, y = 251.3846153846154},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Mechanism_2090244",
              StaticCreatorIdList = {2090244}
            }
          },
          ["17530680683581290822"] = {
            key = "17530680683581290822",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1929.3846153846152, y = 269.8461538461539},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Mechanism_2090244",
              StaticCreatorIdList = {2090244}
            }
          }
        },
        commentData = {}
      }
    },
    ["17526690222653616"] = {
      isStoryNode = true,
      key = "17526690222653616",
      type = "StoryNode",
      name = "\230\136\152\230\150\151",
      pos = {x = 2197.7250000000004, y = 375.4857142857143},
      propsData = {
        QuestId = 20030404,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_5",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090230"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17528323294851288976",
            startPort = "Out",
            endQuest = "17528323122291288661",
            endPort = "In"
          },
          {
            startQuest = "17526690222653617",
            startPort = "QuestStart",
            endQuest = "1753340702521333162",
            endPort = "In"
          },
          {
            startQuest = "1753340702521333162",
            startPort = "Success",
            endQuest = "17526690222653620",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690222653617"] = {
            key = "17526690222653617",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 785.6216216216217, y = 408.81081081081084},
            propsData = {ModeType = 0}
          },
          ["17526690222653620"] = {
            key = "17526690222653620",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1612.5387968613775, y = 394.2432432432432},
            propsData = {ModeType = 0}
          },
          ["17526690222653623"] = {
            key = "17526690222653623",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17528323122291288661"] = {
            key = "17528323122291288661",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1484.569124423963, y = -52.49539170506915},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = true,
              GuideType = "N",
              GuideName = "Monster_BiAn_2090161",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {2090161, 2090162}
            }
          },
          ["17528323294851288976"] = {
            key = "17528323294851288976",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1197.0668202764978, y = -62.269585253456285},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Monster_BiAn_2090161",
              StaticCreatorIdList = {2090161, 2090162}
            }
          },
          ["1753340702521333162"] = {
            key = "1753340702521333162",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1212.148212728858, y = 407.93548387096774},
            propsData = {SpecialConfigId = 20030401, BlackScreenImmediately = false}
          }
        },
        commentData = {}
      }
    },
    ["17526690272133868"] = {
      isStoryNode = true,
      key = "17526690272133868",
      type = "StoryNode",
      name = "\230\146\173\229\175\185\232\175\157",
      pos = {x = 965.5572580645162, y = 628.5571428571429},
      propsData = {
        QuestId = 20030405,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_6",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090230"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1753687497705337872",
            startPort = "Out",
            endQuest = "17526690272133872",
            endPort = "Success"
          },
          {
            startQuest = "17526690272133869",
            startPort = "QuestStart",
            endQuest = "1753687497705337872",
            endPort = "In"
          }
        },
        nodeData = {
          ["17526690272133869"] = {
            key = "17526690272133869",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1630.4, y = 372.79999999999995},
            propsData = {ModeType = 0}
          },
          ["17526690272133872"] = {
            key = "17526690272133872",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2634, y = 368},
            propsData = {ModeType = 0}
          },
          ["17526690272133875"] = {
            key = "17526690272133875",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1753687497705337872"] = {
            key = "1753687497705337872",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2034, y = 380},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51104070,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20030405",
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
                  TalkActorId = 700325,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700328,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700333,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700326,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700327,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700325},
                {TalkActorType = "Npc", TalkActorId = 700328},
                {TalkActorType = "Npc", TalkActorId = 700333},
                {TalkActorType = "Npc", TalkActorId = 700326},
                {TalkActorType = "Npc", TalkActorId = 700327}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17554172717792382"] = {
            key = "17554172717792382",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1887.963644405131, y = 99.99367905056738},
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
    ["17526690292964001"] = {
      isStoryNode = true,
      key = "17526690292964001",
      type = "StoryNode",
      name = "\229\175\187\232\183\175",
      pos = {x = 1290.6905172413797, y = 628.5571428571429},
      propsData = {
        QuestId = 20030406,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_4",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090231"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17526690292964002",
            startPort = "QuestStart",
            endQuest = "17533431822914299643",
            endPort = "In"
          },
          {
            startQuest = "17533431822914299643",
            startPort = "Out",
            endQuest = "17533431548264299342",
            endPort = "In"
          },
          {
            startQuest = "17533431548264299342",
            startPort = "Out",
            endQuest = "17533432048134300231",
            endPort = "In"
          },
          {
            startQuest = "17533432048134300231",
            startPort = "Out",
            endQuest = "17526690292964005",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690292964002"] = {
            key = "17526690292964002",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1012, y = 386},
            propsData = {ModeType = 0}
          },
          ["17526690292964005"] = {
            key = "17526690292964005",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2340, y = 404},
            propsData = {ModeType = 0}
          },
          ["17526690292964008"] = {
            key = "17526690292964008",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17533431548264299342"] = {
            key = "17533431548264299342",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1713.923076923077, y = 388.2307692307692},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090245,
              GuideType = "M",
              GuidePointName = "Mechanism_2090245"
            }
          },
          ["17533431822914299643"] = {
            key = "17533431822914299643",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1370, y = 386},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Mechanism_2090245",
              StaticCreatorIdList = {2090245}
            }
          },
          ["17533432048134300231"] = {
            key = "17533432048134300231",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2018.8461538461538, y = 402},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Mechanism_2090245",
              StaticCreatorIdList = {2090245}
            }
          }
        },
        commentData = {}
      }
    },
    ["17526690329524169"] = {
      isStoryNode = true,
      key = "17526690329524169",
      type = "StoryNode",
      name = "\230\136\152\230\150\151",
      pos = {x = 1574.0541536050157, y = 628.5571428571429},
      propsData = {
        QuestId = 20030407,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_5",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090231"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17526690329524170",
            startPort = "QuestStart",
            endQuest = "17533592253513473",
            endPort = "In"
          },
          {
            startQuest = "17533592253513473",
            startPort = "Success",
            endQuest = "17526690329524173",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690329524170"] = {
            key = "17526690329524170",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1212, y = 294},
            propsData = {ModeType = 0}
          },
          ["17526690329524173"] = {
            key = "17526690329524173",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2030, y = 302},
            propsData = {ModeType = 0}
          },
          ["17526690329524176"] = {
            key = "17526690329524176",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17533434897425290871"] = {
            key = "17533434897425290871",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1627.2307692307693, y = -80.76923076923083},
            propsData = {WaitTime = 3}
          },
          ["17533592253513473"] = {
            key = "17533592253513473",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1618.0769230769226, y = 297.9230769230768},
            propsData = {SpecialConfigId = 20030402, BlackScreenImmediately = false}
          }
        },
        commentData = {}
      }
    },
    ["17526690358164345"] = {
      isStoryNode = true,
      key = "17526690358164345",
      type = "StoryNode",
      name = "\230\146\173\229\175\185\232\175\157",
      pos = {x = 1887.8705938697321, y = 635.5793650793651},
      propsData = {
        QuestId = 20030408,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_6",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090231"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17526690358164346",
            startPort = "QuestStart",
            endQuest = "1753692586807338918",
            endPort = "In"
          },
          {
            startQuest = "1753692586807338918",
            startPort = "Out",
            endQuest = "17526690358164349",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690358164346"] = {
            key = "17526690358164346",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1484, y = 398},
            propsData = {ModeType = 0}
          },
          ["17526690358164349"] = {
            key = "17526690358164349",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2090, y = 390},
            propsData = {ModeType = 0}
          },
          ["17526690358164352"] = {
            key = "17526690358164352",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1753692586807338918"] = {
            key = "1753692586807338918",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1788.1428571428567, y = 401.71428571428567},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51104094,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20030408",
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
                  TalkActorId = 700325,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700333,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700325},
                {TalkActorType = "Npc", TalkActorId = 700333},
                {TalkActorType = "Player", TalkActorId = 100001}
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
    ["17526690390324518"] = {
      isStoryNode = true,
      key = "17526690390324518",
      type = "StoryNode",
      name = "\228\186\164\228\186\146\229\175\185\232\175\157",
      pos = {x = 2206.2250000000004, y = 628.5571428571429},
      propsData = {
        QuestId = 20030409,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_7",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_YuMing_2090252"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17526690390324519",
            startPort = "QuestStart",
            endQuest = "17536926740181338220",
            endPort = "In"
          },
          {
            startQuest = "17536926740181338220",
            startPort = "Out",
            endQuest = "17536926910051338671",
            endPort = "In"
          },
          {
            startQuest = "17536926910051338671",
            startPort = "Out",
            endQuest = "17536929401941339488",
            endPort = "In"
          },
          {
            startQuest = "17536929401941339488",
            startPort = "Out",
            endQuest = "17526690390324522",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17526690390324519"] = {
            key = "17526690390324519",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 884, y = 290},
            propsData = {ModeType = 0}
          },
          ["17526690390324522"] = {
            key = "17526690390324522",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2148, y = 318},
            propsData = {ModeType = 0}
          },
          ["17526690390324525"] = {
            key = "17526690390324525",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17536926740181338220"] = {
            key = "17536926740181338220",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1180, y = 298},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_YuMing_2090252",
              StaticCreatorIdList = {2090252, 2090251}
            }
          },
          ["17536926910051338671"] = {
            key = "17536926910051338671",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1492, y = 300},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700325,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51104111,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20030409",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700324,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700325,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700324},
                {TalkActorType = "Npc", TalkActorId = 700325}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17536929401941339488"] = {
            key = "17536929401941339488",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1806, y = 302},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_YuMing_2090252",
              StaticCreatorIdList = {2090252, 2090251}
            }
          }
        },
        commentData = {}
      }
    },
    ["17527196648361260296"] = {
      isStoryNode = true,
      key = "17527196648361260296",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 628.2061074725796, y = 385.7386569872958},
      propsData = {QuestChainId = 200304},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17527196648361260297"] = {
      isStoryNode = true,
      key = "17527196648361260297",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2594.586956521739, y = 365.0217391304348},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17527196648361260298"] = {
      isStoryNode = true,
      key = "17527196648361260298",
      type = "StoryNode",
      name = "\229\175\187\232\183\175",
      pos = {x = 1281.7493448849737, y = 379.8076840680822},
      propsData = {
        QuestId = 20030401,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200304_2",
        QuestDeatil = "Content_200304_1",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2090243"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17527196648361260300",
            startPort = "QuestStart",
            endQuest = "17527587896026405868",
            endPort = "In"
          },
          {
            startQuest = "17527587896026405868",
            startPort = "Out",
            endQuest = "17527590363586409406",
            endPort = "In"
          },
          {
            startQuest = "17527590363586409406",
            startPort = "Out",
            endQuest = "17528319577231285425",
            endPort = "In"
          },
          {
            startQuest = "17528319577231285425",
            startPort = "Out",
            endQuest = "1752827434766968589",
            endPort = "In"
          },
          {
            startQuest = "1752827434766968589",
            startPort = "Out",
            endQuest = "17527196648361260301",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17527196648361260300"] = {
            key = "17527196648361260300",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 136, y = 297.0357142857143},
            propsData = {ModeType = 0}
          },
          ["17527196648361260301"] = {
            key = "17527196648361260301",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1520.406441384703, y = 312.9154884017584},
            propsData = {ModeType = 0}
          },
          ["17527196648361260302"] = {
            key = "17527196648361260302",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1684.5766590389017, y = 571.2814645308924},
            propsData = {}
          },
          ["17527587896026405868"] = {
            key = "17527587896026405868",
            type = "ChangeStaticCreatorNode",
            name = "\230\148\190\229\135\186NPC",
            pos = {x = 426.2412967467316, y = 299.07453416149065},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_LiHuan_2090160",
              StaticCreatorIdList = {
                2090158,
                2090159,
                2090160,
                2090243
              }
            }
          },
          ["17527590363586409406"] = {
            key = "17527590363586409406",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 725.4504028580116, y = 304.0547713156408},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090243,
              GuideType = "M",
              GuidePointName = "Mechanism_2090243"
            }
          },
          ["1752827434766968589"] = {
            key = "1752827434766968589",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1263.746794871795, y = 325.1222527472527},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Mechanism_2090243",
              StaticCreatorIdList = {
                2090243,
                2090158,
                2090159
              }
            }
          },
          ["17528319577231285425"] = {
            key = "17528319577231285425",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 999.8986944428119, y = 305.59400957771527},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51104004,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20030401",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700326,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700327,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700328,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700326},
                {TalkActorType = "Npc", TalkActorId = 700327},
                {TalkActorType = "Npc", TalkActorId = 700328},
                {TalkActorType = "Player", TalkActorId = 100001}
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
    ["17527196648361260299"] = {
      isStoryNode = true,
      key = "17527196648361260299",
      type = "PreStoryNode",
      name = "\228\186\164\228\186\146\229\175\185\232\175\157",
      pos = {x = 965.8961705490519, y = 377.2627567650531},
      propsData = {
        QuestId = 20030400,
        QuestDescriptionComment = "",
        SubRegionId = 104108,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_White_2090157"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17527196648361260310",
            startPort = "Out",
            endQuest = "17527196648361260309",
            endPort = "Input"
          },
          {
            startQuest = "17527196648361260310",
            startPort = "Fail",
            endQuest = "17527196648361260308",
            endPort = "Fail"
          },
          {
            startQuest = "17527196648361260306",
            startPort = "QuestStart",
            endQuest = "17528273232536513",
            endPort = "In"
          },
          {
            startQuest = "17528273232536513",
            startPort = "Out",
            endQuest = "17527196648361260310",
            endPort = "In"
          },
          {
            startQuest = "17527196648361260309",
            startPort = "CancelOut",
            endQuest = "17527196648361260308",
            endPort = "Fail"
          },
          {
            startQuest = "17527196648361260309",
            startPort = "ApproveOut",
            endQuest = "17528273630217602",
            endPort = "In"
          },
          {
            startQuest = "17528273630217602",
            startPort = "Out",
            endQuest = "17527196648361260307",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17527196648361260306"] = {
            key = "17527196648361260306",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 941.8939393939395, y = 137.3320158102767},
            propsData = {ModeType = 0}
          },
          ["17527196648361260307"] = {
            key = "17527196648361260307",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2493.766233766234, y = 113.18181818181816},
            propsData = {ModeType = 0}
          },
          ["17527196648361260308"] = {
            key = "17527196648361260308",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2200, y = 375.45454545454544},
            propsData = {}
          },
          ["17527196648361260309"] = {
            key = "17527196648361260309",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1888.1091269841272, y = 121.54872758820136},
            propsData = {
              SideQuestChainId = 200304,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17527196648361260310"] = {
            key = "17527196648361260310",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 1476.1559065934064, y = 136.8419433827043},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700324,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_White_2090157",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51104001,
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
          ["17528273232536513"] = {
            key = "17528273232536513",
            type = "ChangeStaticCreatorNode",
            name = "\230\148\190\229\135\186\229\176\143\231\153\189",
            pos = {x = 1195.5938375350138, y = 137.12464985994393},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090157}
            }
          },
          ["17528273630217602"] = {
            key = "17528273630217602",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\176\143\231\153\189",
            pos = {x = 2170.2366946778707, y = 109.26750700280115},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090157}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
