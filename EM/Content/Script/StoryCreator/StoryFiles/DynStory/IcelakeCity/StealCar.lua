return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17188720248314094",
      startPort = "StoryStart",
      endStory = "17188725123469119",
      endPort = "In"
    },
    {
      startStory = "17188725123469119",
      startPort = "Success",
      endStory = "17188720248314097",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17188720248314094"] = {
      isStoryNode = true,
      key = "17188720248314094",
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
    ["17188720248314097"] = {
      isStoryNode = true,
      key = "17188720248314097",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1613.452380952381, y = 310.4761904761905},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17188725123469119"] = {
      isStoryNode = true,
      key = "17188725123469119",
      type = "StoryNode",
      name = "\229\129\183\232\189\166",
      pos = {x = 1123.0442342398762, y = 296.66182938089014},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityStealCar_Des",
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
            startQuest = "17188725123469120",
            startPort = "QuestStart",
            endQuest = "171887267520212287",
            endPort = "In"
          },
          {
            startQuest = "171887393903425682",
            startPort = "Out",
            endQuest = "171887415058628984",
            endPort = "In"
          },
          {
            startQuest = "171887415058628984",
            startPort = "Out",
            endQuest = "171887418252329993",
            endPort = "In"
          },
          {
            startQuest = "171887280913814460",
            startPort = "Option_1",
            endQuest = "171887393903425682",
            endPort = "In"
          },
          {
            startQuest = "171887393903425682",
            startPort = "Out",
            endQuest = "17213855146685809",
            endPort = "In"
          },
          {
            startQuest = "171887393903425682",
            startPort = "Out",
            endQuest = "171887404036226605",
            endPort = "In"
          },
          {
            startQuest = "1718877303907131048",
            startPort = "Out",
            endQuest = "171887280913814460",
            endPort = "In"
          },
          {
            startQuest = "17188725123469120",
            startPort = "QuestStart",
            endQuest = "17217161960701030",
            endPort = "In"
          },
          {
            startQuest = "171887404036226605",
            startPort = "Out",
            endQuest = "17217164209203383",
            endPort = "In"
          },
          {
            startQuest = "17217164209203383",
            startPort = "Out",
            endQuest = "171887409314627603",
            endPort = "In"
          },
          {
            startQuest = "17219796749773662",
            startPort = "Out",
            endQuest = "17219796749773660",
            endPort = "In"
          },
          {
            startQuest = "171887280913814460",
            startPort = "Option_2",
            endQuest = "17219796749773663",
            endPort = "In"
          },
          {
            startQuest = "171887280913814460",
            startPort = "Option_2",
            endQuest = "17219796749773662",
            endPort = "In"
          },
          {
            startQuest = "171887409314627603",
            startPort = "Out",
            endQuest = "17188725123469123",
            endPort = "Success"
          },
          {
            startQuest = "17219796749773660",
            startPort = "Out",
            endQuest = "17188725123469123",
            endPort = "Success"
          },
          {
            startQuest = "171887267520212287",
            startPort = "Out",
            endQuest = "1723544054036840",
            endPort = "In"
          },
          {
            startQuest = "1723544054036840",
            startPort = "Out",
            endQuest = "1718877303907131048",
            endPort = "In"
          }
        },
        nodeData = {
          ["17188725123469120"] = {
            key = "17188725123469120",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 376.4448051948051, y = 286.1363636363636},
            propsData = {ModeType = 0}
          },
          ["17188725123469123"] = {
            key = "17188725123469123",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3369.085497835498, y = 160.06493506493513},
            propsData = {ModeType = 0}
          },
          ["17188725123469126"] = {
            key = "17188725123469126",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3436.194083694084, y = 474.28210678210684},
            propsData = {}
          },
          ["171887267520212287"] = {
            key = "171887267520212287",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\177\189\232\189\166",
            pos = {x = 658.7617667074087, y = 288.00467075004724},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190548, 1190712}
            }
          },
          ["171887280913814460"] = {
            key = "171887280913814460",
            type = "TalkNode",
            name = "\229\143\145\231\142\176\230\177\189\232\189\166\233\128\137\230\139\169\230\152\175\229\144\166\229\129\183\232\189\166",
            pos = {x = 1447.969583718773, y = 216.8651273415108},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001002,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {
                {
                  OptionText = "710010020",
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "710010021",
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["171887393903425682"] = {
            key = "171887393903425682",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1761.954080133129, y = 164.89325862946015},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190543,
                1190544,
                1190545
              }
            }
          },
          ["171887404036226605"] = {
            key = "171887404036226605",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\140\135\229\174\154id\231\154\132\230\128\170\231\137\169",
            pos = {x = 2158.1609766848524, y = 115.53365271812994},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1190543,
                1190544,
                1190545
              }
            }
          },
          ["171887409314627603"] = {
            key = "171887409314627603",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2860.9207169445926, y = 107.35183453631177},
            propsData = {
              DialogueId = 71001004,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["171887415058628984"] = {
            key = "171887415058628984",
            type = "MonitorPlayerStatusNode",
            name = "\231\155\145\229\144\172\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 2189.746287925337, y = 449.79585603205754},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["171887418252329993"] = {
            key = "171887418252329993",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2518.6748593539087, y = 462.6529988892004},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["1718877303907131048"] = {
            key = "1718877303907131048",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1166.8563722139575, y = 277.8591130231996},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190548,
              StateId = 780021,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17213855146685809"] = {
            key = "17213855146685809",
            type = "TalkNode",
            name = "\229\163\171\229\133\181\229\168\129\230\133\145\231\142\169\229\174\182",
            pos = {x = 2165.202324127776, y = -123.11479642115118},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001003,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17217161960701030"] = {
            key = "17217161960701030",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 674.3660186562665, y = 85.6687172476647},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001001,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17217164209203383"] = {
            key = "17217164209203383",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2485.3887459289926, y = 104.98689906584632},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001004,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17219796749773660"] = {
            key = "17219796749773660",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2488.4004211395154, y = 696.0601623198585},
            propsData = {
              DialogueId = 71001006,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 1
            }
          },
          ["17219796749773662"] = {
            key = "17219796749773662",
            type = "TalkNode",
            name = "\228\184\142\229\163\171\229\133\181\229\175\185\232\175\157",
            pos = {x = 1964.5849983260773, y = 683.301921762448},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818010,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190712",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001006,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17219796749773663"] = {
            key = "17219796749773663",
            type = "TalkNode",
            name = "\230\143\144\232\174\174\229\142\187\230\137\190\229\163\171\229\133\181",
            pos = {x = 1965.831082479283, y = 881.031411570885},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001005,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1723544054036840"] = {
            key = "1723544054036840",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 915.7777777777776, y = 278.5176767676768},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190548,
              StateId = 780020,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
