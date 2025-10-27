return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17169732630581",
      startPort = "StoryStart",
      endStory = "1716973276530132",
      endPort = "In"
    },
    {
      startStory = "1716973276530132",
      startPort = "Success",
      endStory = "17169732630585",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17169732630581"] = {
      isStoryNode = true,
      key = "17169732630581",
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
    ["17169732630585"] = {
      isStoryNode = true,
      key = "17169732630585",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2044, y = 268},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716973276530132"] = {
      isStoryNode = true,
      key = "1716973276530132",
      type = "StoryNode",
      name = "\228\191\174\231\144\134\230\157\130\232\141\137",
      pos = {x = 1434, y = 276},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_VillageGrass_Des",
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
            startQuest = "17169737849112259",
            startPort = "Out",
            endQuest = "17169737755952008",
            endPort = "In"
          },
          {
            startQuest = "1716973276530133",
            startPort = "QuestStart",
            endQuest = "1716973331678890",
            endPort = "In"
          },
          {
            startQuest = "17169737755952008",
            startPort = "Out",
            endQuest = "1716973276530139",
            endPort = "Success"
          },
          {
            startQuest = "1716973276530133",
            startPort = "QuestStart",
            endQuest = "1721805845277299",
            endPort = "In"
          },
          {
            startQuest = "1721805845277299",
            startPort = "Out",
            endQuest = "17235474840083327",
            endPort = "In"
          },
          {
            startQuest = "1721805845277299",
            startPort = "Out",
            endQuest = "17235474840083328",
            endPort = "In"
          },
          {
            startQuest = "1721805845277299",
            startPort = "Out",
            endQuest = "17235474840083329",
            endPort = "In"
          },
          {
            startQuest = "17235474840083327",
            startPort = "Out",
            endQuest = "1721805875269546",
            endPort = "In"
          },
          {
            startQuest = "17235474840083328",
            startPort = "Out",
            endQuest = "17218065197981791",
            endPort = "In"
          },
          {
            startQuest = "17235474840083329",
            startPort = "Out",
            endQuest = "17218065212791849",
            endPort = "In"
          },
          {
            startQuest = "1721805875269546",
            startPort = "Out",
            endQuest = "17285288279716932",
            endPort = "Input_1"
          },
          {
            startQuest = "17218065197981791",
            startPort = "Out",
            endQuest = "17285288279716932",
            endPort = "Input_2"
          },
          {
            startQuest = "17218065212791849",
            startPort = "Out",
            endQuest = "17285288279716932",
            endPort = "Input_3"
          },
          {
            startQuest = "17285288279716932",
            startPort = "Out",
            endQuest = "17169737849112259",
            endPort = "In"
          }
        },
        nodeData = {
          ["1716973276530133"] = {
            key = "1716973276530133",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 686.6666666666666, y = 286.6666666666667},
            propsData = {ModeType = 0}
          },
          ["1716973276530139"] = {
            key = "1716973276530139",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1716973276530145"] = {
            key = "1716973276530145",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1716973331678890"] = {
            key = "1716973331678890",
            type = "TalkNode",
            name = "\229\188\128\229\167\139\230\184\133\230\137\171\229\175\185\232\175\157",
            pos = {x = 1364.0588235294117, y = 81.72549019607844},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001201,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17169737755952008"] = {
            key = "17169737755952008",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2458.3725490196075, y = 498.3921568627451},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17169737849112259"] = {
            key = "17169737849112259",
            type = "TalkNode",
            name = "\229\174\140\230\136\144\229\175\185\232\175\157",
            pos = {x = 2194.647058823529, y = 488.392156862745},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001202,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1721805845277299"] = {
            key = "1721805845277299",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 891.3707664884134, y = 502.3101604278075},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1590200,
                1590201,
                1590202
              }
            }
          },
          ["1721805875269546"] = {
            key = "1721805875269546",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1417.4135472370765, y = 378.2994652406418},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1590200,
              StateId = 780051,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17218065197981791"] = {
            key = "17218065197981791",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1416.156862745098, y = 565.1176470588235},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1590201,
              StateId = 780051,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17218065212791849"] = {
            key = "17218065212791849",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1414.7932263814616, y = 739.4224598930482},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1590202,
              StateId = 780051,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17235474840083327"] = {
            key = "17235474840083327",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1175.1639153685187, y = 381.18949081608923},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1590200,
              StateId = 780050,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17235474840083328"] = {
            key = "17235474840083328",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1173.9072308765403, y = 568.007672634271},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1590201,
              StateId = 780050,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17235474840083329"] = {
            key = "17235474840083329",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1173.9072308765403, y = 740.9488491048593},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1590202,
              StateId = 780050,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17285288279716932"] = {
            key = "17285288279716932",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 1792.1100478468902, y = 485.4202082746973},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
