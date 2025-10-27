return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1753253151804594094",
      startPort = "StoryStart",
      endStory = "1753253151804594096",
      endPort = "In"
    },
    {
      startStory = "1753253151804594096",
      startPort = "Success",
      endStory = "1753253151804594095",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1753253151804594094"] = {
      isStoryNode = true,
      key = "1753253151804594094",
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
    ["1753253151804594095"] = {
      isStoryNode = true,
      key = "1753253151804594095",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1446.5384615384612, y = 302.66578249336874},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1753253151804594096"] = {
      isStoryNode = true,
      key = "1753253151804594096",
      type = "StoryNode",
      name = "\231\172\172\228\184\128\230\136\152",
      pos = {x = 1102.4137931034484, y = 288.62068965517244},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_14",
        QuestDeatil = "Content_120102_14",
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
            startQuest = "1753253151805594097",
            startPort = "QuestStart",
            endQuest = "1753253151805594100",
            endPort = "In"
          },
          {
            startQuest = "1753253151805594100",
            startPort = "Out",
            endQuest = "1753253151805594099",
            endPort = "Fail"
          },
          {
            startQuest = "17532526907392650",
            startPort = "Out",
            endQuest = "17532555191312941018",
            endPort = "In"
          },
          {
            startQuest = "17532555191312941018",
            startPort = "Out",
            endQuest = "17532561421092941368",
            endPort = "In"
          },
          {
            startQuest = "1753253151805594097",
            startPort = "QuestStart",
            endQuest = "17532526907392649",
            endPort = "In"
          },
          {
            startQuest = "17532526907392649",
            startPort = "Out",
            endQuest = "17532526907392650",
            endPort = "In"
          },
          {
            startQuest = "17532561421092941368",
            startPort = "Out",
            endQuest = "17532617117861109",
            endPort = "In"
          },
          {
            startQuest = "17532617117861109",
            startPort = "Out",
            endQuest = "17532562666033589816",
            endPort = "In"
          },
          {
            startQuest = "17532526907392650",
            startPort = "Out",
            endQuest = "17536768431961375",
            endPort = "In"
          }
        },
        nodeData = {
          ["17532526907392649"] = {
            key = "17532526907392649",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4227.837857950878, y = 463.48544350378717},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040004,
                2040005,
                2040006,
                2040007,
                2040080
              }
            }
          },
          ["17532526907392650"] = {
            key = "17532526907392650",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 4229.501185244452, y = 639.2220582623613},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2040004,
                2040005,
                2040006,
                2040007
              }
            }
          },
          ["1753253151805594097"] = {
            key = "1753253151805594097",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3523.231005750356, y = 826.1651978912043},
            propsData = {ModeType = 0}
          },
          ["1753253151805594098"] = {
            key = "1753253151805594098",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5400.655286252576, y = 1038.3242115719804},
            propsData = {ModeType = 0}
          },
          ["1753253151805594099"] = {
            key = "1753253151805594099",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4359.019566170811, y = 952.1857122749408},
            propsData = {}
          },
          ["1753253151805594100"] = {
            key = "1753253151805594100",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 4005.9813002550422, y = 927.7901099035132},
            propsData = {}
          },
          ["1753253151805594101"] = {
            key = "1753253151805594101",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 4123.91421341816, y = 1158.8948393711553},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01CavSQCreateMonster",
              UnitId = -1
            }
          },
          ["1753253151805594102"] = {
            key = "1753253151805594102",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 4448.902877385771, y = 1152.79567970729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01CavSQDestoryMonster",
              UnitId = -1
            }
          },
          ["17532555191312941018"] = {
            key = "17532555191312941018",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4659.18567774936, y = 452.3058823529413},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040078,
                2040079,
                2040087,
                2040088,
                2040089,
                2040090,
                2040091,
                2040092
              }
            }
          },
          ["17532555206692941087"] = {
            key = "17532555206692941087",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4986.735294117647, y = 435.6470588235294},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040004,
                2040005,
                2040006,
                2040007
              }
            }
          },
          ["17532561421092941368"] = {
            key = "17532561421092941368",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 4667.3117647058825, y = 628.4851662404092},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 8,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2040078,
                2040079,
                2040087,
                2040088,
                2040089,
                2040090,
                2040091,
                2040092
              }
            }
          },
          ["17532562666033589816"] = {
            key = "17532562666033589816",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 5474.4367647058825, y = 696.9882352941178},
            propsData = {}
          },
          ["17532570910525858484"] = {
            key = "17532570910525858484",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 3715.5014302059503, y = 539.5243915123779},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 0,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17532617117861109"] = {
            key = "17532617117861109",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4992.779411764706, y = 651.2941176470588},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2040080}
            }
          },
          ["17536768431961375"] = {
            key = "17536768431961375",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\136\152\230\150\151\229\137\141",
            pos = {x = 4549.8823529411775, y = 140},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
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
