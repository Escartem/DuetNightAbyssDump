return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17331371451611",
      startPort = "StoryStart",
      endStory = "1733137204053211535",
      endPort = "In"
    },
    {
      startStory = "1733137204053211535",
      startPort = "Success",
      endStory = "17331371451615",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17331371451611"] = {
      isStoryNode = true,
      key = "17331371451611",
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
    ["17331371451615"] = {
      isStoryNode = true,
      key = "17331371451615",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1532.888888888889, y = 297.55555555555554},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1733137204053211535"] = {
      isStoryNode = true,
      key = "1733137204053211535",
      type = "StoryNode",
      name = "\232\182\129\231\129\171\230\137\147\229\138\171",
      pos = {x = 1196, y = 300.2857142857143},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityChenhuodajie_Des",
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
            startQuest = "1733137204053211536",
            startPort = "QuestStart",
            endQuest = "1733137277993212998",
            endPort = "In"
          },
          {
            startQuest = "1733137364941213516",
            startPort = "Out",
            endQuest = "1733137426480214138",
            endPort = "In"
          },
          {
            startQuest = "1733137426480214138",
            startPort = "Out",
            endQuest = "1733137457523214503",
            endPort = "In"
          },
          {
            startQuest = "1733137457523214503",
            startPort = "Out",
            endQuest = "1733137502490215111",
            endPort = "In"
          },
          {
            startQuest = "1733137524857215575",
            startPort = "Out",
            endQuest = "1733137204053211539",
            endPort = "Success"
          },
          {
            startQuest = "1733137502490215111",
            startPort = "Option_2",
            endQuest = "1733137532592215812",
            endPort = "In"
          },
          {
            startQuest = "1733137532592215812",
            startPort = "Out",
            endQuest = "1733137204053211539",
            endPort = "Success"
          },
          {
            startQuest = "1733137502490215111",
            startPort = "Option_1",
            endQuest = "1733137524857215575",
            endPort = "In"
          },
          {
            startQuest = "1733137277993212998",
            startPort = "Out",
            endQuest = "17333081322503774258",
            endPort = "In"
          },
          {
            startQuest = "17333081322503774258",
            startPort = "Out",
            endQuest = "1733137364941213516",
            endPort = "In"
          },
          {
            startQuest = "1733137204053211536",
            startPort = "QuestStart",
            endQuest = "1733137261166212656",
            endPort = "In"
          },
          {
            startQuest = "1733137364941213516",
            startPort = "Out",
            endQuest = "1740382667651522885",
            endPort = "In"
          },
          {
            startQuest = "1740382667651522885",
            startPort = "Out",
            endQuest = "17331391356532740157",
            endPort = "In"
          }
        },
        nodeData = {
          ["1733137204053211536"] = {
            key = "1733137204053211536",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1733137204053211539"] = {
            key = "1733137204053211539",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3697.3913043478265, y = 316.52173913043475},
            propsData = {ModeType = 0}
          },
          ["1733137204053211542"] = {
            key = "1733137204053211542",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3675.217391304348, y = 612.608695652174},
            propsData = {}
          },
          ["1733137261166212656"] = {
            key = "1733137261166212656",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1182.2946868158538, y = 84.1248154972412},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003501,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733137277993212998"] = {
            key = "1733137277993212998",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1139.9577302941148, y = 287.9166215173082},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1190869},
              QuestPickupId = -1,
              UnitId = 80021,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1733137364941213516"] = {
            key = "1733137364941213516",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\230\183\183\230\183\183",
            pos = {x = 1706.9142520332452, y = 289.6682937581108},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190864,
                1190865,
                1190866,
                1190867,
                1190868
              }
            }
          },
          ["1733137426480214138"] = {
            key = "1733137426480214138",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 2039.5772955115062, y = 299.8856850624587},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1190864,
                1190865,
                1190866,
                1190867,
                1190868
              }
            }
          },
          ["1733137457523214503"] = {
            key = "1733137457523214503",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144NPC",
            pos = {x = 2342.1859911636807, y = 312.92916332332817},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190870,
                1190871,
                1190872,
                1190873
              }
            }
          },
          ["1733137502490215111"] = {
            key = "1733137502490215111",
            type = "TalkNode",
            name = "\228\184\142\230\183\183\230\183\183\229\175\185\232\175\157",
            pos = {x = 2635.6642520332457, y = 265.9726415841979},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818028,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190870",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71003504,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
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
              NormalOptions = {
                {
                  OptionText = "710035041",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                },
                {
                  OptionText = "710035042",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1733137524857215575"] = {
            key = "1733137524857215575",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3147.776053275482, y = 160.3748154972413},
            propsData = {
              DialogueId = 710035041,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1733137532592215812"] = {
            key = "1733137532592215812",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3145.1984135239286, y = 448.6667409630798},
            propsData = {
              DialogueId = 710035042,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17331391356532740157"] = {
            key = "17331391356532740157",
            type = "TalkNode",
            name = "\230\183\183\230\183\183\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 2193.653382468028, y = 93.20090245376312},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003502,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17333081322503774258"] = {
            key = "17333081322503774258",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1397.5, y = 305.5},
            propsData = {WaitTime = 1}
          },
          ["1740382667651522885"] = {
            key = "1740382667651522885",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1919.9970355731225, y = 118.69318181818187},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
