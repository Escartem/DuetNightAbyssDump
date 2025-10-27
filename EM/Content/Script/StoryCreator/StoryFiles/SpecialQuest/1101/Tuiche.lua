return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102438395213",
      startPort = "Success",
      endStory = "1721630102438395212",
      endPort = "StoryEnd"
    },
    {
      startStory = "1721630102438395211",
      startPort = "StoryStart",
      endStory = "172856170309249544",
      endPort = "In"
    },
    {
      startStory = "172856170309249544",
      startPort = "Success",
      endStory = "1721630102438395213",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1721630102438395211"] = {
      isStoryNode = true,
      key = "1721630102438395211",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 494.3750000000004, y = 346.87499999999994},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102438395212"] = {
      isStoryNode = true,
      key = "1721630102438395212",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1436.802884615385, y = 347.3076923076923},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102438395213"] = {
      isStoryNode = true,
      key = "1721630102438395213",
      type = "StoryNode",
      name = "\230\142\168\232\189\166",
      pos = {x = 1092.330885874055, y = 359.27735337183873},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110109_2",
        QuestDeatil = "Content_110109_2",
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
            startQuest = "1721630102438395220",
            startPort = "Out",
            endQuest = "1721630102438395218",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395214",
            startPort = "QuestStart",
            endQuest = "1721630102438395219",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395219",
            startPort = "Out",
            endQuest = "1721630102438395222",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395222",
            startPort = "Out",
            endQuest = "1721630102438395216",
            endPort = "Fail"
          },
          {
            startQuest = "17203254935114037990",
            startPort = "Out",
            endQuest = "17203249441934033967",
            endPort = "In"
          },
          {
            startQuest = "17203255151804038632",
            startPort = "Out",
            endQuest = "17203249441934033964",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395221",
            startPort = "Out",
            endQuest = "1722959381350673108",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395214",
            startPort = "QuestStart",
            endQuest = "172597340089719500774",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395214",
            startPort = "QuestStart",
            endQuest = "17283936245673679378",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395214",
            startPort = "QuestStart",
            endQuest = "17203255151804038632",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395214",
            startPort = "QuestStart",
            endQuest = "17203254935114037990",
            endPort = "In"
          },
          {
            startQuest = "1721630102438395214",
            startPort = "QuestStart",
            endQuest = "1721630102438395221",
            endPort = "In"
          },
          {
            startQuest = "1722959381350673108",
            startPort = "Out",
            endQuest = "17316566038941017211",
            endPort = "In"
          },
          {
            startQuest = "17316566038941017211",
            startPort = "Out",
            endQuest = "1721630102438395217",
            endPort = "In"
          }
        },
        nodeData = {
          ["17203249441934033964"] = {
            key = "17203249441934033964",
            type = "TalkNode",
            name = "\230\142\168\232\189\166\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 638.0321216129807, y = 61.027466077184684},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012006,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17203249441934033967"] = {
            key = "17203249441934033967",
            type = "TalkNode",
            name = "\230\142\168\232\189\166\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 631.6289522758753, y = 235.26060347747},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012005,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17203249441934033968"] = {
            key = "17203249441934033968",
            type = "SendMessageNode",
            name = "\229\188\128\229\167\139\230\142\168\232\189\166",
            pos = {x = -461.7505983535566, y = 120.4852787885231},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "TuicheStart",
              UnitId = -1
            }
          },
          ["17203254935114037990"] = {
            key = "17203254935114037990",
            type = "BossBattleFinishNode",
            name = "\230\142\168\232\189\166\229\188\128\232\189\1661",
            pos = {x = 393.4732257557134, y = 255.22077370513853},
            propsData = {SendMessage = "", FinishCondition = "Tuiche_1"}
          },
          ["17203255151804038632"] = {
            key = "17203255151804038632",
            type = "BossBattleFinishNode",
            name = "\230\142\168\232\189\166\229\188\128\232\189\1662",
            pos = {x = 387.84822575571326, y = 77.09577370513853},
            propsData = {SendMessage = "", FinishCondition = "Tuiche_2"}
          },
          ["1721630102438395214"] = {
            key = "1721630102438395214",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -389.34928229664985, y = 429.40221291866027},
            propsData = {ModeType = 0}
          },
          ["1721630102438395215"] = {
            key = "1721630102438395215",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2298.747311125407, y = 400.88063407181056},
            propsData = {ModeType = 0}
          },
          ["1721630102438395216"] = {
            key = "1721630102438395216",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1382.6394194041254, y = 668.7323338426279},
            propsData = {}
          },
          ["1721630102438395217"] = {
            key = "1721630102438395217",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1930.6567128899098, y = 399.8158081791916},
            propsData = {}
          },
          ["1721630102438395218"] = {
            key = "1721630102438395218",
            type = "SpecialQuestFailNode",
            name = "\231\137\185\230\174\138\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 703.2805947929432, y = 1028.5568796077632},
            propsData = {}
          },
          ["1721630102438395219"] = {
            key = "1721630102438395219",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 376.6866774116975, y = 744.8991860427468},
            propsData = {}
          },
          ["1721630102438395220"] = {
            key = "1721630102438395220",
            type = "BossBattleFinishNode",
            name = "\231\130\174\229\143\176\232\161\128\233\135\143\229\189\146\233\155\182",
            pos = {x = 377.1908277885617, y = 1041.8260825178406},
            propsData = {SendMessage = "", FinishCondition = "TuicheFail"}
          },
          ["1721630102438395221"] = {
            key = "1721630102438395221",
            type = "BossBattleFinishNode",
            name = "\231\173\137\229\190\133\230\142\168\232\189\166\231\187\147\230\157\159",
            pos = {x = 384.5991487323715, y = 413.9744880316571},
            propsData = {SendMessage = "", FinishCondition = "TuicheSucc"}
          },
          ["1721630102438395222"] = {
            key = "1721630102438395222",
            type = "SendMessageNode",
            name = "\229\155\158\230\148\182\231\130\174\229\143\176\230\149\176\230\141\174",
            pos = {x = 1081.5982257557134, y = 665.8457737051385},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "TuicheStop",
              UnitId = -1
            }
          },
          ["1722959381350673108"] = {
            key = "1722959381350673108",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1099.9219924812, y = 407.8703007518785},
            propsData = {WaitTime = 4.5}
          },
          ["172597340089719500774"] = {
            key = "172597340089719500774",
            type = "TalkNode",
            name = "\229\188\128\229\167\139\229\188\128\232\189\166",
            pos = {x = -77.27710717232696, y = -32.38710837624812},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012003,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17283936245673679378"] = {
            key = "17283936245673679378",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 324.67161301017893, y = -153.79970965421717},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0059_scene_ex01_encounter.0059_scene_ex01_encounter'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17316566038941017211"] = {
            key = "17316566038941017211",
            type = "CreatePhantomNode",
            name = "\233\148\128\230\175\129\233\152\191\231\147\166\229\176\148\233\173\133\229\189\177",
            pos = {x = 1568.9345853778632, y = 406.42857142857156},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1650135}
            }
          }
        },
        commentData = {
          ["17231943860921035947"] = {
            key = "17231943860921035947",
            name = "\232\174\169\230\142\168\232\189\166\229\174\140\230\136\144\228\187\165\229\144\142\229\185\179\231\168\179\229\156\176\229\129\156\228\184\139\230\157\165",
            position = {x = 908.3479179272581, y = 209.27366407504007},
            size = {width = 600, height = 400}
          }
        }
      }
    },
    ["172856170309249544"] = {
      isStoryNode = true,
      key = "172856170309249544",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 805.5323989219185, y = 354.1375867338869},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110109_2_1",
        QuestDeatil = "Content_110109_2_1",
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
            startQuest = "172856170309249545",
            startPort = "QuestStart",
            endQuest = "172856186456450770",
            endPort = "In"
          },
          {
            startQuest = "172856186456450770",
            startPort = "Out",
            endQuest = "172856281411165328",
            endPort = "In"
          },
          {
            startQuest = "172856281411165328",
            startPort = "Out",
            endQuest = "172856170309249548",
            endPort = "Success"
          },
          {
            startQuest = "172985566827824001909",
            startPort = "Out",
            endQuest = "172985566827824001908",
            endPort = "In"
          },
          {
            startQuest = "172856170309249545",
            startPort = "QuestStart",
            endQuest = "172985566827824001909",
            endPort = "In"
          },
          {
            startQuest = "17340023613791287",
            startPort = "Out",
            endQuest = "17340023613791289",
            endPort = "In"
          },
          {
            startQuest = "17340023613791288",
            startPort = "Out",
            endQuest = "17340023613791290",
            endPort = "In"
          },
          {
            startQuest = "172856170309249545",
            startPort = "QuestStart",
            endQuest = "17340023613791288",
            endPort = "In"
          },
          {
            startQuest = "17340023613791290",
            startPort = "Out",
            endQuest = "172856170309249551",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["172856170309249545"] = {
            key = "172856170309249545",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1177.6470588235286, y = 195.8823529411767},
            propsData = {ModeType = 0}
          },
          ["172856170309249548"] = {
            key = "172856170309249548",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2056.041189931351, y = 256.3386727688789},
            propsData = {ModeType = 0}
          },
          ["172856170309249551"] = {
            key = "172856170309249551",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2364.5537757437082, y = 463.7757437070942},
            propsData = {}
          },
          ["172856186456450770"] = {
            key = "172856186456450770",
            type = "SendMessageNode",
            name = "\229\188\128\229\167\139\230\142\168\232\189\166",
            pos = {x = 1520.3004666562572, y = 228.6137320307152},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "TuicheStart",
              UnitId = -1
            }
          },
          ["172856281411165328"] = {
            key = "172856281411165328",
            type = "BossBattleFinishNode",
            name = "\230\142\168\232\189\166\229\188\128\232\189\1660",
            pos = {x = 1774.3047204311174, y = 221.3947032392991},
            propsData = {SendMessage = "", FinishCondition = "Tuiche_0"}
          },
          ["172985566827824001908"] = {
            key = "172985566827824001908",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164\233\152\191\231\147\166\229\176\148\233\173\133\229\189\177",
            pos = {x = 1773.5917024843855, y = 59.04782219358434},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1650135}
            }
          },
          ["172985566827824001909"] = {
            key = "172985566827824001909",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\152\191\231\147\166\229\176\148NPC",
            pos = {x = 1498.235782243873, y = 66.43626455815972},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650117}
            }
          },
          ["17340023613791287"] = {
            key = "17340023613791287",
            type = "BossBattleFinishNode",
            name = "\231\130\174\229\143\176\232\161\128\233\135\143\229\189\146\233\155\182",
            pos = {x = 1852.8275360610182, y = 926.7535103493482},
            propsData = {SendMessage = "", FinishCondition = ""}
          },
          ["17340023613791288"] = {
            key = "17340023613791288",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1567.7970698946804, y = 422.66871913741215},
            propsData = {}
          },
          ["17340023613791289"] = {
            key = "17340023613791289",
            type = "SpecialQuestFailNode",
            name = "\231\137\185\230\174\138\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2089.1067767496106, y = 823.1053600708494},
            propsData = {}
          },
          ["17340023613791290"] = {
            key = "17340023613791290",
            type = "SendMessageNode",
            name = "\229\155\158\230\148\182\231\130\174\229\143\176\230\149\176\230\141\174",
            pos = {x = 1879.6138813965908, y = 428.2095651730097},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "TuicheStop",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
