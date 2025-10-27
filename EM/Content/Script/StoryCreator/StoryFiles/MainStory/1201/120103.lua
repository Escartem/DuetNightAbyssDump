return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17369484810821365490",
      startPort = "StoryStart",
      endStory = "17369484810821365492",
      endPort = "In"
    },
    {
      startStory = "17369484810821365492",
      startPort = "Success",
      endStory = "17369484810821365493",
      endPort = "In"
    },
    {
      startStory = "17369484810821365493",
      startPort = "Success",
      endStory = "17369484810821365494",
      endPort = "In"
    },
    {
      startStory = "17369484810821365494",
      startPort = "Success",
      endStory = "17369484810821365495",
      endPort = "In"
    },
    {
      startStory = "17369484810821365498",
      startPort = "Success",
      endStory = "17369484810821365499",
      endPort = "In"
    },
    {
      startStory = "17399512085136963905",
      startPort = "Success",
      endStory = "173995185447510831890",
      endPort = "In"
    },
    {
      startStory = "173995185447510831890",
      startPort = "Success",
      endStory = "17369484810821365497",
      endPort = "In"
    },
    {
      startStory = "1729824077214384836",
      startPort = "Success",
      endStory = "17472093252682066435",
      endPort = "In"
    },
    {
      startStory = "17472093252682066435",
      startPort = "Success",
      endStory = "1729837616511768604",
      endPort = "In"
    },
    {
      startStory = "1729837616511768604",
      startPort = "Success",
      endStory = "17494353249906753",
      endPort = "In"
    },
    {
      startStory = "17369484810821365495",
      startPort = "Success",
      endStory = "17399512085136963905",
      endPort = "In"
    },
    {
      startStory = "17369484810821365500",
      startPort = "Success",
      endStory = "17516305984007935639",
      endPort = "In"
    },
    {
      startStory = "17516305984007935639",
      startPort = "Success",
      endStory = "1729824077214384836",
      endPort = "In"
    },
    {
      startStory = "17369484810821365497",
      startPort = "Success",
      endStory = "175179966789127876667",
      endPort = "In"
    },
    {
      startStory = "175179966789127876667",
      startPort = "Success",
      endStory = "17369484810821365498",
      endPort = "In"
    },
    {
      startStory = "175180116464528830642",
      startPort = "Success",
      endStory = "17369484810821365491",
      endPort = "StoryEnd"
    },
    {
      startStory = "17494353249906753",
      startPort = "\230\137\182\231\150\143",
      endStory = "175180116464528830642",
      endPort = "In"
    },
    {
      startStory = "17494353249906753",
      startPort = "\232\153\172\229\133\136\231\148\159",
      endStory = "175180192004028834552",
      endPort = "In"
    },
    {
      startStory = "175180192004028834552",
      startPort = "Success",
      endStory = "17369484810821365491",
      endPort = "StoryEnd"
    },
    {
      startStory = "17369484810821365499",
      startPort = "Success",
      endStory = "175368181970312023917",
      endPort = "In"
    },
    {
      startStory = "175368181970312023917",
      startPort = "Success",
      endStory = "175368182913012024358",
      endPort = "In"
    },
    {
      startStory = "175368182913012024358",
      startPort = "Success",
      endStory = "17369484810821365500",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1729824077214384836"] = {
      isStoryNode = true,
      key = "1729824077214384836",
      type = "StoryNode",
      name = "\230\137\190\230\173\162\230\181\129\228\186\164\229\183\174",
      pos = {x = 2342.4879276527145, y = 469.15851900889425},
      propsData = {
        QuestId = 12010312,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_10",
        QuestDeatil = "Content_120103_10",
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
            startQuest = "1729824077214384840",
            startPort = "QuestStart",
            endQuest = "17298384127971534818",
            endPort = "In"
          },
          {
            startQuest = "17298384127971534818",
            startPort = "Out",
            endQuest = "17489161175276448",
            endPort = "In"
          },
          {
            startQuest = "17489161175276448",
            startPort = "Out",
            endQuest = "1729824077214384841",
            endPort = "Success"
          },
          {
            startQuest = "17298384127971534818",
            startPort = "Out",
            endQuest = "175368479159116370448",
            endPort = "In"
          }
        },
        nodeData = {
          ["1729824077214384840"] = {
            key = "1729824077214384840",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2273.2486754624683, y = 453.7065417341279},
            propsData = {ModeType = 0}
          },
          ["1729824077214384841"] = {
            key = "1729824077214384841",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3218.2468336113884, y = 460.10633729322853},
            propsData = {ModeType = 0}
          },
          ["1729824077214384842"] = {
            key = "1729824077214384842",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["17298384127971534818"] = {
            key = "17298384127971534818",
            type = "GoToNode",
            name = "\232\191\148\229\155\158\230\173\162\230\181\129\229\164\132",
            pos = {x = 2578.721117005598, y = 447.5674971580147},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2080024,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2080024"
            }
          },
          ["17298385447322299891"] = {
            key = "17298385447322299891",
            type = "TalkNode",
            name = "\229\146\140\230\173\162\230\181\129\228\186\164\230\181\129",
            pos = {x = 2823.9886320575956, y = 180.47390109890142},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013417,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["17489161175276448"] = {
            key = "17489161175276448",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2861.214285714286, y = 442.6725146198829},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2080071,
                2080072,
                2080073,
                2080074,
                2080075,
                2080076
              }
            }
          },
          ["175368479159116370448"] = {
            key = "175368479159116370448",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2855.5538277511964, y = 640.0484449760768},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022601,
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
    ["1729837616511768604"] = {
      isStoryNode = true,
      key = "1729837616511768604",
      type = "StoryNode",
      name = "\229\155\158\229\142\187\230\137\190\230\173\162\230\181\129",
      pos = {x = 2841.570677688962, y = 464.3996547318266},
      propsData = {
        QuestId = 12010314,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_12",
        QuestDeatil = "Content_120103_12",
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
        SubRegionId = 104110,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Zhiliu_2110054"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1729837616511768608",
            startPort = "QuestStart",
            endQuest = "1748917083805993236",
            endPort = "In"
          },
          {
            startQuest = "1748917083805993236",
            startPort = "Out",
            endQuest = "174893754896319744843",
            endPort = "In"
          },
          {
            startQuest = "174893754896319744843",
            startPort = "Out",
            endQuest = "1748917083805993237",
            endPort = "In"
          },
          {
            startQuest = "1748917083805993237",
            startPort = "Out",
            endQuest = "17472100974392945088",
            endPort = "In"
          },
          {
            startQuest = "1748917083805993237",
            startPort = "Out",
            endQuest = "1729837616511768609",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1729837616511768608"] = {
            key = "1729837616511768608",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1642.2674344812274, y = 458.9446369722232},
            propsData = {ModeType = 0}
          },
          ["1729837616511768609"] = {
            key = "1729837616511768609",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2590.0818561206397, y = 490.0278023979968},
            propsData = {ModeType = 0}
          },
          ["1729837616511768610"] = {
            key = "1729837616511768610",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["17472100841842944757"] = {
            key = "17472100841842944757",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2143.878968253968, y = 95.69715956558048},
            propsData = {WaitTime = 2}
          },
          ["17472100974392945088"] = {
            key = "17472100974392945088",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\229\155\158\229\191\134\230\173\162\230\181\129\231\154\132\232\175\157",
            pos = {x = 2549.593253968254, y = 246.80827067669154},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1748917083805993236"] = {
            key = "1748917083805993236",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\229\145\138\228\184\128\230\174\181\232\144\189",
            pos = {x = 1942.775582226511, y = 453.3959346896653},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1748917083805993237"] = {
            key = "1748917083805993237",
            type = "TalkNode",
            name = "\229\146\140\230\173\162\230\181\129\229\175\185\232\175\157",
            pos = {x = 2222.890362939434, y = 454.42657613284536},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Zhiliu_2110054",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12023301,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_34",
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
          ["174893754896319744843"] = {
            key = "174893754896319744843",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2215.961722488039, y = 309.72248803827756},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110054}
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810821365490"] = {
      isStoryNode = true,
      key = "17369484810821365490",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 120103},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17369484810821365491"] = {
      isStoryNode = true,
      key = "17369484810821365491",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3669.082259341288, y = 496.015715429048},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17369484810821365492"] = {
      isStoryNode = true,
      key = "17369484810821365492",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\178\137\232\136\185\233\187\145\229\184\130",
      pos = {x = 1077.0793650793653, y = 301.57142857142856},
      propsData = {
        QuestId = 12010301,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_1",
        QuestDeatil = "Content_120103_1",
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
        SubRegionId = 104109,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2100002"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810821365501",
            startPort = "QuestStart",
            endQuest = "1729250773244193085",
            endPort = "In"
          },
          {
            startQuest = "1729250773244193085",
            startPort = "Out",
            endQuest = "17369484810821365502",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1729250773244193085"] = {
            key = "1729250773244193085",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\178\137\232\136\185\233\187\145\229\184\130",
            pos = {x = 2227.8567963917208, y = 437.5539650342895},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100002,
              GuideType = "P",
              GuidePointName = "TargetPoint_Shi_01"
            }
          },
          ["17369484810821365501"] = {
            key = "17369484810821365501",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 444.3671328671328},
            propsData = {ModeType = 0}
          },
          ["17369484810821365502"] = {
            key = "17369484810821365502",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2573.0257008798526, y = 443.4957463853951},
            propsData = {ModeType = 0}
          },
          ["17369484810821365503"] = {
            key = "17369484810821365503",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["17369484810821365493"] = {
      isStoryNode = true,
      key = "17369484810821365493",
      type = "StoryNode",
      name = "\229\146\140\233\187\145\229\184\130\229\149\134\228\186\186\228\186\164\230\181\129",
      pos = {x = 1330.003018761932, y = 302.96610393384583},
      propsData = {
        QuestId = 12010302,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_2",
        QuestDeatil = "Content_120103_2",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010302"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810821365509",
            startPort = "Out",
            endQuest = "17369484810821365510",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365510",
            startPort = "Out",
            endQuest = "17369484810821365505",
            endPort = "Success"
          },
          {
            startQuest = "175367951161611012641",
            startPort = "Out",
            endQuest = "17369484810821365509",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365504",
            startPort = "QuestStart",
            endQuest = "175367953011811013035",
            endPort = "In"
          },
          {
            startQuest = "175367953011811013035",
            startPort = "Out",
            endQuest = "175367951161611012641",
            endPort = "In"
          }
        },
        nodeData = {
          ["17369484810821365504"] = {
            key = "17369484810821365504",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1893.7629611767545, y = 439.7636845912707},
            propsData = {ModeType = 0}
          },
          ["17369484810821365505"] = {
            key = "17369484810821365505",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3182.9308732936456, y = 446.6903276661832},
            propsData = {ModeType = 0}
          },
          ["17369484810821365506"] = {
            key = "17369484810821365506",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17369484810821365507"] = {
            key = "17369484810821365507",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2104.551724137932, y = 311.99999999999994},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104109,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010302"
            }
          },
          ["17369484810821365509"] = {
            key = "17369484810821365509",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\233\187\145\229\184\130\229\149\134\228\186\186\232\129\138\229\164\169 Fixsimple10",
            pos = {x = 2650.7724411603735, y = 440.64532019704427},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210008,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MerchantA_2100003",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12012101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_21",
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
                  TalkActorId = 210008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17369484810821365510"] = {
            key = "17369484810821365510",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\187\145\229\184\130\229\149\134\228\186\186A",
            pos = {x = 2908.029556650247, y = 440.8916256157635},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100003}
            }
          },
          ["175367951161611012641"] = {
            key = "175367951161611012641",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\229\184\130\229\149\134\228\186\186A",
            pos = {x = 2389.1570536430913, y = 443.94366169188135},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100003}
            }
          },
          ["175367953011811013035"] = {
            key = "175367953011811013035",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\178\137\232\136\185\233\187\145\229\184\130",
            pos = {x = 2146.0536053672295, y = 463.5988341056744},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100002,
              GuideType = "P",
              GuidePointName = "TargetPoint_Shi_01"
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810821365494"] = {
      isStoryNode = true,
      key = "17369484810821365494",
      type = "StoryNode",
      name = "\229\137\141\229\142\187\229\135\145\229\135\145\231\131\173\233\151\185",
      pos = {x = 1585.933305618044, y = 300.2744971526759},
      propsData = {
        QuestId = 12010303,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_3",
        QuestDeatil = "Content_120103_3",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010303"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810821365512",
            startPort = "QuestStart",
            endQuest = "17297503632772664467",
            endPort = "In"
          },
          {
            startQuest = "17297503632772664467",
            startPort = "Out",
            endQuest = "17297503632772664468",
            endPort = "In"
          },
          {
            startQuest = "17297512733783807266",
            startPort = "Out",
            endQuest = "17369484810821365515",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365515",
            startPort = "Out",
            endQuest = "17297518621226853779",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365515",
            startPort = "Out",
            endQuest = "17297519919286854542",
            endPort = "In"
          },
          {
            startQuest = "17297518621226853779",
            startPort = "Out",
            endQuest = "17297520852087615690",
            endPort = "In"
          },
          {
            startQuest = "17297520852087615690",
            startPort = "Out",
            endQuest = "17297521975087996727",
            endPort = "In"
          },
          {
            startQuest = "17297521975087996727",
            startPort = "Out",
            endQuest = "17369484810821365513",
            endPort = "Success"
          },
          {
            startQuest = "17297503632772664468",
            startPort = "Out",
            endQuest = "175367979672611014923",
            endPort = "In"
          },
          {
            startQuest = "175367979672611014923",
            startPort = "Out",
            endQuest = "17297512733783807266",
            endPort = "In"
          },
          {
            startQuest = "175367979672611014923",
            startPort = "Out",
            endQuest = "17397816656154155903",
            endPort = "In"
          }
        },
        nodeData = {
          ["17297503632772664467"] = {
            key = "17297503632772664467",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1759.2398119122263, y = 435.63949843260184},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104109,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Shi_01"
            }
          },
          ["17297503632772664468"] = {
            key = "17297503632772664468",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\229\184\130\229\149\134\228\186\186B\229\146\140\229\185\180\232\189\187\229\165\179\229\173\169",
            pos = {x = 2016.0517241379312, y = 445.94529608322716},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100006, 2100007}
            }
          },
          ["17297512733783807266"] = {
            key = "17297512733783807266",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\144\181\233\151\185\231\154\132\229\156\176\230\150\185",
            pos = {x = 2607.651469471735, y = 431.64705190409313},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100009,
              GuideType = "M",
              GuidePointName = "QuestPoint_12010303"
            }
          },
          ["17297518621226853779"] = {
            key = "17297518621226853779",
            type = "GoToNode",
            name = "\229\135\145\229\190\151\230\155\180\232\191\145\228\184\128\228\186\155",
            pos = {x = 3183.4303311354442, y = 434.91625497041036},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100010,
              GuideType = "M",
              GuidePointName = "QuestPoint_12010303"
            }
          },
          ["17297519919286854542"] = {
            key = "17297519919286854542",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\135\145\229\190\151\230\155\180\232\191\145\228\184\128\228\186\155",
            pos = {x = 3133.2537368963494, y = 255.2508162424715},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17297520852087615690"] = {
            key = "17297520852087615690",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\175\148\232\175\149\229\188\128\229\167\139 Fixsimple12",
            pos = {x = 3438.808182450795, y = 435.8452218368771},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_22",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17297521975087996727"] = {
            key = "17297521975087996727",
            type = "TalkNode",
            name = "\233\187\145\229\177\143 - \228\184\187\232\167\146\229\135\186\230\137\139",
            pos = {x = 3707.7042863468987, y = 430.4556114472666},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012509,
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
          ["17369484810821365512"] = {
            key = "17369484810821365512",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1505.2629611767545, y = 433.7636845912707},
            propsData = {ModeType = 0}
          },
          ["17369484810821365513"] = {
            key = "17369484810821365513",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3990.8742795042926, y = 422.3185327943884},
            propsData = {ModeType = 0}
          },
          ["17369484810821365514"] = {
            key = "17369484810821365514",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["17369484810821365515"] = {
            key = "17369484810821365515",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\187\145\229\184\130\228\186\137\229\144\181 Fixsimple11",
            pos = {x = 2876.5948204755696, y = 437.8074560161103},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_22",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17397816656154155903"] = {
            key = "17397816656154155903",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\130\163\233\135\140\229\143\145\231\148\159\228\186\134\228\187\128\228\185\136",
            pos = {x = 2591.9126706626694, y = 252.94316794316782},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175367979672611014923"] = {
            key = "175367979672611014923",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\144\181\233\151\185\231\154\132\229\156\176\230\150\185",
            pos = {x = 2304.1923076923076, y = 436.9903846153846},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100071,
              GuideType = "M",
              GuidePointName = "QuestPoint_12010303"
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810821365495"] = {
      isStoryNode = true,
      key = "17369484810821365495",
      type = "StoryNode",
      name = "\230\159\165\231\156\139\229\167\145\229\168\152\228\188\164\229\138\191",
      pos = {x = 1828.2496099585994, y = 304.8745631999747},
      propsData = {
        QuestId = 12010304,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_4",
        QuestDeatil = "Content_120103_4",
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
        SubRegionId = 104109,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_YoungGirl_2100007"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810821365516",
            startPort = "QuestStart",
            endQuest = "17369484810821365519",
            endPort = "In"
          },
          {
            startQuest = "173978246157113479789",
            startPort = "Out",
            endQuest = "173978246157013479788",
            endPort = "In"
          },
          {
            startQuest = "173978246157013479788",
            startPort = "Out",
            endQuest = "173978255956014517379",
            endPort = "In"
          },
          {
            startQuest = "173978255956014517379",
            startPort = "Out",
            endQuest = "173978246157113479790",
            endPort = "In"
          },
          {
            startQuest = "173978246157113479790",
            startPort = "Out",
            endQuest = "173978290850219699662",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365519",
            startPort = "Out",
            endQuest = "173978318021724881484",
            endPort = "In"
          },
          {
            startQuest = "173978318021724881484",
            startPort = "Out",
            endQuest = "173978246157113479789",
            endPort = "In"
          },
          {
            startQuest = "173978290850219699662",
            startPort = "Out",
            endQuest = "174947040973010155753",
            endPort = "In"
          },
          {
            startQuest = "174947040973010155753",
            startPort = "Out",
            endQuest = "173978241163313479208",
            endPort = "In"
          },
          {
            startQuest = "173978241163313479208",
            startPort = "Out",
            endQuest = "175179394115622183321",
            endPort = "In"
          },
          {
            startQuest = "175179394115622183321",
            startPort = "Out",
            endQuest = "17369484810821365517",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17369484810821365516"] = {
            key = "17369484810821365516",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1817.846078059871, y = 437.5558923834785},
            propsData = {ModeType = 0}
          },
          ["17369484810821365517"] = {
            key = "17369484810821365517",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4191.9061924189655, y = 448.1381132139688},
            propsData = {ModeType = 0}
          },
          ["17369484810821365518"] = {
            key = "17369484810821365518",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4197.090526106753, y = 588.2137233962793},
            propsData = {}
          },
          ["17369484810821365519"] = {
            key = "17369484810821365519",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\175\162\233\151\174\230\131\133\229\134\181 Fixsimple11",
            pos = {x = 2091.596263477012, y = 427.42506063371485},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_YoungGirl_2100007",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12012601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_24",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
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
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011},
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
          ["173978241163313479208"] = {
            key = "173978241163313479208",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\187\167\231\187\173\229\175\185\232\175\157",
            pos = {x = 3900.933049708912, y = 435.79220779220776},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012609,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_25",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173978246157013479788"] = {
            key = "173978246157013479788",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2821.912137572636, y = 435.7973303264336},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2100011,
                2100012,
                2100013
              }
            }
          },
          ["173978246157113479789"] = {
            key = "173978246157113479789",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2574.5527978359, y = 424.9568046260629},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104109,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010303"
            }
          },
          ["173978246157113479790"] = {
            key = "173978246157113479790",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3329.358756127377, y = 441.23259397802997},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2100011,
                2100012,
                2100013
              }
            }
          },
          ["173978255956014517379"] = {
            key = "173978255956014517379",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3059.110294208553, y = 436.7137036159539},
            propsData = {
              NewDescription = "Description_120103_4_1",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          },
          ["173978290850219699662"] = {
            key = "173978290850219699662",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3620.77263187089, y = 436.59682049907093},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104109,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010303"
            }
          },
          ["173978318021724881484"] = {
            key = "173978318021724881484",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\187\145\229\184\130\229\149\134\228\186\186B\229\146\140\229\185\180\232\189\187\229\165\179\229\173\169",
            pos = {x = 2339.3440604423176, y = 434.4539633562137},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100006, 2100007}
            }
          },
          ["174947040973010155753"] = {
            key = "174947040973010155753",
            type = "TalkNode",
            name = "\227\128\144\233\187\145\229\177\143\227\128\145\228\184\187\232\167\146\229\135\186\230\137\139",
            pos = {x = 3890.857142857142, y = 268.07142857142856},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012608,
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["175179394115622183321"] = {
            key = "175179394115622183321",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 3900, y = 630},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2100014"
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810821365496"] = {
      isStoryNode = true,
      key = "17369484810821365496",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\232\153\172\229\133\136\231\148\159\229\138\158\229\133\172\229\174\164",
      pos = {x = 2126.4495835762073, y = 101.26902763512194},
      propsData = {
        QuestId = 12010305,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_5",
        QuestDeatil = "Content_120103_5",
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
        SubRegionId = 104109,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2100014"
      },
      questNodeData = {
        lineData = {},
        nodeData = {
          ["17369484810821365520"] = {
            key = "17369484810821365520",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2143.467887285128, y = 453.2981673498914},
            propsData = {ModeType = 0}
          },
          ["17369484810821365521"] = {
            key = "17369484810821365521",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2742.230318723694, y = 455.6910129004892},
            propsData = {ModeType = 0}
          },
          ["17369484810821365522"] = {
            key = "17369484810821365522",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["17399510307526963186"] = {
            key = "17399510307526963186",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2476.6307076544144, y = 198.6399204244032},
            propsData = {
              ModeType = 1,
              Id = 104901,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17369484810821365497"] = {
      isStoryNode = true,
      key = "17369484810821365497",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\231\153\187\229\156\186",
      pos = {x = 807.6524913485106, y = 472.01926772070703},
      propsData = {
        QuestId = 12010308,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_6",
        QuestDeatil = "Content_120103_6",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010306"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810821365530",
            startPort = "Out",
            endQuest = "172975580176614097699",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365530",
            startPort = "Out",
            endQuest = "172975544516213334888",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365526",
            startPort = "QuestStart",
            endQuest = "17473166293875237601",
            endPort = "In"
          },
          {
            startQuest = "17473166293875237601",
            startPort = "Out",
            endQuest = "17369484810821365530",
            endPort = "In"
          },
          {
            startQuest = "172975621297314861048",
            startPort = "Out",
            endQuest = "174893496307411714891",
            endPort = "In"
          },
          {
            startQuest = "172975580176614097699",
            startPort = "Out",
            endQuest = "17527345719571929289",
            endPort = "In"
          },
          {
            startQuest = "17527345719571929289",
            startPort = "Out",
            endQuest = "172975621297314861048",
            endPort = "In"
          },
          {
            startQuest = "174893496307411714891",
            startPort = "Out",
            endQuest = "17369484810821365527",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172975544516213334888"] = {
            key = "172975544516213334888",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\153\189\232\174\164\230\128\130",
            pos = {x = 2556.614251810271, y = 308.4719534449446},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172975580176614097699"] = {
            key = "172975580176614097699",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\165\179\229\173\169\232\186\171\230\151\129",
            pos = {x = 2554.664649688256, y = 458.30643620356517},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100016,
              GuideType = "N",
              GuidePointName = "Npc_YoungGirl_2100015"
            }
          },
          ["172975621297314861048"] = {
            key = "172975621297314861048",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\175\162\233\151\174\230\137\182\231\150\143 Fixsimple15",
            pos = {x = 3074.7743379730287, y = 461.9165426710686},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_27",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["17369484810821365526"] = {
            key = "17369484810821365526",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1647.4169210100247, y = 473.4507630300733},
            propsData = {ModeType = 0}
          },
          ["17369484810821365527"] = {
            key = "17369484810821365527",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3670.318123906091, y = 468.0835562025708},
            propsData = {ModeType = 0}
          },
          ["17369484810821365528"] = {
            key = "17369484810821365528",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3903.3864906785802, y = 636.6508035574974},
            propsData = {}
          },
          ["17369484810821365530"] = {
            key = "17369484810821365530",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\185\180\232\189\187\229\167\145\229\168\152",
            pos = {x = 2220.9917068365453, y = 462.99945463799196},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100015}
            }
          },
          ["17473166293875237601"] = {
            key = "17473166293875237601",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1935.6115061409175, y = 335.43244990303793},
            propsData = {WaitTime = 1}
          },
          ["174893496307411714891"] = {
            key = "174893496307411714891",
            type = "TalkNode",
            name = "\227\128\144SC006\227\128\145\230\137\182\231\150\143\229\146\179\232\161\128",
            pos = {x = 3338.929945054945, y = 463.8610900593659},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC006/SQ_Ver0101_SC006",
              BlendInTime = 1,
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
          ["17527345719571929289"] = {
            key = "17527345719571929289",
            type = "TalkNode",
            name = "\227\128\144SC005\227\128\145\230\137\182\231\150\143\231\153\187\229\156\186",
            pos = {x = 2814, y = 460.7232142857142},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC005/SQ_Ver0101_SC005",
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
    ["17369484810821365498"] = {
      isStoryNode = true,
      key = "17369484810821365498",
      type = "StoryNode",
      name = "\229\146\140\229\133\172\229\176\154\229\184\136\229\130\133\228\186\164\232\176\136",
      pos = {x = 1345.3362357927974, y = 467.04851216362175},
      propsData = {
        QuestId = 12010309,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_8",
        QuestDeatil = "Content_120103_8",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Gongshu"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1740129975643782769",
            startPort = "Out",
            endQuest = "1740129975643782770",
            endPort = "In"
          },
          {
            startQuest = "1740129975642782767",
            startPort = "Out",
            endQuest = "17369484810821365532",
            endPort = "Success"
          },
          {
            startQuest = "17369484810821365531",
            startPort = "QuestStart",
            endQuest = "1740129975643782769",
            endPort = "In"
          },
          {
            startQuest = "1740129975643782770",
            startPort = "Out",
            endQuest = "175368277687212033952",
            endPort = "In"
          },
          {
            startQuest = "175368277687212033952",
            startPort = "Out",
            endQuest = "1740129975642782767",
            endPort = "In"
          }
        },
        nodeData = {
          ["17369484810821365531"] = {
            key = "17369484810821365531",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2205.8127780265704, y = 470.37320840079457},
            propsData = {ModeType = 0}
          },
          ["17369484810821365532"] = {
            key = "17369484810821365532",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3464.6087769312267, y = 452.7139717640208},
            propsData = {ModeType = 0}
          },
          ["17369484810821365533"] = {
            key = "17369484810821365533",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1740129975642782766"] = {
            key = "1740129975642782766",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2418.834989430815, y = 168.78263453159207},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104105,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Gongshu"
            }
          },
          ["1740129975642782767"] = {
            key = "1740129975642782767",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 3188.917224437189, y = 476.97332430159213},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060002}
            }
          },
          ["1740129975643782769"] = {
            key = "1740129975643782769",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2537.738614541336, y = 483.5276389524587},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060002}
            }
          },
          ["1740129975643782770"] = {
            key = "1740129975643782770",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\133\172\229\176\154\229\184\136\229\130\133\232\129\138\229\164\169 Fixsimple17",
            pos = {x = 2876.646467607811, y = 472.6914199989982},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210014,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MasterGS_2060002",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12013401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_29",
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
                  TalkActorId = 210014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["175368277687212033952"] = {
            key = "175368277687212033952",
            type = "TalkNode",
            name = "\227\128\144\229\188\149\229\175\188\227\128\145\232\163\133\229\164\135\231\137\181\230\156\186\229\133\172\230\158\162",
            pos = {x = 2904.4583333333335, y = 657.2916666666666},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023811,
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
    ["17369484810821365499"] = {
      isStoryNode = true,
      key = "17369484810821365499",
      type = "StoryNode",
      name = "\232\174\178\232\191\176\229\144\184\230\148\182\230\153\182\229\158\162",
      pos = {x = 1588.0600911493466, y = 464.9199955207834},
      propsData = {
        QuestId = 12010310,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_8_1",
        QuestDeatil = "Content_120103_8",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Fil_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810821365540",
            startPort = "Out",
            endQuest = "17369484810831365541",
            endPort = "In"
          },
          {
            startQuest = "17369484810821365537",
            startPort = "QuestStart",
            endQuest = "17369484810821365540",
            endPort = "In"
          },
          {
            startQuest = "1747206869845896911",
            startPort = "Out",
            endQuest = "17369484810821365538",
            endPort = "Success"
          },
          {
            startQuest = "17369484810831365541",
            startPort = "Out",
            endQuest = "175368279221012034247",
            endPort = "In"
          },
          {
            startQuest = "175368279221012034247",
            startPort = "Out",
            endQuest = "1747206869845896911",
            endPort = "In"
          }
        },
        nodeData = {
          ["17369484810821365537"] = {
            key = "17369484810821365537",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1736.8736754624683, y = 228.62699627958256},
            propsData = {ModeType = 0}
          },
          ["17369484810821365538"] = {
            key = "17369484810821365538",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2801.295763724921, y = 288.4680347741814},
            propsData = {ModeType = 0}
          },
          ["17369484810821365539"] = {
            key = "17369484810821365539",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4571.107084548312, y = 381.6663207988767},
            propsData = {}
          },
          ["17369484810821365540"] = {
            key = "17369484810821365540",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2245.413731650808, y = 49.19979500643578},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060019}
            }
          },
          ["17369484810831365541"] = {
            key = "17369484810831365541",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\174\178\232\167\163\229\144\184\230\148\182\229\173\144\229\188\185",
            pos = {x = 2358.2426053633035, y = 224.07451511391434},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210014,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MasterGS_2060019",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12013416,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_29a",
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
                  TalkActorId = 200002,
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
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["1747206869845896911"] = {
            key = "1747206869845896911",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2445.4222317156514, y = 581.111980125138},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060019}
            }
          },
          ["175368279221012034247"] = {
            key = "175368279221012034247",
            type = "TalkNode",
            name = "\227\128\144\229\188\149\229\175\188\227\128\145\229\142\187\233\153\164\230\153\182\229\158\162",
            pos = {x = 2408.144650505865, y = 391.7722636687132},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023812,
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
    ["17369484810821365500"] = {
      isStoryNode = true,
      key = "17369484810821365500",
      type = "StoryNode",
      name = "\233\135\135\233\155\134\233\187\145\233\190\153\233\179\158",
      pos = {x = 1847.8164789237017, y = 467.02416096614655},
      propsData = {
        QuestId = 12010311,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_9",
        QuestDeatil = "Content_120103_9",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Fil_02"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17369484810831365542",
            startPort = "QuestStart",
            endQuest = "17369484810831365546",
            endPort = "In"
          },
          {
            startQuest = "17369484810831365546",
            startPort = "Out",
            endQuest = "17472076711892059546",
            endPort = "In"
          },
          {
            startQuest = "17516299699546979902",
            startPort = "Out",
            endQuest = "17516302884497932833",
            endPort = "In"
          },
          {
            startQuest = "17516302884497932833",
            startPort = "Out",
            endQuest = "17516299935556980291",
            endPort = "In"
          },
          {
            startQuest = "17369484810831365546",
            startPort = "Out",
            endQuest = "17369484810831365547",
            endPort = "In"
          },
          {
            startQuest = "17369484810831365547",
            startPort = "Out",
            endQuest = "17472077016072060344",
            endPort = "In"
          },
          {
            startQuest = "17369484810831365547",
            startPort = "Out",
            endQuest = "17369484810831365543",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17369484810831365542"] = {
            key = "17369484810831365542",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1886.3915326053254, y = 474.84939887698505},
            propsData = {ModeType = 0}
          },
          ["17369484810831365543"] = {
            key = "17369484810831365543",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3321.41552018797, y = 497.4031326031817},
            propsData = {ModeType = 0}
          },
          ["17369484810831365544"] = {
            key = "17369484810831365544",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3390.0735283985796, y = 686.8233490647285},
            propsData = {}
          },
          ["17369484810831365545"] = {
            key = "17369484810831365545",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \228\189\142\232\175\173",
            pos = {x = 3198.1988655781884, y = -8.720561935473341},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 120134311,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17369484810831365546"] = {
            key = "17369484810831365546",
            type = "GoToNode",
            name = "\229\142\187\230\177\161\231\167\189\228\185\139\229\156\176\233\171\152\230\177\161\230\159\147\229\140\186",
            pos = {x = 2181.323429369029, y = 466.6771470918371},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060100,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010309"
            }
          },
          ["17369484810831365547"] = {
            key = "17369484810831365547",
            type = "TalkNode",
            name = "\227\128\144\230\156\186\229\133\179\227\128\145\233\135\135\233\155\134\233\187\145\233\190\153\233\179\158",
            pos = {x = 2645.001204508218, y = 475.9954736112322},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023810,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["17472076711892059546"] = {
            key = "17472076711892059546",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\233\130\163\233\135\140\230\156\137\229\165\135\230\128\170\231\154\132\228\184\156\232\165\191",
            pos = {x = 2502.0990259740265, y = 239.45454545454544},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013429,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17472077016072060344"] = {
            key = "17472077016072060344",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \228\189\142\232\175\173",
            pos = {x = 3104.0564652738567, y = 273.49760022586105},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013436,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174731759484111329551"] = {
            key = "174731759484111329551",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4413.26050420168, y = 652.6050420168067},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_Plai_02",
              FadeIn = true,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["174947272810618461952"] = {
            key = "174947272810618461952",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\233\135\135\233\155\134\233\187\145\233\190\153\233\179\158",
            pos = {x = 2428.887445887445, y = 942.8181818181818},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060029,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2060029"
            }
          },
          ["174947277824018462779"] = {
            key = "174947277824018462779",
            type = "GoToNode",
            name = "\233\135\135\233\155\134\229\144\142\228\189\142\232\175\173",
            pos = {x = 3049.8831168831175, y = 782.4285714285714},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060030,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2060030"
            }
          },
          ["174947380978124002188"] = {
            key = "174947380978124002188",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2910.3506493506484, y = 48.25974025974031},
            propsData = {WaitTime = 0}
          },
          ["17516299699546979902"] = {
            key = "17516299699546979902",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\233\190\153\233\179\158",
            pos = {x = 1916.9859782030835, y = 770.4300239234449},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060094}
            }
          },
          ["17516299935556980291"] = {
            key = "17516299935556980291",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2248.247730339835, y = 783.5853269537481},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2060094,
              StateId = 118019,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Heilongling_2060094"
            }
          },
          ["17516302884497932833"] = {
            key = "17516302884497932833",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\149\140\228\186\186",
            pos = {x = 1927.9601951252403, y = 964.3830610020539},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060098, 2060099}
            }
          }
        },
        commentData = {}
      }
    },
    ["17399512085136963905"] = {
      isStoryNode = true,
      key = "17399512085136963905",
      type = "StoryNode",
      name = "\229\146\140\232\153\172\229\133\136\231\148\159\228\186\164\230\181\129",
      pos = {x = 2085.028626649878, y = 303.704605489463},
      propsData = {
        QuestId = 12010306,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_5",
        QuestDeatil = "Content_120103_5",
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
            startQuest = "17399512085136963913",
            startPort = "Out",
            endQuest = "17399512085136963911",
            endPort = "Success"
          },
          {
            startQuest = "17399517418169284814",
            startPort = "Out",
            endQuest = "173995177539310057972",
            endPort = "In"
          },
          {
            startQuest = "173995177539310057972",
            startPort = "Out",
            endQuest = "17399512085136963913",
            endPort = "In"
          },
          {
            startQuest = "17482691015939066",
            startPort = "Out",
            endQuest = "17399517418169284814",
            endPort = "In"
          },
          {
            startQuest = "17399512085136963910",
            startPort = "QuestStart",
            endQuest = "17482691015939066",
            endPort = "In"
          }
        },
        nodeData = {
          ["17399512085136963910"] = {
            key = "17399512085136963910",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1898.1028421291348, y = 501.6148750674612},
            propsData = {ModeType = 0}
          },
          ["17399512085136963911"] = {
            key = "17399512085136963911",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3501.9722190647326, y = 471.15468285122813},
            propsData = {ModeType = 0}
          },
          ["17399512085136963912"] = {
            key = "17399512085136963912",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["17399512085136963913"] = {
            key = "17399512085136963913",
            type = "TalkNode",
            name = "\227\128\14426\227\128\145\232\175\162\233\151\174\230\131\133\229\134\181 Fixsimple11",
            pos = {x = 3106.3058594366084, y = 476.41297549662977},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012701,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_26",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
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
                {TalkActorType = "Npc", TalkActorId = 210012},
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
          ["17399513980008511192"] = {
            key = "17399513980008511192",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 2073.05303030303, y = 820.4077380952381},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104901,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_QuestTrigger_2270004"
            }
          },
          ["17399517418169284814"] = {
            key = "17399517418169284814",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2547.938311688312, y = 483.0892857142857},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2270001}
            }
          },
          ["173995177539310057972"] = {
            key = "173995177539310057972",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2817.402597402597, y = 469.4123376623377},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270004,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270004"
            }
          },
          ["17482691015939066"] = {
            key = "17482691015939066",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2272.8571428571427, y = 473.787878787879},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270005,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270005"
            }
          }
        },
        commentData = {}
      }
    },
    ["173995185447510831890"] = {
      isStoryNode = true,
      key = "173995185447510831890",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\232\153\172\229\133\136\231\148\159\229\138\158\229\133\172\229\174\164",
      pos = {x = 2354.951390272229, y = 304.871964825113},
      propsData = {
        QuestId = 12010307,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_5_1",
        QuestDeatil = "Content_120103_5_1",
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
            startQuest = "173995185447510831895",
            startPort = "QuestStart",
            endQuest = "17494373184241862346",
            endPort = "In"
          },
          {
            startQuest = "17494373184241862346",
            startPort = "Out",
            endQuest = "173995185447510831896",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173995185447510831895"] = {
            key = "173995185447510831895",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2166.6861754624683, y = 442.53154173412787},
            propsData = {ModeType = 0}
          },
          ["173995185447510831896"] = {
            key = "173995185447510831896",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2740.9722190647326, y = 443.15468285122813},
            propsData = {ModeType = 0}
          },
          ["173995185447510831897"] = {
            key = "173995185447510831897",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["173995192568511606272"] = {
            key = "173995192568511606272",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\229\138\158\229\133\172\229\174\164",
            pos = {x = 2354.685930252962, y = 657.0474459878394},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270005,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270005"
            }
          },
          ["173995192568511606273"] = {
            key = "173995192568511606273",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2650.7216784426905, y = 643.4826543466086},
            propsData = {
              ModeType = 1,
              Id = 104109,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17494373184241862346"] = {
            key = "17494373184241862346",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\229\138\158\229\133\172\229\174\164",
            pos = {x = 2441.7774767801857, y = 437.52180082559335},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2100014"
            }
          }
        },
        commentData = {}
      }
    },
    ["17472093252682066435"] = {
      isStoryNode = true,
      key = "17472093252682066435",
      type = "StoryNode",
      name = "\231\153\190\229\185\180\230\152\165\228\191\157\229\141\171\230\136\152",
      pos = {x = 2582.9709297663785, y = 463.70598164690745},
      propsData = {
        QuestId = 12010313,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_11_1",
        QuestDeatil = "Content_120103_11_1",
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
            startQuest = "17472093252682066440",
            startPort = "QuestStart",
            endQuest = "17472098498022940718",
            endPort = "In"
          },
          {
            startQuest = "17472098668102941220",
            startPort = "Out",
            endQuest = "17472097537952939376",
            endPort = "In"
          },
          {
            startQuest = "17472097537952939376",
            startPort = "Out",
            endQuest = "17472097756462939591",
            endPort = "In"
          },
          {
            startQuest = "17472098498022940718",
            startPort = "Out",
            endQuest = "17489162545498117",
            endPort = "In"
          },
          {
            startQuest = "17489162545498117",
            startPort = "Out",
            endQuest = "17489163046798865",
            endPort = "In"
          },
          {
            startQuest = "174891649767711006",
            startPort = "Out",
            endQuest = "17472097302382938973",
            endPort = "In"
          },
          {
            startQuest = "174891659526411938",
            startPort = "Out",
            endQuest = "17472098668102941220",
            endPort = "In"
          },
          {
            startQuest = "174891692074014869",
            startPort = "Out",
            endQuest = "174891692589914964",
            endPort = "In"
          },
          {
            startQuest = "174893739353118851855",
            startPort = "Out",
            endQuest = "17472097861352939812",
            endPort = "In"
          },
          {
            startQuest = "174943571813510070",
            startPort = "Out",
            endQuest = "174891649767711006",
            endPort = "In"
          },
          {
            startQuest = "17472097302382938973",
            startPort = "Out",
            endQuest = "174943614233611527",
            endPort = "In"
          },
          {
            startQuest = "17472097756462939591",
            startPort = "Out",
            endQuest = "174943616873612300",
            endPort = "In"
          },
          {
            startQuest = "174943571813510070",
            startPort = "Out",
            endQuest = "174947497975426771438",
            endPort = "In"
          },
          {
            startQuest = "17527346640701931810",
            startPort = "Out",
            endQuest = "17472093252682066441",
            endPort = "Success"
          },
          {
            startQuest = "17489163046798865",
            startPort = "Out",
            endQuest = "174943571813510070",
            endPort = "In"
          },
          {
            startQuest = "174943614233611527",
            startPort = "Out",
            endQuest = "174891659526411938",
            endPort = "In"
          },
          {
            startQuest = "174943616873612300",
            startPort = "Out",
            endQuest = "174891689082014286",
            endPort = "In"
          },
          {
            startQuest = "174891689082014286",
            startPort = "Out",
            endQuest = "174891692074014869",
            endPort = "In"
          },
          {
            startQuest = "174891692589914964",
            startPort = "Out",
            endQuest = "17527346640701931810",
            endPort = "In"
          }
        },
        nodeData = {
          ["17472093252682066440"] = {
            key = "17472093252682066440",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1394.0705242019644, y = 529.9380543391699},
            propsData = {ModeType = 0}
          },
          ["17472093252682066441"] = {
            key = "17472093252682066441",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3928.4554840407054, y = 377.77443502233825},
            propsData = {ModeType = 0}
          },
          ["17472093252682066442"] = {
            key = "17472093252682066442",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3937.3567196655163, y = 548.5139324751262},
            propsData = {}
          },
          ["17472097302382938973"] = {
            key = "17472097302382938973",
            type = "TalkNode",
            name = "\227\128\14431a\227\128\145\229\146\140\231\142\137\231\172\153\229\175\185\232\175\157",
            pos = {x = 2330.576298701299, y = 578.9674676888297},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210033,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Yusheng_2110034",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12022801,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_31a",
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
                  TalkActorId = 210033,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["17472097537952939376"] = {
            key = "17472097537952939376",
            type = "TalkNode",
            name = "\227\128\14432\227\128\145\230\173\162\230\181\129\232\174\173\230\150\165\228\184\139\229\177\158",
            pos = {x = 2958.1207652752573, y = 381.6786146400484},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022901,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_32",
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
                  TalkActorId = 210031,
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
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210031},
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
          ["17472097756462939591"] = {
            key = "17472097756462939591",
            type = "TalkNode",
            name = "\227\128\14433\227\128\145\229\146\140\230\173\162\230\181\129\229\175\185\232\175\157",
            pos = {x = 2951.58922089707, y = 546.9738138449572},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_33",
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
          ["17472097861352939812"] = {
            key = "17472097861352939812",
            type = "TalkNode",
            name = "SC007-\231\153\189\233\190\153\230\168\170\230\137\171\233\187\145\231\139\188\231\129\181",
            pos = {x = 3616.2674590888982, y = 920.0086687306502},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023101,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 1,
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
          ["17472098498022940718"] = {
            key = "17472098498022940718",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1698.5518907563026, y = 448.1881026094649},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110062,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110062"
            }
          },
          ["17472098668102941220"] = {
            key = "17472098668102941220",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2639.849006987165, y = 713.7773980405559},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930085,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1930085"
            }
          },
          ["17489162545498117"] = {
            key = "17489162545498117",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\142\137\231\172\153",
            pos = {x = 2004.307842132068, y = 380.63922305764413},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110034}
            }
          },
          ["17489163046798865"] = {
            key = "17489163046798865",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 2012.893136249715, y = 570.4156936458793},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2110056,
                2110057,
                2110058,
                2110059,
                2110060,
                2110061
              }
            }
          },
          ["17489163785059428"] = {
            key = "17489163785059428",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1299.693136249715, y = 771.817000835422},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110063,
              GuideType = "M",
              GuidePointName = ""
            }
          },
          ["174891649767711006"] = {
            key = "174891649767711006",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2342.4441166418715, y = 378.69347142365734},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2110059,
                2110060,
                2110061
              }
            }
          },
          ["174891659526411938"] = {
            key = "174891659526411938",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 2644.6107408673197, y = 537.8187324371535},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2110065,
                2110066,
                2110067
              }
            }
          },
          ["174891689082014286"] = {
            key = "174891689082014286",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 3246.957192284229, y = 210.47091474768425},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110078,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110078"
            }
          },
          ["174891692074014869"] = {
            key = "174891692074014869",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3258.604636652726, y = 394.2200071757241},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2110068,
                2110069,
                2110070,
                2110074,
                2110075,
                2110076
              }
            }
          },
          ["174891692589914964"] = {
            key = "174891692589914964",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3260.26662495682, y = 551.2037923963517},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2110068,
                2110069,
                2110070,
                2110074,
                2110075,
                2110076
              }
            }
          },
          ["174893739353118851855"] = {
            key = "174893739353118851855",
            type = "TalkNode",
            name = "SC007-\231\153\189\233\190\153\230\168\170\230\137\171\233\187\145\231\139\188\231\129\181",
            pos = {x = 3621.4308441558437, y = 811.9380895420368},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022517,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["174943571813510070"] = {
            key = "174943571813510070",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2008.7272727272727, y = 789.459595959596},
            propsData = {
              NewDescription = "Description_120103_11_2",
              NewDetail = "Content_120103_11_2",
              SubTaskTargetIndex = 0
            }
          },
          ["174943614233611527"] = {
            key = "174943614233611527",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2644.0277777777774, y = 388.99999999999983},
            propsData = {
              NewDescription = "Description_120103_11_1",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          },
          ["174943616873612300"] = {
            key = "174943616873612300",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3248.95707070707, y = 42.252525252525125},
            propsData = {
              NewDescription = "Description_120103_11_3",
              NewDetail = "Content_120103_11_3",
              SubTaskTargetIndex = 0
            }
          },
          ["174947497975426771438"] = {
            key = "174947497975426771438",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2024.643506493507, y = 1014.0810276679842},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022701,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17527346640701931810"] = {
            key = "17527346640701931810",
            type = "TalkNode",
            name = "\227\128\144SC007\227\128\145\231\153\189\233\190\153\230\168\170\230\137\171\233\187\145\231\139\188\231\129\181",
            pos = {x = 3554.858053710996, y = 547.8494005994004},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC007/SQ_Ver0101_SC007",
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
    ["17494353249906753"] = {
      isStoryNode = true,
      key = "17494353249906753",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\231\153\190\229\185\180\230\152\165",
      pos = {x = 3111.9574154206584, y = 463.7346570063982},
      propsData = {
        QuestId = 12010315,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_13",
        QuestDeatil = "Content_120103_13",
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
        SubRegionId = 104110,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_MerchantC_2110079"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17494353249906762",
            startPort = "Option_1",
            endQuest = "175180182961128833303",
            endPort = "In"
          },
          {
            startQuest = "17494353249906762",
            startPort = "Option_2",
            endQuest = "175180183040828833342",
            endPort = "In"
          },
          {
            startQuest = "17518830991543810669",
            startPort = "Out",
            endQuest = "17518831226273811092",
            endPort = "In"
          },
          {
            startQuest = "17518831226273811092",
            startPort = "Out",
            endQuest = "17494353249906762",
            endPort = "In"
          },
          {
            startQuest = "17494353249906758",
            startPort = "QuestStart",
            endQuest = "175368702647225360127",
            endPort = "In"
          },
          {
            startQuest = "175368702647225360127",
            startPort = "Out",
            endQuest = "17518830991543810669",
            endPort = "In"
          }
        },
        nodeData = {
          ["17494353249906758"] = {
            key = "17494353249906758",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1654.109539744385, y = 486.65516328801266},
            propsData = {ModeType = 0}
          },
          ["17494353249906759"] = {
            key = "17494353249906759",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3665.680625772041, y = 500.66888237065575},
            propsData = {ModeType = 0}
          },
          ["17494353249906760"] = {
            key = "17494353249906760",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3576.622993639221, y = 698.9345026170586},
            propsData = {}
          },
          ["17494353249906761"] = {
            key = "17494353249906761",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 1951.9673720109267, y = 301.2548189106723},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110077,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110077"
            }
          },
          ["17494353249906762"] = {
            key = "17494353249906762",
            type = "TalkNode",
            name = "\231\171\153\230\161\169\233\128\137\230\139\169",
            pos = {x = 2874.8600930376324, y = 467.13141989589394},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013601,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_35a",
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["17494353249906763"] = {
            key = "17494353249906763",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\128\137\230\139\169\228\187\187\229\138\161",
            pos = {x = 3222.2935581659704, y = 146.99064986737432},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175180147968028832625"] = {
            key = "175180147968028832625",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2851.365434565435, y = 943.2474775224778},
            propsData = {VarName = "", VarValue = 0}
          },
          ["175180182961128833303"] = {
            key = "175180182961128833303",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 3344.40004995005, y = 434.51670829170837},
            propsData = {PortName = "\230\137\182\231\150\143"}
          },
          ["175180183040828833342"] = {
            key = "175180183040828833342",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 3344.90004995005, y = 574.0167082917083},
            propsData = {PortName = "\232\153\172\229\133\136\231\148\159"}
          },
          ["17518830991543810669"] = {
            key = "17518830991543810669",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\187\145\229\184\130\229\149\134\228\186\186",
            pos = {x = 2260.375, y = 487.5},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210010,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MerchantC_2110079",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12013501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_35",
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
                  TalkActorId = 210010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17518831226273811092"] = {
            key = "17518831226273811092",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2538.875, y = 492},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110115,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110115"
            }
          },
          ["175368702647225360127"] = {
            key = "175368702647225360127",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\149\134\228\186\186",
            pos = {x = 1954.4824561403511, y = 503.65634674922603},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2110079}
            }
          }
        },
        commentData = {}
      }
    },
    ["17516305984007935639"] = {
      isStoryNode = true,
      key = "17516305984007935639",
      type = "StoryNode",
      name = "\232\142\183\229\190\151\233\187\145\233\190\153\233\179\158\229\144\142",
      pos = {x = 2102.679829853669, y = 468.20752579034325},
      propsData = {
        QuestId = 12010321,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_9",
        QuestDeatil = "Content_120103_9",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Fil_02"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17516305984017935652",
            startPort = "Out",
            endQuest = "17516305984017935654",
            endPort = "In"
          },
          {
            startQuest = "17516305984017935654",
            startPort = "Out",
            endQuest = "17516305984017935653",
            endPort = "In"
          },
          {
            startQuest = "17516305984017935655",
            startPort = "Out",
            endQuest = "17516305984007935645",
            endPort = "Success"
          },
          {
            startQuest = "17516305984017935659",
            startPort = "Out",
            endQuest = "17516305984017935652",
            endPort = "In"
          },
          {
            startQuest = "17516305984017935653",
            startPort = "Out",
            endQuest = "17516305984017935660",
            endPort = "In"
          },
          {
            startQuest = "17516305984017935660",
            startPort = "Out",
            endQuest = "17516305984017935655",
            endPort = "In"
          },
          {
            startQuest = "17516305984007935644",
            startPort = "QuestStart",
            endQuest = "17516305984017935659",
            endPort = "In"
          }
        },
        nodeData = {
          ["17516305984007935644"] = {
            key = "17516305984007935644",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2861.2473018360947, y = 455.3782450308312},
            propsData = {ModeType = 0}
          },
          ["17516305984007935645"] = {
            key = "17516305984007935645",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4709.460974733424, y = 451.44858714863625},
            propsData = {ModeType = 0}
          },
          ["17516305984007935646"] = {
            key = "17516305984007935646",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4429.164437489489, y = 828.6415308829103},
            propsData = {}
          },
          ["17516305984017935652"] = {
            key = "17516305984017935652",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3491.2823519359895, y = 455.1810492139438},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013439,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_30",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
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
          ["17516305984017935653"] = {
            key = "17516305984017935653",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 4073.846442644042, y = 452.052660059239},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013446,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_30",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
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
          ["17516305984017935654"] = {
            key = "17516305984017935654",
            type = "TalkNode",
            name = "2D\230\188\148\229\135\186",
            pos = {x = 3789.4704374572793, y = 455.42130895420354},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013444,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17516305984017935655"] = {
            key = "17516305984017935655",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4380.353383458646, y = 458.0075187969925},
            propsData = {
              ModeType = 1,
              Id = 104107,
              StartIndex = 2,
              IsWhite = false
            }
          },
          ["17516305984017935656"] = {
            key = "17516305984017935656",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4413.26050420168, y = 652.6050420168067},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_Plai_02",
              FadeIn = true,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17516305984017935659"] = {
            key = "17516305984017935659",
            type = "GoToNode",
            name = "\229\175\185\232\175\157",
            pos = {x = 3179.541599095779, y = 453.91472107184194},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060031,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2060031"
            }
          },
          ["17516305984017935660"] = {
            key = "17516305984017935660",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 4376.796992481202, y = 267.86716791979956},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    ["175179966789127876667"] = {
      isStoryNode = true,
      key = "175179966789127876667",
      type = "StoryNode",
      name = "\228\184\142\230\137\182\231\150\143\229\175\185\232\175\157",
      pos = {x = 1079.1309762906517, y = 472.59243536820946},
      propsData = {
        QuestId = 12010322,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_7",
        QuestDeatil = "Content_120103_7",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010306"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175179966789227876681",
            startPort = "Out",
            endQuest = "175179966789227876676",
            endPort = "Success"
          },
          {
            startQuest = "175179966789227876675",
            startPort = "QuestStart",
            endQuest = "175368095295711020613",
            endPort = "In"
          },
          {
            startQuest = "175368095295711020613",
            startPort = "Out",
            endQuest = "175179966789227876681",
            endPort = "In"
          },
          {
            startQuest = "175179966789227876681",
            startPort = "Out",
            endQuest = "175368128425811023021",
            endPort = "In"
          }
        },
        nodeData = {
          ["175179966789227876675"] = {
            key = "175179966789227876675",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2765.345492438596, y = 508.5221916015019},
            propsData = {ModeType = 0}
          },
          ["175179966789227876676"] = {
            key = "175179966789227876676",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3896.0324096203767, y = 465.22641334542794},
            propsData = {ModeType = 0}
          },
          ["175179966789227876677"] = {
            key = "175179966789227876677",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3903.3864906785802, y = 636.6508035574974},
            propsData = {}
          },
          ["175179966789227876681"] = {
            key = "175179966789227876681",
            type = "TalkNode",
            name = "\227\128\14428\227\128\145\231\171\153\230\161\169 - \232\175\162\233\151\174\230\137\182\231\150\143",
            pos = {x = 3462.069565491979, y = 485.5652471383355},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210013,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Fushu_2100018",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12013201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_28",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["175368095295711020613"] = {
            key = "175368095295711020613",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\137\182\231\150\143",
            pos = {x = 3122, y = 520},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100067}
            }
          },
          ["175368128425811023021"] = {
            key = "175368128425811023021",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3672, y = 258},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013301,
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
    ["175180116464528830642"] = {
      isStoryNode = true,
      key = "175180116464528830642",
      type = "StoryNode",
      name = "\229\133\136\229\142\187\230\137\190\230\137\182\231\150\143",
      pos = {x = 3407.701075451598, y = 429.1347494868394},
      propsData = {
        QuestId = 12010317,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_14_1",
        QuestDeatil = "Content_120103_14_1",
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
        SubRegionId = 104110,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1930089"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175180116464528830647",
            startPort = "QuestStart",
            endQuest = "17518842504375713772",
            endPort = "In"
          },
          {
            startQuest = "17518842504375713772",
            startPort = "Out",
            endQuest = "175180116464528830648",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175180116464528830647"] = {
            key = "175180116464528830647",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2275.6312788748196, y = 478.3725545923605},
            propsData = {ModeType = 0}
          },
          ["175180116464528830648"] = {
            key = "175180116464528830648",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2884.8719301198666, y = 473.8645345445688},
            propsData = {ModeType = 0}
          },
          ["175180116464528830649"] = {
            key = "175180116464528830649",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3441.622993639221, y = 682.4345026170586},
            propsData = {}
          },
          ["175180116464528830652"] = {
            key = "175180116464528830652",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\128\137\230\139\169\228\187\187\229\138\161",
            pos = {x = 3229.7935581659704, y = 139.49064986737432},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175180261187428836403"] = {
            key = "175180261187428836403",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2581.5187377839547, y = 239.29671524128054},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110112,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2110112"
            }
          },
          ["17518842504375713772"] = {
            key = "17518842504375713772",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2588.5, y = 469.5},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["175180192004028834552"] = {
      isStoryNode = true,
      key = "175180192004028834552",
      type = "StoryNode",
      name = "\229\133\136\229\142\187\230\137\190\232\153\172\229\133\136\231\148\159",
      pos = {x = 3412.592992744831, y = 625.8674099423262},
      propsData = {
        QuestId = 12010318,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_14_2",
        QuestDeatil = "Content_120103_14_2",
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
        SubRegionId = 104110,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1930139"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175180192004028834557",
            startPort = "QuestStart",
            endQuest = "17518842327965713147",
            endPort = "In"
          },
          {
            startQuest = "17518842327965713147",
            startPort = "Out",
            endQuest = "175180192004028834558",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175180192004028834557"] = {
            key = "175180192004028834557",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2149.109539744385, y = 473.15516328801266},
            propsData = {ModeType = 0}
          },
          ["175180192004028834558"] = {
            key = "175180192004028834558",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2858.06758229378, y = 471.64714324022094},
            propsData = {ModeType = 0}
          },
          ["175180192004028834559"] = {
            key = "175180192004028834559",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3441.622993639221, y = 682.4345026170586},
            propsData = {}
          },
          ["175180192004028834560"] = {
            key = "175180192004028834560",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\128\137\230\139\169\228\187\187\229\138\161",
            pos = {x = 3229.7935581659704, y = 139.49064986737432},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175180278734128838150"] = {
            key = "175180278734128838150",
            type = "GoToNode",
            name = "\229\138\158\229\133\172\229\174\164",
            pos = {x = 2961.3665638709112, y = 846.7314978499762},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270005,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270005"
            }
          },
          ["175180280194928838696"] = {
            key = "175180280194928838696",
            type = "GoToNode",
            name = "\229\138\158\229\133\172\229\174\164\229\133\165\229\143\163",
            pos = {x = 2265.8013464796068, y = 664.5575848064977},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2100014"
            }
          },
          ["17518842327965713147"] = {
            key = "17518842327965713147",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2494.5, y = 467.5},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["175368181970312023917"] = {
      isStoryNode = true,
      key = "175368181970312023917",
      type = "StoryNode",
      name = "\229\144\184\230\148\182\230\153\182\229\176\152\231\172\166\230\150\135",
      pos = {x = 1587.237892525431, y = 670.4102904319622},
      propsData = {
        QuestId = 12010351,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_8_1",
        QuestDeatil = "Content_120103_8",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Fil_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175368181970412023934",
            startPort = "Out",
            endQuest = "175368181970412023937",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023934",
            startPort = "Out",
            endQuest = "175368181970412023938",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023934",
            startPort = "Out",
            endQuest = "175368181970412023936",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023925",
            startPort = "QuestStart",
            endQuest = "175368269066212031029",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023935",
            startPort = "Out",
            endQuest = "175368181970412023926",
            endPort = "Success"
          },
          {
            startQuest = "175368269066212031029",
            startPort = "Out",
            endQuest = "175368316679314365466",
            endPort = "In"
          },
          {
            startQuest = "175368316679314365466",
            startPort = "Out",
            endQuest = "175368181970412023934",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023937",
            startPort = "Out",
            endQuest = "175368320413114366064",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023936",
            startPort = "Out",
            endQuest = "175368394556114367234",
            endPort = "In"
          },
          {
            startQuest = "175368181970412023938",
            startPort = "Out",
            endQuest = "175368394418814367182",
            endPort = "In"
          },
          {
            startQuest = "175368320413114366064",
            startPort = "Out",
            endQuest = "175368181970412023935",
            endPort = "Branch_1"
          },
          {
            startQuest = "175368394418814367182",
            startPort = "Out",
            endQuest = "175368181970412023935",
            endPort = "Branch_2"
          },
          {
            startQuest = "175368394556114367234",
            startPort = "Out",
            endQuest = "175368181970412023935",
            endPort = "Branch_3"
          }
        },
        nodeData = {
          ["175368181970412023925"] = {
            key = "175368181970412023925",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2323.3736754624683, y = 269.62699627958256},
            propsData = {ModeType = 0}
          },
          ["175368181970412023926"] = {
            key = "175368181970412023926",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4383.629097058254, y = 200.2180347741814},
            propsData = {ModeType = 0}
          },
          ["175368181970412023927"] = {
            key = "175368181970412023927",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4571.107084548312, y = 381.6663207988767},
            propsData = {}
          },
          ["175368181970412023934"] = {
            key = "175368181970412023934",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 2905.440789473684, y = 244.875},
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
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["175368181970412023935"] = {
            key = "175368181970412023935",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 3964.5413615560637, y = 188.95434782608697},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["175368181970412023936"] = {
            key = "175368181970412023936",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3207.04423076923, y = 425.43846153846164},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2060091,
              StateId = 118022,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_JingGou_2060091"
            }
          },
          ["175368181970412023937"] = {
            key = "175368181970412023937",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3213.2057692307694, y = 20.061538461538362},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2060092,
              StateId = 118022,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_JingGou_2060092"
            }
          },
          ["175368181970412023938"] = {
            key = "175368181970412023938",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3223.720652173913, y = 211.17307692307668},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2060093,
              StateId = 118022,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_JingGou_2060093"
            }
          },
          ["175368269066212031029"] = {
            key = "175368269066212031029",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\178\137\231\167\175\230\153\182\229\158\162",
            pos = {x = 2636.6395352191225, y = 228.30346824396477},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2060091,
                2060092,
                2060093
              }
            }
          },
          ["175368316679314365466"] = {
            key = "175368316679314365466",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\151\160\231\148\177\231\148\159",
            pos = {x = 2632.1247712163563, y = 417.8538345443311},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2060105,
                2060106,
                2060107
              }
            }
          },
          ["175368320413114366064"] = {
            key = "175368320413114366064",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3511.0377003924427, y = 23.43601552124898},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210041,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Wuyou02_2060107",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 12023500,
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
          ["175368394418814367182"] = {
            key = "175368394418814367182",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3524.996510461093, y = 217.37194229470438},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210042,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Wuyou02_2060107",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 12023510,
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
          ["175368394556114367234"] = {
            key = "175368394556114367234",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3527.811155770017, y = 424.2540933244527},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210043,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Wuyou02_2060106",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 12023520,
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
    ["175368182913012024358"] = {
      isStoryNode = true,
      key = "175368182913012024358",
      type = "StoryNode",
      name = "\229\144\184\230\148\182\230\153\182\229\176\152\231\172\166\230\150\135",
      pos = {x = 1852.137641898865, y = 666.7386112339673},
      propsData = {
        QuestId = 12010352,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120103_8_2",
        QuestDeatil = "Content_120103_8",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Fil_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175368182913812024372",
            startPort = "Out",
            endQuest = "175368182913712024371",
            endPort = "In"
          },
          {
            startQuest = "175368182913412024366",
            startPort = "QuestStart",
            endQuest = "175368182913812024372",
            endPort = "In"
          },
          {
            startQuest = "175368182913712024371",
            startPort = "Out",
            endQuest = "175368182913412024367",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175368182913312024364"] = {
            key = "175368182913312024364",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2734.759725611872, y = 596.9590135614937},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060021}
            }
          },
          ["175368182913412024366"] = {
            key = "175368182913412024366",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2369.600948189741, y = 285.8997235523098},
            propsData = {ModeType = 0}
          },
          ["175368182913412024367"] = {
            key = "175368182913412024367",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3095.295763724921, y = 309.0767304263553},
            propsData = {ModeType = 0}
          },
          ["175368182913512024368"] = {
            key = "175368182913512024368",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3099.802736722225, y = 505.5793642771376},
            propsData = {}
          },
          ["175368182913712024371"] = {
            key = "175368182913712024371",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\174\140\230\136\144\230\140\145\230\136\152",
            pos = {x = 2750.3282467532463, y = 321.23083003952587},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210014,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MasterGS_2060021",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12013423,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "East01_FixSimple_29b",
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
                  TalkActorId = 200002,
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
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["175368182913812024372"] = {
            key = "175368182913812024372",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2734.2977272727267, y = 130.18142292490126},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060021}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
