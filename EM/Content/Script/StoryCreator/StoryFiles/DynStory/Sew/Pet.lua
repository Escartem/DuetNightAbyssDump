return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17364774505761410",
      startPort = "StoryStart",
      endStory = "1736505932733239572",
      endPort = "In"
    },
    {
      startStory = "1736505932733239572",
      startPort = "Success",
      endStory = "17364774505761413",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17364774505761410"] = {
      isStoryNode = true,
      key = "17364774505761410",
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
    ["17364774505761413"] = {
      isStoryNode = true,
      key = "17364774505761413",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1547.5824175824175, y = 287.96703296703294},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1736505932733239572"] = {
      isStoryNode = true,
      key = "1736505932733239572",
      type = "StoryNode",
      name = "\233\173\148\231\129\181",
      pos = {x = 1139.769230769231, y = 289.7692307692307},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_SewPet_Des",
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
            startQuest = "1736505932733239582",
            startPort = "Out",
            endQuest = "1736505932733239578",
            endPort = "Success"
          },
          {
            startQuest = "1736505932733239583",
            startPort = "Out",
            endQuest = "1736505932733239584",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239585",
            startPort = "Out",
            endQuest = "1736505932733239583",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239585",
            startPort = "Out",
            endQuest = "1736505932733239581",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239584",
            startPort = "Out",
            endQuest = "1736505932733239587",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239589",
            startPort = "Out",
            endQuest = "1736505932733239580",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239585",
            startPort = "Out",
            endQuest = "1736505932733239590",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239580",
            startPort = "Out",
            endQuest = "1736505932733239591",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239584",
            startPort = "Out",
            endQuest = "1736505932733239592",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239592",
            startPort = "Out",
            endQuest = "1736505932733239589",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239577",
            startPort = "QuestStart",
            endQuest = "17440183950454200796",
            endPort = "In"
          },
          {
            startQuest = "17440183950454200796",
            startPort = "Out",
            endQuest = "17440184099364201047",
            endPort = "In"
          },
          {
            startQuest = "17440184099364201047",
            startPort = "Out",
            endQuest = "1736505932733239585",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239580",
            startPort = "Out",
            endQuest = "1736505932733239588",
            endPort = "In"
          },
          {
            startQuest = "1736505932733239588",
            startPort = "Out",
            endQuest = "1736505932733239582",
            endPort = "In"
          }
        },
        nodeData = {
          ["1736505932733239577"] = {
            key = "1736505932733239577",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -370.25000000000006, y = 279},
            propsData = {ModeType = 0}
          },
          ["1736505932733239578"] = {
            key = "1736505932733239578",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3058.5714285714284, y = 301.42857142857144},
            propsData = {ModeType = 0}
          },
          ["1736505932733239579"] = {
            key = "1736505932733239579",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1736505932733239580"] = {
            key = "1736505932733239580",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\231\167\189\229\133\189",
            pos = {x = 1859.4999999999993, y = 271.43636363636375},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720454,
                1720455,
                1720456,
                1720457,
                1720458,
                1720459
              }
            }
          },
          ["1736505932733239581"] = {
            key = "1736505932733239581",
            type = "TalkNode",
            name = "\232\167\163\230\149\145\229\174\160\231\137\169\229\188\128\232\189\166",
            pos = {x = 697.4086080586077, y = 48.30811965811986},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004401,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1736505932733239582"] = {
            key = "1736505932733239582",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2744.316883116883, y = 286.5714285714287},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1736505932733239583"] = {
            key = "1736505932733239583",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 702.4545454545455, y = 276.5681818181819},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720451,
                1720452,
                1720453
              }
            }
          },
          ["1736505932733239584"] = {
            key = "1736505932733239584",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\155\180\231\187\149\231\157\128\229\174\160\231\137\169\231\154\132\231\167\189\229\133\189",
            pos = {x = 999.4538961038962, y = 272.8779220779222},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720451,
                1720452,
                1720453
              }
            }
          },
          ["1736505932733239585"] = {
            key = "1736505932733239585",
            type = "SendMessageNode",
            name = "\233\148\129\228\189\143\229\174\160\231\137\169",
            pos = {x = 433.7045454545455, y = 274.9772727272729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LockPet",
              UnitId = -1
            }
          },
          ["1736505932733239586"] = {
            key = "1736505932733239586",
            type = "SendMessageNode",
            name = "\232\167\163\233\148\129\229\174\160\231\137\169",
            pos = {x = 2413.2616883116884, y = 422.0058441558443},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "UnlockPet",
              UnitId = -1
            }
          },
          ["1736505932733239587"] = {
            key = "1736505932733239587",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\231\167\189\229\133\189\229\188\128\232\189\166",
            pos = {x = 1286.4727215766695, y = -44.5552916381867},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004402,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1736505932733239588"] = {
            key = "1736505932733239588",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\136\157\229\167\139\229\163\171\229\133\181\229\188\128\232\189\166",
            pos = {x = 2131.3698507632735, y = 275.85379927090435},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004403,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1736505932733239589"] = {
            key = "1736505932733239589",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 1578.0101105035326, y = 275.66548758259245},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720454,
                1720455,
                1720456,
                1720457,
                1720458,
                1720459
              }
            }
          },
          ["1736505932733239590"] = {
            key = "1736505932733239590",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\148\129\229\174\154\231\137\185\230\149\136",
            pos = {x = 690.3356978968, y = 451.30958419356966},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720450}
            }
          },
          ["1736505932733239591"] = {
            key = "1736505932733239591",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 2120.7356978968, y = 26.50958419356948},
            propsData = {
              StaticCreatorIdList = {1720450},
              ManualItemIdList = {},
              StateId = 780341,
              QuestId = 0
            }
          },
          ["1736505932733239592"] = {
            key = "1736505932733239592",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1307.6846705846704, y = 271.62100482100465},
            propsData = {WaitTime = 3}
          },
          ["17440183950454200796"] = {
            key = "17440183950454200796",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\174\160\231\137\169",
            pos = {x = -100.88157894736833, y = 288.1842105263157},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720449}
            }
          },
          ["17440184099364201047"] = {
            key = "17440184099364201047",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 184.11842105263156, y = 274.4342105263156},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
