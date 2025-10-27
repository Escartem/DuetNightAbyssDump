return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17316513918828349589",
      startPort = "StoryStart",
      endStory = "17316513946438349683",
      endPort = "In"
    },
    {
      startStory = "17316513946438349683",
      startPort = "Success",
      endStory = "17316513918828349592",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17316513918828349589"] = {
      isStoryNode = true,
      key = "17316513918828349589",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1096, y = 336},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17316513918828349592"] = {
      isStoryNode = true,
      key = "17316513918828349592",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1734, y = 354},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17316513946438349683"] = {
      isStoryNode = true,
      key = "17316513946438349683",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1440, y = 339.0877192982456},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030502",
        QuestDeatil = "Content_110107_2",
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
            startQuest = "1731651506926256",
            startPort = "Out",
            endQuest = "17316514006538349958",
            endPort = "In"
          },
          {
            startQuest = "17316513946448349684",
            startPort = "QuestStart",
            endQuest = "1731651553626204428",
            endPort = "In"
          },
          {
            startQuest = "17316514006538349958",
            startPort = "Out",
            endQuest = "1736421550448707001",
            endPort = "In"
          },
          {
            startQuest = "1736421550448707001",
            startPort = "Out",
            endQuest = "17316514006538349960",
            endPort = "In"
          },
          {
            startQuest = "17316514006538349960",
            startPort = "Out",
            endQuest = "1736421550846707015",
            endPort = "In"
          },
          {
            startQuest = "1736421550846707015",
            startPort = "Out",
            endQuest = "1736421608879707899",
            endPort = "In"
          },
          {
            startQuest = "1736421608879707899",
            startPort = "Out",
            endQuest = "17316514006538349959",
            endPort = "In"
          },
          {
            startQuest = "17316514006538349959",
            startPort = "Out",
            endQuest = "1736421644685708257",
            endPort = "In"
          },
          {
            startQuest = "1731651553626204428",
            startPort = "Out",
            endQuest = "1739256955862807",
            endPort = "In"
          },
          {
            startQuest = "17316513946448349684",
            startPort = "QuestStart",
            endQuest = "1731651506926256",
            endPort = "In"
          },
          {
            startQuest = "1731651506926256",
            startPort = "Out",
            endQuest = "17364993247245449",
            endPort = "In"
          },
          {
            startQuest = "1736421644685708257",
            startPort = "Out",
            endQuest = "174226749963721619792",
            endPort = "In"
          },
          {
            startQuest = "174226749963721619792",
            startPort = "Out",
            endQuest = "17316514006538349961",
            endPort = "In"
          },
          {
            startQuest = "174226749963721619792",
            startPort = "Out",
            endQuest = "1731651506926257",
            endPort = "In"
          },
          {
            startQuest = "1731651506926257",
            startPort = "Out",
            endQuest = "1731651563154204777",
            endPort = "In"
          },
          {
            startQuest = "1739256955862807",
            startPort = "Out",
            endQuest = "1747039043670571921",
            endPort = "In"
          },
          {
            startQuest = "1747039043670571921",
            startPort = "Out",
            endQuest = "1747039043670571922",
            endPort = "In"
          },
          {
            startQuest = "1747039043670571922",
            startPort = "Out",
            endQuest = "1747039043670571923",
            endPort = "In"
          },
          {
            startQuest = "1747039043670571923",
            startPort = "Out",
            endQuest = "17316513946448349690",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17316513946448349684"] = {
            key = "17316513946448349684",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 227.62896825396814, y = 143.48214285714283},
            propsData = {ModeType = 0}
          },
          ["17316513946448349687"] = {
            key = "17316513946448349687",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3317.0325623210924, y = 608.8786638796064},
            propsData = {ModeType = 0}
          },
          ["17316513946448349690"] = {
            key = "17316513946448349690",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1578.0935986056952, y = 909.747273425499},
            propsData = {}
          },
          ["17316514006538349958"] = {
            key = "17316514006538349958",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1042.4562296441868, y = 157.74540766577547},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineUpBattleStart",
              UnitId = -1
            }
          },
          ["17316514006538349959"] = {
            key = "17316514006538349959",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\1693",
            pos = {x = 1320.9406167304285, y = 546.9367251099594},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640295,
                1640306,
                1640307,
                1640308,
                1640309,
                1640310
              }
            }
          },
          ["17316514006538349960"] = {
            key = "17316514006538349960",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1555.947170882275, y = 164.66041221782885},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640301,
                1640302,
                1640303,
                1640304,
                1640305,
                1640240
              }
            }
          },
          ["17316514006538349961"] = {
            key = "17316514006538349961",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175 - gamemode\230\184\133\230\128\170",
            pos = {x = 2243.6855366271798, y = 60.64857564559907},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineUpBattleEnd",
              UnitId = -1
            }
          },
          ["1731651506926256"] = {
            key = "1731651506926256",
            type = "TalkNode",
            name = "\233\148\129\233\151\168",
            pos = {x = 798.7638621773874, y = 149.10964912280704},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/AssetDesign/Story/Sequence/1101EX01/Maifu.Maifu'",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = false,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              OverrideFailBlend = false
            }
          },
          ["1731651506926257"] = {
            key = "1731651506926257",
            type = "TalkNode",
            name = "\229\188\128\233\151\168",
            pos = {x = 2179.806494754168, y = 572.3093008491682},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/AssetDesign/Story/Sequence/1101EX01/Maifu_End.Maifu_End'",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = false,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              OverrideFailBlend = false
            }
          },
          ["1731651553626204428"] = {
            key = "1731651553626204428",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 577.86392942806, y = 890.0226107226108},
            propsData = {}
          },
          ["1731651563154204777"] = {
            key = "1731651563154204777",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2759.798318367743, y = 578.4413153933011},
            propsData = {}
          },
          ["1736421550448707001"] = {
            key = "1736421550448707001",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\1691",
            pos = {x = 1298.1775305895449, y = 167.27992213570636},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640301,
                1640302,
                1640303,
                1640304,
                1640305,
                1640240
              }
            }
          },
          ["1736421550846707015"] = {
            key = "1736421550846707015",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\1692",
            pos = {x = 1297.325917686319, y = 336.3250834260289},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640294,
                1640296,
                1640297,
                1640298,
                1640299,
                1640300
              }
            }
          },
          ["1736421608879707899"] = {
            key = "1736421608879707899",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1566.6404338153511, y = 347.93798665183544},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640294,
                1640296,
                1640297,
                1640298,
                1640299,
                1640300
              }
            }
          },
          ["1736421644685708257"] = {
            key = "1736421644685708257",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1576.7019188199101, y = 541.8530042717866},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640295,
                1640306,
                1640307,
                1640308,
                1640309,
                1640310
              }
            }
          },
          ["17364993247245449"] = {
            key = "17364993247245449",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1023.2605049043028, y = -33.685991798812466},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018207,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1739256955862807"] = {
            key = "1739256955862807",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 910.6563725490194, y = 894.3547619047617},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineUpBattleEnd",
              UnitId = -1
            }
          },
          ["174226749963721619792"] = {
            key = "174226749963721619792",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1955.120943849154, y = 416.7143519326915},
            propsData = {WaitTime = 5}
          },
          ["1747039043670571921"] = {
            key = "1747039043670571921",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\1691",
            pos = {x = 1247.2021721390793, y = 843.7516602136254},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640301,
                1640302,
                1640303,
                1640304,
                1640305,
                1640240
              }
            }
          },
          ["1747039043670571922"] = {
            key = "1747039043670571922",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\1692",
            pos = {x = 1244.921987807282, y = 1012.796821503948},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640294,
                1640296,
                1640297,
                1640298,
                1640299,
                1640300
              }
            }
          },
          ["1747039043670571923"] = {
            key = "1747039043670571923",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\1693",
            pos = {x = 1268.5366868513916, y = 1223.4084631878786},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640295,
                1640306,
                1640307,
                1640308,
                1640309,
                1640310
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
