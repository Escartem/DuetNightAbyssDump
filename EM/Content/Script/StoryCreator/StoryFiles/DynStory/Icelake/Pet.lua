return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1728977758063186730",
      startPort = "StoryStart",
      endStory = "17309717633901879",
      endPort = "In"
    },
    {
      startStory = "17309717633901879",
      startPort = "Success",
      endStory = "1728977758064186733",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1728977758063186730"] = {
      isStoryNode = true,
      key = "1728977758063186730",
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
    ["1728977758064186733"] = {
      isStoryNode = true,
      key = "1728977758064186733",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1438.4615384615383, y = 286.15384615384613},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1728977761759186855"] = {
      isStoryNode = true,
      key = "1728977761759186855",
      type = "StoryNode",
      name = "\232\167\163\230\149\145\233\173\148\231\129\181",
      pos = {x = 1081.0576923076922, y = -11.003846153846155},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakePet_Des",
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
            startQuest = "1728977761768186856",
            startPort = "QuestStart",
            endQuest = "1728977960475188269",
            endPort = "In"
          },
          {
            startQuest = "1728977960475188269",
            startPort = "Out",
            endQuest = "1728977984254188731",
            endPort = "In"
          },
          {
            startQuest = "1728977984254188731",
            startPort = "Out",
            endQuest = "1728978027722189688",
            endPort = "In"
          },
          {
            startQuest = "1728977984254188731",
            startPort = "Out",
            endQuest = "1728978098939190456",
            endPort = "In"
          },
          {
            startQuest = "1728978280887192757",
            startPort = "Out",
            endQuest = "1728977761768186859",
            endPort = "Success"
          },
          {
            startQuest = "1728978027722189688",
            startPort = "Out",
            endQuest = "1728989787235637",
            endPort = "In"
          },
          {
            startQuest = "1728989787235637",
            startPort = "Out",
            endQuest = "1728978280887192757",
            endPort = "In"
          },
          {
            startQuest = "1728977960475188269",
            startPort = "Out",
            endQuest = "1729651925139670",
            endPort = "In"
          },
          {
            startQuest = "1729651925139670",
            startPort = "Out",
            endQuest = "17309644977061030347",
            endPort = "In"
          },
          {
            startQuest = "17309649815681031781",
            startPort = "Out",
            endQuest = "17309650108101032375",
            endPort = "In"
          },
          {
            startQuest = "17309650108101032375",
            startPort = "Out",
            endQuest = "1728978098939190456",
            endPort = "In"
          },
          {
            startQuest = "17309650404211032846",
            startPort = "Out",
            endQuest = "17309649815681031781",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728977761768186856"] = {
            key = "1728977761768186856",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728977761768186859"] = {
            key = "1728977761768186859",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3031.3303604607954, y = 264.7231512448904},
            propsData = {ModeType = 0}
          },
          ["1728977761768186862"] = {
            key = "1728977761768186862",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2864.6153846153848, y = 787.6923076923076},
            propsData = {}
          },
          ["1728977960475188269"] = {
            key = "1728977960475188269",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\167\163\230\149\145\230\156\186\229\133\179",
            pos = {x = 1157.461538461539, y = 294.8406593406594},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240334}
            }
          },
          ["1728977984254188731"] = {
            key = "1728977984254188731",
            type = "WaitingMechanismEnterStateNode",
            name = "\228\186\164\228\186\146\229\136\135\231\138\182\230\128\129-\229\136\183\230\128\170",
            pos = {x = 1481.3076923076926, y = 301.8461538461539},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240334,
              StateId = 780161,
              IsGuideEnable = true,
              GuidePointName = ""
            }
          },
          ["1728978027722189688"] = {
            key = "1728978027722189688",
            type = "WaitingMechanismEnterStateNode",
            name = "\229\174\160\231\137\169\232\167\163\233\148\129",
            pos = {x = 1843.5054945054947, y = 304.0582895365502},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240334,
              StateId = 780162,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1728978098939190456"] = {
            key = "1728978098939190456",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175\229\136\183\230\128\170",
            pos = {x = 1807.7362637362642, y = 44.59340659340635},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "StartDynStory_Pet",
              UnitId = -1
            }
          },
          ["1728978280887192757"] = {
            key = "1728978280887192757",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2688.682008812443, y = 272.39348091521987},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1728989787235637"] = {
            key = "1728989787235637",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2357.027777777778, y = 304.44444444444446},
            propsData = {WaitTime = 5}
          },
          ["1729651925139670"] = {
            key = "1729651925139670",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1452.4902721547462, y = 58.26529795453942},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LockPet",
              UnitId = -1
            }
          },
          ["1729652710007191380"] = {
            key = "1729652710007191380",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2274.926169590643, y = 514.0345287237701},
            propsData = {SendMessage = "", FinishCondition = ""}
          },
          ["17309644977061030347"] = {
            key = "17309644977061030347",
            type = "TalkNode",
            name = "\232\167\163\230\149\145\229\174\160\231\137\169\229\188\128\232\189\166",
            pos = {x = 1458.0184340326518, y = -159.55227679172359},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003101,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17309649815681031781"] = {
            key = "17309649815681031781",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 1422.6612911755087, y = 544.3762946368479},
            propsData = {
              StaticCreatorIdList = {1240334},
              ManualItemIdList = {},
              StateId = 780163,
              QuestId = 0
            }
          },
          ["17309650108101032375"] = {
            key = "17309650108101032375",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\232\147\157\229\155\190\229\136\135\230\141\162\231\138\182\230\128\129",
            pos = {x = 1696.5898626040805, y = 543.3048660654193},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240334,
              StateId = 780163,
              IsGuideEnable = true,
              GuidePointName = ""
            }
          },
          ["17309650404211032846"] = {
            key = "17309650404211032846",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1431.9184340326515, y = 689.1905803511336},
            propsData = {WaitTime = 5}
          }
        },
        commentData = {}
      }
    },
    ["17309717633901879"] = {
      isStoryNode = true,
      key = "17309717633901879",
      type = "StoryNode",
      name = "\233\173\148\231\129\181",
      pos = {x = 1097.5714285714282, y = 270.7000000000003},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakePet_Des",
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
            startQuest = "1730971927187211801",
            startPort = "Out",
            endQuest = "17309717633911883",
            endPort = "Success"
          },
          {
            startQuest = "17309747154951025",
            startPort = "Out",
            endQuest = "17309747263701260",
            endPort = "In"
          },
          {
            startQuest = "17309749642831664",
            startPort = "Out",
            endQuest = "17309747154951025",
            endPort = "In"
          },
          {
            startQuest = "17309749642831664",
            startPort = "Out",
            endQuest = "17309718779544631",
            endPort = "In"
          },
          {
            startQuest = "17309747263701260",
            startPort = "Out",
            endQuest = "17310515645821047796",
            endPort = "In"
          },
          {
            startQuest = "17310515645821047796",
            startPort = "Out",
            endQuest = "17310531444011259208",
            endPort = "In"
          },
          {
            startQuest = "17310531444011259208",
            startPort = "Out",
            endQuest = "17309718572273928",
            endPort = "In"
          },
          {
            startQuest = "17309749642831664",
            startPort = "Out",
            endQuest = "17336392480281276816",
            endPort = "In"
          },
          {
            startQuest = "17309718572273928",
            startPort = "Out",
            endQuest = "17336392981921914776",
            endPort = "In"
          },
          {
            startQuest = "17309717633901880",
            startPort = "QuestStart",
            endQuest = "17440180842552100436",
            endPort = "In"
          },
          {
            startQuest = "17440180842552100436",
            startPort = "Out",
            endQuest = "17440181016232100730",
            endPort = "In"
          },
          {
            startQuest = "17440181016232100730",
            startPort = "Out",
            endQuest = "17309749642831664",
            endPort = "In"
          },
          {
            startQuest = "17309718572273928",
            startPort = "Out",
            endQuest = "17310519710431049226",
            endPort = "In"
          },
          {
            startQuest = "17310519710431049226",
            startPort = "Out",
            endQuest = "1730971927187211801",
            endPort = "In"
          }
        },
        nodeData = {
          ["17309717633901880"] = {
            key = "17309717633901880",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -340.0000000000001, y = 286.25},
            propsData = {ModeType = 0}
          },
          ["17309717633911883"] = {
            key = "17309717633911883",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3011.5, y = 306},
            propsData = {ModeType = 0}
          },
          ["17309717633911886"] = {
            key = "17309717633911886",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17309718572273928"] = {
            key = "17309718572273928",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1859.4999999999993, y = 271.43636363636375},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 9,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240345,
                1240346,
                1240347,
                1240348,
                1240349,
                1240350,
                1240351,
                1240352,
                1240353
              }
            }
          },
          ["17309718779544631"] = {
            key = "17309718779544631",
            type = "TalkNode",
            name = "\232\167\163\230\149\145\229\174\160\231\137\169\229\188\128\232\189\166",
            pos = {x = 704.0752747252743, y = -10.580769230769036},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003101,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730971927187211801"] = {
            key = "1730971927187211801",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2710.316883116883, y = 305.5000000000001},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17309747154951025"] = {
            key = "17309747154951025",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 702.4545454545455, y = 277.47727272727286},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240341,
                1240342,
                1240343
              }
            }
          },
          ["17309747263701260"] = {
            key = "17309747263701260",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\155\180\231\187\149\231\157\128\229\174\160\231\137\169\231\154\132\229\163\171\229\133\181",
            pos = {x = 1008.8045454545455, y = 293.5272727272729},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240341,
                1240342,
                1240343
              }
            }
          },
          ["17309749642831664"] = {
            key = "17309749642831664",
            type = "SendMessageNode",
            name = "\233\148\129\228\189\143\229\174\160\231\137\169",
            pos = {x = 433.7045454545455, y = 274.9772727272729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LockPet",
              UnitId = -1
            }
          },
          ["17309749941302248"] = {
            key = "17309749941302248",
            type = "SendMessageNode",
            name = "\232\167\163\233\148\129\229\174\160\231\137\169",
            pos = {x = 2409.6545454545458, y = 495.3272727272729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "UnlockPet",
              UnitId = -1
            }
          },
          ["17310515645821047796"] = {
            key = "17310515645821047796",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\229\163\171\229\133\181\229\188\128\232\189\166",
            pos = {x = 1268.2584358623837, y = 273.658994076099},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003102,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17310519710431049226"] = {
            key = "17310519710431049226",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\229\163\171\229\133\181\229\188\128\232\189\166",
            pos = {x = 2095.6555650489877, y = 298.06808498519},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003103,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17310531444011259208"] = {
            key = "17310531444011259208",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 1540.5101105035326, y = 251.02263043973528},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240345,
                1240346,
                1240347,
                1240348,
                1240349,
                1240350,
                1240351,
                1240352,
                1240353
              }
            }
          },
          ["17336392480281276816"] = {
            key = "17336392480281276816",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\148\129\229\174\154\231\137\185\230\149\136",
            pos = {x = 690.3356978968, y = 451.30958419356966},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240334}
            }
          },
          ["17336392981921914776"] = {
            key = "17336392981921914776",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 2120.7356978968, y = 26.50958419356948},
            propsData = {
              StaticCreatorIdList = {1240334},
              ManualItemIdList = {},
              StateId = 780341,
              QuestId = 0
            }
          },
          ["17440180842552100436"] = {
            key = "17440180842552100436",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -61.7499999999999, y = 287},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240333}
            }
          },
          ["17440181016232100730"] = {
            key = "17440181016232100730",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 187.0000000000001, y = 283.25},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
