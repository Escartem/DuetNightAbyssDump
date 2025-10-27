return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17347712125611590976",
      startPort = "StoryStart",
      endStory = "17347712154441591080",
      endPort = "In"
    },
    {
      startStory = "17347712154441591080",
      startPort = "Success",
      endStory = "17347712125611590979",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17347712125611590976"] = {
      isStoryNode = true,
      key = "17347712125611590976",
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
    ["17347712125611590979"] = {
      isStoryNode = true,
      key = "17347712125611590979",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1561.8181818181818, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17347712154441591080"] = {
      isStoryNode = true,
      key = "17347712154441591080",
      type = "StoryNode",
      name = "\233\153\183\233\152\177",
      pos = {x = 1256.4444444444446, y = 295.1111111111111},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_FortXianjing_Des",
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
            startQuest = "17347742139722273449",
            startPort = "Out",
            endQuest = "17347742288812273651",
            endPort = "In"
          },
          {
            startQuest = "17347742288812273651",
            startPort = "Out",
            endQuest = "17347746446032274593",
            endPort = "In"
          },
          {
            startQuest = "17347746446032274593",
            startPort = "Out",
            endQuest = "17347746061572274200",
            endPort = "In"
          },
          {
            startQuest = "17347746061572274200",
            startPort = "Out",
            endQuest = "17347746535552274906",
            endPort = "In"
          },
          {
            startQuest = "17347746535552274906",
            startPort = "Out",
            endQuest = "17347747799432275770",
            endPort = "In"
          },
          {
            startQuest = "17347747799432275770",
            startPort = "Out",
            endQuest = "17347748294402276242",
            endPort = "In"
          },
          {
            startQuest = "17347748371182276419",
            startPort = "Out",
            endQuest = "17347712154441591084",
            endPort = "Success"
          },
          {
            startQuest = "17347748294402276242",
            startPort = "Out",
            endQuest = "17347748583752277042",
            endPort = "In"
          },
          {
            startQuest = "17347740401072271713",
            startPort = "Out",
            endQuest = "17347742024902273153",
            endPort = "In"
          },
          {
            startQuest = "17347748583752277042",
            startPort = "Out",
            endQuest = "17349199775691487",
            endPort = "In"
          },
          {
            startQuest = "17349199938071815",
            startPort = "Out",
            endQuest = "17349200103492094",
            endPort = "In"
          },
          {
            startQuest = "17349200103492094",
            startPort = "Out",
            endQuest = "17349224256022046976",
            endPort = "In"
          },
          {
            startQuest = "17349224256022046976",
            startPort = "Out",
            endQuest = "17347748371182276419",
            endPort = "In"
          },
          {
            startQuest = "17347748583752277042",
            startPort = "Out",
            endQuest = "17349199938071815",
            endPort = "In"
          },
          {
            startQuest = "17347740401072271713",
            startPort = "Out",
            endQuest = "17347742139722273449",
            endPort = "In"
          },
          {
            startQuest = "17347740401072271713",
            startPort = "Out",
            endQuest = "17349246822782272633",
            endPort = "In"
          },
          {
            startQuest = "17347748583752277042",
            startPort = "Out",
            endQuest = "17349247334982273516",
            endPort = "In"
          },
          {
            startQuest = "17347712154441591081",
            startPort = "QuestStart",
            endQuest = "17349348477974999640",
            endPort = "In"
          },
          {
            startQuest = "17349348477974999640",
            startPort = "Out",
            endQuest = "17347740401072271713",
            endPort = "In"
          },
          {
            startQuest = "17349348477974999640",
            startPort = "Out",
            endQuest = "17347740680422272057",
            endPort = "In"
          },
          {
            startQuest = "17349348477974999640",
            startPort = "Out",
            endQuest = "17347746752342275188",
            endPort = "In"
          }
        },
        nodeData = {
          ["17347712154441591081"] = {
            key = "17347712154441591081",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 567.5, y = 316.25},
            propsData = {ModeType = 0}
          },
          ["17347712154441591084"] = {
            key = "17347712154441591084",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5120.671936758893, y = 444.1304347826087},
            propsData = {ModeType = 0}
          },
          ["17347712154441591087"] = {
            key = "17347712154441591087",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3671.3636363636365, y = 717.7272727272727},
            propsData = {}
          },
          ["17347740401072271713"] = {
            key = "17347740401072271713",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1145.9930887825626, y = 293.88455988456},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1650494},
              QuestPickupId = -1,
              UnitId = 80026,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17347740680422272057"] = {
            key = "17347740680422272057",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\188\128\232\189\166",
            pos = {x = 1139.7304625199365, y = 91.15728715728727},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004701,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17347742024902273153"] = {
            key = "17347742024902273153",
            type = "TalkNode",
            name = "\230\136\152\230\150\151\229\188\128\232\189\166",
            pos = {x = 1837.2452846543245, y = 111.74029110985637},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004702,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17347742139722273449"] = {
            key = "17347742139722273449",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1865.3233478954307, y = 299.72942154463897},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650495,
                1650496,
                1650497,
                1650498
              }
            }
          },
          ["17347742288812273651"] = {
            key = "17347742288812273651",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2444.7304625199367, y = 260.24819624819645},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650495,
                1650496,
                1650497,
                1650498
              }
            }
          },
          ["17347746061572274200"] = {
            key = "17347746061572274200",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 2108.8213716108457, y = 486.61183261183294},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650499,
                1650500,
                1650501,
                1650502
              }
            }
          },
          ["17347746446032274593"] = {
            key = "17347746446032274593",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2709.2759170653912, y = 256.1572871572874},
            propsData = {WaitTime = 1}
          },
          ["17347746535552274906"] = {
            key = "17347746535552274906",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2444.275917065391, y = 490.70274170274195},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650499,
                1650500,
                1650501,
                1650502
              }
            }
          },
          ["17347746752342275188"] = {
            key = "17347746752342275188",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\188\128\233\151\168\230\156\186\229\133\179",
            pos = {x = 1145.244296512031, y = 565.5248760900938},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650503}
            }
          },
          ["17347747799432275770"] = {
            key = "17347747799432275770",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 2769.2759170653903, y = 496.1572871572875},
            propsData = {
              StaticCreatorIdList = {1650503},
              ManualItemIdList = {},
              StateId = 780111,
              QuestId = 0
            }
          },
          ["17347748294402276242"] = {
            key = "17347748294402276242",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3097.9122807017543, y = 505.70274170274195},
            propsData = {WaitTime = 1}
          },
          ["17347748371182276419"] = {
            key = "17347748371182276419",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4874.908328132585, y = 459.4576824142044},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 2
            }
          },
          ["17347748583752277042"] = {
            key = "17347748583752277042",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3406.2077352472097, y = 492.0663780663782},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1650503,
              StateId = 780113,
              IsGuideEnable = false,
              GuidePointName = "Mechanism_Dyn_1650503"
            }
          },
          ["17349199775691487"] = {
            key = "17349199775691487",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3827.7391304347825, y = 195.9782608695653},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004703,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17349199938071815"] = {
            key = "17349199938071815",
            type = "ChangeStaticCreatorNode",
            name = "\230\140\135\230\140\165\229\174\152\229\143\138\230\149\140\228\186\186",
            pos = {x = 3920.565217391305, y = 487.7173913043478},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650504,
                1650505,
                1650506,
                1650507,
                1650508,
                1650509,
                1650510
              }
            }
          },
          ["17349200103492094"] = {
            key = "17349200103492094",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 4276.000000000001, y = 445.21739130434776},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 7,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650504,
                1650505,
                1650506,
                1650507,
                1650508,
                1650509,
                1650510
              }
            }
          },
          ["17349224256022046976"] = {
            key = "17349224256022046976",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 4566.000000000001, y = 453.04347826086973},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004704,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17349246822782272633"] = {
            key = "17349246822782272633",
            type = "SwitchMechanismStateNode",
            name = "\229\133\179\233\151\168",
            pos = {x = 1540.0131578947367, y = 111.20175438596472},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650005},
              StateId = 104012,
              QuestId = 0
            }
          },
          ["17349247334982273516"] = {
            key = "17349247334982273516",
            type = "SwitchMechanismStateNode",
            name = "\229\188\128\233\151\168",
            pos = {x = 3525.0131578947367, y = 217.45175438596476},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650005},
              StateId = 104011,
              QuestId = 0
            }
          },
          ["17349348477974999640"] = {
            key = "17349348477974999640",
            type = "SwitchMechanismStateNode",
            name = "\229\136\157\229\167\139\229\140\150\229\188\128\233\151\168",
            pos = {x = 855.0131578947367, y = 326.2017543859649},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1650005},
              StateId = 104011,
              QuestId = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
