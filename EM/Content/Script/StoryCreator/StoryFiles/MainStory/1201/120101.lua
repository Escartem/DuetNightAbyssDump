return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17369484810741363018",
      startPort = "StoryStart",
      endStory = "17367374547646334827",
      endPort = "In"
    },
    {
      startStory = "173674969962612905113",
      startPort = "Success",
      endStory = "173675157578920421667",
      endPort = "In"
    },
    {
      startStory = "173675157578920421667",
      startPort = "Success",
      endStory = "173675336314426999083",
      endPort = "In"
    },
    {
      startStory = "173675336314426999083",
      startPort = "Success",
      endStory = "173675378274927943426",
      endPort = "In"
    },
    {
      startStory = "173675378274927943426",
      startPort = "Success",
      endStory = "17367656620703101511",
      endPort = "In"
    },
    {
      startStory = "17367656620703101511",
      startPort = "Success",
      endStory = "173676775435614570517",
      endPort = "In"
    },
    {
      startStory = "173676775435614570517",
      startPort = "Success",
      endStory = "173676918497727001133",
      endPort = "In"
    },
    {
      startStory = "173676918497727001133",
      startPort = "Success",
      endStory = "173682272875534655780",
      endPort = "In"
    },
    {
      startStory = "173682272875534655780",
      startPort = "Success",
      endStory = "17369484810741363020",
      endPort = "In"
    },
    {
      startStory = "173684445027456651082",
      startPort = "Success",
      endStory = "17369484810741363021",
      endPort = "In"
    },
    {
      startStory = "17369484810741363020",
      startPort = "Success",
      endStory = "173684445027456651082",
      endPort = "In"
    },
    {
      startStory = "17367374547646334827",
      startPort = "Success",
      endStory = "17512632684412959",
      endPort = "In"
    },
    {
      startStory = "17512632684412959",
      startPort = "Success",
      endStory = "173674969962612905113",
      endPort = "In"
    },
    {
      startStory = "17369484810741363021",
      startPort = "Success",
      endStory = "17513497879983831718",
      endPort = "In"
    },
    {
      startStory = "17513497879983831718",
      startPort = "Success",
      endStory = "17369484810741363019",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17367374547646334827"] = {
      isStoryNode = true,
      key = "17367374547646334827",
      type = "StoryNode",
      name = "\231\153\187\228\184\138\230\184\161\229\143\163",
      pos = {x = 2024.709090909091, y = 320.2666666666667},
      propsData = {
        QuestId = 12010101,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_1",
        QuestDeatil = "Content_120101_1",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010101"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17367374547656334832",
            startPort = "QuestStart",
            endQuest = "1747131697839873230",
            endPort = "In"
          },
          {
            startQuest = "17477293363658836590",
            startPort = "Out",
            endQuest = "17367376586198213024",
            endPort = "In"
          },
          {
            startQuest = "17367376586198213024",
            startPort = "Out",
            endQuest = "17367374547656334833",
            endPort = "Success"
          },
          {
            startQuest = "1747131697839873230",
            startPort = "Out",
            endQuest = "17527190526402897",
            endPort = "In"
          },
          {
            startQuest = "17527190526402897",
            startPort = "Out",
            endQuest = "17477293363658836590",
            endPort = "In"
          }
        },
        nodeData = {
          ["17367374547656334832"] = {
            key = "17367374547656334832",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1503.4980186480186, y = 467.6171328671328},
            propsData = {ModeType = 0}
          },
          ["17367374547656334833"] = {
            key = "17367374547656334833",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2780.7934424419714, y = 472.02744038687916},
            propsData = {ModeType = 0}
          },
          ["17367374547656334834"] = {
            key = "17367374547656334834",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17367374547656334835"] = {
            key = "17367374547656334835",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2187.739065110476, y = 225.4673436466917},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010101"
            }
          },
          ["17367376586198213024"] = {
            key = "17367376586198213024",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\229\175\185\232\175\157",
            pos = {x = 2529.7205800997363, y = 457.29438405797094},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_01",
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
              EndNewTargetPointName = "EndPoint_12010001",
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
          ["1747131697839873230"] = {
            key = "1747131697839873230",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1748.8500000000001, y = 467.95},
            propsData = {WaitTime = 2}
          },
          ["17477293363658836590"] = {
            key = "17477293363658836590",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2257.6409090909087, y = 459.0285714285713},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_PorStart",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17489323148176350324"] = {
            key = "17489323148176350324",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1995.0458241191218, y = 936.3090992856473},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Por_SC001",
              UnitId = -1
            }
          },
          ["17489329593638136366"] = {
            key = "17489329593638136366",
            type = "TalkNode",
            name = "\227\128\144SC001\227\128\145-\230\138\181\232\190\190\228\184\156\229\155\189\231\160\129\229\164\180",
            pos = {x = 2221.5849610121923, y = 706.6653604323462},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022511,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["17527190526402897"] = {
            key = "17527190526402897",
            type = "TalkNode",
            name = "\227\128\144SC001\227\128\145-\230\138\181\232\190\190\228\184\156\229\155\189\231\160\129\229\164\180",
            pos = {x = 1996.6857940446648, y = 463.75589330024815},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC001/SQ_Ver0101_SC001",
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
    ["173674969962612905113"] = {
      isStoryNode = true,
      key = "173674969962612905113",
      type = "StoryNode",
      name = "\229\146\140\230\144\172\232\191\144\229\183\165\228\186\164\230\181\129",
      pos = {x = 2279.5448621553883, y = 319.12180451127824},
      propsData = {
        QuestId = 12010102,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_2",
        QuestDeatil = "Content_120101_2",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010102"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173674969962612905118",
            startPort = "QuestStart",
            endQuest = "173674974210512905889",
            endPort = "In"
          },
          {
            startQuest = "173674974210512905889",
            startPort = "Out",
            endQuest = "173675014361112907912",
            endPort = "In"
          },
          {
            startQuest = "173675014361112907912",
            startPort = "Out",
            endQuest = "173675078246712909031",
            endPort = "In"
          },
          {
            startQuest = "173675078246712909031",
            startPort = "Out",
            endQuest = "173675129998416665110",
            endPort = "In"
          },
          {
            startQuest = "173675129998416665110",
            startPort = "Out",
            endQuest = "173674969962612905119",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173674969962612905118"] = {
            key = "173674969962612905118",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2267.457542457543, y = 801.4385614385615},
            propsData = {ModeType = 0}
          },
          ["173674969962612905119"] = {
            key = "173674969962612905119",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3781.847725071863, y = 803.1291754222791},
            propsData = {ModeType = 0}
          },
          ["173674969962612905120"] = {
            key = "173674969962612905120",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3174.864797870795, y = 1012.9215986412389},
            propsData = {}
          },
          ["173674974210512905889"] = {
            key = "173674974210512905889",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\144\172\232\191\144\229\183\165\229\146\140\230\173\162\230\181\129",
            pos = {x = 2528.5392385392383, y = 792.2501942501942},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090013, 2090016}
            }
          },
          ["173675014361112907912"] = {
            key = "173675014361112907912",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\144\172\232\191\144\229\183\165\233\153\132\232\191\145",
            pos = {x = 2774.7692307692314, y = 793.4230769230769},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090012,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010102"
            }
          },
          ["173675078246712909031"] = {
            key = "173675078246712909031",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\144\172\232\191\144\229\183\165\229\175\185\232\175\157",
            pos = {x = 3032.717948717949, y = 790.8547008547009},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010101,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_02",
              BlendInTime = 1,
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
                  TalkActorId = 210030,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210004,
                  TalkActorVisible = true
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210030},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["173675129998416665110"] = {
            key = "173675129998416665110",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\144\172\232\191\144\229\183\165\229\146\140\230\173\162\230\181\129",
            pos = {x = 3294.299145299146, y = 809.3162393162395},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090013, 2090016}
            }
          },
          ["173675133829017603931"] = {
            key = "173675133829017603931",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\144\172\232\191\144\229\183\165\229\175\185\232\175\157",
            pos = {x = 3112.1623931623944, y = 571.8376068376069},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010106,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_02",
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
          }
        },
        commentData = {}
      }
    },
    ["173675157578920421667"] = {
      isStoryNode = true,
      key = "173675157578920421667",
      type = "StoryNode",
      name = "\229\142\187\231\160\129\229\164\180\233\155\134\229\184\130\229\140\186",
      pos = {x = 2533.150414078675, y = 319.06262939958594},
      propsData = {
        QuestId = 12010103,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_3",
        QuestDeatil = "Content_120101_3",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173675157578920421672",
            startPort = "QuestStart",
            endQuest = "173675293195723241138",
            endPort = "In"
          },
          {
            startQuest = "173675293195723241138",
            startPort = "Out",
            endQuest = "173675157578920421673",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173675157578920421672"] = {
            key = "173675157578920421672",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2500.3146853146854, y = 790.00999000999},
            propsData = {ModeType = 0}
          },
          ["173675157578920421673"] = {
            key = "173675157578920421673",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3297.7601708636184, y = 790.326388171216},
            propsData = {ModeType = 0}
          },
          ["173675157578920421674"] = {
            key = "173675157578920421674",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2946.650512156509, y = 1190.7787414983818},
            propsData = {}
          },
          ["173675293195723241138"] = {
            key = "173675293195723241138",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\160\129\229\164\180",
            pos = {x = 2936.5999999999995, y = 774.5285714285717},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090019,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090019"
            }
          },
          ["173675322888225119708"] = {
            key = "173675322888225119708",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\160\129\229\164\180",
            pos = {x = 3001.057142857143, y = 922.1285714285715},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090019,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090019"
            }
          }
        },
        commentData = {}
      }
    },
    ["173675336314426999083"] = {
      isStoryNode = true,
      key = "173675336314426999083",
      type = "StoryNode",
      name = "\229\155\155\229\164\132\233\128\155\233\128\155",
      pos = {x = 2783.767741935484, y = 318.0720897615708},
      propsData = {
        QuestId = 12010104,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_4",
        QuestDeatil = "Content_120101_4",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010101"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173675651901144884039",
            startPort = "Out",
            endQuest = "173675651901144884040",
            endPort = "In"
          },
          {
            startQuest = "173675651901144884040",
            startPort = "Out",
            endQuest = "173675651901144884041",
            endPort = "Branch_1"
          },
          {
            startQuest = "173675336314426999088",
            startPort = "QuestStart",
            endQuest = "173675651901144884043",
            endPort = "In"
          },
          {
            startQuest = "173675651901144884039",
            startPort = "Out",
            endQuest = "173675651901144884042",
            endPort = "In"
          },
          {
            startQuest = "173675651901144884042",
            startPort = "Out",
            endQuest = "173675651901144884041",
            endPort = "Branch_2"
          },
          {
            startQuest = "173675651901144884043",
            startPort = "Out",
            endQuest = "173675651901144884039",
            endPort = "In"
          },
          {
            startQuest = "173675651901144884041",
            startPort = "Out",
            endQuest = "17513397044331920074",
            endPort = "In"
          },
          {
            startQuest = "17513397044331920074",
            startPort = "Out",
            endQuest = "173675336314426999089",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173675336314426999088"] = {
            key = "173675336314426999088",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1980.0598413081175, y = 778.6860710171055},
            propsData = {ModeType = 0}
          },
          ["173675336314426999089"] = {
            key = "173675336314426999089",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3692.588073578928, y = 812.2201936494293},
            propsData = {ModeType = 0}
          },
          ["173675336314426999090"] = {
            key = "173675336314426999090",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3693.2700428673443, y = 950.9235881226887},
            propsData = {}
          },
          ["173675651901144884039"] = {
            key = "173675651901144884039",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 2530.9310677994345, y = 784.1541908699331},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_120101_4_1",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_120101_4_3",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["173675651901144884040"] = {
            key = "173675651901144884040",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 2810.772061588253, y = 646.2566753419826},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Bai_2090020",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010130,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "",
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173675651901144884041"] = {
            key = "173675651901144884041",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 3122.632731253421, y = 763.668319519894},
            propsData = {
              InputBranchQuestNumber = 2,
              BranchQuestFinishOptions = {
                {IsNeedFinish = false},
                {IsNeedFinish = true}
              }
            }
          },
          ["173675651901144884042"] = {
            key = "173675651901144884042",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\173\162\230\181\129\229\176\143\232\180\169\229\175\185\232\175\157",
            pos = {x = 2800.8440768679225, y = 885.8548872294319},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210031,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Hawker_2090023",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010113,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_03",
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
          ["173675651901144884043"] = {
            key = "173675651901144884043",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\173\162\230\181\129\229\143\138\231\155\184\229\133\179\229\175\185\232\175\157\228\186\186",
            pos = {x = 2248.1144214243773, y = 781.4435773455267},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2090020,
                2090022,
                2090023
              }
            }
          },
          ["173675651901144884044"] = {
            key = "173675651901144884044",
            type = "TalkNode",
            name = "\231\130\185\233\166\153\228\187\170\229\188\143",
            pos = {x = 2761.0937317692055, y = 466.49185320759557},
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
              FirstDialogueId = 12010134,
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
          ["17513397044331920074"] = {
            key = "17513397044331920074",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\176\143\231\153\189\229\146\140\230\173\162\230\181\129\229\143\138\231\155\184\229\133\179\229\175\185\232\175\157\228\186\186",
            pos = {x = 3397.75, y = 792.0000000000001},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090020}
            }
          },
          ["17536705416336654"] = {
            key = "17536705416336654",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2800.354304879847, y = 1079.7429971988795},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010104"
            }
          }
        },
        commentData = {}
      }
    },
    ["173675378274927943426"] = {
      isStoryNode = true,
      key = "173675378274927943426",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\229\176\143\231\153\189",
      pos = {x = 3036.9716756828966, y = 321.1840112201964},
      propsData = {
        QuestId = 12010105,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_5",
        QuestDeatil = "Content_120101_5",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_FindBai"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173675764471952410080",
            startPort = "Out",
            endQuest = "173675764471952410081",
            endPort = "In"
          },
          {
            startQuest = "173675764471952410081",
            startPort = "Out",
            endQuest = "173675764471952410082",
            endPort = "In"
          },
          {
            startQuest = "173675764471952410082",
            startPort = "Out",
            endQuest = "173675791540258994858",
            endPort = "In"
          },
          {
            startQuest = "173675733965349588059",
            startPort = "Out",
            endQuest = "173675737235750528655",
            endPort = "In"
          },
          {
            startQuest = "173675378275027943431",
            startPort = "QuestStart",
            endQuest = "173675719544047707102",
            endPort = "In"
          },
          {
            startQuest = "173675378275027943431",
            startPort = "QuestStart",
            endQuest = "173675764471952410080",
            endPort = "In"
          },
          {
            startQuest = "173675791540258994858",
            startPort = "Out",
            endQuest = "17513547417005742407",
            endPort = "In"
          },
          {
            startQuest = "17513547417005742407",
            startPort = "Out",
            endQuest = "173675378275027943432",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173675378275027943431"] = {
            key = "173675378275027943431",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2173.194816677576, y = 811.8643961402582},
            propsData = {ModeType = 0}
          },
          ["173675378275027943432"] = {
            key = "173675378275027943432",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3661.36749339283, y = 804.6120929378802},
            propsData = {ModeType = 0}
          },
          ["173675378275027943433"] = {
            key = "173675378275027943433",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3585.2733269395935, y = 954.377337438507},
            propsData = {}
          },
          ["173675677951547706393"] = {
            key = "173675677951547706393",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2191.6431570565624, y = 484.5451728681114},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010101"
            }
          },
          ["173675719544047707102"] = {
            key = "173675719544047707102",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\142\187\229\147\170\233\135\140\228\186\134",
            pos = {x = 2507.643157056562, y = 626.7991411220796},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010132,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173675733965349588059"] = {
            key = "173675733965349588059",
            type = "GoToNode",
            name = "\229\142\187\229\176\143\231\153\189\228\185\139\229\137\141\229\156\168\231\154\132\229\156\176\230\150\185",
            pos = {x = 2553.039982453387, y = 1068.6086649316037},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2090026,
              GuideType = "P",
              GuidePointName = ""
            }
          },
          ["173675737235750528655"] = {
            key = "173675737235750528655",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\228\185\139\229\137\141\229\156\168\231\154\132",
            pos = {x = 2821.928871342277, y = 1071.783268106207},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010136,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173675764471952410080"] = {
            key = "173675764471952410080",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\228\184\156\229\155\189\229\176\143\231\153\189",
            pos = {x = 2486.5393719527765, y = 813.1495684725071},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090027, 2090029}
            }
          },
          ["173675764471952410081"] = {
            key = "173675764471952410081",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\176\143\231\153\189",
            pos = {x = 2776.4490178624224, y = 802.9249042478428},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090030,
              GuideType = "P",
              GuidePointName = "QuestPoint_FindBai"
            }
          },
          ["173675764471952410082"] = {
            key = "173675764471952410082",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 3074.810434223839, y = 801.062877385816},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_04",
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
          ["173675791540258994858"] = {
            key = "173675791540258994858",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\176\143\231\153\189\229\146\140\228\184\156\229\155\189\229\176\143\231\153\189",
            pos = {x = 3370.976490389895, y = 846.7039030268417},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2090027,
                2090029,
                2090022
              }
            }
          },
          ["17513547417005742407"] = {
            key = "17513547417005742407",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\173\162\230\181\129",
            pos = {x = 3409.714285714286, y = 702.5714285714287},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090098}
            }
          }
        },
        commentData = {}
      }
    },
    ["17367656620703101511"] = {
      isStoryNode = true,
      key = "17367656620703101511",
      type = "StoryNode",
      name = "\229\155\158\229\142\187\230\137\190\230\173\162\230\181\129",
      pos = {x = 3298.42231349763, y = 321.54440325919995},
      propsData = {
        QuestId = 12010106,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_6",
        QuestDeatil = "Content_120101_6",
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
        StoryGuidePointName = "Mechanism_QuestTrigger_2090036"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17367673639968835808",
            startPort = "Out",
            endQuest = "173676796029516484441",
            endPort = "In"
          },
          {
            startQuest = "173676796029516484441",
            startPort = "Out",
            endQuest = "17367656620703101517",
            endPort = "Success"
          },
          {
            startQuest = "17367656620713101524",
            startPort = "Out",
            endQuest = "17367673639968835806",
            endPort = "In"
          },
          {
            startQuest = "17367656620703101516",
            startPort = "QuestStart",
            endQuest = "17367656620713101524",
            endPort = "In"
          },
          {
            startQuest = "17367673639968835806",
            startPort = "Out",
            endQuest = "17527342102715466",
            endPort = "In"
          },
          {
            startQuest = "17527342102715466",
            startPort = "Out",
            endQuest = "17367673639968835808",
            endPort = "In"
          }
        },
        nodeData = {
          ["17367656620703101516"] = {
            key = "17367656620703101516",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2411.8138642966237, y = 815.2929675688297},
            propsData = {ModeType = 0}
          },
          ["17367656620703101517"] = {
            key = "17367656620703101517",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4037.6771415990297, y = 809.3229950625755},
            propsData = {ModeType = 0}
          },
          ["17367656620703101518"] = {
            key = "17367656620703101518",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3872.5303802311296, y = 962.7002214510461},
            propsData = {}
          },
          ["17367656620703101519"] = {
            key = "17367656620703101519",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2217.6431570565624, y = 644.5451728681114},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010101"
            }
          },
          ["17367656620713101523"] = {
            key = "17367656620713101523",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\173\162\230\181\129",
            pos = {x = 2479.281572281184, y = 647.9475980291575},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090098}
            }
          },
          ["17367656620713101524"] = {
            key = "17367656620713101524",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\173\162\230\181\129\233\153\132\232\191\145",
            pos = {x = 2698.4325975011748, y = 806.3567597486639},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090036,
              GuideType = "N",
              GuidePointName = "Npc_Zhiliu_2090098"
            }
          },
          ["17367673639968835806"] = {
            key = "17367673639968835806",
            type = "TalkNode",
            name = "\227\128\14405\227\128\145 \233\129\135\229\136\176\231\187\145\229\140\170 Fixsimple01",
            pos = {x = 2962.8654092873558, y = 769.1180151769986},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Zhiliu_2090098",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010215,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_05",
              BlendInTime = 1,
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
                {TalkActorType = "Npc", TalkActorId = 210001},
                {TalkActorType = "Npc", TalkActorId = 210002},
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
          ["17367673639968835807"] = {
            key = "17367673639968835807",
            type = "TalkNode",
            name = "\227\128\144SC002\227\128\145\231\139\180\231\138\180\230\131\169\230\178\187\229\138\171\229\140\170",
            pos = {x = 2867.804125199393, y = 1139.0105564505066},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022512,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["17367673639968835808"] = {
            key = "17367673639968835808",
            type = "TalkNode",
            name = "\227\128\14406\227\128\145\229\138\171\229\144\142\228\189\153\230\179\162 Fixsimple02",
            pos = {x = 3495.7039755305486, y = 801.2586623146967},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010227,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_06",
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
          ["173676796029516484441"] = {
            key = "173676796029516484441",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\173\162\230\181\129",
            pos = {x = 3758.3213628390313, y = 812.6739697084522},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090098}
            }
          },
          ["17527342102715466"] = {
            key = "17527342102715466",
            type = "TalkNode",
            name = "\227\128\144SC002\227\128\145\231\139\180\231\138\180\230\131\169\230\178\187\229\138\171\229\140\170",
            pos = {x = 3227.7625000000003, y = 777.8130159958723},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC002/SQ_Ver0101_SC002",
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
    ["173676775435614570517"] = {
      isStoryNode = true,
      key = "173676775435614570517",
      type = "StoryNode",
      name = "\229\146\140\230\157\156\231\171\139\232\175\180\232\175\157",
      pos = {x = 2026.8272389446302, y = 484.92166480862136},
      propsData = {
        QuestId = 12010107,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_7",
        QuestDeatil = "Content_120101_7",
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
        StoryGuidePointName = "Npc_Duli_2090041"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173676775435614570522",
            startPort = "QuestStart",
            endQuest = "173676775435614570525",
            endPort = "In"
          },
          {
            startQuest = "173676775435614570525",
            startPort = "Out",
            endQuest = "173676775435614570526",
            endPort = "In"
          },
          {
            startQuest = "173676775435614570526",
            startPort = "Out",
            endQuest = "173676821658118396464",
            endPort = "In"
          },
          {
            startQuest = "173676821658118396464",
            startPort = "Out",
            endQuest = "173676848428826044434",
            endPort = "In"
          },
          {
            startQuest = "173676848428826044434",
            startPort = "Out",
            endQuest = "17501564952795078955",
            endPort = "In"
          },
          {
            startQuest = "17501564952795078955",
            startPort = "Out",
            endQuest = "173676775435614570523",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173676775435614570522"] = {
            key = "173676775435614570522",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1950.0519595347187, y = 868.4358247116868},
            propsData = {ModeType = 0}
          },
          ["173676775435614570523"] = {
            key = "173676775435614570523",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3593.438253458615, y = 817.9401045186003},
            propsData = {ModeType = 0}
          },
          ["173676775435614570524"] = {
            key = "173676775435614570524",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2362.0868318440325, y = 1163.5873182252396},
            propsData = {}
          },
          ["173676775435614570525"] = {
            key = "173676775435614570525",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2222.7448106212137, y = 834.1949424533648},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010101"
            }
          },
          ["173676775435614570526"] = {
            key = "173676775435614570526",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\157\156\231\171\139",
            pos = {x = 2490.710143709756, y = 832.5190266005859},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090041}
            }
          },
          ["173676821658118396464"] = {
            key = "173676821658118396464",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\157\156\231\171\139\229\175\185\232\175\157",
            pos = {x = 2767.685010839778, y = 781.6790551248279},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210032,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Duli_2090041",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_07",
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
          ["173676848428826044434"] = {
            key = "173676848428826044434",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\157\156\231\171\139",
            pos = {x = 3036.831881329298, y = 733.5004962992623},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090041}
            }
          },
          ["17501564952795078955"] = {
            key = "17501564952795078955",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\228\184\156\229\155\189\229\176\143\231\153\189",
            pos = {x = 3275.696428571429, y = 690.0178571428571},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090095}
            }
          }
        },
        commentData = {}
      }
    },
    ["173676918497727001133"] = {
      isStoryNode = true,
      key = "173676918497727001133",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\149\140\231\162\145",
      pos = {x = 2273.449305542913, y = 484.47778057664834},
      propsData = {
        QuestId = 12010108,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_8",
        QuestDeatil = "Content_120101_8",
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
            startQuest = "173677013040328915430",
            startPort = "Out",
            endQuest = "173677015515629871934",
            endPort = "In"
          },
          {
            startQuest = "173685428554676741221",
            startPort = "Out",
            endQuest = "17476350200277058446",
            endPort = "In"
          },
          {
            startQuest = "17476350200277058446",
            startPort = "Out",
            endQuest = "173676918497727001139",
            endPort = "Success"
          },
          {
            startQuest = "173676918497727001138",
            startPort = "QuestStart",
            endQuest = "173685428554676741221",
            endPort = "In"
          },
          {
            startQuest = "173676918497727001138",
            startPort = "QuestStart",
            endQuest = "173676937344327958737",
            endPort = "In"
          },
          {
            startQuest = "173676937344327958737",
            startPort = "Out",
            endQuest = "175367140162510391",
            endPort = "In"
          }
        },
        nodeData = {
          ["173676918497727001138"] = {
            key = "173676918497727001138",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1787.3591023918616, y = 837.6929675688297},
            propsData = {ModeType = 0}
          },
          ["173676918497727001139"] = {
            key = "173676918497727001139",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3170.509682030043, y = 813.0115330900288},
            propsData = {ModeType = 0}
          },
          ["173676918497727001140"] = {
            key = "173676918497727001140",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3497.8090540662547, y = 987.6150960030174},
            propsData = {}
          },
          ["173676937344327958737"] = {
            key = "173676937344327958737",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\159\179\231\162\145",
            pos = {x = 2323.1805231848416, y = 583.1613258984681},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2090042,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090042"
            }
          },
          ["173677013040328915430"] = {
            key = "173677013040328915430",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\159\179\231\162\145",
            pos = {x = 2390.459629080073, y = 1057.361034517548},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090043,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090043"
            }
          },
          ["173677015515629871934"] = {
            key = "173677015515629871934",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\159\179\231\162\145",
            pos = {x = 2613.3096886441285, y = 981.4004433845428},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090044,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090044"
            }
          },
          ["173685428554676741221"] = {
            key = "173685428554676741221",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\159\179\231\162\145",
            pos = {x = 2345.1034811036407, y = 805.8948073370208},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090068,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090068"
            }
          },
          ["17476350200277058446"] = {
            key = "17476350200277058446",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\157\165\229\136\176\231\159\179\231\162\145",
            pos = {x = 2740.5, y = 808.4000000000001},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010401,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_08",
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
          ["175367140162510391"] = {
            key = "175367140162510391",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\233\148\166\233\178\164\231\154\142\231\154\142",
            pos = {x = 2688, y = 562},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010450,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["173682272875534655780"] = {
      isStoryNode = true,
      key = "173682272875534655780",
      type = "StoryNode",
      name = "\232\167\166\230\145\184\231\149\140\231\162\145",
      pos = {x = 2532.203904422556, y = 485.54171740522656},
      propsData = {
        QuestId = 12010109,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_9",
        QuestDeatil = "Content_120101_9",
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
        StoryGuidePointName = "Npc_Jiebei_2090097"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173683502858839442466",
            startPort = "Out",
            endQuest = "173685330928674825745",
            endPort = "In"
          },
          {
            startQuest = "173685330928674825745",
            startPort = "Out",
            endQuest = "173682272875534655786",
            endPort = "Success"
          },
          {
            startQuest = "173682272875534655785",
            startPort = "QuestStart",
            endQuest = "173685329059274825335",
            endPort = "In"
          },
          {
            startQuest = "173685329059274825335",
            startPort = "Out",
            endQuest = "17477291926047952457",
            endPort = "In"
          },
          {
            startQuest = "17477291926047952457",
            startPort = "Out",
            endQuest = "174773016526710601527",
            endPort = "In"
          },
          {
            startQuest = "174773016526710601527",
            startPort = "Out",
            endQuest = "173683502858839442466",
            endPort = "In"
          },
          {
            startQuest = "173683502858839442466",
            startPort = "Out",
            endQuest = "175367184499312472",
            endPort = "In"
          }
        },
        nodeData = {
          ["173682272875534655785"] = {
            key = "173682272875534655785",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1559.4898680314504, y = 791.9801757854497},
            propsData = {ModeType = 0}
          },
          ["173682272875534655786"] = {
            key = "173682272875534655786",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3536.153229304025, y = 785.8296835386142},
            propsData = {ModeType = 0}
          },
          ["173682272875534655787"] = {
            key = "173682272875534655787",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3560.3090540662547, y = 1001.3650960030174},
            propsData = {}
          },
          ["173683502858839442466"] = {
            key = "173683502858839442466",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\167\166\230\145\184\231\159\179\231\162\145",
            pos = {x = 2629.944553316452, y = 783.6562917463314},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010429,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_09",
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
          ["173685329059274825335"] = {
            key = "173685329059274825335",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\159\179\231\162\145",
            pos = {x = 1813.0291958691255, y = 785.3170683099212},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090097}
            }
          },
          ["173685330928674825745"] = {
            key = "173685330928674825745",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\159\179\231\162\145/\228\184\156\229\155\189\229\176\143\231\153\189",
            pos = {x = 2899.472779679462, y = 800.2390510160469},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090097, 2090095}
            }
          },
          ["17477117576017069050"] = {
            key = "17477117576017069050",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2305.757199322417, y = 518.5536874620868},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01_Port_Jiebei",
              UnitId = -1
            }
          },
          ["17477291926047952457"] = {
            key = "17477291926047952457",
            type = "TalkNode",
            name = "\233\187\145\229\177\143-\232\167\166\230\145\184\231\159\179\231\162\145",
            pos = {x = 2077.2515745124433, y = 777.4576096268786},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Jiebei_2090097",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12010427,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["174773016526710601527"] = {
            key = "174773016526710601527",
            type = "TalkNode",
            name = "\230\188\148\229\135\186-\232\167\166\231\162\176\231\149\140\231\162\145",
            pos = {x = 2350.2987012987023, y = 784.0933651756775},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/East01/Port/East01_Port_Jiebei",
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["175367184499312472"] = {
            key = "175367184499312472",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2888, y = 566},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010500,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["173684445027456651082"] = {
      isStoryNode = true,
      key = "173684445027456651082",
      type = "StoryNode",
      name = "\229\146\140\231\142\137\231\172\153\232\175\180\232\175\157",
      pos = {x = 3034.7742448490726, y = 488.1573671260659},
      propsData = {
        QuestId = 12010111,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_11",
        QuestDeatil = "Content_120101_11",
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
        StoryGuidePointName = "Mechanism_QuestTrigger_2090099"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17482644343534997",
            startPort = "Out",
            endQuest = "173684458092858564354",
            endPort = "In"
          },
          {
            startQuest = "173684445027456651087",
            startPort = "QuestStart",
            endQuest = "17482644343534997",
            endPort = "In"
          },
          {
            startQuest = "173684458092858564354",
            startPort = "Out",
            endQuest = "17537025771963016",
            endPort = "In"
          },
          {
            startQuest = "17537025771963016",
            startPort = "Out",
            endQuest = "173684445027456651088",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173684445027456651087"] = {
            key = "173684445027456651087",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2541.38593711189, y = 865.2056600386911},
            propsData = {ModeType = 0}
          },
          ["173684445027456651088"] = {
            key = "173684445027456651088",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3542.7552447552443, y = 849.1539743781124},
            propsData = {ModeType = 0}
          },
          ["173684445027456651089"] = {
            key = "173684445027456651089",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3632.690884827317, y = 1061.1824682064564},
            propsData = {}
          },
          ["173684453712957608115"] = {
            key = "173684453712957608115",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2866.4849445025397, y = 613.0662079674448},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Heilang"
            }
          },
          ["173684458092858564354"] = {
            key = "173684458092858564354",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\142\137\231\172\153\229\175\185\232\175\157",
            pos = {x = 3071.4902495423275, y = 825.2545368799117},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210033,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Yusheng_2090073",
              DelayShowGuideTime = 1,
              FirstDialogueId = 12010508,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_10",
              BlendInTime = 0,
              BlendOutTime = 1,
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
              EndNewTargetPointName = "QuestPoint_YushengTalkEPQuestPoint_YushengTalkEP",
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
          ["174764907053013553469"] = {
            key = "174764907053013553469",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2563.62767199261, y = 1052.3202719622998},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090099,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090099"
            }
          },
          ["17482644343534997"] = {
            key = "17482644343534997",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\142\137\231\172\153",
            pos = {x = 2827, y = 860.0769230769231},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090254}
            }
          },
          ["17537025771963016"] = {
            key = "17537025771963016",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\142\137\231\172\153",
            pos = {x = 3306, y = 852},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2090254}
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810741363018"] = {
      isStoryNode = true,
      key = "17369484810741363018",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1772, y = 324},
      propsData = {QuestChainId = 120101},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17369484810741363019"] = {
      isStoryNode = true,
      key = "17369484810741363019",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3808.8814057635404, y = 497.9906418829412},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17369484810741363020"] = {
      isStoryNode = true,
      key = "17369484810741363020",
      type = "StoryNode",
      name = "\233\187\145\231\139\188\231\129\181\229\164\132",
      pos = {x = 2789.2237199667743, y = 485.2061510374105},
      propsData = {
        QuestId = 12010110,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_10",
        QuestDeatil = "Content_120101_10",
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
            startQuest = "173685154543269084728",
            startPort = "PassiveFail",
            endQuest = "173685154543269084730",
            endPort = "In"
          },
          {
            startQuest = "173685154543269084730",
            startPort = "Out",
            endQuest = "17369484810741363024",
            endPort = "Fail"
          },
          {
            startQuest = "173685154543269084728",
            startPort = "Success",
            endQuest = "17369484810741363023",
            endPort = "Success"
          },
          {
            startQuest = "173685154543269084728",
            startPort = "Fail",
            endQuest = "173686015605181515863",
            endPort = "In"
          },
          {
            startQuest = "173686015605181515863",
            startPort = "Out",
            endQuest = "17369484810741363024",
            endPort = "Fail"
          },
          {
            startQuest = "173686033243882469273",
            startPort = "Out",
            endQuest = "173685154543269084728",
            endPort = "In"
          },
          {
            startQuest = "17369484810741363022",
            startPort = "QuestStart",
            endQuest = "173686033243882469273",
            endPort = "In"
          }
        },
        nodeData = {
          ["173685154543269084728"] = {
            key = "173685154543269084728",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2222.730237690472, y = 773.9962706744818},
            propsData = {SpecialConfigId = 2004, BlackScreenImmediately = false}
          },
          ["173685154543269084730"] = {
            key = "173685154543269084730",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2505.0527031881456, y = 1016.958768688148},
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
          ["173686015605181515863"] = {
            key = "173686015605181515863",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2504.7934094514035, y = 822.8659605415298},
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
          ["173686033243882469273"] = {
            key = "173686033243882469273",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1861.7320059426318, y = 791.6905219450387},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090053,
              GuideType = "P",
              GuidePointName = "QuestPoint_Heilang"
            }
          },
          ["17369484810741363022"] = {
            key = "17369484810741363022",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1511.5512897568256, y = 804.7304117540053},
            propsData = {ModeType = 0}
          },
          ["17369484810741363023"] = {
            key = "17369484810741363023",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2507.3915072691484, y = 660.842517203474},
            propsData = {ModeType = 0}
          },
          ["17369484810741363024"] = {
            key = "17369484810741363024",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2856.5618525692526, y = 927.585694012908},
            propsData = {}
          },
          ["17373546550242399"] = {
            key = "17373546550242399",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1150.8214285714287, y = 952.25},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090082,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090082"
            }
          },
          ["1737354701026984661"] = {
            key = "1737354701026984661",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1404.0389610389611, y = 956.5714285714287},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090083,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090083"
            }
          },
          ["17373547456941966449"] = {
            key = "17373547456941966449",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\187\145\231\139\188\231\129\181\229\164\132",
            pos = {x = 1641.2500000000002, y = 962.6071428571429},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090084,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090084"
            }
          },
          ["174688013796628131"] = {
            key = "174688013796628131",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1453, y = 542},
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
    ["17369484810741363021"] = {
      isStoryNode = true,
      key = "17369484810741363021",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
      pos = {x = 3298.246222684818, y = 486.18436235246054},
      propsData = {
        QuestId = 12010112,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_12",
        QuestDeatil = "Content_120101_12",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
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
            startQuest = "17369484810741363025",
            startPort = "QuestStart",
            endQuest = "17373548828673930124",
            endPort = "In"
          },
          {
            startQuest = "17373550257985893745",
            startPort = "Out",
            endQuest = "173684586761262390802",
            endPort = "In"
          },
          {
            startQuest = "174773181816712367828",
            startPort = "Out",
            endQuest = "174773187790612368485",
            endPort = "In"
          },
          {
            startQuest = "173684586761262390802",
            startPort = "Out",
            endQuest = "17369484810741363026",
            endPort = "Success"
          },
          {
            startQuest = "17373548828673930124",
            startPort = "Out",
            endQuest = "174721915177512574",
            endPort = "In"
          },
          {
            startQuest = "17369484810741363025",
            startPort = "QuestStart",
            endQuest = "17373550257985893745",
            endPort = "In"
          },
          {
            startQuest = "17369484810741363025",
            startPort = "QuestStart",
            endQuest = "17536729726933007496",
            endPort = "In"
          },
          {
            startQuest = "17536729726933007496",
            startPort = "Out",
            endQuest = "174773181816712367828",
            endPort = "In"
          }
        },
        nodeData = {
          ["173684586761262390802"] = {
            key = "173684586761262390802",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-\231\153\190\229\185\180\230\152\165",
            pos = {x = 2065.6098996907876, y = 788.7599501324605},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/East01/Plai/East01_Plai_Main",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["17369484810741363025"] = {
            key = "17369484810741363025",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1106.7072318985367, y = 791.3580921493965},
            propsData = {ModeType = 0}
          },
          ["17369484810741363026"] = {
            key = "17369484810741363026",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2610.1171050117523, y = 804.2003529745286},
            propsData = {ModeType = 0}
          },
          ["17369484810741363027"] = {
            key = "17369484810741363027",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2733.614797870795, y = 964.5188208634611},
            propsData = {}
          },
          ["17373548828673930124"] = {
            key = "17373548828673930124",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 1505.5024844720497, y = 370.6152173913043},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2090085,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090085"
            }
          },
          ["17373550027754912013"] = {
            key = "17373550027754912013",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 702.0341614906833, y = 335.03089244851265},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 2080014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2080014"
            }
          },
          ["17373550257985893745"] = {
            key = "17373550257985893745",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 1638.0502451781624, y = 782.4838672768876},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2080013,
              GuideType = "P",
              GuidePointName = "TargetPoint_Plai_Cen01"
            }
          },
          ["174721915177512574"] = {
            key = "174721915177512574",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1825.9372670807452, y = 190.80900621118008},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12010533,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174773181816712367828"] = {
            key = "174773181816712367828",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2021.8149176271304, y = 464.1658091695176},
            propsData = {WaitTime = 1}
          },
          ["174773183340912368218"] = {
            key = "174773183340912368218",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2266.174008536221, y = 182.18399098769953},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["174773187790612368485"] = {
            key = "174773187790612368485",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2278.1558267180394, y = 412.9203546240632},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0034_atomos_feina_home",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["174912837634642191760"] = {
            key = "174912837634642191760",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 1543.4116459627326, y = 996.832298136646},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2090100,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2090100"
            }
          },
          ["17536729726933007496"] = {
            key = "17536729726933007496",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1646.25, y = 532.8664596273289},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104107,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "TargetPoint_Plai_Cen01"
            }
          }
        },
        commentData = {}
      }
    },
    ["17512632684412959"] = {
      isStoryNode = true,
      key = "17512632684412959",
      type = "StoryNode",
      name = "\229\188\128\229\156\186UI",
      pos = {x = 2138.0439560439563, y = 124.26373626373626},
      propsData = {
        QuestId = 12010150,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_2",
        QuestDeatil = "Content_120101_2",
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2090012",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512632684412960",
            startPort = "QuestStart",
            endQuest = "17512638979342975745",
            endPort = "In"
          },
          {
            startQuest = "17512638979342975745",
            startPort = "Out",
            endQuest = "17512632684412963",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17512632684412960"] = {
            key = "17512632684412960",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512632684412963"] = {
            key = "17512632684412963",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512632684412966"] = {
            key = "17512632684412966",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17512638979342975745"] = {
            key = "17512638979342975745",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1504, y = 294},
            propsData = {WaitTime = 4}
          }
        },
        commentData = {}
      }
    },
    ["17513497879983831718"] = {
      isStoryNode = true,
      key = "17513497879983831718",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
      pos = {x = 3563.199108138239, y = 481.77566682543466},
      propsData = {
        QuestId = 12010113,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120101_12",
        QuestDeatil = "Content_120101_12",
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
            startQuest = "17513497879983831736",
            startPort = "Out",
            endQuest = "17513497879983831726",
            endPort = "Success"
          },
          {
            startQuest = "17513497879983831725",
            startPort = "QuestStart",
            endQuest = "17536724718762008480",
            endPort = "In"
          },
          {
            startQuest = "17536724718762008480",
            startPort = "Out",
            endQuest = "17513497879983831736",
            endPort = "In"
          }
        },
        nodeData = {
          ["17513497879983831724"] = {
            key = "17513497879983831724",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 2616.676727934844, y = 786.8356507795903},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2080004,
              GuideType = "P",
              GuidePointName = "TargetPoint_Spr_Cen01"
            }
          },
          ["17513497879983831725"] = {
            key = "17513497879983831725",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2238.0756529511686, y = 815.568618465186},
            propsData = {ModeType = 0}
          },
          ["17513497879983831726"] = {
            key = "17513497879983831726",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3326.420676440324, y = 777.0396386888143},
            propsData = {ModeType = 0}
          },
          ["17513497879983831727"] = {
            key = "17513497879983831727",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3299.150512156509, y = 935.1438208634611},
            propsData = {}
          },
          ["17513497879983831728"] = {
            key = "17513497879983831728",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 2860.7164542875416, y = 1020.5166245692546},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2080003,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2080003"
            }
          },
          ["17513497879983831736"] = {
            key = "17513497879983831736",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2951.667550864002, y = 752.6826569145412},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["17513497879983831738"] = {
            key = "17513497879983831738",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 2637.8049138449205, y = 1005.9105590062113},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2080028,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2080028"
            }
          },
          ["17513497879983831739"] = {
            key = "17513497879983831739",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3039.4173901826175, y = 912.1568298944292},
            propsData = {WaitTime = 2}
          },
          ["17536724718762008480"] = {
            key = "17536724718762008480",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 2588, y = 622},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104110,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Spr_Cen01"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
