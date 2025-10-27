return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1737027326082541514",
      startPort = "StoryStart",
      endStory = "1737027326082541516",
      endPort = "In"
    },
    {
      startStory = "1737027326082541516",
      startPort = "Success",
      endStory = "1737027326082541515",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1737027326082541514"] = {
      isStoryNode = true,
      key = "1737027326082541514",
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
    ["1737027326082541515"] = {
      isStoryNode = true,
      key = "1737027326082541515",
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
    ["1737027326082541516"] = {
      isStoryNode = true,
      key = "1737027326082541516",
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
            startQuest = "1737027326082541521",
            startPort = "Out",
            endQuest = "1737027326082541518",
            endPort = "Success"
          },
          {
            startQuest = "1737027326082541522",
            startPort = "Out",
            endQuest = "1737027326082541523",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541524",
            startPort = "Out",
            endQuest = "1737027326082541522",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541524",
            startPort = "Out",
            endQuest = "1737027326082541520",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541523",
            startPort = "Out",
            endQuest = "1737027326082541526",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541526",
            startPort = "Out",
            endQuest = "1737027326082541528",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541524",
            startPort = "Out",
            endQuest = "1737027326082541529",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541528",
            startPort = "Out",
            endQuest = "1737027326082541531",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541528",
            startPort = "Out",
            endQuest = "1737027326082541532",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541533",
            startPort = "Out",
            endQuest = "1737027326082541534",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541533",
            startPort = "Out",
            endQuest = "1737027326082541535",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541531",
            startPort = "Out",
            endQuest = "1737027326082541533",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541534",
            startPort = "Out",
            endQuest = "1737027326082541536",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541535",
            startPort = "Out",
            endQuest = "1737027326082541537",
            endPort = "Input_2"
          },
          {
            startQuest = "1737027326082541532",
            startPort = "Out",
            endQuest = "1737027326082541537",
            endPort = "Input_3"
          },
          {
            startQuest = "1737027326082541537",
            startPort = "Out",
            endQuest = "1737027326082541530",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541536",
            startPort = "Out",
            endQuest = "1737027326082541539",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541539",
            startPort = "Out",
            endQuest = "1737027326082541537",
            endPort = "Input_1"
          },
          {
            startQuest = "1737027326082541540",
            startPort = "Out",
            endQuest = "1737027326082541524",
            endPort = "In"
          },
          {
            startQuest = "17440183208723675985",
            startPort = "Out",
            endQuest = "1737027326082541540",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541517",
            startPort = "QuestStart",
            endQuest = "17440183208723675985",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541537",
            startPort = "Out",
            endQuest = "1737027326082541527",
            endPort = "In"
          },
          {
            startQuest = "1737027326082541527",
            startPort = "Out",
            endQuest = "1737027326082541521",
            endPort = "In"
          }
        },
        nodeData = {
          ["1737027326082541517"] = {
            key = "1737027326082541517",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1274.478287841191, y = 278.8436724565757},
            propsData = {ModeType = 0}
          },
          ["1737027326082541518"] = {
            key = "1737027326082541518",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3775.954545454545, y = 422.5909090909091},
            propsData = {ModeType = 0}
          },
          ["1737027326082541519"] = {
            key = "1737027326082541519",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1737027326082541520"] = {
            key = "1737027326082541520",
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
          ["1737027326082541521"] = {
            key = "1737027326082541521",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3482.2714285714283, y = 432.59090909090924},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1737027326082541522"] = {
            key = "1737027326082541522",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 16.454545454545496, y = 302.97727272727286},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1440150,
                1440151,
                1440152,
                1440153
              }
            }
          },
          ["1737027326082541523"] = {
            key = "1737027326082541523",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\155\180\231\187\149\231\157\128\229\174\160\231\137\169\231\154\132\231\167\189\229\133\189",
            pos = {x = 325.8045454545455, y = 317.8272727272729},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1440150,
                1440151,
                1440152,
                1440153
              }
            }
          },
          ["1737027326082541524"] = {
            key = "1737027326082541524",
            type = "SendMessageNode",
            name = "\233\148\129\228\189\143\229\174\160\231\137\169",
            pos = {x = -253.2954545454545, y = 300.4772727272729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LockPet",
              UnitId = -1
            }
          },
          ["1737027326082541525"] = {
            key = "1737027326082541525",
            type = "SendMessageNode",
            name = "\232\167\163\233\148\129\229\174\160\231\137\169",
            pos = {x = 3255.95, y = 658.8500000000001},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "UnlockPet",
              UnitId = -1
            }
          },
          ["1737027326082541526"] = {
            key = "1737027326082541526",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\231\167\189\229\133\189\229\188\128\232\189\166",
            pos = {x = 581.2584358623837, y = 299.158994076099},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71006002,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1737027326082541527"] = {
            key = "1737027326082541527",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\231\167\189\229\133\189\229\188\128\232\189\166",
            pos = {x = 2984.2010195944417, y = 443.84081225791726},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71006003,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1737027326082541528"] = {
            key = "1737027326082541528",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\178\190\232\139\177\231\167\189\229\133\189",
            pos = {x = 853.5101105035326, y = 276.5226304397353},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1440154}
            }
          },
          ["1737027326082541529"] = {
            key = "1737027326082541529",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\148\129\229\174\154\231\137\185\230\149\136",
            pos = {x = 11.517516078618087, y = 501.3550387390242},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1440149}
            }
          },
          ["1737027326082541530"] = {
            key = "1737027326082541530",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 3046.959474120576, y = 152.3435002774856},
            propsData = {
              StaticCreatorIdList = {1440149},
              ManualItemIdList = {},
              StateId = 780341,
              QuestId = 0
            }
          },
          ["1737027326082541531"] = {
            key = "1737027326082541531",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1147.8289473684217, y = 278.7523923444974},
            propsData = {WaitTime = 3}
          },
          ["1737027326082541532"] = {
            key = "1737027326082541532",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\231\178\190\232\139\177\231\167\189\229\133\189",
            pos = {x = 1154.0789473684217, y = 40.00239234449742},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1440154}
            }
          },
          ["1737027326082541533"] = {
            key = "1737027326082541533",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 1435.044528935977, y = 273.39763043973534},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1440155,
                1440156,
                1440157,
                1440158
              }
            }
          },
          ["1737027326082541534"] = {
            key = "1737027326082541534",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1729.3633658008662, y = 275.6273923444975},
            propsData = {WaitTime = 3}
          },
          ["1737027326082541535"] = {
            key = "1737027326082541535",
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
                1440155,
                1440156,
                1440157,
                1440158
              }
            }
          },
          ["1737027326082541536"] = {
            key = "1737027326082541536",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 2056.4081652996133, y = 278.51126680337177},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1440159,
                1440160,
                1440161,
                1440162
              }
            }
          },
          ["1737027326082541537"] = {
            key = "1737027326082541537",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2731.578947368422, y = 396.5933014354066},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["1737027326082541538"] = {
            key = "1737027326082541538",
            type = "SendMessageNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -987.3492592610756, y = 78.07408963664949},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "CreatePet",
              UnitId = -1
            }
          },
          ["1737027326082541539"] = {
            key = "1737027326082541539",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2356.5162907268177, y = 269.65789473684197},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1440159,
                1440160,
                1440161,
                1440162
              }
            }
          },
          ["1737027326082541540"] = {
            key = "1737027326082541540",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -629.2995391705068, y = 265.41935483870964},
            propsData = {WaitTime = 1}
          },
          ["17440183208723675985"] = {
            key = "17440183208723675985",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -955.3540372670806, y = 281.80434782608705},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1440148}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
