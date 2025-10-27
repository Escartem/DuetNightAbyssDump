return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1733292832223126",
      startPort = "StoryStart",
      endStory = "1733292834515215",
      endPort = "In"
    },
    {
      startStory = "1733292834515215",
      startPort = "Success",
      endStory = "1733292832223129",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1733292832223126"] = {
      isStoryNode = true,
      key = "1733292832223126",
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
    ["1733292832223129"] = {
      isStoryNode = true,
      key = "1733292832223129",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1469.090909090909, y = 287.72727272727275},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1733292834515215"] = {
      isStoryNode = true,
      key = "1733292834515215",
      type = "StoryNode",
      name = "\228\188\143\229\135\187",
      pos = {x = 1163.793103448276, y = 286.48275862068965},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_FortFuji_Des",
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
            startQuest = "1733292834515216",
            startPort = "QuestStart",
            endQuest = "1733292897040628967",
            endPort = "In"
          },
          {
            startQuest = "1733297774709630433",
            startPort = "Out",
            endQuest = "1733292834515223",
            endPort = "Success"
          },
          {
            startQuest = "1733292897040628967",
            startPort = "Out",
            endQuest = "17332989673241887603",
            endPort = "In"
          },
          {
            startQuest = "17332989673241887603",
            startPort = "Out",
            endQuest = "1733297731695629697",
            endPort = "In"
          },
          {
            startQuest = "1733297731695629697",
            startPort = "Out",
            endQuest = "17332989868151888230",
            endPort = "In"
          },
          {
            startQuest = "17332989868151888230",
            startPort = "Out",
            endQuest = "1733297735924629867",
            endPort = "In"
          },
          {
            startQuest = "1733297748852630196",
            startPort = "Out",
            endQuest = "17332990196171889258",
            endPort = "In"
          },
          {
            startQuest = "17332990288071889515",
            startPort = "Out",
            endQuest = "1733297748852630196",
            endPort = "In"
          },
          {
            startQuest = "1733297735924629867",
            startPort = "Out",
            endQuest = "17332990288071889515",
            endPort = "In"
          },
          {
            startQuest = "1733297735924629867",
            startPort = "Out",
            endQuest = "17332990401711889815",
            endPort = "In"
          },
          {
            startQuest = "1733292897040628967",
            startPort = "Out",
            endQuest = "1733301967132381",
            endPort = "In"
          },
          {
            startQuest = "1733297731695629697",
            startPort = "Out",
            endQuest = "1733301985076892",
            endPort = "In"
          },
          {
            startQuest = "1733297748852630196",
            startPort = "Out",
            endQuest = "17333019938241163",
            endPort = "In"
          },
          {
            startQuest = "17332990401711889815",
            startPort = "Out",
            endQuest = "17333020012021437",
            endPort = "In"
          },
          {
            startQuest = "17333020012021437",
            startPort = "Out",
            endQuest = "1733297774709630433",
            endPort = "In"
          }
        },
        nodeData = {
          ["1733292834515216"] = {
            key = "1733292834515216",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1733292834515223"] = {
            key = "1733292834515223",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3608.894827586207, y = 327.51034482758627},
            propsData = {ModeType = 0}
          },
          ["1733292834515230"] = {
            key = "1733292834515230",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1733292897040628967"] = {
            key = "1733292897040628967",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\163\129\230\154\180\230\156\186",
            pos = {x = 1086.784980237154, y = 295.3623551860434},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650435,
                1650436,
                1650437,
                1650438
              }
            }
          },
          ["1733297731695629697"] = {
            key = "1733297731695629697",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\163\129\230\154\180\230\156\186",
            pos = {x = 1610.7620485211937, y = 301.12896279133173},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650439,
                1650440,
                1650441,
                1650442
              }
            }
          },
          ["1733297735924629867"] = {
            key = "1733297735924629867",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\149\140\229\134\155",
            pos = {x = 2101.274274226523, y = 302.27441733678626},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650453,
                1650454,
                1650455,
                1650456,
                1650457,
                1650458,
                1650459,
                1650460
              }
            }
          },
          ["1733297748852630196"] = {
            key = "1733297748852630196",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\163\129\230\154\180\230\156\186",
            pos = {x = 2759.5194152923536, y = -9.14062968515745},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650443,
                1650444,
                1650445
              }
            }
          },
          ["1733297774709630433"] = {
            key = "1733297774709630433",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3323.2280359820097, y = 320.1490254872563},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17332989673241887603"] = {
            key = "17332989673241887603",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1355.7031317674496, y = 300.82381666309703},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650435,
                1650436,
                1650437,
                1650438
              }
            }
          },
          ["17332989868151888230"] = {
            key = "17332989868151888230",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1850.9031317674496, y = 306.8238166630971},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650439,
                1650440,
                1650441,
                1650442
              }
            }
          },
          ["17332990196171889258"] = {
            key = "17332990196171889258",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3043.70313176745, y = -7.576183336902952},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650443,
                1650444,
                1650445
              }
            }
          },
          ["17332990288071889515"] = {
            key = "17332990288071889515",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2430.5031317674493, y = 2.0238166630970937},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17332990401711889815"] = {
            key = "17332990401711889815",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2485.7031317674496, y = 311.623816663097},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 8,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650453,
                1650454,
                1650455,
                1650456,
                1650457,
                1650458,
                1650459,
                1650460
              }
            }
          },
          ["1733301967132381"] = {
            key = "1733301967132381",
            type = "TalkNode",
            name = "\231\163\129\230\154\180\230\156\186\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 1379.75, y = 550},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003601,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733301985076892"] = {
            key = "1733301985076892",
            type = "TalkNode",
            name = "\231\163\129\230\154\180\230\156\186\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 1891, y = 540},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003602,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17333019938241163"] = {
            key = "17333019938241163",
            type = "TalkNode",
            name = "\231\163\129\230\154\180\230\156\186\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 2964.75, y = -261.2500000000001},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003603,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17333020012021437"] = {
            key = "17333020012021437",
            type = "TalkNode",
            name = "\231\163\129\230\154\180\230\156\186\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 2894.75, y = 320},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003604,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
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
