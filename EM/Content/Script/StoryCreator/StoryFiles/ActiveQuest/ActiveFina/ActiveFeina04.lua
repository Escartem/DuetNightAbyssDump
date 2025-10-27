return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17544762212711742418",
      startPort = "Success",
      endStory = "17544762212711742405",
      endPort = "StoryEnd"
    },
    {
      startStory = "17544762212711742422",
      startPort = "Success",
      endStory = "17544762212711742423",
      endPort = "In"
    },
    {
      startStory = "17544762212711742423",
      startPort = "Success",
      endStory = "17544762212711742424",
      endPort = "In"
    },
    {
      startStory = "17544762212711742424",
      startPort = "Success",
      endStory = "17544762212711742420",
      endPort = "In"
    },
    {
      startStory = "17544762212711742420",
      startPort = "Success",
      endStory = "17544762212711742425",
      endPort = "In"
    },
    {
      startStory = "17544762212711742427",
      startPort = "Success",
      endStory = "17544762212711742430",
      endPort = "In"
    },
    {
      startStory = "17544762212711742430",
      startPort = "Success",
      endStory = "17544762212711742428",
      endPort = "In"
    },
    {
      startStory = "17544762212711742431",
      startPort = "Success",
      endStory = "17544762212711742429",
      endPort = "In"
    },
    {
      startStory = "17544762212711742425",
      startPort = "Success",
      endStory = "17544762212711742426",
      endPort = "In"
    },
    {
      startStory = "17544762212711742426",
      startPort = "Success",
      endStory = "17544762212711742427",
      endPort = "In"
    },
    {
      startStory = "17544762212711742428",
      startPort = "Success",
      endStory = "17560370834409401448",
      endPort = "In"
    },
    {
      startStory = "17560370834409401448",
      startPort = "Success",
      endStory = "17544762212711742431",
      endPort = "In"
    },
    {
      startStory = "17544762212711742419",
      startPort = "Success",
      endStory = "17544762212711742422",
      endPort = "In"
    },
    {
      startStory = "17544762212711742404",
      startPort = "StoryStart",
      endStory = "175751634154018027485",
      endPort = "In"
    },
    {
      startStory = "175751634154018027485",
      startPort = "Success",
      endStory = "17544762212711742419",
      endPort = "In"
    },
    {
      startStory = "17574017033051867104",
      startPort = "Success",
      endStory = "17544762212711742418",
      endPort = "In"
    },
    {
      startStory = "17544762212711742429",
      startPort = "\229\174\140\230\136\144\229\137\175\230\156\172",
      endStory = "17544762212711742418",
      endPort = "In"
    },
    {
      startStory = "17544762212711742429",
      startPort = "\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172",
      endStory = "17574017033051867104",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17544762212711742404"] = {
      isStoryNode = true,
      key = "17544762212711742404",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1017.5164502164503, y = -530.5236652236653},
      propsData = {QuestChainId = 120114},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17544762212711742405"] = {
      isStoryNode = true,
      key = "17544762212711742405",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3603.346958270861, y = 276.501884914565},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17544762212711742418"] = {
      isStoryNode = true,
      key = "17544762212711742418",
      type = "StoryNode",
      name = "\231\187\147\230\157\159",
      pos = {x = 3309.025139777737, y = 277.74545546566185},
      propsData = {
        QuestId = 12011414,
        QuestDescriptionComment = "",
        QuestDescription = "Episode_Feina",
        QuestDeatil = "Content_120114_13",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17576645841834386",
            startPort = "true",
            endQuest = "17576645841834385",
            endPort = "In"
          },
          {
            startQuest = "17576645841834386",
            startPort = "true",
            endQuest = "17576645841834384",
            endPort = "In"
          },
          {
            startQuest = "17544762212711742507",
            startPort = "QuestStart",
            endQuest = "17576645841834386",
            endPort = "In"
          },
          {
            startQuest = "17576645841834384",
            startPort = "Success",
            endQuest = "17558546295375255",
            endPort = "In"
          },
          {
            startQuest = "17576653735437875",
            startPort = "Out",
            endQuest = "17576653735437874",
            endPort = "In"
          },
          {
            startQuest = "17576653735437874",
            startPort = "Out",
            endQuest = "17576653735437876",
            endPort = "In"
          },
          {
            startQuest = "17576645841834386",
            startPort = "false",
            endQuest = "17576653735437875",
            endPort = "In"
          },
          {
            startQuest = "17576653735437876",
            startPort = "Out",
            endQuest = "17576645841834384",
            endPort = "In"
          },
          {
            startQuest = "17576645841834384",
            startPort = "Fail",
            endQuest = "17544762212711742509",
            endPort = "Fail"
          },
          {
            startQuest = "17576645841834384",
            startPort = "PassiveFail",
            endQuest = "17544762212711742509",
            endPort = "Fail"
          },
          {
            startQuest = "17576645841834384",
            startPort = "Success",
            endQuest = "1759913775428938085",
            endPort = "In"
          },
          {
            startQuest = "17558546295375255",
            startPort = "Out",
            endQuest = "1759913775428938086",
            endPort = "In"
          },
          {
            startQuest = "1759913775428938086",
            startPort = "Out",
            endQuest = "17544762212711742508",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17544762212711742507"] = {
            key = "17544762212711742507",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 432.5, y = 338.5},
            propsData = {ModeType = 0}
          },
          ["17544762212711742508"] = {
            key = "17544762212711742508",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2362.714285714286, y = 317.7142857142857},
            propsData = {ModeType = 0}
          },
          ["17544762212711742509"] = {
            key = "17544762212711742509",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1691.4285714285716, y = 487.7142857142858},
            propsData = {}
          },
          ["17558546295375255"] = {
            key = "17558546295375255",
            type = "TalkNode",
            name = "SC04\227\128\144\232\191\135\229\156\186\227\128\145\229\164\167\229\144\136\231\133\167",
            pos = {x = 1692.892857142857, y = 322.0357142857143},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Activity/Activity_Feina/Activity_Feina_SC002/SQ_Activity_Feina_SC002",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17576645841834384"] = {
            key = "17576645841834384",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1327.8733332370325, y = 326.2999389110913},
            propsData = {SpecialConfigId = 2082, BlackScreenImmediately = true}
          },
          ["17576645841834385"] = {
            key = "17576645841834385",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1005.6949890865999, y = 175.7307136989632},
            propsData = {
              VarName = "FeinaDay04StoryEnd",
              VarValue = 1
            }
          },
          ["17576645841834386"] = {
            key = "17576645841834386",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 763.0909524772524, y = 332.9145081653663},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04StoryEnd",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17576653735437874"] = {
            key = "17576653735437874",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1031.6785714285713, y = 630.5714285714287},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["17576653735437875"] = {
            key = "17576653735437875",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 990.9285714285713, y = 484.8214285714286},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17576653735437876"] = {
            key = "17576653735437876",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1072.1785714285713, y = 810.0714285714287},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["1759913775428938085"] = {
            key = "1759913775428938085",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1686.3462217371386, y = 145.78571428571428},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/1_0/0091_feina_activity_cs_01",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {101105},
              bStoreToServer = false
            }
          },
          ["1759913775428938086"] = {
            key = "1759913775428938086",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2020.7966354057187, y = 315.64285714285717},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742419"] = {
      isStoryNode = true,
      key = "17544762212711742419",
      type = "StoryNode",
      name = "\228\187\142\229\186\138\228\184\138\233\134\146\230\157\165",
      pos = {x = 1616.1478672409937, y = -530.3578432474358},
      propsData = {
        QuestId = 12011401,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_0",
        QuestDeatil = "Content_120114_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome",
        QuestUIId = 120114
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175446748346814616",
            startPort = "Fail",
            endQuest = "17544762212711742514",
            endPort = "Fail"
          },
          {
            startQuest = "175446748346814616",
            startPort = "PassiveFail",
            endQuest = "17544762212711742514",
            endPort = "Fail"
          },
          {
            startQuest = "175446748346814616",
            startPort = "Success",
            endQuest = "175455768771019404730",
            endPort = "In"
          },
          {
            startQuest = "175455768771019404730",
            startPort = "Out",
            endQuest = "17544762212711742513",
            endPort = "Success"
          },
          {
            startQuest = "17555144603835508397",
            startPort = "true",
            endQuest = "17555144603835508396",
            endPort = "In"
          },
          {
            startQuest = "17555144603835508397",
            startPort = "true",
            endQuest = "175446748346814616",
            endPort = "In"
          },
          {
            startQuest = "17544762212711742512",
            startPort = "QuestStart",
            endQuest = "17555144603835508397",
            endPort = "In"
          },
          {
            startQuest = "17555144603835508397",
            startPort = "false",
            endQuest = "1757398351578933660",
            endPort = "In"
          },
          {
            startQuest = "1757398351578933660",
            startPort = "Out",
            endQuest = "1757398345458933549",
            endPort = "In"
          },
          {
            startQuest = "1757398345458933549",
            startPort = "Out",
            endQuest = "175446748346814616",
            endPort = "In"
          },
          {
            startQuest = "1757398345458933549",
            startPort = "Out",
            endQuest = "17573984082761863885",
            endPort = "In"
          }
        },
        nodeData = {
          ["175446748346814616"] = {
            key = "175446748346814616",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1082.6525958561565, y = 521.041378899738},
            propsData = {SpecialConfigId = 2070, BlackScreenImmediately = true}
          },
          ["17544762212711742512"] = {
            key = "17544762212711742512",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 254.4389140271492, y = 576.7735175041677},
            propsData = {ModeType = 0}
          },
          ["17544762212711742513"] = {
            key = "17544762212711742513",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1714.4999999999995, y = 514.0902255639097},
            propsData = {ModeType = 0}
          },
          ["17544762212711742514"] = {
            key = "17544762212711742514",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1432.7518796992485, y = 697.8646616541355},
            propsData = {}
          },
          ["17544762212711742517"] = {
            key = "17544762212711742517",
            type = "PlayerSwitchWalkRunNode",
            name = "\231\142\169\229\174\182\232\181\176\232\183\145\229\136\135\230\141\162",
            pos = {x = 2796.770514735574, y = 1255.7220973044798},
            propsData = {Rate = 0.5, Mode = "ToRun"}
          },
          ["175455768771019404730"] = {
            key = "175455768771019404730",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1420, y = 512},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 4,
              IsWhite = false
            }
          },
          ["17555144603835508396"] = {
            key = "17555144603835508396",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 833.2318602019066, y = 368.3279220779221},
            propsData = {
              VarName = "FeinaDay04Home",
              VarValue = 1
            }
          },
          ["17555144603835508397"] = {
            key = "17555144603835508397",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 542.9989090288626, y = 531.7125374625374},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04Home",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1757398345458933549"] = {
            key = "1757398345458933549",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 899.5, y = 860.5},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["1757398351578933660"] = {
            key = "1757398351578933660",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 821.5, y = 700},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17573984082761863885"] = {
            key = "17573984082761863885",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1159.5, y = 979},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742420"] = {
      isStoryNode = true,
      key = "17544762212711742420",
      type = "StoryNode",
      name = "\229\143\145\231\142\176\231\186\191\231\180\162",
      pos = {x = 1631.8693539317092, y = -145.32147549940115},
      propsData = {
        QuestId = 12011406,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_6",
        QuestDeatil = "Content_120114_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SQTrigger_LeaveCity_1241068"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17544726658901016884",
            startPort = "Fail",
            endQuest = "17544762212711742522",
            endPort = "Fail"
          },
          {
            startQuest = "17544726658901016884",
            startPort = "PassiveFail",
            endQuest = "17544762212711742522",
            endPort = "Fail"
          },
          {
            startQuest = "17555146551275514274",
            startPort = "true",
            endQuest = "17555146551275514273",
            endPort = "In"
          },
          {
            startQuest = "17544762212711742520",
            startPort = "QuestStart",
            endQuest = "17555146551275514274",
            endPort = "In"
          },
          {
            startQuest = "17555146551275514274",
            startPort = "true",
            endQuest = "17544726658901016884",
            endPort = "In"
          },
          {
            startQuest = "17544726658901016884",
            startPort = "Success",
            endQuest = "17544762212711742521",
            endPort = "Success"
          },
          {
            startQuest = "175752394269812074396",
            startPort = "Out",
            endQuest = "175752394269812074395",
            endPort = "In"
          },
          {
            startQuest = "17555146551275514274",
            startPort = "false",
            endQuest = "175752394269812074396",
            endPort = "In"
          },
          {
            startQuest = "175752394269812074395",
            startPort = "Out",
            endQuest = "17544726658901016884",
            endPort = "In"
          },
          {
            startQuest = "175752394269812074395",
            startPort = "Out",
            endQuest = "175752397081112075045",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544726658901016884"] = {
            key = "17544726658901016884",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 615.4783115435295, y = -346.0904095904106},
            propsData = {SpecialConfigId = 2075, BlackScreenImmediately = true}
          },
          ["17544762212711742520"] = {
            key = "17544762212711742520",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -240.64032797497035, y = -302.4151341645731},
            propsData = {ModeType = 0}
          },
          ["17544762212711742521"] = {
            key = "17544762212711742521",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1018.5415757687849, y = -355.4302847689942},
            propsData = {ModeType = 0}
          },
          ["17544762212711742522"] = {
            key = "17544762212711742522",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1025.3590250329382, y = -112.11791831357026},
            propsData = {}
          },
          ["17544762212711742523"] = {
            key = "17544762212711742523",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3852.701298701298, y = -916.8701298701297},
            propsData = {WaitTime = 2}
          },
          ["17544762212711742524"] = {
            key = "17544762212711742524",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 3529.1468119943356, y = -983.2495987629502},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1240929},
              QuestPickupId = -1,
              UnitId = 10034,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Feina04_01",
              IsUseCount = false
            }
          },
          ["17544762212711742525"] = {
            key = "17544762212711742525",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3644.1298701298697, y = -1227.2987012987014},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
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
          ["17555146551275514273"] = {
            key = "17555146551275514273",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 467.23186020190656, y = -563.5},
            propsData = {
              VarName = "FeinaDay04Find02",
              VarValue = 1
            }
          },
          ["17555146551275514274"] = {
            key = "17555146551275514274",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 43.56813979809344, y = -341.3},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04Find02",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175752394269812074395"] = {
            key = "175752394269812074395",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 357.7025171624714, y = -61.87494279176203},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook06",
              IsUseCount = false
            }
          },
          ["175752394269812074396"] = {
            key = "175752394269812074396",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 298.32860411899316, y = -211.48798627002293},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191950, 1191951}
            }
          },
          ["175752397081112075045"] = {
            key = "175752397081112075045",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 429.1368421052632, y = 122.18032036613285},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191950, 1191951}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742422"] = {
      isStoryNode = true,
      key = "17544762212711742422",
      type = "StoryNode",
      name = "\229\142\187\230\137\190\229\188\159\229\188\159",
      pos = {x = 2032.3932919419758, y = -531.6498634038596},
      propsData = {
        QuestId = 12011403,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_3",
        QuestDeatil = "Content_120114_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SQTrigger_Walk02_1191913"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175446977903121685",
            startPort = "Fail",
            endQuest = "17544762212721742566",
            endPort = "Fail"
          },
          {
            startQuest = "175446977903121685",
            startPort = "PassiveFail",
            endQuest = "17544762212721742566",
            endPort = "Fail"
          },
          {
            startQuest = "175446977903121685",
            startPort = "Success",
            endQuest = "17545696234973350611",
            endPort = "In"
          },
          {
            startQuest = "17545696234973350611",
            startPort = "Out",
            endQuest = "17544762212721742565",
            endPort = "Success"
          },
          {
            startQuest = "17555145294115510215",
            startPort = "true",
            endQuest = "17555145294115510214",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742564",
            startPort = "QuestStart",
            endQuest = "17555145294115510215",
            endPort = "In"
          },
          {
            startQuest = "175751608505418025015",
            startPort = "Out",
            endQuest = "175751608505418025017",
            endPort = "In"
          },
          {
            startQuest = "175751608505418025017",
            startPort = "Out",
            endQuest = "175751608505418025016",
            endPort = "In"
          },
          {
            startQuest = "17555145294115510215",
            startPort = "true",
            endQuest = "175751608505418025015",
            endPort = "In"
          },
          {
            startQuest = "175751608505418025016",
            startPort = "Out",
            endQuest = "175446977903121685",
            endPort = "In"
          },
          {
            startQuest = "175751615403418026280",
            startPort = "Out",
            endQuest = "175751615403418026279",
            endPort = "In"
          },
          {
            startQuest = "17555145294115510215",
            startPort = "false",
            endQuest = "175751615403418026280",
            endPort = "In"
          },
          {
            startQuest = "175751615403418026279",
            startPort = "Out",
            endQuest = "175446977903121685",
            endPort = "In"
          },
          {
            startQuest = "175751615403418026279",
            startPort = "Out",
            endQuest = "175752697935717652619",
            endPort = "In"
          }
        },
        nodeData = {
          ["175446977903121685"] = {
            key = "175446977903121685",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 336.3847525023998, y = 641.0839160839163},
            propsData = {SpecialConfigId = 2072, BlackScreenImmediately = true}
          },
          ["17544762212721742564"] = {
            key = "17544762212721742564",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -986.3736263736265, y = 654.3846153846152},
            propsData = {ModeType = 0}
          },
          ["17544762212721742565"] = {
            key = "17544762212721742565",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 967.0136852394915, y = 638.7927663734115},
            propsData = {ModeType = 0}
          },
          ["17544762212721742566"] = {
            key = "17544762212721742566",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 869.0909090909091, y = 852.7272727272727},
            propsData = {}
          },
          ["17545696234973350611"] = {
            key = "17545696234973350611",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 690.6666666666664, y = 637},
            propsData = {
              ModeType = 1,
              Id = 101105,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17555145294115510214"] = {
            key = "17555145294115510214",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = -429.76813979809344, y = 437.50000000000006},
            propsData = {
              VarName = "FeinaDay04Walk02",
              VarValue = 1
            }
          },
          ["17555145294115510215"] = {
            key = "17555145294115510215",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = -682.2318602019066, y = 650.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04Walk02",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175751608505418025015"] = {
            key = "175751608505418025015",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -399.2019855237038, y = 640.7723845905085},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12032501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple24",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175751608505418025016"] = {
            key = "175751608505418025016",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 59.20198552370357, y = 643.2276154094915},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12032601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple24",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175751608505418025017"] = {
            key = "175751608505418025017",
            type = "TalkNode",
            name = "\227\128\144Seq\227\128\145\229\143\172\229\148\164\232\157\180\232\157\182",
            pos = {x = -176.48222500261227, y = 644.1749838305441},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/ActivityFeina/Feina04_Seq/Feina04_Saiqi01",
              InType = "BlendIn",
              OutType = "BlendOut",
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = false,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["175751615403418026279"] = {
            key = "175751615403418026279",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = -185.8598901098901, y = 979.315934065934},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook05",
              IsUseCount = false
            }
          },
          ["175751615403418026280"] = {
            key = "175751615403418026280",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -290.9093406593406, y = 844.9532967032965},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191948, 1191949}
            }
          },
          ["175752697935717652619"] = {
            key = "175752697935717652619",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -104.02703875072288, y = 1166.1710526315787},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191948, 1191949}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742423"] = {
      isStoryNode = true,
      key = "17544762212711742423",
      type = "StoryNode",
      name = "\229\155\158\229\174\182",
      pos = {x = 2313.774221347326, y = -528.8655282850286},
      propsData = {
        QuestId = 12011404,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_4",
        QuestDeatil = "Content_120114_4",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175447082426925631",
            startPort = "Fail",
            endQuest = "17544762212721742573",
            endPort = "Fail"
          },
          {
            startQuest = "175447082426925631",
            startPort = "PassiveFail",
            endQuest = "17544762212721742573",
            endPort = "Fail"
          },
          {
            startQuest = "175447082426925631",
            startPort = "Success",
            endQuest = "17545730114796080868",
            endPort = "In"
          },
          {
            startQuest = "17545730114796080868",
            startPort = "Out",
            endQuest = "17544762212721742572",
            endPort = "Success"
          },
          {
            startQuest = "17555145614015511403",
            startPort = "true",
            endQuest = "17555145614015511402",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742571",
            startPort = "QuestStart",
            endQuest = "17555145614015511403",
            endPort = "In"
          },
          {
            startQuest = "17555145614015511403",
            startPort = "true",
            endQuest = "175447082426925631",
            endPort = "In"
          },
          {
            startQuest = "17574021489936838236",
            startPort = "Out",
            endQuest = "17574021489936838235",
            endPort = "In"
          },
          {
            startQuest = "17574021489936838235",
            startPort = "Out",
            endQuest = "17574021489936838237",
            endPort = "In"
          },
          {
            startQuest = "17555145614015511403",
            startPort = "false",
            endQuest = "17574021489936838236",
            endPort = "In"
          },
          {
            startQuest = "17574021489936838235",
            startPort = "Out",
            endQuest = "175447082426925631",
            endPort = "In"
          }
        },
        nodeData = {
          ["175447082426925631"] = {
            key = "175447082426925631",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1053.3141326636749, y = 6.461218415451825},
            propsData = {SpecialConfigId = 2073, BlackScreenImmediately = true}
          },
          ["17544762212721742571"] = {
            key = "17544762212721742571",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 152.89184952978053, y = 33.97452978056424},
            propsData = {ModeType = 0}
          },
          ["17544762212721742572"] = {
            key = "17544762212721742572",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1740.579313842296, y = 0.4641239563667767},
            propsData = {ModeType = 0}
          },
          ["17544762212721742573"] = {
            key = "17544762212721742573",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1746.155844155844, y = 201.974025974026},
            propsData = {}
          },
          ["17545730114796080868"] = {
            key = "17545730114796080868",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1410, y = -6.5},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 4,
              IsWhite = false
            }
          },
          ["17555145614015511402"] = {
            key = "17555145614015511402",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 735.2318602019066, y = -457.49999999999994},
            propsData = {
              VarName = "FeinaDay04HomeCry",
              VarValue = 1
            }
          },
          ["17555145614015511403"] = {
            key = "17555145614015511403",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 470.76813979809344, y = 13.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04HomeCry",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17556753814122766171"] = {
            key = "17556753814122766171",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 283, y = 376.6666666666667},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1230071,
              GuideType = "N",
              GuidePointName = "Npc_Aote_Feina01_1230030"
            }
          },
          ["17574021489936838235"] = {
            key = "17574021489936838235",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 781.1454545454546, y = 317.79393939393947},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["17574021489936838236"] = {
            key = "17574021489936838236",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 691.6606060606063, y = 178.68181818181827},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17574021489936838237"] = {
            key = "17574021489936838237",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 887.0666666666666, y = 502.9000000000001},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742424"] = {
      isStoryNode = true,
      key = "17544762212711742424",
      type = "StoryNode",
      name = "\229\188\159\229\188\159\228\184\141\232\167\129\228\186\134",
      pos = {x = 1368.5102259669115, y = -144.1885299079069},
      propsData = {
        QuestId = 12011405,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_5",
        QuestDeatil = "Content_120114_5",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175455839582719411777",
            startPort = "Fail",
            endQuest = "17544762212721742577",
            endPort = "Fail"
          },
          {
            startQuest = "175455839582719411777",
            startPort = "PassiveFail",
            endQuest = "17544762212721742577",
            endPort = "Fail"
          },
          {
            startQuest = "17555146050955512930",
            startPort = "true",
            endQuest = "17555146050955512929",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742575",
            startPort = "QuestStart",
            endQuest = "17555146050955512930",
            endPort = "In"
          },
          {
            startQuest = "17555254827943680777",
            startPort = "Out",
            endQuest = "17544762212721742576",
            endPort = "Success"
          },
          {
            startQuest = "175455839582719411777",
            startPort = "Success",
            endQuest = "17572468315213465460",
            endPort = "In"
          },
          {
            startQuest = "17572468315213465460",
            startPort = "Out",
            endQuest = "17555254827943680777",
            endPort = "In"
          },
          {
            startQuest = "175751660557418958395",
            startPort = "Out",
            endQuest = "175751660557418958394",
            endPort = "In"
          },
          {
            startQuest = "175751660557418958394",
            startPort = "Out",
            endQuest = "175751660557418958396",
            endPort = "In"
          },
          {
            startQuest = "17555146050955512930",
            startPort = "false",
            endQuest = "175751660557418958395",
            endPort = "In"
          },
          {
            startQuest = "175751660557418958394",
            startPort = "Out",
            endQuest = "175455839582719411777",
            endPort = "In"
          },
          {
            startQuest = "17555146050955512930",
            startPort = "true",
            endQuest = "1755598546245925883",
            endPort = "In"
          },
          {
            startQuest = "1755598546245925883",
            startPort = "Out",
            endQuest = "175455839582719411777",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544762212721742575"] = {
            key = "17544762212721742575",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 778.5714285714286, y = 348.85714285714283},
            propsData = {ModeType = 0}
          },
          ["17544762212721742576"] = {
            key = "17544762212721742576",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2582.223136645963, y = 331.4222049689441},
            propsData = {ModeType = 0}
          },
          ["17544762212721742577"] = {
            key = "17544762212721742577",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2031.0724137931034, y = 514.7129310344828},
            propsData = {}
          },
          ["175455839582719411777"] = {
            key = "175455839582719411777",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1710.848602484472, y = 323.72344720496886},
            propsData = {SpecialConfigId = 2074, BlackScreenImmediately = true}
          },
          ["17555146050955512929"] = {
            key = "17555146050955512929",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1367.7970775932108, y = 97.54347826086962},
            propsData = {
              VarName = "FeinaDay04Find01",
              VarValue = 1
            }
          },
          ["17555146050955512930"] = {
            key = "17555146050955512930",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 1085.7681397980934, y = 331.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04Find01",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17555254827943680777"] = {
            key = "17555254827943680777",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2312.104347826087, y = 322.6534161490683},
            propsData = {
              ModeType = 1,
              Id = 101103,
              StartIndex = 6,
              IsWhite = false
            }
          },
          ["1755598546245925883"] = {
            key = "1755598546245925883",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1397.6136645962733, y = 327.0975155279503},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12033201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple31_32",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211012},
                {TalkActorType = "Npc", TalkActorId = 211013},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211011},
                {TalkActorType = "Npc", TalkActorId = 211010},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17572468315213465460"] = {
            key = "17572468315213465460",
            type = "TalkNode",
            name = "SEQ_GoOutIceLakeCity",
            pos = {x = 2022.6552795031055, y = 319.6403726708075},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/ActivityFeina/Feina04_Seq/Feina04_GoOutIceLakeCity",
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["175751660557418958394"] = {
            key = "175751660557418958394",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1418.8, y = 650.4499999999999},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook03",
              IsUseCount = false
            }
          },
          ["175751660557418958395"] = {
            key = "175751660557418958395",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1312, y = 492.75},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191941, 1191942}
            }
          },
          ["175751660557418958396"] = {
            key = "175751660557418958396",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1520, y = 851.25},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191941, 1191942}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742425"] = {
      isStoryNode = true,
      key = "17544762212711742425",
      type = "StoryNode",
      name = "\229\188\186\231\155\151\232\144\165\229\156\176\229\137\141",
      pos = {x = 1899.408757026321, y = -143.6174726271636},
      propsData = {
        QuestId = 12011407,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_7",
        QuestDeatil = "Content_120114_7",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1240944"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17544758375291019433",
            startPort = "Fail",
            endQuest = "17544762212721742584",
            endPort = "Fail"
          },
          {
            startQuest = "17544758375291019433",
            startPort = "PassiveFail",
            endQuest = "17544762212721742584",
            endPort = "Fail"
          },
          {
            startQuest = "17555146960215515020",
            startPort = "true",
            endQuest = "17555146960215515019",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742582",
            startPort = "QuestStart",
            endQuest = "17555146960215515020",
            endPort = "In"
          },
          {
            startQuest = "17544758375291019433",
            startPort = "Success",
            endQuest = "17558650944972790801",
            endPort = "In"
          },
          {
            startQuest = "17555146960215515020",
            startPort = "true",
            endQuest = "17544758375291019433",
            endPort = "In"
          },
          {
            startQuest = "175752400531312075875",
            startPort = "Out",
            endQuest = "175752400531312075874",
            endPort = "In"
          },
          {
            startQuest = "17555146960215515020",
            startPort = "false",
            endQuest = "175752400531312075875",
            endPort = "In"
          },
          {
            startQuest = "175752400531312075874",
            startPort = "Out",
            endQuest = "17544758375291019433",
            endPort = "In"
          },
          {
            startQuest = "175752400531312075874",
            startPort = "Out",
            endQuest = "175752404079212076699",
            endPort = "In"
          },
          {
            startQuest = "17544758375291019433",
            startPort = "Success",
            endQuest = "17599125586245104",
            endPort = "In"
          },
          {
            startQuest = "17558650944972790801",
            startPort = "Out",
            endQuest = "17599125758545562",
            endPort = "In"
          },
          {
            startQuest = "17599125758545562",
            startPort = "Out",
            endQuest = "17544762212721742583",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17544758375291019433"] = {
            key = "17544758375291019433",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 515.9436965421621, y = 378.5872797279446},
            propsData = {SpecialConfigId = 2076, BlackScreenImmediately = false}
          },
          ["17544762212721742582"] = {
            key = "17544762212721742582",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -367.4310850439883, y = 392.8817204301075},
            propsData = {ModeType = 0}
          },
          ["17544762212721742583"] = {
            key = "17544762212721742583",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1409.9713163180902, y = 389.9759756372659},
            propsData = {ModeType = 0}
          },
          ["17544762212721742584"] = {
            key = "17544762212721742584",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1254.5604395604396, y = 625.4890109890109},
            propsData = {}
          },
          ["17555146960215515019"] = {
            key = "17555146960215515019",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 231.23186020190656, y = 114.98913043478261},
            propsData = {
              VarName = "FeinaDay04Thief",
              VarValue = 1
            }
          },
          ["17555146960215515020"] = {
            key = "17555146960215515020",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = -49.98186020190656, y = 383.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04Thief",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17558650944972790801"] = {
            key = "17558650944972790801",
            type = "TalkNode",
            name = "SC01\227\128\144\232\191\135\229\156\186\227\128\145\229\165\179\228\184\187\233\163\158\232\184\162",
            pos = {x = 841.5232340123644, y = 373.7364193777237},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Activity/Activity_Feina/Activity_Feina_SC001/SQ_Activity_Feina_SC001",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["175752400531312075874"] = {
            key = "175752400531312075874",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 273.724269753668, y = 651.6030589581369},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook07",
              IsUseCount = false
            }
          },
          ["175752400531312075875"] = {
            key = "175752400531312075875",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 210.04600888410283, y = 501.0769720016152},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241159, 1241160}
            }
          },
          ["175752404079212076699"] = {
            key = "175752404079212076699",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 349.7009803921569, y = 842.4344919786097},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241159, 1241160}
            }
          },
          ["17599125586245104"] = {
            key = "17599125586245104",
            type = "PlayOrStopBGMNode",
            name = "BGM-Play",
            pos = {x = 836.8078280896617, y = 203.2761238761238},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {101103},
              bStoreToServer = false
            }
          },
          ["17599125758545562"] = {
            key = "17599125758545562",
            type = "PlayOrStopBGMNode",
            name = "BGM-Stop",
            pos = {x = 1126.1868131868134, y = 386.7376623376623},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742426"] = {
      isStoryNode = true,
      key = "17544762212711742426",
      type = "StoryNode",
      name = "\230\136\152\230\150\151",
      pos = {x = 2159.735651131379, y = -143.72384597331018},
      propsData = {
        QuestId = 12011408,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_9",
        QuestDeatil = "Content_120114_9",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1240944"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175455878326919415471",
            startPort = "Fail",
            endQuest = "17544762212721742595",
            endPort = "Fail"
          },
          {
            startQuest = "175455878326919415471",
            startPort = "PassiveFail",
            endQuest = "17544762212721742595",
            endPort = "Fail"
          },
          {
            startQuest = "17555147221025515961",
            startPort = "true",
            endQuest = "17555147221025515960",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742593",
            startPort = "QuestStart",
            endQuest = "17555147221025515961",
            endPort = "In"
          },
          {
            startQuest = "175455878326919415471",
            startPort = "Success",
            endQuest = "17544762212721742594",
            endPort = "Success"
          },
          {
            startQuest = "17555147221025515961",
            startPort = "true",
            endQuest = "17561943317184130385",
            endPort = "In"
          },
          {
            startQuest = "17561943317184130385",
            startPort = "Out",
            endQuest = "17559600715105639685",
            endPort = "In"
          },
          {
            startQuest = "17559600715105639685",
            startPort = "Out",
            endQuest = "175455878326919415471",
            endPort = "In"
          },
          {
            startQuest = "175752412951212078740",
            startPort = "Out",
            endQuest = "175752412951212078739",
            endPort = "In"
          },
          {
            startQuest = "17555147221025515961",
            startPort = "false",
            endQuest = "175752412951212078740",
            endPort = "In"
          },
          {
            startQuest = "175752412951212078739",
            startPort = "Out",
            endQuest = "175455878326919415471",
            endPort = "In"
          },
          {
            startQuest = "175752412951212078739",
            startPort = "Out",
            endQuest = "175752481794412085392",
            endPort = "In"
          },
          {
            startQuest = "17561943317184130385",
            startPort = "Out",
            endQuest = "17599126388786257",
            endPort = "In"
          },
          {
            startQuest = "17559600715105639685",
            startPort = "Out",
            endQuest = "17599126671586819",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544762212721742593"] = {
            key = "17544762212721742593",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 302.3974358974358, y = 339.1666666666667},
            propsData = {ModeType = 0}
          },
          ["17544762212721742594"] = {
            key = "17544762212721742594",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1715.6393188854488, y = 314.1298098186643},
            propsData = {ModeType = 0}
          },
          ["17544762212721742595"] = {
            key = "17544762212721742595",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1720.0676691729325, y = 490.79699248120295},
            propsData = {}
          },
          ["175455878326919415471"] = {
            key = "175455878326919415471",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1299.1087092731827, y = 314.30231829573927},
            propsData = {SpecialConfigId = 2077, BlackScreenImmediately = true}
          },
          ["17555147221025515960"] = {
            key = "17555147221025515960",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 898.2318602019066, y = -207.5},
            propsData = {
              VarName = "FeinaDay04Fight",
              VarValue = 1
            }
          },
          ["17555147221025515961"] = {
            key = "17555147221025515961",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 622.2681397980934, y = 329.17857142857144},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04Fight",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17559600715105639685"] = {
            key = "17559600715105639685",
            type = "TalkNode",
            name = "SC04\227\128\144\232\191\135\229\156\186\227\128\145\230\136\152\230\150\151\229\143\172\229\148\164",
            pos = {x = 928.0714285714286, y = 319.29761904761904},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Activity/Activity_Feina/Activity_Feina_SC004/SQ_Activity_Feina_SC004",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17561943317184130385"] = {
            key = "17561943317184130385",
            type = "TalkNode",
            name = "\227\128\14436b\227\128\145\232\143\178\229\168\156\229\133\179\229\191\131\229\161\158\231\187\180\230\172\167",
            pos = {x = 930.2499999999999, y = 120.60714285714272},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12033803,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple36b",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211037,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211038,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211039,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211040,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211041,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211041},
                {TalkActorType = "Npc", TalkActorId = 211037},
                {TalkActorType = "Npc", TalkActorId = 211038},
                {TalkActorType = "Npc", TalkActorId = 211039},
                {TalkActorType = "Npc", TalkActorId = 211040}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175752412951212078739"] = {
            key = "175752412951212078739",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 978.4884562749586, y = 634.1661675477345},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook08",
              IsUseCount = false
            }
          },
          ["175752412951212078740"] = {
            key = "175752412951212078740",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 936.6507751155382, y = 492.40819653324183},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241161, 1241162}
            }
          },
          ["175752481794412085392"] = {
            key = "175752481794412085392",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1027.8493516399692, y = 841.3493516399697},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241161, 1241162}
            }
          },
          ["17599126388786257"] = {
            key = "17599126388786257",
            type = "PlayOrStopBGMNode",
            name = "BGM-Play",
            pos = {x = 1205.6447368421054, y = 17.328947368421098},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/1_0/0092_feina_activity_cs_02",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {101103},
              bStoreToServer = false
            }
          },
          ["17599126671586819"] = {
            key = "17599126671586819",
            type = "PlayOrStopBGMNode",
            name = "BGM-Stop",
            pos = {x = 1215.6447368421054, y = 199.82894736842104},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742427"] = {
      isStoryNode = true,
      key = "17544762212711742427",
      type = "StoryNode",
      name = "\229\175\185\232\175\157",
      pos = {x = 2601.875172242401, y = -143.51724346662013},
      propsData = {
        QuestId = 12011409,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_10_1",
        QuestDeatil = "Content_120114_10_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1240944"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17544762212721742605",
            startPort = "Out",
            endQuest = "17544762212721742606",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742606",
            startPort = "Out",
            endQuest = "17544762212721742607",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742609",
            startPort = "Out",
            endQuest = "17544762212721742605",
            endPort = "In"
          },
          {
            startQuest = "175455893362320414931",
            startPort = "Fail",
            endQuest = "17544762212721742604",
            endPort = "Fail"
          },
          {
            startQuest = "175455893362320414931",
            startPort = "PassiveFail",
            endQuest = "17544762212721742604",
            endPort = "Fail"
          },
          {
            startQuest = "175455893362320414931",
            startPort = "Success",
            endQuest = "17546332096808809959",
            endPort = "In"
          },
          {
            startQuest = "17546332096808809959",
            startPort = "Out",
            endQuest = "17544762212721742603",
            endPort = "Success"
          },
          {
            startQuest = "17555147701675517580",
            startPort = "true",
            endQuest = "17555147701675517579",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742602",
            startPort = "QuestStart",
            endQuest = "17555147701675517580",
            endPort = "In"
          },
          {
            startQuest = "17555147701675517580",
            startPort = "true",
            endQuest = "175455893362320414931",
            endPort = "In"
          },
          {
            startQuest = "175752482862712085759",
            startPort = "Out",
            endQuest = "175752482862712085758",
            endPort = "In"
          },
          {
            startQuest = "175752482862712085758",
            startPort = "Out",
            endQuest = "175752482862712085760",
            endPort = "In"
          },
          {
            startQuest = "17555147701675517580",
            startPort = "false",
            endQuest = "175752482862712085759",
            endPort = "In"
          },
          {
            startQuest = "175752482862712085758",
            startPort = "Out",
            endQuest = "175455893362320414931",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544762212721742602"] = {
            key = "17544762212721742602",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 295.8409090909091, y = 285.6297846889952},
            propsData = {ModeType = 0}
          },
          ["17544762212721742603"] = {
            key = "17544762212721742603",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1700.8651260504198, y = 271.2976317799847},
            propsData = {ModeType = 0}
          },
          ["17544762212721742604"] = {
            key = "17544762212721742604",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1699.7290552584673, y = 495.56506238859185},
            propsData = {}
          },
          ["17544762212721742605"] = {
            key = "17544762212721742605",
            type = "TalkNode",
            name = "\227\128\14436-37\227\128\145\229\146\140\229\188\159\229\188\159\229\175\185\232\175\157",
            pos = {x = 1231.1698717948718, y = -199.0158862876254},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 211015,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Sevio_Feina04_1240937",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12033901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple36_37",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17544762212721742606"] = {
            key = "17544762212721742606",
            type = "TalkNode",
            name = "\227\128\14438\227\128\145\229\141\161\231\143\138\229\190\183\230\139\137\229\184\166\231\157\128\229\163\171\229\133\181\232\191\135\230\157\165",
            pos = {x = 1506.1250000000002, y = -197.86858974358978},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple38",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17544762212721742607"] = {
            key = "17544762212721742607",
            type = "TalkNode",
            name = "\227\128\14439\227\128\145\229\146\140\229\141\161\231\143\138\229\190\183\230\139\137\229\175\185\232\175\157",
            pos = {x = 1797.8442307692305, y = -198.14230769230767},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple39",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17544762212721742609"] = {
            key = "17544762212721742609",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1198.9142829900836, y = -27.028895768833934},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240937}
            }
          },
          ["175455893362320414931"] = {
            key = "175455893362320414931",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1104.7172459893047, y = 276.03475935828874},
            propsData = {SpecialConfigId = 2078, BlackScreenImmediately = true}
          },
          ["17546332096808809959"] = {
            key = "17546332096808809959",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1428.3749999999998, y = 270.3441558441558},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17555147701675517579"] = {
            key = "17555147701675517579",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 820.2318602019066, y = -44.5},
            propsData = {
              VarName = "FeinaDay04BackCity01",
              VarValue = 1
            }
          },
          ["17555147701675517580"] = {
            key = "17555147701675517580",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 575.7681397980934, y = 284.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04BackCity01",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175752482862712085758"] = {
            key = "175752482862712085758",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 855.0415170176667, y = 560.7305752793105},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook08",
              IsUseCount = false
            }
          },
          ["175752482862712085759"] = {
            key = "175752482862712085759",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 813.8401994946098, y = 427.1544224466361},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241161, 1241162}
            }
          },
          ["175752482862712085760"] = {
            key = "175752482862712085760",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 893.4933214735863, y = 747.4592139170002},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241161, 1241162}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742428"] = {
      isStoryNode = true,
      key = "17544762212711742428",
      type = "StoryNode",
      name = "\229\136\176\229\174\182",
      pos = {x = 3120.2902931977815, y = -144.7241935449291},
      propsData = {
        QuestId = 12011411,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_11",
        QuestDeatil = "Content_120114_11",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175456309604420419060",
            startPort = "Fail",
            endQuest = "17544762212721742612",
            endPort = "Fail"
          },
          {
            startQuest = "175456309604420419060",
            startPort = "PassiveFail",
            endQuest = "17544762212721742612",
            endPort = "Fail"
          },
          {
            startQuest = "17561186748966314270",
            startPort = "Out",
            endQuest = "17561186748966314272",
            endPort = "In"
          },
          {
            startQuest = "17561186748966314272",
            startPort = "Out",
            endQuest = "17561186748966314271",
            endPort = "In"
          },
          {
            startQuest = "175456309604420419060",
            startPort = "Success",
            endQuest = "17561186748966314270",
            endPort = "In"
          },
          {
            startQuest = "1756199517021953392",
            startPort = "true",
            endQuest = "1756199517021953391",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742610",
            startPort = "QuestStart",
            endQuest = "1756199517021953392",
            endPort = "In"
          },
          {
            startQuest = "1756199517021953392",
            startPort = "true",
            endQuest = "175456309604420419060",
            endPort = "In"
          },
          {
            startQuest = "17574019616666836646",
            startPort = "Out",
            endQuest = "17574019616666836645",
            endPort = "In"
          },
          {
            startQuest = "17574019616666836645",
            startPort = "Out",
            endQuest = "17574019616666836647",
            endPort = "In"
          },
          {
            startQuest = "1756199517021953392",
            startPort = "false",
            endQuest = "17574019616666836646",
            endPort = "In"
          },
          {
            startQuest = "17574019616666836645",
            startPort = "Out",
            endQuest = "175456309604420419060",
            endPort = "In"
          },
          {
            startQuest = "17561186748966314272",
            startPort = "Out",
            endQuest = "17601852407913431",
            endPort = "In"
          },
          {
            startQuest = "17561186748966314271",
            startPort = "Out",
            endQuest = "17601852479103695",
            endPort = "In"
          },
          {
            startQuest = "17601852479103695",
            startPort = "Out",
            endQuest = "17544762212721742611",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17544762212721742610"] = {
            key = "17544762212721742610",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 68, y = 382},
            propsData = {ModeType = 0}
          },
          ["17544762212721742611"] = {
            key = "17544762212721742611",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2311.1218216318784, y = 295.97717538628353},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 4,
              IsWhite = false
            }
          },
          ["17544762212721742612"] = {
            key = "17544762212721742612",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1514, y = 508},
            propsData = {}
          },
          ["175456309604420419060"] = {
            key = "175456309604420419060",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 991.686274509804, y = 333.266106442577},
            propsData = {SpecialConfigId = 2080, BlackScreenImmediately = true}
          },
          ["1756117230796967379"] = {
            key = "1756117230796967379",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 963.2631578947369, y = -98.73684210526324},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1230071,
              GuideType = "N",
              GuidePointName = "Npc_Aote_Feina01_1230030"
            }
          },
          ["17561186748966314270"] = {
            key = "17561186748966314270",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1307.3421052631581, y = 287.1282894736842},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple41_42",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17561186748966314271"] = {
            key = "17561186748966314271",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1803.815789473684, y = 289.1546052631579},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple43",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 211002},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17561186748966314272"] = {
            key = "17561186748966314272",
            type = "TalkNode",
            name = "\227\128\144\231\153\189\233\184\159\229\133\136\231\148\159\227\128\145",
            pos = {x = 1549.1578947368423, y = 289.9506578947368},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple41_42",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1756199517021953391"] = {
            key = "1756199517021953391",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 660.0316722319819, y = 96.32988721804512},
            propsData = {
              VarName = "FeinaDay04HomeParty",
              VarValue = 1
            }
          },
          ["1756199517021953392"] = {
            key = "1756199517021953392",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 383.6826134823036, y = 345.09868421052636},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04HomeParty",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17574019616666836645"] = {
            key = "17574019616666836645",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 808.4342105263158, y = 669.9022556390978},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["17574019616666836646"] = {
            key = "17574019616666836646",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 647.3627819548873, y = 499.25939849624064},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17574019616666836647"] = {
            key = "17574019616666836647",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1021.6484962406014, y = 836.8308270676692},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17601852407913431"] = {
            key = "17601852407913431",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1806.2559966914805, y = 135.45651486401027},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230088}
            }
          },
          ["17601852479103695"] = {
            key = "17601852479103695",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2052.062448304384, y = 295.133934218849},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230088}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742429"] = {
      isStoryNode = true,
      key = "17544762212711742429",
      type = "StoryNode",
      name = "\231\173\137\229\190\133\229\133\179\229\141\1614\229\174\140\230\136\144",
      pos = {x = 2659.4528594659623, y = 239.00348947522585},
      propsData = {
        QuestId = 12011413,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_13",
        QuestDeatil = "Content_120114_13",
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
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17594839194625318040",
            startPort = "Success",
            endQuest = "17594839194625318041",
            endPort = "In"
          },
          {
            startQuest = "17594839194625318040",
            startPort = "Fail",
            endQuest = "17594839194625318042",
            endPort = "In"
          },
          {
            startQuest = "17594839194625318039",
            startPort = "Out",
            endQuest = "17594839194625318042",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742616",
            startPort = "QuestStart",
            endQuest = "17574017676701868339",
            endPort = "In"
          },
          {
            startQuest = "17574017676701868339",
            startPort = "true",
            endQuest = "17574017676701868338",
            endPort = "In"
          },
          {
            startQuest = "17574017676701868338",
            startPort = "Out",
            endQuest = "175755679420523224854",
            endPort = "In"
          },
          {
            startQuest = "175755679420523224854",
            startPort = "Out",
            endQuest = "17594839194625318039",
            endPort = "In"
          },
          {
            startQuest = "17574017676701868339",
            startPort = "false",
            endQuest = "17594839194625318040",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544762212721742616"] = {
            key = "17544762212721742616",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 996.5, y = 432.5},
            propsData = {ModeType = 0}
          },
          ["17544762212721742617"] = {
            key = "17544762212721742617",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2606.5, y = 197.36206896551727},
            propsData = {ModeType = 0}
          },
          ["17544762212721742618"] = {
            key = "17544762212721742618",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2678.5, y = 958},
            propsData = {}
          },
          ["17574017676701868338"] = {
            key = "17574017676701868338",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1728.8609481975968, y = 249.84210526315792},
            propsData = {
              VarName = "FeinaDay04UI",
              VarValue = 1
            }
          },
          ["17574017676701868339"] = {
            key = "17574017676701868339",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 1322.2130172674679, y = 420.05263157894734},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04UI",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175755679420523224854"] = {
            key = "175755679420523224854",
            type = "TalkNode",
            name = "\230\137\147\229\188\128\228\185\166\230\156\172",
            pos = {x = 1735.751879699248, y = 407.7481203007519},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/ActivityFeina/Feina04_Seq/Feina04_Book",
              InType = "BlendIn",
              OutType = "BlendOut",
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17594839194625318039"] = {
            key = "17594839194625318039",
            type = "OpenSytstemUINode",
            name = "\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185",
            pos = {x = 2031.766666666666, y = 407.5547619047618},
            propsData = {
              UIName = "ActivityFeinaEventLevelSelect"
            }
          },
          ["17594839194625318040"] = {
            key = "17594839194625318040",
            type = "ConditionNode",
            name = "\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 2031.166666666666, y = 627.445238095238},
            propsData = {ConditionId = 12011413}
          },
          ["17594839194625318041"] = {
            key = "17594839194625318041",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2608.8333333333335, y = 503.445238095238},
            propsData = {
              PortName = "\229\174\140\230\136\144\229\137\175\230\156\172"
            }
          },
          ["17594839194625318042"] = {
            key = "17594839194625318042",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2607.1666666666665, y = 663.445238095238},
            propsData = {
              PortName = "\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742430"] = {
      isStoryNode = true,
      key = "17544762212711742430",
      type = "StoryNode",
      name = "\229\155\158\229\134\176\230\185\150\229\159\142",
      pos = {x = 2859.6302273110905, y = -147.37941892726883},
      propsData = {
        QuestId = 12011410,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_10_2",
        QuestDeatil = "Content_120114_10_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SQTrigger_BackCity_1191878"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175455899549320416183",
            startPort = "Fail",
            endQuest = "17544762212721742622",
            endPort = "Fail"
          },
          {
            startQuest = "175455899549320416183",
            startPort = "PassiveFail",
            endQuest = "17544762212721742622",
            endPort = "Fail"
          },
          {
            startQuest = "17555148013045518528",
            startPort = "true",
            endQuest = "17555148013045518527",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742620",
            startPort = "QuestStart",
            endQuest = "17555148013045518528",
            endPort = "In"
          },
          {
            startQuest = "175455899549320416183",
            startPort = "Success",
            endQuest = "17560364840467520727",
            endPort = "In"
          },
          {
            startQuest = "17560364840467520727",
            startPort = "Out",
            endQuest = "17544762212721742621",
            endPort = "Success"
          },
          {
            startQuest = "17555148013045518528",
            startPort = "true",
            endQuest = "175455899549320416183",
            endPort = "In"
          },
          {
            startQuest = "175752498256712087362",
            startPort = "Out",
            endQuest = "175752498256712087361",
            endPort = "In"
          },
          {
            startQuest = "17555148013045518528",
            startPort = "false",
            endQuest = "175752498256712087362",
            endPort = "In"
          },
          {
            startQuest = "175752498256712087361",
            startPort = "Out",
            endQuest = "175455899549320416183",
            endPort = "In"
          },
          {
            startQuest = "175752498256712087361",
            startPort = "Out",
            endQuest = "175752499600712087656",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544762212721742620"] = {
            key = "17544762212721742620",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 5423.158154774286, y = 888.6004206828005},
            propsData = {ModeType = 0}
          },
          ["17544762212721742621"] = {
            key = "17544762212721742621",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 7003.183894356417, y = 857.8151849182808},
            propsData = {ModeType = 0}
          },
          ["17544762212721742622"] = {
            key = "17544762212721742622",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 6957.287878787879, y = 1031.545454545454},
            propsData = {}
          },
          ["175455899549320416183"] = {
            key = "175455899549320416183",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 6334.965243090243, y = 870.6410917513859},
            propsData = {SpecialConfigId = 2079, BlackScreenImmediately = true}
          },
          ["17555148013045518527"] = {
            key = "17555148013045518527",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 6042.2511846540965, y = 710.1790093964007},
            propsData = {
              VarName = "FeinaDay04BackCity02",
              VarValue = 1
            }
          },
          ["17555148013045518528"] = {
            key = "17555148013045518528",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 5781.147148044749, y = 881.8628038628038},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay04BackCity02",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17560364840467520727"] = {
            key = "17560364840467520727",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 6669.6373626373625, y = 857.6938061938062},
            propsData = {
              ModeType = 1,
              Id = 101105,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["175752498256712087361"] = {
            key = "175752498256712087361",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 6066.184825183455, y = 1143.6630782264015},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook09",
              IsUseCount = false
            }
          },
          ["175752498256712087362"] = {
            key = "175752498256712087362",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 6024.983507660399, y = 1010.0869253937271},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192032, 1192033}
            }
          },
          ["175752499600712087656"] = {
            key = "175752499600712087656",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 6116.983981693365, y = 1313.7175819984745},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192032, 1192033}
            }
          }
        },
        commentData = {}
      }
    },
    ["17544762212711742431"] = {
      isStoryNode = true,
      key = "17544762212711742431",
      type = "StoryNode",
      name = "\230\153\154\228\188\154",
      pos = {x = 3662.003407325763, y = -139.47181968134362},
      propsData = {
        QuestId = 12011412,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_12",
        QuestDeatil = "Content_120114_12",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17558648551761862400",
            startPort = "Out",
            endQuest = "17560368806469397055",
            endPort = "In"
          },
          {
            startQuest = "175603803404410346786",
            startPort = "Out",
            endQuest = "17558648551761862400",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742698",
            startPort = "QuestStart",
            endQuest = "175603803404410346786",
            endPort = "In"
          },
          {
            startQuest = "17544762212721742698",
            startPort = "QuestStart",
            endQuest = "1758202380647935510",
            endPort = "In"
          },
          {
            startQuest = "17558648551761862400",
            startPort = "Out",
            endQuest = "1758202527344935715",
            endPort = "In"
          },
          {
            startQuest = "17560368806469397055",
            startPort = "Out",
            endQuest = "17544762212721742699",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17544762212721742698"] = {
            key = "17544762212721742698",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1421.828947368421, y = 337.4868421052632},
            propsData = {ModeType = 0}
          },
          ["17544762212721742699"] = {
            key = "17544762212721742699",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2685.1705128205126, y = 351.51410256410253},
            propsData = {ModeType = 0}
          },
          ["17544762212721742700"] = {
            key = "17544762212721742700",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2737.8333333333335, y = 601.8333333333333},
            propsData = {}
          },
          ["17558648551761862400"] = {
            key = "17558648551761862400",
            type = "TalkNode",
            name = "SC03\227\128\144\232\191\135\229\156\186\227\128\145\230\153\154\228\188\154",
            pos = {x = 2059.666666666667, y = 323.7575757575757},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Activity/Activity_Feina/Activity_Feina_SC003/SQ_Activity_Feina_SC003",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17560368806469397055"] = {
            key = "17560368806469397055",
            type = "TalkNode",
            name = "\227\128\14444\227\128\145\232\135\170\232\168\128\232\135\170\232\175\173",
            pos = {x = 2336.5, y = 323.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple44",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175603803404410346786"] = {
            key = "175603803404410346786",
            type = "TalkNode",
            name = "\227\128\14443b\227\128\145\229\165\165\229\147\165\229\155\158\230\157\165\228\186\134",
            pos = {x = 1748.7236842105262, y = 323.7236842105263},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 120347161,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple43b",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 211002},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1758202380647935510"] = {
            key = "1758202380647935510",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1756.3946048230944, y = 107.7359839816933},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230088}
            }
          },
          ["1758202527344935715"] = {
            key = "1758202527344935715",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2301.3394208766063, y = 108.93999735961974},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230088}
            }
          }
        },
        commentData = {}
      }
    },
    ["17560370834409401448"] = {
      isStoryNode = true,
      key = "17560370834409401448",
      type = "StoryNode",
      name = "\229\135\186\233\151\168",
      pos = {x = 3383.3672875904404, y = -140.17973335648668},
      propsData = {
        QuestId = 12011415,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17560370834409401449",
            startPort = "QuestStart",
            endQuest = "17560377119799402967",
            endPort = "In"
          },
          {
            startQuest = "17560377119799402967",
            startPort = "Out",
            endQuest = "17560370834409401452",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17560370834409401449"] = {
            key = "17560370834409401449",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17560370834409401452"] = {
            key = "17560370834409401452",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1612, y = 330},
            propsData = {
              ModeType = 1,
              Id = 101105,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17560370834409401455"] = {
            key = "17560370834409401455",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17560377119799402967"] = {
            key = "17560377119799402967",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1196.5, y = 285.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034704,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple43a",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17574017033051867104"] = {
      isStoryNode = true,
      key = "17574017033051867104",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 2980.687554520457, y = 393.1984682264832},
      propsData = {
        QuestId = 12011420,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_13",
        QuestDeatil = "Content_120114_13",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 70154,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 54
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175751634154018027485"] = {
      isStoryNode = true,
      key = "175751634154018027485",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1361.6407894736842, y = -526.7727443609022},
      propsData = {
        QuestId = 12011450,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_0",
        QuestDeatil = "Content_120114_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175751639335318028334",
            startPort = "Out",
            endQuest = "175751639335318028333",
            endPort = "In"
          },
          {
            startQuest = "175751639335318028333",
            startPort = "Out",
            endQuest = "175751639335318028335",
            endPort = "In"
          },
          {
            startQuest = "175751634154018027486",
            startPort = "QuestStart",
            endQuest = "175751639335318028334",
            endPort = "In"
          },
          {
            startQuest = "175751639335318028335",
            startPort = "Out",
            endQuest = "175751634154018027489",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175751634154018027486"] = {
            key = "175751634154018027486",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175751634154018027489"] = {
            key = "175751634154018027489",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1688, y = 310},
            propsData = {ModeType = 0}
          },
          ["175751634154018027492"] = {
            key = "175751634154018027492",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1702, y = 514},
            propsData = {}
          },
          ["175751639335318028333"] = {
            key = "175751639335318028333",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1216, y = 312},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["175751639335318028334"] = {
            key = "175751639335318028334",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1114, y = 167.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["175751639335318028335"] = {
            key = "175751639335318028335",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1354, y = 496.5},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {
    ["17594837721525314731"] = {
      key = "17594837721525314731",
      name = "Phase01_Bonfire_Start",
      position = {x = 1295.1264524948733, y = -623.9507860560498},
      size = {width = 592, height = 296}
    },
    ["17594837757225314854"] = {
      key = "17594837757225314854",
      name = "Phase02_SandBox_Try&Obstruction",
      position = {x = 1972.7514524948733, y = -624.7007860560498},
      size = {width = 580, height = 298}
    },
    ["17594838657485316451"] = {
      key = "17594838657485316451",
      name = "Phase03_SandBox_Try&Obstruction&Challenge",
      position = {x = 1286.6308332590363, y = -233.984349955918},
      size = {width = 1172.7459102301211, height = 261.18391433128266}
    },
    ["17594838931965317368"] = {
      key = "17594838931965317368",
      name = "Phase04_Back&Review",
      position = {x = 2540.030423142837, y = -230.5805222047216},
      size = {width = 1358.3333333333333, height = 271.6666666666667}
    },
    ["17594878345145321658"] = {
      key = "17594878345145321658",
      name = "Phase05_Reward&Review",
      position = {x = 2548.1874959719685, y = 119.05943195876219},
      size = {width = 1011.1764705882355, height = 423.5294117647059}
    }
  }
}
