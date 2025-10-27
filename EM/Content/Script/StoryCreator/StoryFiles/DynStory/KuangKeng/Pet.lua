return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1736911435977527080",
      startPort = "StoryStart",
      endStory = "17369209818721277",
      endPort = "In"
    },
    {
      startStory = "17369209818721277",
      startPort = "Success",
      endStory = "1736911435977527081",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1736911435977527080"] = {
      isStoryNode = true,
      key = "1736911435977527080",
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
    ["1736911435977527081"] = {
      isStoryNode = true,
      key = "1736911435977527081",
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
    ["17369209818721277"] = {
      isStoryNode = true,
      key = "17369209818721277",
      type = "StoryNode",
      name = "\233\173\148\231\129\181",
      pos = {x = 1123.7777777777776, y = 279.1111111111111},
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
            startQuest = "17369209818721286",
            startPort = "Out",
            endQuest = "17369209818721283",
            endPort = "Success"
          },
          {
            startQuest = "17369209818721287",
            startPort = "Out",
            endQuest = "17369209818721288",
            endPort = "In"
          },
          {
            startQuest = "17369209818731289",
            startPort = "Out",
            endQuest = "17369209818721287",
            endPort = "In"
          },
          {
            startQuest = "17369209818731289",
            startPort = "Out",
            endQuest = "17369209818721285",
            endPort = "In"
          },
          {
            startQuest = "17369209818721288",
            startPort = "Out",
            endQuest = "17369209818731291",
            endPort = "In"
          },
          {
            startQuest = "17369209818731291",
            startPort = "Out",
            endQuest = "17369209818731293",
            endPort = "In"
          },
          {
            startQuest = "17369209818731289",
            startPort = "Out",
            endQuest = "17369209818731294",
            endPort = "In"
          },
          {
            startQuest = "17369209818731293",
            startPort = "Out",
            endQuest = "17369209818731296",
            endPort = "In"
          },
          {
            startQuest = "17369209818731293",
            startPort = "Out",
            endQuest = "17369209818731297",
            endPort = "In"
          },
          {
            startQuest = "17369209818731298",
            startPort = "Out",
            endQuest = "17369209818731299",
            endPort = "In"
          },
          {
            startQuest = "17369209818731298",
            startPort = "Out",
            endQuest = "17369209818731300",
            endPort = "In"
          },
          {
            startQuest = "17369209818731296",
            startPort = "Out",
            endQuest = "17369209818731298",
            endPort = "In"
          },
          {
            startQuest = "17369209818731299",
            startPort = "Out",
            endQuest = "17369209818731301",
            endPort = "In"
          },
          {
            startQuest = "17369209818731300",
            startPort = "Out",
            endQuest = "17369209818731303",
            endPort = "Input_2"
          },
          {
            startQuest = "17369209818731297",
            startPort = "Out",
            endQuest = "17369209818731303",
            endPort = "Input_3"
          },
          {
            startQuest = "17369209818731303",
            startPort = "Out",
            endQuest = "17369209818731295",
            endPort = "In"
          },
          {
            startQuest = "17369209818731301",
            startPort = "Out",
            endQuest = "17369258704891122",
            endPort = "In"
          },
          {
            startQuest = "17369258704891122",
            startPort = "Out",
            endQuest = "17369209818731303",
            endPort = "Input_1"
          },
          {
            startQuest = "1736927934425723171",
            startPort = "Out",
            endQuest = "17369209818731289",
            endPort = "In"
          },
          {
            startQuest = "17369209818721282",
            startPort = "QuestStart",
            endQuest = "17440182735883150999",
            endPort = "In"
          },
          {
            startQuest = "17440182735883150999",
            startPort = "Out",
            endQuest = "1736927934425723171",
            endPort = "In"
          },
          {
            startQuest = "17369209818731303",
            startPort = "Out",
            endQuest = "17369209818731292",
            endPort = "In"
          },
          {
            startQuest = "17369209818731292",
            startPort = "Out",
            endQuest = "17369209818721286",
            endPort = "In"
          }
        },
        nodeData = {
          ["17369209818721282"] = {
            key = "17369209818721282",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1274.478287841191, y = 278.8436724565757},
            propsData = {ModeType = 0}
          },
          ["17369209818721283"] = {
            key = "17369209818721283",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4016.168831168831, y = 440.51948051948057},
            propsData = {ModeType = 0}
          },
          ["17369209818721284"] = {
            key = "17369209818721284",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17369209818721285"] = {
            key = "17369209818721285",
            type = "TalkNode",
            name = "\232\167\163\230\149\145\229\174\160\231\137\169\229\188\128\232\189\166",
            pos = {x = 17.075274725274312, y = 14.919230769230964},
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
          ["17369209818721286"] = {
            key = "17369209818721286",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3658.3428571428567, y = 417.80519480519496},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17369209818721287"] = {
            key = "17369209818721287",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 15.454545454545496, y = 302.97727272727286},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1270146,
                1270147,
                1270148
              }
            }
          },
          ["17369209818721288"] = {
            key = "17369209818721288",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\155\180\231\187\149\231\157\128\229\174\160\231\137\169\231\154\132\229\163\171\229\133\181",
            pos = {x = 321.8045454545455, y = 317.8272727272729},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1270146,
                1270147,
                1270148
              }
            }
          },
          ["17369209818731289"] = {
            key = "17369209818731289",
            type = "SendMessageNode",
            name = "\233\148\129\228\189\143\229\174\160\231\137\169",
            pos = {x = -253.2954545454545, y = 300.4772727272729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LockPet",
              UnitId = -1
            }
          },
          ["17369209818731290"] = {
            key = "17369209818731290",
            type = "SendMessageNode",
            name = "\232\167\163\233\148\129\229\174\160\231\137\169",
            pos = {x = 3312.0543956043957, y = 675.8390109890113},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "UnlockPet",
              UnitId = -1
            }
          },
          ["17369209818731291"] = {
            key = "17369209818731291",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\229\163\171\229\133\181\229\188\128\232\189\166",
            pos = {x = 581.2584358623837, y = 299.158994076099},
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
          ["17369209818731292"] = {
            key = "17369209818731292",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\229\163\171\229\133\181\229\188\128\232\189\166",
            pos = {x = 3014.4867338801564, y = 435.9836694007745},
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
          ["17369209818731293"] = {
            key = "17369209818731293",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\140\135\230\140\165\229\174\152",
            pos = {x = 853.5101105035326, y = 276.5226304397353},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1270157}
            }
          },
          ["17369209818731294"] = {
            key = "17369209818731294",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\148\129\229\174\154\231\137\185\230\149\136",
            pos = {x = 11.517516078618087, y = 501.3550387390242},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1270145}
            }
          },
          ["17369209818731295"] = {
            key = "17369209818731295",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 3046.959474120576, y = 151.3435002774856},
            propsData = {
              StaticCreatorIdList = {1270145},
              ManualItemIdList = {},
              StateId = 780341,
              QuestId = 0
            }
          },
          ["17369209818731296"] = {
            key = "17369209818731296",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1147.8289473684217, y = 278.7523923444974},
            propsData = {WaitTime = 3}
          },
          ["17369209818731297"] = {
            key = "17369209818731297",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1154.0789473684217, y = 40.00239234449742},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1270157}
            }
          },
          ["17369209818731298"] = {
            key = "17369209818731298",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 1435.044528935977, y = 273.39763043973534},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1270149,
                1270150,
                1270151,
                1270152
              }
            }
          },
          ["17369209818731299"] = {
            key = "17369209818731299",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1729.3633658008662, y = 275.6273923444975},
            propsData = {WaitTime = 3}
          },
          ["17369209818731300"] = {
            key = "17369209818731300",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1736.9770021645024, y = 36.87739234449748},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1270149,
                1270150,
                1270151,
                1270152
              }
            }
          },
          ["17369209818731301"] = {
            key = "17369209818731301",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 2056.4081652996133, y = 278.51126680337177},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1270153,
                1270154,
                1270155
              }
            }
          },
          ["17369209818731303"] = {
            key = "17369209818731303",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2731.578947368422, y = 396.5933014354066},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["1736923701708707"] = {
            key = "1736923701708707",
            type = "SendMessageNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -980.7854443943155, y = -8.854381611597375},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "CreatePet",
              UnitId = -1
            }
          },
          ["17369258704891122"] = {
            key = "17369258704891122",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2356.5162907268177, y = 269.65789473684197},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1270153,
                1270154,
                1270155
              }
            }
          },
          ["1736927934425723171"] = {
            key = "1736927934425723171",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -629.2995391705068, y = 265.41935483870964},
            propsData = {WaitTime = 1}
          },
          ["17440182735883150999"] = {
            key = "17440182735883150999",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -963.7900053163205, y = 277.5371885236062},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1270144}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
