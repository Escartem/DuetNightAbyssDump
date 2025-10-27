return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17334684424571",
      startPort = "StoryStart",
      endStory = "1733468608304149",
      endPort = "In"
    },
    {
      startStory = "1733468608304149",
      startPort = "Success",
      endStory = "17334684424575",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17334684424571"] = {
      isStoryNode = true,
      key = "17334684424571",
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
    ["17334684424575"] = {
      isStoryNode = true,
      key = "17334684424575",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1800, y = 304.59999999999997},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1733468608304149"] = {
      isStoryNode = true,
      key = "1733468608304149",
      type = "StoryNode",
      name = "\230\178\191\232\183\175\230\184\133\230\137\171",
      pos = {x = 1286.3815789473686, y = 303.33552631578954},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_FortYanluqingsao_Des",
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
            startQuest = "1733468608304150",
            startPort = "QuestStart",
            endQuest = "1733468702751637600",
            endPort = "In"
          },
          {
            startQuest = "1733468608304150",
            startPort = "QuestStart",
            endQuest = "1733468730434637974",
            endPort = "In"
          },
          {
            startQuest = "1733468702751637600",
            startPort = "Out",
            endQuest = "1733468757517638301",
            endPort = "In"
          },
          {
            startQuest = "1733468954018638926",
            startPort = "Out",
            endQuest = "1733468954018638927",
            endPort = "In"
          },
          {
            startQuest = "1733468955532638998",
            startPort = "Out",
            endQuest = "1733468955532638999",
            endPort = "In"
          },
          {
            startQuest = "1733469002487640651",
            startPort = "Out",
            endQuest = "1733468608304157",
            endPort = "Success"
          },
          {
            startQuest = "1733468981456639909",
            startPort = "Out",
            endQuest = "1733468981456639910",
            endPort = "In"
          },
          {
            startQuest = "17334739246391958",
            startPort = "Out",
            endQuest = "1733469002487640651",
            endPort = "In"
          },
          {
            startQuest = "1733468981456639910",
            startPort = "Out",
            endQuest = "1733468994422640427",
            endPort = "In"
          },
          {
            startQuest = "1733468994422640427",
            startPort = "Out",
            endQuest = "1733482579748639",
            endPort = "In"
          },
          {
            startQuest = "1733482579748639",
            startPort = "Out",
            endQuest = "17334739246391958",
            endPort = "In"
          },
          {
            startQuest = "1733468757517638301",
            startPort = "Out",
            endQuest = "1733468954018638926",
            endPort = "In"
          },
          {
            startQuest = "1733468954018638927",
            startPort = "Out",
            endQuest = "1733468955532638998",
            endPort = "In"
          },
          {
            startQuest = "1733468955532638999",
            startPort = "Out",
            endQuest = "1733473884441832",
            endPort = "In"
          },
          {
            startQuest = "1733468955532638999",
            startPort = "Out",
            endQuest = "1733468981456639909",
            endPort = "In"
          }
        },
        nodeData = {
          ["1733468608304150"] = {
            key = "1733468608304150",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1733468608304157"] = {
            key = "1733468608304157",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3776.6062801932367, y = 486.63647342995176},
            propsData = {ModeType = 0}
          },
          ["1733468608304164"] = {
            key = "1733468608304164",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3162.5, y = 696.25},
            propsData = {}
          },
          ["1733468702751637600"] = {
            key = "1733468702751637600",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189\231\190\1641",
            pos = {x = 1169.3013493253375, y = 270.4647676161919},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640424, 1640425}
            }
          },
          ["1733468730434637974"] = {
            key = "1733468730434637974",
            type = "TalkNode",
            name = "\231\156\139\229\136\176\231\167\189\229\133\189\231\190\164\229\188\128\232\189\166",
            pos = {x = 1161.63928035982, y = 81.62645343994663},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003801,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733468757517638301"] = {
            key = "1733468757517638301",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1554.7427286356824, y = 265.76438447442933},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1640424, 1640425}
            }
          },
          ["1733468954018638926"] = {
            key = "1733468954018638926",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189\231\190\1641",
            pos = {x = 1169.548275862069, y = 482.47739463601533},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640426,
                1640427,
                1640428,
                1640429,
                1640430,
                1640431
              }
            }
          },
          ["1733468954018638927"] = {
            key = "1733468954018638927",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1554.989655172414, y = 477.77701149425275},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640426,
                1640427,
                1640428,
                1640429,
                1640430,
                1640431
              }
            }
          },
          ["1733468955532638998"] = {
            key = "1733468955532638998",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189\231\190\1641",
            pos = {x = 1171.5406130268198, y = 713.1670498084292},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640432,
                1640433,
                1640434
              }
            }
          },
          ["1733468955532638999"] = {
            key = "1733468955532638999",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1558.0931034482758, y = 708.4666666666666},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640432,
                1640433,
                1640434
              }
            }
          },
          ["1733468981456639909"] = {
            key = "1733468981456639909",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189\231\190\1641",
            pos = {x = 2298.8652405482235, y = 484.3765435048043},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640435,
                1640436,
                1640437,
                1640438,
                1640439,
                1640440
              }
            }
          },
          ["1733468981456639910"] = {
            key = "1733468981456639910",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2521.003479761951, y = 447.55287905497767},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640435,
                1640436,
                1640437,
                1640438,
                1640439,
                1640440
              }
            }
          },
          ["1733468994422640427"] = {
            key = "1733468994422640427",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189\231\190\1641",
            pos = {x = 2825.7200810766785, y = 449.5653708859854},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640441,
                1640442,
                1640443,
                1640444,
                1640445,
                1640446,
                1640447,
                1640448
              }
            }
          },
          ["1733469002487640651"] = {
            key = "1733469002487640651",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3358.2786095047713, y = 491.3955455422469},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1733473884441832"] = {
            key = "1733473884441832",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\228\184\128\229\141\138\229\188\128\232\189\166",
            pos = {x = 2354.634271099744, y = 178.8407928388748},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003802,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17334739246391958"] = {
            key = "17334739246391958",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\174\140\230\136\144\229\188\128\232\189\166",
            pos = {x = 3220.704505213457, y = 317.15182962817244},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003803,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733482579748639"] = {
            key = "1733482579748639",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3062.8811188811187, y = 486.04195804195786},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 8,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640441,
                1640442,
                1640443,
                1640444,
                1640445,
                1640446,
                1640447,
                1640448
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
