return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716186952018430076",
      startPort = "Success",
      endStory = "1716548641937668699",
      endPort = "StoryEnd"
    },
    {
      startStory = "1716186533223214597",
      startPort = "Success",
      endStory = "1716186952018430076",
      endPort = "In"
    },
    {
      startStory = "1716548641937668698",
      startPort = "StoryStart",
      endStory = "172199349154911350398",
      endPort = "In"
    },
    {
      startStory = "172199349154911350398",
      startPort = "Success",
      endStory = "1716548641937668700",
      endPort = "In"
    },
    {
      startStory = "17394342966482045506",
      startPort = "Success",
      endStory = "1716186533223214597",
      endPort = "In"
    },
    {
      startStory = "1716548641937668700",
      startPort = "Success",
      endStory = "17394342966482045506",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1716186533223214597"] = {
      isStoryNode = true,
      key = "1716186533223214597",
      type = "StoryNode",
      name = "\229\135\187\232\180\165\231\167\189\229\133\189",
      pos = {x = 653.7232037274939, y = 678.3370915687457},
      propsData = {
        QuestId = 20021003,
        QuestDescriptionComment = "\229\135\187\232\180\165\231\167\189\229\133\189",
        QuestDescription = "Description_200210_3",
        QuestDeatil = "Content_200210_3",
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
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1240265"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1716186533224214601",
            startPort = "QuestStart",
            endQuest = "173944613083222491807",
            endPort = "In"
          },
          {
            startQuest = "17235179213841198753",
            startPort = "Out",
            endQuest = "1716461193978781106",
            endPort = "In"
          },
          {
            startQuest = "17235179213841198753",
            startPort = "Out",
            endQuest = "173944339091614314518",
            endPort = "In"
          },
          {
            startQuest = "173944613083222491807",
            startPort = "Out",
            endQuest = "17220586988952787073",
            endPort = "In"
          },
          {
            startQuest = "17220586988952787073",
            startPort = "Out",
            endQuest = "17235179213841198753",
            endPort = "In"
          },
          {
            startQuest = "1716461193978781106",
            startPort = "Out",
            endQuest = "174766041597317244094",
            endPort = "In"
          },
          {
            startQuest = "174766041597317244094",
            startPort = "Out",
            endQuest = "1716186533224214602",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716186533224214601"] = {
            key = "1716186533224214601",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -245.9821428571429, y = 324.2410714285715},
            propsData = {ModeType = 0}
          },
          ["1716186533224214602"] = {
            key = "1716186533224214602",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1173.1795454545454, y = 305.1272727272727},
            propsData = {ModeType = 0}
          },
          ["1716186533224214603"] = {
            key = "1716186533224214603",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1716461193978781106"] = {
            key = "1716461193978781106",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 741.8180385356991, y = 294.32180939178437},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240077,
                1240078,
                1240079,
                1240080
              }
            }
          },
          ["17220586988952787073"] = {
            key = "17220586988952787073",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 440.1611682808715, y = 139.29812348668307},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240265,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240265"
            }
          },
          ["17235179213841198753"] = {
            key = "17235179213841198753",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 306.2987571393256, y = 316.3254372190407},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240077,
                1240078,
                1240079,
                1240080
              }
            }
          },
          ["173944339091614314518"] = {
            key = "173944339091614314518",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 736.4, y = 453.8285714285716},
            propsData = {
              NewDescription = "Description_200210_3",
              NewDetail = "Content_200210_3",
              SubTaskTargetIndex = 0
            }
          },
          ["173944613083222491807"] = {
            key = "173944613083222491807",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -8.612500000000466, y = 313.73461981566817},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_QuestTrigger_1240265"
            }
          },
          ["174766041597317244094"] = {
            key = "174766041597317244094",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1118.5689658081951, y = 487.34295299290284},
            propsData = {WaitTime = 0.5}
          }
        },
        commentData = {}
      }
    },
    ["1716186952018430076"] = {
      isStoryNode = true,
      key = "1716186952018430076",
      type = "StoryNode",
      name = "\229\134\141\230\172\161\229\146\140\232\141\183\229\176\148\230\180\155\229\175\185\232\175\157",
      pos = {x = 906.8721129661623, y = 676.3032126133213},
      propsData = {
        QuestId = 20021004,
        QuestDescriptionComment = "\229\134\141\230\172\161\229\146\140\232\141\183\229\176\148\230\180\155\229\175\185\232\175\157",
        QuestDescription = "Description_200210_4",
        QuestDeatil = "Content_200210_4",
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
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20021004"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17164634114891998025",
            startPort = "Out",
            endQuest = "1716191878908108199",
            endPort = "In"
          },
          {
            startQuest = "1716191878908108199",
            startPort = "Out",
            endQuest = "17164634930101998648",
            endPort = "In"
          },
          {
            startQuest = "17164634930101998648",
            startPort = "Out",
            endQuest = "1716186952019430081",
            endPort = "Success"
          },
          {
            startQuest = "1716186952018430080",
            startPort = "QuestStart",
            endQuest = "1722842035826326897",
            endPort = "In"
          },
          {
            startQuest = "1722842035826326897",
            startPort = "Out",
            endQuest = "17164634114891998025",
            endPort = "In"
          }
        },
        nodeData = {
          ["1716186952018430080"] = {
            key = "1716186952018430080",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 302.53571428571433, y = 307.0928571428571},
            propsData = {ModeType = 0}
          },
          ["1716186952019430081"] = {
            key = "1716186952019430081",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1617.6642857142856, y = 308.3142857142857},
            propsData = {ModeType = 0}
          },
          ["1716186952019430082"] = {
            key = "1716186952019430082",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1716191878908108199"] = {
            key = "1716191878908108199",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1101.2785714285712, y = 296.56428571428575},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700101,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Heerluo_1240092",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004301,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700100,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700100}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17164634114891998025"] = {
            key = "17164634114891998025",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 861.1860185286789, y = 309.50601827599377},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240092, 1240124}
            }
          },
          ["17164634930101998648"] = {
            key = "17164634930101998648",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1351.8860185286785, y = 312.20601827599376},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240092, 1240124}
            }
          },
          ["1722842035826326897"] = {
            key = "1722842035826326897",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 582.2987012987011, y = 308.33766233766227},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021004"
            }
          }
        },
        commentData = {}
      }
    },
    ["1716548641937668698"] = {
      isStoryNode = true,
      key = "1716548641937668698",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -336.00209972252816, y = 688.482147430621},
      propsData = {QuestChainId = 200210},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716548641937668699"] = {
      isStoryNode = true,
      key = "1716548641937668699",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1180.7306269185597, y = 666.8716222619644},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716548641937668700"] = {
      isStoryNode = true,
      key = "1716548641937668700",
      type = "StoryNode",
      name = "\229\146\140\232\141\183\229\176\148\230\180\155\229\175\185\232\175\157",
      pos = {x = 151.43975178235254, y = 685.1100921400778},
      propsData = {
        QuestId = 20021001,
        QuestDescriptionComment = "\229\146\140\232\141\183\229\176\148\230\180\155\229\175\185\232\175\157",
        QuestDescription = "Description_200210_1",
        QuestDeatil = "Content_200210_1",
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
        SubRegionId = 101702,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Heerluo_1730032"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1716548641937668702",
            startPort = "QuestStart",
            endQuest = "1716187116907643114",
            endPort = "In"
          },
          {
            startQuest = "1716187116907643114",
            startPort = "Out",
            endQuest = "1716548641937668703",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716187116907643114"] = {
            key = "1716187116907643114",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1048.3307799460365, y = 301.02405150263235},
            propsData = {
              ImpressionTalkTriggerId = 510042,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Heerluo_1730032",
              GuideStaticCreatorId = 700096
            }
          },
          ["1716548641937668702"] = {
            key = "1716548641937668702",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1716548641937668703"] = {
            key = "1716548641937668703",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1299.8173913043481, y = 302.588198757764},
            propsData = {ModeType = 0}
          },
          ["1716548641937668704"] = {
            key = "1716548641937668704",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["172199349154911350398"] = {
      isStoryNode = true,
      key = "172199349154911350398",
      type = "StoryNode",
      name = "\229\188\128\233\151\168\229\175\185\232\175\157\239\188\136\233\154\144\232\151\143\239\188\137",
      pos = {x = -100.1598083080988, y = 685.0569516452284},
      propsData = {
        QuestId = 20021007,
        QuestDescriptionComment = "\229\188\128\233\151\168\229\175\185\232\175\157\239\188\136\233\154\144\232\151\143\239\188\137",
        QuestDescription = "Description_200210_7",
        QuestDeatil = "Content_200210_7",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
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
        SubRegionId = 101702,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20021001"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1722055160375735492",
            startPort = "Out",
            endQuest = "172199351413311497320",
            endPort = "In"
          },
          {
            startQuest = "172199354750211498226",
            startPort = "Out",
            endQuest = "17220557472791614165",
            endPort = "In"
          },
          {
            startQuest = "17220557472791614165",
            startPort = "Out",
            endQuest = "172199349154911350402",
            endPort = "Success"
          },
          {
            startQuest = "172199349154911350399",
            startPort = "QuestStart",
            endQuest = "17225027690401006",
            endPort = "In"
          },
          {
            startQuest = "17225027690401006",
            startPort = "Out",
            endQuest = "1722055160375735492",
            endPort = "In"
          },
          {
            startQuest = "172199351413311497320",
            startPort = "Option_1",
            endQuest = "172199354750211498226",
            endPort = "In"
          },
          {
            startQuest = "172199351413311497320",
            startPort = "Option_2",
            endQuest = "172199349154911350405",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["172199349154911350399"] = {
            key = "172199349154911350399",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 288.0049261083743, y = 340.6034482758621},
            propsData = {ModeType = 0}
          },
          ["172199349154911350402"] = {
            key = "172199349154911350402",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2305.8333333333326, y = 178.6904761904762},
            propsData = {ModeType = 0}
          },
          ["172199349154911350405"] = {
            key = "172199349154911350405",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1743.3333333333333, y = 435.8333333333332},
            propsData = {}
          },
          ["172199351413311497320"] = {
            key = "172199351413311497320",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1302.8878177246536, y = 277.2215561736762},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700151,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_20021001",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700151,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700151}
              },
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {
                "\229\155\158\231\173\148\230\173\163\231\161\174",
                "\229\155\158\231\173\148\233\148\153\232\175\175"
              },
              OverrideFailBlend = false
            }
          },
          ["172199354750211498226"] = {
            key = "172199354750211498226",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 1739.151886988723, y = 178.02675097887084},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1730003},
              StateId = 104011,
              QuestId = 0
            }
          },
          ["1722055160375735492"] = {
            key = "1722055160375735492",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 891.0714285714289, y = 337.57142857142844},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730064}
            }
          },
          ["17220557472791614165"] = {
            key = "17220557472791614165",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2008.214285714286, y = 178.99999999999986},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730064}
            }
          },
          ["17225027690401006"] = {
            key = "17225027690401006",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 582.9983608345677, y = 343.56907747425},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101702,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021001"
            }
          }
        },
        commentData = {}
      }
    },
    ["17394342966482045506"] = {
      isStoryNode = true,
      key = "17394342966482045506",
      type = "StoryNode",
      name = "\229\135\187\230\157\128\231\167\189\229\133\189",
      pos = {x = 407.057724957555, y = 678.6672325976233},
      propsData = {
        QuestId = 20021002,
        QuestDescriptionComment = "\229\135\187\230\157\128\231\167\189\229\133\189",
        QuestDescription = "Description_200210_2",
        QuestDeatil = "Content_200210_2",
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
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1240485"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17394344929356134579",
            startPort = "Out",
            endQuest = "173943542590710225683",
            endPort = "In"
          },
          {
            startQuest = "173943542590710225683",
            startPort = "Out",
            endQuest = "17394342966482045512",
            endPort = "Success"
          },
          {
            startQuest = "17394342966482045511",
            startPort = "QuestStart",
            endQuest = "173944607225421469011",
            endPort = "In"
          },
          {
            startQuest = "17394344929366134581",
            startPort = "Out",
            endQuest = "17394344929356134579",
            endPort = "In"
          },
          {
            startQuest = "17394344929366134581",
            startPort = "Out",
            endQuest = "173944328550214313952",
            endPort = "In"
          },
          {
            startQuest = "173944607225421469011",
            startPort = "Out",
            endQuest = "17394344929366134580",
            endPort = "In"
          },
          {
            startQuest = "17394344929366134580",
            startPort = "Out",
            endQuest = "17394344929366134581",
            endPort = "In"
          }
        },
        nodeData = {
          ["17394342966482045511"] = {
            key = "17394342966482045511",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100.61263736263766, y = 289.7851648351648},
            propsData = {ModeType = 0}
          },
          ["17394342966482045512"] = {
            key = "17394342966482045512",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1707.6642857142854, y = 281.00659340659337},
            propsData = {ModeType = 0}
          },
          ["17394342966482045513"] = {
            key = "17394342966482045513",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17394344929356134579"] = {
            key = "17394344929356134579",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1062.4573646316364, y = 280.7180260059546},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240486,
                1240487,
                1240488,
                1240489
              }
            }
          },
          ["17394344929366134580"] = {
            key = "17394344929366134580",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 878.9096539706766, y = 100.31213990656417},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240485,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240485"
            }
          },
          ["17394344929366134581"] = {
            key = "17394344929366134581",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 671.3009728172059, y = 288.51204330464935},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240486,
                1240487,
                1240488,
                1240489
              }
            }
          },
          ["173943542590710225683"] = {
            key = "173943542590710225683",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\149\134\228\186\186\229\175\185\232\175\157",
            pos = {x = 1437.8951048951046, y = 289.1888111888111},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_51004501",
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
                  TalkActorId = 700101,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700101},
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
          ["173944328550214313952"] = {
            key = "173944328550214313952",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1139.0112436583024, y = 494.3840097810686},
            propsData = {
              NewDescription = "Description_200210_3",
              NewDetail = "Content_200210_3",
              SubTaskTargetIndex = 0
            }
          },
          ["173944607225421469011"] = {
            key = "173944607225421469011",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 354.04895104895144, y = 283.03496503496507},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_QuestTrigger_1240485"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
