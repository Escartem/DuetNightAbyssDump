return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750936378049937199",
      startPort = "StoryStart",
      endStory = "1750936378049937201",
      endPort = "In"
    },
    {
      startStory = "1750936378049937201",
      startPort = "Success",
      endStory = "1750936378049937200",
      endPort = "StoryEnd"
    },
    {
      startStory = "1750936378049937201",
      startPort = "Fail",
      endStory = "1750936378049937200",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750936378049937199"] = {
      isStoryNode = true,
      key = "1750936378049937199",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 874, y = 308},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750936378049937200"] = {
      isStoryNode = true,
      key = "1750936378049937200",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1566, y = 318},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750936378049937201"] = {
      isStoryNode = true,
      key = "1750936378049937201",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1192, y = 304},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200104_7",
        QuestDeatil = "Content_200104_7",
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
            startQuest = "1750936378049937206",
            startPort = "Out",
            endQuest = "1750936378049937207",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937210",
            startPort = "Out",
            endQuest = "1750936378049937211",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937211",
            startPort = "Out",
            endQuest = "1750936378049937212",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937205",
            startPort = "Out",
            endQuest = "1750936378049937206",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937207",
            startPort = "Out",
            endQuest = "1750936378049937217",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240065",
            startPort = "Out",
            endQuest = "17510095653949240066",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240074",
            startPort = "Out",
            endQuest = "17510095653949240069",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240074",
            startPort = "Out",
            endQuest = "17510095653949240070",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240069",
            startPort = "Out",
            endQuest = "17510095653949240072",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240069",
            startPort = "Out",
            endQuest = "17510095653949240064",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240072",
            startPort = "Out",
            endQuest = "17510095653949240065",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240075",
            startPort = "Out",
            endQuest = "17510095653949240076",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240076",
            startPort = "Out",
            endQuest = "17510095653959240077",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937202",
            startPort = "QuestStart",
            endQuest = "17510095653949240073",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937215",
            startPort = "Out",
            endQuest = "17510096655309242811",
            endPort = "In"
          },
          {
            startQuest = "1750936378049937202",
            startPort = "QuestStart",
            endQuest = "1750936378049937215",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240066",
            startPort = "Out",
            endQuest = "17509391473551319654",
            endPort = "In"
          },
          {
            startQuest = "17510095653949240073",
            startPort = "Out",
            endQuest = "17510095653949240074",
            endPort = "In"
          },
          {
            startQuest = "17510096655309242811",
            startPort = "Out",
            endQuest = "17510096672059242852",
            endPort = "In"
          },
          {
            startQuest = "17510096672059242852",
            startPort = "Out",
            endQuest = "1750936378049937204",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1750936378049937202"] = {
            key = "1750936378049937202",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1049.25, y = 265.75},
            propsData = {ModeType = 0}
          },
          ["1750936378049937203"] = {
            key = "1750936378049937203",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3175.376648351649, y = 275.28708791208794},
            propsData = {ModeType = 0}
          },
          ["1750936378049937204"] = {
            key = "1750936378049937204",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2226.207792207793, y = 498.31707678286625},
            propsData = {}
          },
          ["1750936378049937205"] = {
            key = "1750936378049937205",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\231\142\169\229\174\182\230\148\190\232\191\155\230\136\152\230\150\151\229\140\186\229\159\159",
            pos = {x = 2849.038547213886, y = 819.2899025180576},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "20010303_pPlayer",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1750936378049937206"] = {
            key = "1750936378049937206",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 2856.0001272726695, y = 987.8048706725255},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240834,
                1240835,
                1240836,
                1240837,
                1240838,
                1240839,
                1240840,
                1240841,
                1240842
              }
            }
          },
          ["1750936378049937207"] = {
            key = "1750936378049937207",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3169.674340779583, y = 971.3219742530882},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 9,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240834,
                1240835,
                1240836,
                1240837,
                1240838,
                1240839,
                1240840,
                1240841,
                1240842
              }
            }
          },
          ["1750936378049937208"] = {
            key = "1750936378049937208",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186\230\176\148\229\162\153",
            pos = {x = 305.57345557424094, y = -132.5531643607096},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240843}
            }
          },
          ["1750936378049937209"] = {
            key = "1750936378049937209",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\169\186\230\176\148\229\162\153",
            pos = {x = 416.6341694655009, y = 458.5010936036973},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240843}
            }
          },
          ["1750936378049937210"] = {
            key = "1750936378049937210",
            type = "MonitorPlayerStatusNode",
            name = "\231\155\145\229\144\172\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 54.19846703919825, y = 25.939735407893238},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["1750936378049937211"] = {
            key = "1750936378049937211",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 318.96955236119885, y = 34.03249447948514},
            propsData = {WaitTime = 0.2}
          },
          ["1750936378049937212"] = {
            key = "1750936378049937212",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = 612.9907948486882, y = 13.832639700396783},
            propsData = {}
          },
          ["1750936378049937214"] = {
            key = "1750936378049937214",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -5.315479291949828, y = -178.8251204334021},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "20010303_pPlayer"
            }
          },
          ["1750936378049937215"] = {
            key = "1750936378049937215",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1380.7972396314685, y = 486.2714812175919},
            propsData = {}
          },
          ["1750936378049937216"] = {
            key = "1750936378049937216",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\128\170\231\137\169",
            pos = {x = 1525.9320754774808, y = 944.003062519492},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240834,
                1240835,
                1240836,
                1240837,
                1240838,
                1240839,
                1240840,
                1240841,
                1240842
              }
            }
          },
          ["1750936378049937217"] = {
            key = "1750936378049937217",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3414.534033613446, y = 996.442857142857},
            propsData = {WaitTime = 1}
          },
          ["17509391473551319654"] = {
            key = "17509391473551319654",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2519.0077952233523, y = 239.2078726227334},
            propsData = {}
          },
          ["17510095653949240063"] = {
            key = "17510095653949240063",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186\230\176\148\229\162\153",
            pos = {x = 1441.541339558499, y = -293.2516485062926},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730221}
            }
          },
          ["17510095653949240064"] = {
            key = "17510095653949240064",
            type = "TalkNode",
            name = "\230\136\152\230\150\151\229\188\128\232\189\166",
            pos = {x = 1953.8760597582082, y = -80.62672651752611},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006604,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17510095653949240065"] = {
            key = "17510095653949240065",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1944.931520544561, y = 260.25230406287733},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730226,
                1730227,
                1730228
              }
            }
          },
          ["17510095653949240066"] = {
            key = "17510095653949240066",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2216.645100005886, y = 240.71184651934414},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1730226,
                1730227,
                1730228
              }
            }
          },
          ["17510095653949240067"] = {
            key = "17510095653949240067",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\169\186\230\176\148\229\162\153",
            pos = {x = 2798.234391357959, y = 482.4148898752345},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730221}
            }
          },
          ["17510095653949240069"] = {
            key = "17510095653949240069",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1649.277380908677, y = 245.69409860678195},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 9,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1730245,
                1730246,
                1730247,
                1730248,
                1730249,
                1730250,
                1730251,
                1730252,
                1730253
              }
            }
          },
          ["17510095653949240070"] = {
            key = "17510095653949240070",
            type = "TalkNode",
            name = "\230\136\152\230\150\151\229\188\128\232\189\166",
            pos = {x = 1646.7029009835678, y = 67.58233451275241},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20006601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17510095653949240072"] = {
            key = "17510095653949240072",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\129\171\231\174\173\233\152\159",
            pos = {x = 1951.1832421526963, y = 84.77663449194928},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730214,
                1730215,
                1730225
              }
            }
          },
          ["17510095653949240073"] = {
            key = "17510095653949240073",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1383.410202835034, y = 92.84299604801329},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "pPlayer20010407a",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17510095653949240074"] = {
            key = "17510095653949240074",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1384.4129072244662, y = 265.6722034538799},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730245,
                1730246,
                1730247,
                1730248,
                1730249,
                1730250,
                1730251,
                1730252,
                1730253
              }
            }
          },
          ["17510095653949240075"] = {
            key = "17510095653949240075",
            type = "MonitorPlayerStatusNode",
            name = "\231\155\145\229\144\172\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 1214.1937175681592, y = 1092.4144022285427},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["17510095653949240076"] = {
            key = "17510095653949240076",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1528.4042438839485, y = 1124.6111985672155},
            propsData = {WaitTime = 0.2}
          },
          ["17510095653959240077"] = {
            key = "17510095653959240077",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = 1779.6628251196462, y = 1130.7896882697326},
            propsData = {}
          },
          ["17510096655309242811"] = {
            key = "17510096655309242811",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\128\170\231\137\169",
            pos = {x = 1677.7509840778423, y = 499.069445002882},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730245,
                1730246,
                1730247,
                1730248,
                1730249,
                1730250,
                1730251,
                1730252,
                1730253
              }
            }
          },
          ["17510096672059242852"] = {
            key = "17510096672059242852",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\128\170\231\137\169",
            pos = {x = 1946.8036156567898, y = 499.148392371303},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730226,
                1730227,
                1730228
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
