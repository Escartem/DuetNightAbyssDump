return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17339943394041610",
      startPort = "StoryStart",
      endStory = "17339943404061651",
      endPort = "In"
    },
    {
      startStory = "17339943404061651",
      startPort = "Success",
      endStory = "17339943394041613",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17339943394041610"] = {
      isStoryNode = true,
      key = "17339943394041610",
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
    ["17339943394041613"] = {
      isStoryNode = true,
      key = "17339943394041613",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1580.7971014492753, y = 292.39130434782606},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17339943404061651"] = {
      isStoryNode = true,
      key = "17339943404061651",
      type = "StoryNode",
      name = "\233\173\148\231\129\181",
      pos = {x = 1218, y = 282.5},
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
            startQuest = "17339943404071660",
            startPort = "Out",
            endQuest = "17339943404071656",
            endPort = "Success"
          },
          {
            startQuest = "17339943404071661",
            startPort = "Out",
            endQuest = "17339943404071662",
            endPort = "In"
          },
          {
            startQuest = "17339943404071663",
            startPort = "Out",
            endQuest = "17339943404071661",
            endPort = "In"
          },
          {
            startQuest = "17339943404071663",
            startPort = "Out",
            endQuest = "17339943404071659",
            endPort = "In"
          },
          {
            startQuest = "17339943404071662",
            startPort = "Out",
            endQuest = "17339943404071665",
            endPort = "In"
          },
          {
            startQuest = "17339943404071665",
            startPort = "Out",
            endQuest = "17339943404071667",
            endPort = "In"
          },
          {
            startQuest = "17339943404071663",
            startPort = "Out",
            endQuest = "17339943404071668",
            endPort = "In"
          },
          {
            startQuest = "17339943404071667",
            startPort = "Out",
            endQuest = "1733994618493678686",
            endPort = "In"
          },
          {
            startQuest = "17339943404071667",
            startPort = "Out",
            endQuest = "1733994636337679109",
            endPort = "In"
          },
          {
            startQuest = "1733994662774679869",
            startPort = "Out",
            endQuest = "1733994662774679870",
            endPort = "In"
          },
          {
            startQuest = "1733994662774679869",
            startPort = "Out",
            endQuest = "1733994662774679871",
            endPort = "In"
          },
          {
            startQuest = "1733994618493678686",
            startPort = "Out",
            endQuest = "1733994662774679869",
            endPort = "In"
          },
          {
            startQuest = "1733994668134680065",
            startPort = "Out",
            endQuest = "1733994668134680067",
            endPort = "In"
          },
          {
            startQuest = "1733994662774679870",
            startPort = "Out",
            endQuest = "1733994668134680065",
            endPort = "In"
          },
          {
            startQuest = "1733994668134680067",
            startPort = "Out",
            endQuest = "1733994754698681154",
            endPort = "Input_1"
          },
          {
            startQuest = "1733994662774679871",
            startPort = "Out",
            endQuest = "1733994754698681154",
            endPort = "Input_2"
          },
          {
            startQuest = "1733994636337679109",
            startPort = "Out",
            endQuest = "1733994754698681154",
            endPort = "Input_3"
          },
          {
            startQuest = "1733994754698681154",
            startPort = "Out",
            endQuest = "17339943404071669",
            endPort = "In"
          },
          {
            startQuest = "17404719792654684892",
            startPort = "Out",
            endQuest = "17339943404071663",
            endPort = "In"
          },
          {
            startQuest = "17339943404061655",
            startPort = "QuestStart",
            endQuest = "17440177684231505",
            endPort = "In"
          },
          {
            startQuest = "17440177684231505",
            startPort = "Out",
            endQuest = "17404719792654684892",
            endPort = "In"
          },
          {
            startQuest = "1733994754698681154",
            startPort = "Out",
            endQuest = "17339943404071666",
            endPort = "In"
          },
          {
            startQuest = "17339943404071666",
            startPort = "Out",
            endQuest = "17339943404071660",
            endPort = "In"
          }
        },
        nodeData = {
          ["17339943404061655"] = {
            key = "17339943404061655",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1076.945652173913, y = 291.2608695652174},
            propsData = {ModeType = 0}
          },
          ["17339943404071656"] = {
            key = "17339943404071656",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3866.854545454545, y = 437.89090909090913},
            propsData = {ModeType = 0}
          },
          ["17339943404071657"] = {
            key = "17339943404071657",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17339943404071659"] = {
            key = "17339943404071659",
            type = "TalkNode",
            name = "\232\167\163\230\149\145\229\174\160\231\137\169\229\188\128\232\189\166",
            pos = {x = 16.04079196665362, y = 18.022679045093035},
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
          ["17339943404071660"] = {
            key = "17339943404071660",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3571.3714285714286, y = 438.8909090909092},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17339943404071661"] = {
            key = "17339943404071661",
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
                1580148,
                1580149,
                1580150
              }
            }
          },
          ["17339943404071662"] = {
            key = "17339943404071662",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\155\180\231\187\149\231\157\128\229\174\160\231\137\169\231\154\132\229\163\171\229\133\181",
            pos = {x = 321.8045454545455, y = 319.0272727272729},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1580148,
                1580149,
                1580150
              }
            }
          },
          ["17339943404071663"] = {
            key = "17339943404071663",
            type = "SendMessageNode",
            name = "\233\148\129\228\189\143\229\174\160\231\137\169",
            pos = {x = -253.2954545454545, y = 299.4427899686522},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LockPet",
              UnitId = -1
            }
          },
          ["17339943404071664"] = {
            key = "17339943404071664",
            type = "SendMessageNode",
            name = "\232\167\163\233\148\129\229\174\160\231\137\169",
            pos = {x = 3283.359090909091, y = 675.5409090909093},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "UnlockPet",
              UnitId = -1
            }
          },
          ["17339943404071665"] = {
            key = "17339943404071665",
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
          ["17339943404071666"] = {
            key = "17339943404071666",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\229\163\171\229\133\181\229\188\128\232\189\166",
            pos = {x = 3039.401019594442, y = 438.4408122579173},
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
          ["17339943404071667"] = {
            key = "17339943404071667",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 853.5101105035326, y = 276.5226304397353},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580159}
            }
          },
          ["17339943404071668"] = {
            key = "17339943404071668",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\148\129\229\174\154\231\137\185\230\149\136",
            pos = {x = 11.517516078618087, y = 501.3550387390242},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580133}
            }
          },
          ["17339943404071669"] = {
            key = "17339943404071669",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 3046.959474120576, y = 151.3435002774856},
            propsData = {
              StaticCreatorIdList = {1580133},
              ManualItemIdList = {},
              StateId = 780341,
              QuestId = 0
            }
          },
          ["1733994618493678686"] = {
            key = "1733994618493678686",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1147.8289473684217, y = 278.7523923444974},
            propsData = {WaitTime = 3}
          },
          ["1733994636337679109"] = {
            key = "1733994636337679109",
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
              StaticCreatorIdList = {1580159}
            }
          },
          ["1733994662774679869"] = {
            key = "1733994662774679869",
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
                1580151,
                1580152,
                1580153,
                1580154
              }
            }
          },
          ["1733994662774679870"] = {
            key = "1733994662774679870",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1729.3633658008662, y = 275.6273923444975},
            propsData = {WaitTime = 3}
          },
          ["1733994662774679871"] = {
            key = "1733994662774679871",
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
                1580151,
                1580152,
                1580153,
                1580154
              }
            }
          },
          ["1733994668134680065"] = {
            key = "1733994668134680065",
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
                1580155,
                1580156,
                1580157,
                1580158
              }
            }
          },
          ["1733994668134680067"] = {
            key = "1733994668134680067",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2344.590638528139, y = 269.49102870813397},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1580155,
                1580156,
                1580157,
                1580158
              }
            }
          },
          ["1733994754698681154"] = {
            key = "1733994754698681154",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2731.578947368422, y = 396.5933014354066},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17404719565134684547"] = {
            key = "17404719565134684547",
            type = "SendMessageNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -778.248875562219, y = -9.24437781109458},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "CreatePet",
              UnitId = -1
            }
          },
          ["17404719792654684892"] = {
            key = "17404719792654684892",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -519.0434782608695, y = 294.1739130434782},
            propsData = {WaitTime = 1}
          },
          ["17440177684231505"] = {
            key = "17440177684231505",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -817.5810344827585, y = 289.54137931034484},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580129}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
