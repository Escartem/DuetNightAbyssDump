return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17284624220394257",
      startPort = "StoryStart",
      endStory = "1729066258863196183",
      endPort = "In"
    },
    {
      startStory = "1729066258863196183",
      startPort = "Success",
      endStory = "17284624220404260",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17284624220394257"] = {
      isStoryNode = true,
      key = "17284624220394257",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17284624220404260"] = {
      isStoryNode = true,
      key = "17284624220404260",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1573.8636363636363, y = 302.6136363636364},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17284624273844409"] = {
      isStoryNode = true,
      key = "17284624273844409",
      type = "StoryNode",
      name = "\231\130\174\229\143\176\233\152\178\229\190\161",
      pos = {x = 1125.358420318258, y = 46.37080054390728},
      propsData = {
        QuestId = 0,
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
        bIsDynamicEvent = true,
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
            startQuest = "17284625616336404",
            startPort = "Out",
            endQuest = "17284624273844413",
            endPort = "Success"
          },
          {
            startQuest = "17284624273844410",
            startPort = "QuestStart",
            endQuest = "1729060009754187727",
            endPort = "In"
          },
          {
            startQuest = "1729060009754187727",
            startPort = "Out",
            endQuest = "17284625302085902",
            endPort = "In"
          },
          {
            startQuest = "17284625302085902",
            startPort = "Out",
            endQuest = "1729060049229188566",
            endPort = "In"
          },
          {
            startQuest = "1729060049229188566",
            startPort = "Out",
            endQuest = "1729060101296189067",
            endPort = "In"
          },
          {
            startQuest = "1729060049229188566",
            startPort = "Out",
            endQuest = "1729061995029189869",
            endPort = "In"
          },
          {
            startQuest = "1729061995029189869",
            startPort = "Out",
            endQuest = "1729062025638190507",
            endPort = "In"
          },
          {
            startQuest = "1729061995029189869",
            startPort = "Out",
            endQuest = "17284625616336404",
            endPort = "In"
          },
          {
            startQuest = "1729060101296189067",
            startPort = "Out",
            endQuest = "1729064636630192659",
            endPort = "In"
          },
          {
            startQuest = "1729064636630192659",
            startPort = "Out",
            endQuest = "1729064725820193973",
            endPort = "In"
          },
          {
            startQuest = "1729064725820193973",
            startPort = "Out",
            endQuest = "17284624273844413",
            endPort = "Success"
          },
          {
            startQuest = "1729064636630192659",
            startPort = "Out",
            endQuest = "1729064785662194710",
            endPort = "In"
          }
        },
        nodeData = {
          ["17284624273844410"] = {
            key = "17284624273844410",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 773.6, y = 306},
            propsData = {ModeType = 0}
          },
          ["17284624273844413"] = {
            key = "17284624273844413",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3112.6000000000004, y = 255.89999999999998},
            propsData = {ModeType = 0}
          },
          ["17284624273844416"] = {
            key = "17284624273844416",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17284624718175119"] = {
            key = "17284624718175119",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1161.3454533335519, y = -69.07157012889806},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17284625302085902"] = {
            key = "17284625302085902",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\155\180\229\156\168\229\164\167\231\130\174\231\154\132\231\167\189\229\133\189",
            pos = {x = 1462.545453333552, y = 278.92842987110197},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650317,
                1650318,
                1650319,
                1650320
              }
            }
          },
          ["17284625616336404"] = {
            key = "17284625616336404",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2770.9954533335517, y = 257.62842987110207},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1729060009754187727"] = {
            key = "1729060009754187727",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\164\167\231\130\174",
            pos = {x = 1171.6688029361942, y = 292.248108413326},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650316}
            }
          },
          ["1729060049229188566"] = {
            key = "1729060049229188566",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1774.0688029361943, y = 286.248108413326},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650317,
                1650318,
                1650319,
                1650320
              }
            }
          },
          ["1729060101296189067"] = {
            key = "1729060101296189067",
            type = "SendMessageNode",
            name = "\229\188\128\229\167\139\229\136\183\230\128\170",
            pos = {x = 2026.7149567823485, y = -6.667276202058673},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "StartDynStory_Dapao",
              UnitId = -1
            }
          },
          ["1729061995029189869"] = {
            key = "1729061995029189869",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\232\182\179\229\164\159\229\164\154\231\154\132\230\128\170\231\137\169",
            pos = {x = 2184.7918798592714, y = 279.4865699517875},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 15,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1729062025638190507"] = {
            key = "1729062025638190507",
            type = "SendMessageNode",
            name = "\231\187\147\230\157\159\229\136\183\230\128\170",
            pos = {x = 2445.945726013118, y = -2.0518915866739533},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EndDynStory_Dapao",
              UnitId = -1
            }
          },
          ["1729064636630192659"] = {
            key = "1729064636630192659",
            type = "BossBattleFinishNode",
            name = "\232\139\165\231\130\174\229\143\176\230\173\187\228\186\161\229\136\153\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 2303.707437985356, y = -256.5940980644069},
            propsData = {
              SendMessage = "",
              FinishCondition = "DynDapaoFail"
            }
          },
          ["1729064725820193973"] = {
            key = "1729064725820193973",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2729.957437985356, y = -236.59409806440692},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["1729064785662194710"] = {
            key = "1729064785662194710",
            type = "SendMessageNode",
            name = "\231\187\147\230\157\159\229\136\183\230\128\170",
            pos = {x = 2576.2074379853557, y = -474.0940980644069},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "DynStory_DapaoFail",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1729066258863196183"] = {
      isStoryNode = true,
      key = "1729066258863196183",
      type = "StoryNode",
      name = "\230\184\133\230\137\171\231\167\189\229\133\189\229\183\162\231\169\180",
      pos = {x = 1169.9574379853561, y = 295.9059019355932},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_FortNest_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1729067277447197868",
            startPort = "Out",
            endQuest = "1729067307343198395",
            endPort = "In"
          },
          {
            startQuest = "1729067343630199193",
            startPort = "Out",
            endQuest = "1729066258877196187",
            endPort = "Success"
          },
          {
            startQuest = "1729066258877196184",
            startPort = "QuestStart",
            endQuest = "1729221986181572150",
            endPort = "In"
          },
          {
            startQuest = "1729221986181572150",
            startPort = "Out",
            endQuest = "1729149170552756",
            endPort = "In"
          },
          {
            startQuest = "1729149170552756",
            startPort = "Out",
            endQuest = "1729067277447197868",
            endPort = "In"
          },
          {
            startQuest = "1729067307343198395",
            startPort = "Out",
            endQuest = "1733725894985650920",
            endPort = "In"
          },
          {
            startQuest = "1733725894985650920",
            startPort = "Out",
            endQuest = "1733725968999652836",
            endPort = "In"
          },
          {
            startQuest = "1733725968999652836",
            startPort = "Out",
            endQuest = "1733725977591653107",
            endPort = "In"
          },
          {
            startQuest = "1733725977591653107",
            startPort = "Out",
            endQuest = "1733726000129653625",
            endPort = "In"
          },
          {
            startQuest = "1729221986181572150",
            startPort = "Out",
            endQuest = "1733726036540654253",
            endPort = "In"
          },
          {
            startQuest = "1729067277447197868",
            startPort = "Out",
            endQuest = "1733726057861654801",
            endPort = "In"
          },
          {
            startQuest = "1733725894985650920",
            startPort = "Out",
            endQuest = "1733726069088655191",
            endPort = "In"
          },
          {
            startQuest = "1733725977591653107",
            startPort = "Out",
            endQuest = "1733726079684655587",
            endPort = "In"
          },
          {
            startQuest = "1733726000129653625",
            startPort = "Out",
            endQuest = "1729150847295193560",
            endPort = "In"
          },
          {
            startQuest = "1729150847295193560",
            startPort = "Out",
            endQuest = "1733726083498655715",
            endPort = "In"
          },
          {
            startQuest = "1733726083498655715",
            startPort = "Out",
            endQuest = "1729067351745199387",
            endPort = "In"
          },
          {
            startQuest = "1729067351745199387",
            startPort = "Out",
            endQuest = "1733725705966649264",
            endPort = "In"
          },
          {
            startQuest = "1733725705966649264",
            startPort = "Out",
            endQuest = "17346897074644082686",
            endPort = "In"
          },
          {
            startQuest = "17346897074644082686",
            startPort = "Out",
            endQuest = "1729067343630199193",
            endPort = "In"
          }
        },
        nodeData = {
          ["1729066258877196184"] = {
            key = "1729066258877196184",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 506.74747474747477, y = 304.1111111111111},
            propsData = {ModeType = 0}
          },
          ["1729066258877196187"] = {
            key = "1729066258877196187",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3030.808080808081, y = 278.6868686868687},
            propsData = {ModeType = 0}
          },
          ["1729066258877196190"] = {
            key = "1729066258877196190",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2892.6136363636365, y = 1028.8636363636365},
            propsData = {}
          },
          ["1729067277447197868"] = {
            key = "1729067277447197868",
            type = "SwitchMechanismStateNode",
            name = "\229\188\128\229\144\175\229\183\162\231\169\180\230\156\186\229\133\179",
            pos = {x = 1365.5804816083996, y = 295.44974697943815},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650027},
              StateId = 112011,
              QuestId = 0
            }
          },
          ["1729067307343198395"] = {
            key = "1729067307343198395",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1638.3497123776306, y = 281.74966927936043},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1729067343630199193"] = {
            key = "1729067343630199193",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2610.5268685547867, y = 278.79551232520345},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = true,
              TalkFadeOutTime = 2
            }
          },
          ["1729067351745199387"] = {
            key = "1729067351745199387",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2481.67766220558, y = 978.0469553266464},
            propsData = {WaitTime = 4}
          },
          ["1729075758618939407"] = {
            key = "1729075758618939407",
            type = "SwitchMechanismStateNode",
            name = "\229\136\157\229\167\139\229\140\150\229\183\162\231\169\180\230\156\186\229\133\179",
            pos = {x = 597.277010345976, y = -28.68933939623608},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {
                1650027,
                1650028,
                1650029,
                1650030,
                1650031,
                1650032
              },
              StateId = 112010,
              QuestId = 0
            }
          },
          ["1729149170552756"] = {
            key = "1729149170552756",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1086.2401935173234, y = 295.01969748191857},
            propsData = {WaitTime = 5}
          },
          ["1729150847295193560"] = {
            key = "1729150847295193560",
            type = "SwitchMechanismStateNode",
            name = "\229\133\179\233\151\173\229\183\162\231\169\180\230\156\186\229\133\179",
            pos = {x = 1993.9578877005345, y = 1046.945855614973},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {
                1650027,
                1650028,
                1650029,
                1650030,
                1650031,
                1650032
              },
              StateId = 112010,
              QuestId = 0
            }
          },
          ["1729221986181572150"] = {
            key = "1729221986181572150",
            type = "SendMessageNode",
            name = "\229\136\157\229\167\139\229\140\150\229\183\162\231\169\180\230\156\186\229\133\179",
            pos = {x = 801.1525056281012, y = 307.8673094679334},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "StartDynStory_Nest",
              UnitId = -1
            }
          },
          ["1733725705966649264"] = {
            key = "1733725705966649264",
            type = "SendMessageNode",
            name = "\230\184\133\233\153\164\229\183\162\231\169\180\230\156\186\229\133\179\231\154\132\230\128\170",
            pos = {x = 2526.4258373205753, y = 772.1650717703351},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EndDynStory_Nest",
              UnitId = -1
            }
          },
          ["1733725894985650920"] = {
            key = "1733725894985650920",
            type = "SwitchMechanismStateNode",
            name = "\229\188\128\229\144\175\229\183\162\231\169\180\230\156\186\229\133\179",
            pos = {x = 1332.3349282296654, y = 666.4832535885168},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650028, 1650029},
              StateId = 112011,
              QuestId = 0
            }
          },
          ["1733725968999652836"] = {
            key = "1733725968999652836",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1651.4258373205744, y = 671.9377990430625},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 11,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1733725977591653107"] = {
            key = "1733725977591653107",
            type = "SwitchMechanismStateNode",
            name = "\229\188\128\229\144\175\229\183\162\231\169\180\230\156\186\229\133\179",
            pos = {x = 1339.1531100478473, y = 1040.1196172248806},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {
                1650030,
                1650031,
                1650032
              },
              StateId = 112011,
              QuestId = 0
            }
          },
          ["1733726000129653625"] = {
            key = "1733726000129653625",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1666.4258373205748, y = 1038.7559808612443},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 15,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1733726036540654253"] = {
            key = "1733726036540654253",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1103.6985645933019, y = 67.84688995215342},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003901,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733726057861654801"] = {
            key = "1733726057861654801",
            type = "TalkNode",
            name = "\229\183\162\231\169\180\229\188\128\229\144\1751\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1659.607655502393, y = 88.30143540669887},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003902,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733726069088655191"] = {
            key = "1733726069088655191",
            type = "TalkNode",
            name = "\229\183\162\231\169\180\229\188\128\229\144\1752\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1656.9453178400554, y = 498.7559808612443},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003903,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733726079684655587"] = {
            key = "1733726079684655587",
            type = "TalkNode",
            name = "\229\183\162\231\169\180\229\188\128\229\144\1753\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1675.971291866029, y = 875.1196172248808},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003904,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733726083498655715"] = {
            key = "1733726083498655715",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\174\140\230\136\144",
            pos = {x = 2217.643369788107, y = 1033.5611756664389},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003905,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17346897074644082686"] = {
            key = "17346897074644082686",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2517.9642857142862, y = 620.1785714285714},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
