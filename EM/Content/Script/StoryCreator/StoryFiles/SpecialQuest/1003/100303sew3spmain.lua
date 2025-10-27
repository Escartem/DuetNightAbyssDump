return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1737099727650675610",
      startPort = "StoryStart",
      endStory = "1737099702013988",
      endPort = "In"
    },
    {
      startStory = "1737099702013988",
      startPort = "Success",
      endStory = "1740033517472519860",
      endPort = "In"
    },
    {
      startStory = "1740033517472519860",
      startPort = "Success",
      endStory = "1737099702014990",
      endPort = "In"
    },
    {
      startStory = "1737099702014990",
      startPort = "Success",
      endStory = "17483503991203333",
      endPort = "In"
    },
    {
      startStory = "17483503991203333",
      startPort = "Success",
      endStory = "1737099727651675611",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1737099702013988"] = {
      isStoryNode = true,
      key = "1737099702013988",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147",
      pos = {x = 1126.0591467356178, y = 283.8943187531422},
      propsData = {
        QuestId = 0,
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
            startQuest = "17370997020181010",
            startPort = "Fail",
            endQuest = "17370997020191012",
            endPort = "In"
          },
          {
            startQuest = "17370997020181008",
            startPort = "Out",
            endQuest = "17370997020191013",
            endPort = "In"
          },
          {
            startQuest = "17370997020181005",
            startPort = "QuestStart",
            endQuest = "17371013942251481913",
            endPort = "In"
          },
          {
            startQuest = "17371014236821483496",
            startPort = "Out",
            endQuest = "17371014236821483497",
            endPort = "In"
          },
          {
            startQuest = "17371014236821483497",
            startPort = "Out",
            endQuest = "17370997020181006",
            endPort = "Success"
          },
          {
            startQuest = "17371013942251481913",
            startPort = "false",
            endQuest = "17371014141171482902",
            endPort = "In"
          },
          {
            startQuest = "17371013942251481913",
            startPort = "true",
            endQuest = "17370997020181008",
            endPort = "In"
          },
          {
            startQuest = "17370997020181008",
            startPort = "Out",
            endQuest = "1740222532727788652",
            endPort = "In"
          },
          {
            startQuest = "1740222532727788652",
            startPort = "Out",
            endQuest = "17400331484448089",
            endPort = "In"
          },
          {
            startQuest = "17370997020181008",
            startPort = "Out",
            endQuest = "17453953431974126168",
            endPort = "In"
          },
          {
            startQuest = "17370997020201016",
            startPort = "Out",
            endQuest = "17370997020181007",
            endPort = "Fail"
          },
          {
            startQuest = "17371014141171482902",
            startPort = "Out",
            endQuest = "17370997020191011",
            endPort = "In"
          },
          {
            startQuest = "17370997020191011",
            startPort = "Out",
            endQuest = "17370997020181006",
            endPort = "Success"
          },
          {
            startQuest = "17371013942251481913",
            startPort = "true",
            endQuest = "17370997020201016",
            endPort = "In"
          },
          {
            startQuest = "17400331484448089",
            startPort = "Out",
            endQuest = "17428902329441047727",
            endPort = "In"
          },
          {
            startQuest = "17428902329441047727",
            startPort = "Out",
            endQuest = "17400329570295540",
            endPort = "In"
          },
          {
            startQuest = "17400329570295540",
            startPort = "Out",
            endQuest = "17371014236821483496",
            endPort = "In"
          },
          {
            startQuest = "17388258109212834",
            startPort = "Out",
            endQuest = "17503226125542128",
            endPort = "In"
          }
        },
        nodeData = {
          ["17370997020181005"] = {
            key = "17370997020181005",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 380, y = 446},
            propsData = {ModeType = 0}
          },
          ["17370997020181006"] = {
            key = "17370997020181006",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3587.9157894736836, y = 585.7368421052631},
            propsData = {ModeType = 0}
          },
          ["17370997020181007"] = {
            key = "17370997020181007",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3580, y = 908},
            propsData = {}
          },
          ["17370997020181008"] = {
            key = "17370997020181008",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1435.2819321029856, y = 313.1994486440821},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101701,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_1720218"
            }
          },
          ["17370997020181010"] = {
            key = "17370997020181010",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 587.7950158797516, y = -530.1272681929543},
            propsData = {SpecialConfigId = 1039, BlackScreenImmediately = false}
          },
          ["17370997020191011"] = {
            key = "17370997020191011",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2363.380185603721, y = 580.7508773824403},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "100304sew3sp1prespwanpoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17370997020191012"] = {
            key = "17370997020191012",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 965.3846452228881, y = -562.7252923766683},
            propsData = {
              ModeType = 0,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17370997020191013"] = {
            key = "17370997020191013",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1542.369030556647, y = 25.227411186260383},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034715,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17370997020201016"] = {
            key = "17370997020201016",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1437.233490011714, y = 1047.446235910632},
            propsData = {}
          },
          ["17371013942251481913"] = {
            key = "17371013942251481913",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 862.063350162199, y = 517.6030404611749},
            propsData = {
              FunctionName = "Equal",
              VarName = "sew100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17371014141171482902"] = {
            key = "17371014141171482902",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1431.4726203617445, y = 586.2750897380632},
            propsData = {VarName = "sew100303"}
          },
          ["17371014236821483496"] = {
            key = "17371014236821483496",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 3175.3855812531783, y = 314.6307716191982},
            propsData = {VarName = "sew100303", VarValue = 1}
          },
          ["17371014236821483497"] = {
            key = "17371014236821483497",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 3534.5341660017625, y = 306.7106250990511},
            propsData = {VarName = "sew100303"}
          },
          ["17388258109212834"] = {
            key = "17388258109212834",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2942.8571428571427, y = 80.2857142857143},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew2nddoorunlock",
              UnitId = -1
            }
          },
          ["17400329297515292"] = {
            key = "17400329297515292",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1749.3035714285716, y = -401.0178571428571},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720537,
              GuideType = "M",
              GuidePointName = "Mechanism_1720537"
            }
          },
          ["17400329570295540"] = {
            key = "17400329570295540",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2761.1428571428573, y = 313.7142857142857},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100341,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1720535",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10038012,
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
          ["17400331484448089"] = {
            key = "17400331484448089",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2060, y = 324},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720534,
                1720535,
                1720536
              }
            }
          },
          ["1740222532727788652"] = {
            key = "1740222532727788652",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1742, y = 342},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720553,
                1720554,
                1720555,
                1720556,
                1720557,
                1720558,
                1720559,
                1720560,
                1720561,
                1720562,
                1720563,
                1720564,
                1720567,
                1720568,
                1720569,
                1720570,
                1720573,
                1720574,
                1720575,
                1720576,
                1720577,
                1720578,
                1720579,
                1720580,
                1720581,
                1720582,
                1720583,
                1720584,
                1720585,
                1720586,
                1720587,
                1720588,
                1720589,
                1720590,
                1720591,
                1720594,
                1720539,
                1720540,
                1720541,
                1720542,
                1720543,
                1720544,
                1720545,
                1720546,
                1720547,
                1720548,
                1720549,
                1720550,
                1720594,
                1720595,
                1720596,
                1720597,
                1720598,
                1720599,
                1720600,
                1720601,
                1720602,
                1720603,
                1720572,
                1720605
              }
            }
          },
          ["17428902329441047727"] = {
            key = "17428902329441047727",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2381.428571428571, y = 311.4285714285714},
            propsData = {
              NewDescription = "QuestName_100303sp201",
              NewDetail = "QuestDesc_100303sp201",
              SubTaskTargetIndex = 0
            }
          },
          ["17453953431974126168"] = {
            key = "17453953431974126168",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1722, y = 182},
            propsData = {
              NewDescription = "QuestName_1003plus17",
              NewDetail = "QuestDesc_1003plus17",
              SubTaskTargetIndex = 0
            }
          },
          ["17503226125542128"] = {
            key = "17503226125542128",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 3253.4285714285716, y = 63.71428571428567},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720763,
              GuideType = "M",
              GuidePointName = "Mechanism_1720763"
            }
          }
        },
        commentData = {}
      }
    },
    ["1737099702014990"] = {
      isStoryNode = true,
      key = "1737099702014990",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147\229\176\143\229\137\167\229\156\186\232\176\131\230\159\165",
      pos = {x = 1778.3058823529416, y = 283.04097536450473},
      propsData = {
        QuestId = 0,
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
            startQuest = "17370997020321090",
            startPort = "Fail",
            endQuest = "17370997020321091",
            endPort = "In"
          },
          {
            startQuest = "17370997020351107",
            startPort = "Out",
            endQuest = "17370997020351108",
            endPort = "In"
          },
          {
            startQuest = "17371015786861487877",
            startPort = "false",
            endQuest = "17371015786861487878",
            endPort = "In"
          },
          {
            startQuest = "17370997020311086",
            startPort = "QuestStart",
            endQuest = "17371015786861487877",
            endPort = "In"
          },
          {
            startQuest = "1738828989462760104",
            startPort = "Out",
            endQuest = "1738829064994761122",
            endPort = "In"
          },
          {
            startQuest = "17371015786861487877",
            startPort = "true",
            endQuest = "17428903133811049718",
            endPort = "In"
          },
          {
            startQuest = "17428903133811049718",
            startPort = "Out",
            endQuest = "17370997020321089",
            endPort = "In"
          },
          {
            startQuest = "17370997020331095",
            startPort = "Out",
            endQuest = "17453955096144129315",
            endPort = "In"
          },
          {
            startQuest = "17371015786861487877",
            startPort = "true",
            endQuest = "17458298879741111452",
            endPort = "In"
          },
          {
            startQuest = "17458298879741111452",
            startPort = "Out",
            endQuest = "17479876059753463582",
            endPort = "In"
          },
          {
            startQuest = "17483504419536130",
            startPort = "Out",
            endQuest = "17483504419536131",
            endPort = "In"
          },
          {
            startQuest = "17483504419536131",
            startPort = "Out",
            endQuest = "17370997020311087",
            endPort = "Success"
          },
          {
            startQuest = "17371015786861487878",
            startPort = "Out",
            endQuest = "17483504683957387",
            endPort = "In"
          },
          {
            startQuest = "17483504683957387",
            startPort = "Out",
            endQuest = "17370997020311087",
            endPort = "Success"
          },
          {
            startQuest = "17370997020331095",
            startPort = "Out",
            endQuest = "17484403192841160356",
            endPort = "In"
          },
          {
            startQuest = "17484403192841160356",
            startPort = "Out",
            endQuest = "17370997020351110",
            endPort = "In"
          },
          {
            startQuest = "17370997020351110",
            startPort = "Out",
            endQuest = "17484404750621161707",
            endPort = "In"
          },
          {
            startQuest = "17484405164681163031",
            startPort = "Out",
            endQuest = "17370997020351111",
            endPort = "In"
          },
          {
            startQuest = "17370997020351111",
            startPort = "Out",
            endQuest = "17484405195331163113",
            endPort = "In"
          },
          {
            startQuest = "17484405273571163360",
            startPort = "Out",
            endQuest = "17370997020361113",
            endPort = "In"
          },
          {
            startQuest = "17370997020361113",
            startPort = "Out",
            endQuest = "17484405327631163480",
            endPort = "In"
          },
          {
            startQuest = "17370997020321089",
            startPort = "Out",
            endQuest = "174851596477018311040",
            endPort = "In"
          },
          {
            startQuest = "17370997020331095",
            startPort = "Out",
            endQuest = "174851662675018312185",
            endPort = "In"
          },
          {
            startQuest = "17371015786861487877",
            startPort = "true",
            endQuest = "17370997020331093",
            endPort = "In"
          },
          {
            startQuest = "17370997020331093",
            startPort = "Out",
            endQuest = "17506643057713433",
            endPort = "In"
          },
          {
            startQuest = "17506643057713433",
            startPort = "Out",
            endQuest = "17370997020321088",
            endPort = "Fail"
          },
          {
            startQuest = "174851596477018311040",
            startPort = "Out",
            endQuest = "17506643044343386",
            endPort = "In"
          },
          {
            startQuest = "17506643044343386",
            startPort = "Out",
            endQuest = "17370997020331095",
            endPort = "In"
          },
          {
            startQuest = "17484404750621161707",
            startPort = "Out",
            endQuest = "17484405164681163031",
            endPort = "In"
          },
          {
            startQuest = "17484405195331163113",
            startPort = "Out",
            endQuest = "17509340426254938",
            endPort = "In"
          },
          {
            startQuest = "17484381162872502",
            startPort = "Out",
            endQuest = "1738828989462760104",
            endPort = "In"
          },
          {
            startQuest = "1750935350174667883",
            startPort = "Out",
            endQuest = "17484381162872502",
            endPort = "In"
          },
          {
            startQuest = "17509340426254938",
            startPort = "Out",
            endQuest = "17520438327514934",
            endPort = "In"
          },
          {
            startQuest = "17520438327514934",
            startPort = "Out",
            endQuest = "17484405273571163360",
            endPort = "In"
          },
          {
            startQuest = "17484405327631163480",
            startPort = "Out",
            endQuest = "17520439079995960",
            endPort = "In"
          },
          {
            startQuest = "17520439079995960",
            startPort = "Out",
            endQuest = "17520439147186191",
            endPort = "In"
          },
          {
            startQuest = "17520439147186191",
            startPort = "Out",
            endQuest = "1750935350174667883",
            endPort = "In"
          },
          {
            startQuest = "1738828989462760104",
            startPort = "Out",
            endQuest = "17520453436881268013",
            endPort = "In"
          },
          {
            startQuest = "17370997020361118",
            startPort = "Out",
            endQuest = "17546211675343263",
            endPort = "In"
          },
          {
            startQuest = "17458299593621112794",
            startPort = "Out",
            endQuest = "17483504419536130",
            endPort = "In"
          },
          {
            startQuest = "1750935350174667883",
            startPort = "Out",
            endQuest = "17546239839682574",
            endPort = "In"
          },
          {
            startQuest = "17520439147186191",
            startPort = "Out",
            endQuest = "17546240217712899",
            endPort = "In"
          },
          {
            startQuest = "17546240217712899",
            startPort = "Out",
            endQuest = "17546239740682373",
            endPort = "In"
          },
          {
            startQuest = "17546211675343263",
            startPort = "Out",
            endQuest = "174851667828518312799",
            endPort = "In"
          },
          {
            startQuest = "1738829064994761122",
            startPort = "Out",
            endQuest = "17546211214482506",
            endPort = "In"
          },
          {
            startQuest = "17546211214482506",
            startPort = "Out",
            endQuest = "17428903477481050307",
            endPort = "In"
          },
          {
            startQuest = "17428903477481050307",
            startPort = "Out",
            endQuest = "17370997020351107",
            endPort = "In"
          },
          {
            startQuest = "17509340426254938",
            startPort = "Out",
            endQuest = "1755588467182615104",
            endPort = "In"
          },
          {
            startQuest = "17520438327514934",
            startPort = "Out",
            endQuest = "1755588869514616881",
            endPort = "In"
          },
          {
            startQuest = "17520439079995960",
            startPort = "Out",
            endQuest = "1755589004573617788",
            endPort = "In"
          },
          {
            startQuest = "17370997020351108",
            startPort = "Out",
            endQuest = "17370997020361118",
            endPort = "In"
          },
          {
            startQuest = "174851667828518312799",
            startPort = "Out",
            endQuest = "17557754810298295",
            endPort = "In"
          },
          {
            startQuest = "17557754810298295",
            startPort = "Out",
            endQuest = "17370997020331096",
            endPort = "In"
          },
          {
            startQuest = "17370997020331096",
            startPort = "Out",
            endQuest = "17458299593621112794",
            endPort = "In"
          },
          {
            startQuest = "17484405327631163480",
            startPort = "Out",
            endQuest = "17579903313615153",
            endPort = "In"
          }
        },
        nodeData = {
          ["17370997020311086"] = {
            key = "17370997020311086",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -403.63636363636385, y = 420.3636363636364},
            propsData = {ModeType = 0}
          },
          ["17370997020311087"] = {
            key = "17370997020311087",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3520, y = 968},
            propsData = {ModeType = 0}
          },
          ["17370997020321088"] = {
            key = "17370997020321088",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2886, y = 1384},
            propsData = {}
          },
          ["17370997020321089"] = {
            key = "17370997020321089",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 506.19643706239685, y = 132.12926289271107},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1740029,
              GuideType = "M",
              GuidePointName = "Mechanism_1740029"
            }
          },
          ["17370997020321090"] = {
            key = "17370997020321090",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 646.0098899439308, y = -502.5851070485552},
            propsData = {SpecialConfigId = 1038, BlackScreenImmediately = false}
          },
          ["17370997020321091"] = {
            key = "17370997020321091",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1023.8000000000002, y = -596.7},
            propsData = {
              ModeType = 1,
              Id = 101703,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17370997020331093"] = {
            key = "17370997020331093",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 911.1019110643456, y = 1252.4800687557802},
            propsData = {}
          },
          ["17370997020331095"] = {
            key = "17370997020331095",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 888.7338588140285, y = 403.6690664856327},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple42",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17370997020331096"] = {
            key = "17370997020331096",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 3603.37675394779, y = 305.72658944083355},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple45",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100327,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100356,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100327},
                {TalkActorType = "Npc", TalkActorId = 100356}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17370997020331099"] = {
            key = "17370997020331099",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 2439.675114939255, y = -449.51540843058274},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034909,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17370997020351107"] = {
            key = "17370997020351107",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 3357.450824046961, y = 80.4064221640041},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "sew03tiaopin",
              UnitId = -1
            }
          },
          ["17370997020351108"] = {
            key = "17370997020351108",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 3684.096213384144, y = 72.99616575374775},
            propsData = {
              SendMessage = "",
              FinishCondition = "sew03tiaopinfinish"
            }
          },
          ["17370997020351110"] = {
            key = "17370997020351110",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1554.9130690259067, y = 281.28620703342347},
            propsData = {StaticCreatorId = 1740103, ObservationPointName = ""}
          },
          ["17370997020351111"] = {
            key = "17370997020351111",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1557.8160102023785, y = 473.20973644518824},
            propsData = {StaticCreatorId = 1740104, ObservationPointName = ""}
          },
          ["17370997020361113"] = {
            key = "17370997020361113",
            type = "FirstObservationCompleteNode",
            name = "\233\166\150\230\172\161\232\167\130\229\175\159\229\174\140\230\136\144",
            pos = {x = 1292.7831293577328, y = 778.7363578629862},
            propsData = {StaticCreatorId = 1740105, ObservationPointName = ""}
          },
          ["17370997020361114"] = {
            key = "17370997020361114",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3045.076869930884, y = 82.88869572120605},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1740073}
            }
          },
          ["17370997020361115"] = {
            key = "17370997020361115",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3442.7435365975516, y = -395.8318170993068},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1740073}
            }
          },
          ["17370997020361118"] = {
            key = "17370997020361118",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2447.9907700658437, y = 323.22436691276},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "sew03tiaopindelete",
              UnitId = -1
            }
          },
          ["17371015786861487877"] = {
            key = "17371015786861487877",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = -46.34099873613661, y = 492.0276117251923},
            propsData = {
              FunctionName = "Equal",
              VarName = "sew100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "2"}
              }
            }
          },
          ["17371015786861487878"] = {
            key = "17371015786861487878",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1589.9773623725, y = 1076.8814791838988},
            propsData = {VarName = "sew100303"}
          },
          ["1738828989462760104"] = {
            key = "1738828989462760104",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2428, y = 94},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034817,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple43-44",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1738829064994761122"] = {
            key = "1738829064994761122",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2720, y = 75.2},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple43-44",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1740122446185534265"] = {
            key = "1740122446185534265",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 4221.2, y = 394.79999999999995},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC002/SQ_OBT0103_SC002_B",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
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
          ["17422829188442878"] = {
            key = "17422829188442878",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2306, y = 1738},
            propsData = {
              MessageType = "GameMode",
              MessageContent = -1,
              UnitId = -1
            }
          },
          ["17428903133811049718"] = {
            key = "17428903133811049718",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 505.17748917748895, y = -37.155844155844136},
            propsData = {
              NewDescription = "QuestName_100303sp204",
              NewDetail = "QuestDesc_100303sp204",
              SubTaskTargetIndex = 0
            }
          },
          ["17428903477481050307"] = {
            key = "17428903477481050307",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3165.75, y = -60.25},
            propsData = {
              NewDescription = "QuestName_100303sp205",
              NewDetail = "QuestDesc_100303sp205",
              SubTaskTargetIndex = 0
            }
          },
          ["17428904110961051934"] = {
            key = "17428904110961051934",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3932.838888888889, y = 547.6555555555557},
            propsData = {
              NewDescription = "QuestName_100303sp206",
              NewDetail = "QuestDesc_100303sp206",
              SubTaskTargetIndex = 0
            }
          },
          ["17453955096144129315"] = {
            key = "17453955096144129315",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1005.75, y = 138.49999999999994},
            propsData = {
              NewDescription = "QuestName_1003plus18",
              NewDetail = "QuestDesc_1003plus18",
              SubTaskTargetIndex = 0
            }
          },
          ["17458298879741111452"] = {
            key = "17458298879741111452",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 166.02272727272705, y = -184.18881118881097},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1740072,
                1740103,
                1740104,
                1740105
              }
            }
          },
          ["17458299593621112794"] = {
            key = "17458299593621112794",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2452.75, y = 725.9829059829061},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1740072}
            }
          },
          ["17479876059753463582"] = {
            key = "17479876059753463582",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 511.272727272727, y = -191.72727272727272},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10037813,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17483504419536130"] = {
            key = "17483504419536130",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2775.6161838161843, y = 716.2457875457878},
            propsData = {VarName = "sew100303", VarValue = 3}
          },
          ["17483504419536131"] = {
            key = "17483504419536131",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 3123.0504828504827, y = 715.7542124542122},
            propsData = {VarName = "sew100303"}
          },
          ["17483504683957387"] = {
            key = "17483504683957387",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2322.6666666666674, y = 986.6666666666665},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew03boss",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17484381162872502"] = {
            key = "17484381162872502",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2182.083333333333, y = 89.91666666666671},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1740103,
                1740104,
                1740105
              }
            }
          },
          ["17484403192841160356"] = {
            key = "17484403192841160356",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1297.0833333333333, y = 287.41666666666674},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1740103"
            }
          },
          ["17484404750621161707"] = {
            key = "17484404750621161707",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1810.6060606060603, y = 290.8560606060606},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1740103"
            }
          },
          ["17484405164681163031"] = {
            key = "17484405164681163031",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1296.8560606060603, y = 474.6060606060605},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1740104"
            }
          },
          ["17484405195331163113"] = {
            key = "17484405195331163113",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1814.35606060606, y = 482.1060606060605},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1740104"
            }
          },
          ["17484405273571163360"] = {
            key = "17484405273571163360",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1822.0163170163169, y = 633.5483682983681},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_1740105"
            }
          },
          ["17484405327631163480"] = {
            key = "17484405327631163480",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1552.3452643847374, y = 797.7150349650348},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_1740105"
            }
          },
          ["174851596477018311040"] = {
            key = "174851596477018311040",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 474.94805194805195, y = 291.97402597402606},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851662675018312185"] = {
            key = "174851662675018312185",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 988.7234154734156, y = 618.3982683982686},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["174851667828518312799"] = {
            key = "174851667828518312799",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 3007.164862914863, y = 310.6810966810972},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17485211847911750255"] = {
            key = "17485211847911750255",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 3951, y = 368.95512820512823},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0074_story_encounter_with_blues",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17506643044343386"] = {
            key = "17506643044343386",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 628.0378787878792, y = 463.9924242424241},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "XiaojuchangPuzzleInitiate",
              UnitId = -1
            }
          },
          ["17506643057713433"] = {
            key = "17506643057713433",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1315.3106060606065, y = 1271.6704545454543},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "XiaojuchangPuzzleStop",
              UnitId = -1
            }
          },
          ["17509340426254938"] = {
            key = "17509340426254938",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1295.0566845435274, y = 619.5214127977287},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "XiaojuchangPuzzleStart",
              UnitId = -1
            }
          },
          ["1750935350174667883"] = {
            key = "1750935350174667883",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2120.2768122419156, y = 368.53995946844935},
            propsData = {
              IsNpcNode = false,
              TalkType = "LevelSequence",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Region/Imperial/Sew/LS_Sew03_Xiaojuchang01",
              BlendInTime = 0,
              BlendOutTime = 0,
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
          ["17520438327514934"] = {
            key = "17520438327514934",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1561.9523809523805, y = 625.4761904761904},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1740106,
              StateId = 495004,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_1740106"
            }
          },
          ["17520439079995960"] = {
            key = "17520439079995960",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1820.285714285714, y = 790.4761904761904},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1740107,
              StateId = 495004,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_1740107"
            }
          },
          ["17520439147186191"] = {
            key = "17520439147186191",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2118.6190476190477, y = 780.4761904761905},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1740109,
              StateId = 495004,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_1740109"
            }
          },
          ["17520453436881268013"] = {
            key = "17520453436881268013",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2607.6190476190477, y = -109.85714285714278},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew03boss",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17546211214482506"] = {
            key = "17546211214482506",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2905.166666666666, y = -44.33333333333326},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1740114,
                1740115,
                1740116
              }
            }
          },
          ["17546211675343263"] = {
            key = "17546211675343263",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2714.2499999999995, y = 319.33333333333354},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1740114,
                1740115,
                1740116
              }
            }
          },
          ["17546239740682373"] = {
            key = "17546239740682373",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2532.596362229102, y = 468.42569659442734},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "XiaojuchangPuzzleStop",
              UnitId = -1
            }
          },
          ["17546239839682574"] = {
            key = "17546239839682574",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1886.3463622291024, y = 147.17569659442734},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "XiaojuchangPuzzleFinish",
              UnitId = -1
            }
          },
          ["17546240217712899"] = {
            key = "17546240217712899",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2280.0963622291024, y = 573.4256965944273},
            propsData = {WaitTime = 1}
          },
          ["1755588467182615104"] = {
            key = "1755588467182615104",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1283.25, y = -104},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034825,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1755588869514616881"] = {
            key = "1755588869514616881",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1598.25, y = -92.75},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034827,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1755589004573617788"] = {
            key = "1755589004573617788",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1872, y = -98.07894736842105},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034828,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17557754810298295"] = {
            key = "17557754810298295",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3319.555555555555, y = 302.4444444444443},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10034909,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["17579903313615153"] = {
            key = "17579903313615153",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1809.033799533798, y = 938.253302253302},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "XiaojuchangPuzzle02",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1737099727650675610"] = {
      isStoryNode = true,
      key = "1737099727650675610",
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
    ["1737099727651675611"] = {
      isStoryNode = true,
      key = "1737099727651675611",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2646.5, y = 291},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1740033517472519860"] = {
      isStoryNode = true,
      key = "1740033517472519860",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147\229\176\143\229\137\167\229\156\186\229\164\150",
      pos = {x = 1457.55, y = 280.72712418300654},
      propsData = {
        QuestId = 0,
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
            startQuest = "1740033517473519870",
            startPort = "PassiveFail",
            endQuest = "1740033517473519871",
            endPort = "In"
          },
          {
            startQuest = "1740033517473519870",
            startPort = "Fail",
            endQuest = "1740033517473519872",
            endPort = "In"
          },
          {
            startQuest = "1740033517473519865",
            startPort = "QuestStart",
            endQuest = "1740033517474519879",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519881",
            startPort = "Out",
            endQuest = "1740033517474519882",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519879",
            startPort = "false",
            endQuest = "1740033517474519880",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519876",
            startPort = "Out",
            endQuest = "1740033517474519878",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519878",
            startPort = "Out",
            endQuest = "1740033517473519867",
            endPort = "Fail"
          },
          {
            startQuest = "1740033517474519879",
            startPort = "true",
            endQuest = "17428902641981048586",
            endPort = "In"
          },
          {
            startQuest = "17428902872191049131",
            startPort = "Out",
            endQuest = "1740033517474519884",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519880",
            startPort = "Out",
            endQuest = "174575664062613124",
            endPort = "In"
          },
          {
            startQuest = "17458290251914502",
            startPort = "Out",
            endQuest = "17458290378074825",
            endPort = "In"
          },
          {
            startQuest = "17458290378074825",
            startPort = "Out",
            endQuest = "17458290455825161",
            endPort = "In"
          },
          {
            startQuest = "17458290455825161",
            startPort = "Out",
            endQuest = "17458290514995507",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519884",
            startPort = "Out",
            endQuest = "17458290251914502",
            endPort = "In"
          },
          {
            startQuest = "17458291335567066",
            startPort = "Out",
            endQuest = "17458291335567067",
            endPort = "In"
          },
          {
            startQuest = "17458290514995507",
            startPort = "Out",
            endQuest = "17458291335567066",
            endPort = "In"
          },
          {
            startQuest = "17458290251914502",
            startPort = "Out",
            endQuest = "1740033517474519886",
            endPort = "In"
          },
          {
            startQuest = "17458291335567066",
            startPort = "Out",
            endQuest = "1740033517474519887",
            endPort = "In"
          },
          {
            startQuest = "17458290251914502",
            startPort = "Out",
            endQuest = "174851589174118308519",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519875",
            startPort = "Out",
            endQuest = "174851595362918310573",
            endPort = "In"
          },
          {
            startQuest = "174851595362918310573",
            startPort = "Out",
            endQuest = "1740033517474519881",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519879",
            startPort = "true",
            endQuest = "1740033517474519876",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519884",
            startPort = "Out",
            endQuest = "1740033517474519875",
            endPort = "In"
          },
          {
            startQuest = "17503227054305648",
            startPort = "Out",
            endQuest = "17503227054305649",
            endPort = "In"
          },
          {
            startQuest = "17428902641981048586",
            startPort = "Out",
            endQuest = "17503227054305648",
            endPort = "In"
          },
          {
            startQuest = "17503227054305649",
            startPort = "Out",
            endQuest = "17428902872191049131",
            endPort = "In"
          },
          {
            startQuest = "17503227054305649",
            startPort = "Out",
            endQuest = "17502319616242428",
            endPort = "In"
          },
          {
            startQuest = "1740033517474519882",
            startPort = "Out",
            endQuest = "17544810089943097",
            endPort = "In"
          },
          {
            startQuest = "17544810089943097",
            startPort = "Out",
            endQuest = "1740033517473519866",
            endPort = "Success"
          },
          {
            startQuest = "174575664062613124",
            startPort = "Out",
            endQuest = "17544811282884333",
            endPort = "In"
          },
          {
            startQuest = "17544811282884333",
            startPort = "Out",
            endQuest = "1740033517473519866",
            endPort = "Success"
          },
          {
            startQuest = "17503227054305649",
            startPort = "Out",
            endQuest = "17555881754603785",
            endPort = "In"
          }
        },
        nodeData = {
          ["1740033517473519865"] = {
            key = "1740033517473519865",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 190.58823529411768, y = 323.52941176470586},
            propsData = {ModeType = 0}
          },
          ["1740033517473519866"] = {
            key = "1740033517473519866",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3579.9157894736836, y = 575.7368421052631},
            propsData = {ModeType = 0}
          },
          ["1740033517473519867"] = {
            key = "1740033517473519867",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3580, y = 908},
            propsData = {}
          },
          ["1740033517473519869"] = {
            key = "1740033517473519869",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1347.3186906660603, y = -387.2821720743805},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1740070,
              GuideType = "M",
              GuidePointName = "Mechanism_1740070"
            }
          },
          ["1740033517473519870"] = {
            key = "1740033517473519870",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 587.7950158797516, y = -530.1272681929543},
            propsData = {SpecialConfigId = 1039, BlackScreenImmediately = false}
          },
          ["1740033517473519871"] = {
            key = "1740033517473519871",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 951.3801856037212, y = -371.2491226175597},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "100304sew3sp1prespwanpoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1740033517473519872"] = {
            key = "1740033517473519872",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 965.3846452228881, y = -562.7252923766683},
            propsData = {
              ModeType = 0,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1740033517474519875"] = {
            key = "1740033517474519875",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2164.595037367738, y = 267.2989825711577},
            propsData = {
              SendMessage = "",
              FinishCondition = "cp2sew3prefinish"
            }
          },
          ["1740033517474519876"] = {
            key = "1740033517474519876",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1279.233490011714, y = 919.4462359106319},
            propsData = {}
          },
          ["1740033517474519878"] = {
            key = "1740033517474519878",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2351, y = 896},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew3prestop",
              UnitId = -1
            }
          },
          ["1740033517474519879"] = {
            key = "1740033517474519879",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 658.4162913386695, y = 365.3677463435278},
            propsData = {
              FunctionName = "Equal",
              VarName = "sew100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["1740033517474519880"] = {
            key = "1740033517474519880",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1311.4726203617445, y = 582.2750897380632},
            propsData = {VarName = "sew100303"}
          },
          ["1740033517474519881"] = {
            key = "1740033517474519881",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2824.1355812531783, y = 283.1307716191982},
            propsData = {VarName = "sew100303", VarValue = 2}
          },
          ["1740033517474519882"] = {
            key = "1740033517474519882",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 3137.5698802874767, y = 284.3891965276225},
            propsData = {VarName = "sew100303"}
          },
          ["1740033517474519884"] = {
            key = "1740033517474519884",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1768.611111111111, y = 289.4999999999999},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew3prestart",
              UnitId = -1
            }
          },
          ["1740033517474519885"] = {
            key = "1740033517474519885",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1483, y = 73},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10037801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1740033517474519886"] = {
            key = "1740033517474519886",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2242.142857142857, y = -185.42857142857153},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10037808,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1740033517474519887"] = {
            key = "1740033517474519887",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 4001.5714285714275, y = -230.4285714285716},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10037812,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17428902641981048586"] = {
            key = "17428902641981048586",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1202, y = 74},
            propsData = {
              NewDescription = "QuestName_100303sp202",
              NewDetail = "QuestDesc_100303sp202",
              SubTaskTargetIndex = 0
            }
          },
          ["17428902872191049131"] = {
            key = "17428902872191049131",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1765.7777777777778, y = 478.9542483660131},
            propsData = {
              NewDescription = "QuestName_100303sp203",
              NewDetail = "QuestDesc_100303sp203",
              SubTaskTargetIndex = 0
            }
          },
          ["174575664062613124"] = {
            key = "174575664062613124",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2397.784612446377, y = 582.0094346829642},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "100304sew3sp1battlespwanpoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17458290251914502"] = {
            key = "17458290251914502",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2232.3529411764703, y = 19.794896280190763},
            propsData = {
              SendMessage = "",
              FinishCondition = "cp2sew3pre01"
            }
          },
          ["17458290378074825"] = {
            key = "17458290378074825",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2568.823529411765, y = 29.206660986073153},
            propsData = {
              NewDescription = "QuestName_1003plus28",
              NewDetail = "QuestDesc_1003plus28",
              SubTaskTargetIndex = 0
            }
          },
          ["17458290455825161"] = {
            key = "17458290455825161",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2931.1764705882356, y = 16.26548451548492},
            propsData = {
              SendMessage = "",
              FinishCondition = "cp2sew3pre02"
            }
          },
          ["17458290514995507"] = {
            key = "17458290514995507",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3262.9411764705874, y = 31.559602162543666},
            propsData = {
              NewDescription = "QuestName_1003plus29",
              NewDetail = "QuestDesc_1003plus29",
              SubTaskTargetIndex = 0
            }
          },
          ["17458291335567066"] = {
            key = "17458291335567066",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 3661.764705882353, y = 19.794896280190635},
            propsData = {
              SendMessage = "",
              FinishCondition = "cp2sew3pre03"
            }
          },
          ["17458291335567067"] = {
            key = "17458291335567067",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3993.529411764705, y = 35.08901392724938},
            propsData = {
              NewDescription = "QuestName_1003plus30",
              NewDetail = "QuestDesc_1003plus30",
              SubTaskTargetIndex = 0
            }
          },
          ["174851589174118308519"] = {
            key = "174851589174118308519",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2573.681818181818, y = -172.58333333333326},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/level/stage1/combat01_state2_r01",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851595362918310573"] = {
            key = "174851595362918310573",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2496.431818181818, y = 280.16666666666674},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17502319616242428"] = {
            key = "17502319616242428",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1770, y = 81.99999999999989},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720534,
                1720535,
                1720536
              }
            }
          },
          ["17503227054305648"] = {
            key = "17503227054305648",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1201.3809523809525, y = 293.702380952381},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew2nddoorunlock",
              UnitId = -1
            }
          },
          ["17503227054305649"] = {
            key = "17503227054305649",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1488.6190476190482, y = 283.93650793650784},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1720763,
              GuideType = "M",
              GuidePointName = "Mechanism_1720763"
            }
          },
          ["17544810089943097"] = {
            key = "17544810089943097",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 3460, y = 284},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "SewNight",
              UnitId = -1
            }
          },
          ["17544811282884333"] = {
            key = "17544811282884333",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2956, y = 594},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "SewNight",
              UnitId = -1
            }
          },
          ["17555881754603785"] = {
            key = "17555881754603785",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1768.741341991342, y = -145.03679653679626},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10037805,
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
    },
    ["17483503991203333"] = {
      isStoryNode = true,
      key = "17483503991203333",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147\229\176\143\229\137\167\229\156\186BOSS",
      pos = {x = 2122.515734265734, y = 280.1287878787879},
      propsData = {
        QuestId = 0,
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
            startQuest = "17483503991213342",
            startPort = "Fail",
            endQuest = "17483503991213343",
            endPort = "In"
          },
          {
            startQuest = "17483503991223350",
            startPort = "Out",
            endQuest = "17483503991223352",
            endPort = "In"
          },
          {
            startQuest = "17483503991223352",
            startPort = "Out",
            endQuest = "17483503991223351",
            endPort = "In"
          },
          {
            startQuest = "17483503991223351",
            startPort = "Out",
            endQuest = "17483503991233354",
            endPort = "In"
          },
          {
            startQuest = "17483503991233354",
            startPort = "Out",
            endQuest = "17483503991233353",
            endPort = "In"
          },
          {
            startQuest = "17483503991263365",
            startPort = "false",
            endQuest = "17483503991263366",
            endPort = "In"
          },
          {
            startQuest = "17483503991263366",
            startPort = "Out",
            endQuest = "17483503991213339",
            endPort = "Success"
          },
          {
            startQuest = "17483503991213344",
            startPort = "Out",
            endQuest = "17483503991213340",
            endPort = "Fail"
          },
          {
            startQuest = "17483503991223350",
            startPort = "Out",
            endQuest = "17483503991223347",
            endPort = "In"
          },
          {
            startQuest = "17483503991233355",
            startPort = "Out",
            endQuest = "174851674836718893389",
            endPort = "In"
          },
          {
            startQuest = "174851674836718893389",
            startPort = "Out",
            endQuest = "17485227567615120",
            endPort = "In"
          },
          {
            startQuest = "17485227567615120",
            startPort = "Out",
            endQuest = "17483503991223348",
            endPort = "In"
          },
          {
            startQuest = "17483503991273377",
            startPort = "Out",
            endQuest = "17483503991233355",
            endPort = "In"
          },
          {
            startQuest = "17483503991223347",
            startPort = "Out",
            endQuest = "174851674836718893388",
            endPort = "In"
          },
          {
            startQuest = "174851674836718893388",
            startPort = "Out",
            endQuest = "17483503991273377",
            endPort = "In"
          },
          {
            startQuest = "17483503991263365",
            startPort = "true",
            endQuest = "17483503991213344",
            endPort = "In"
          },
          {
            startQuest = "17483503991223350",
            startPort = "Out",
            endQuest = "17496318501493969",
            endPort = "In"
          },
          {
            startQuest = "17483503991263365",
            startPort = "true",
            endQuest = "1754621234190599016",
            endPort = "In"
          },
          {
            startQuest = "1754621234190599016",
            startPort = "Out",
            endQuest = "17483503991223350",
            endPort = "In"
          },
          {
            startQuest = "17483503991263365",
            startPort = "true",
            endQuest = "17570423189393039",
            endPort = "In"
          },
          {
            startQuest = "17483503991263365",
            startPort = "true",
            endQuest = "17570423189393040",
            endPort = "In"
          },
          {
            startQuest = "17483503991213338",
            startPort = "QuestStart",
            endQuest = "17483503991263365",
            endPort = "In"
          },
          {
            startQuest = "1754621234190599016",
            startPort = "Out",
            endQuest = "17570566649563833756",
            endPort = "In"
          }
        },
        nodeData = {
          ["17483503991213338"] = {
            key = "17483503991213338",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 160, y = 568},
            propsData = {ModeType = 0}
          },
          ["17483503991213339"] = {
            key = "17483503991213339",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3520, y = 968},
            propsData = {ModeType = 0}
          },
          ["17483503991213340"] = {
            key = "17483503991213340",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2886, y = 1384},
            propsData = {}
          },
          ["17483503991213342"] = {
            key = "17483503991213342",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 646.0098899439308, y = -502.5851070485552},
            propsData = {SpecialConfigId = 1038, BlackScreenImmediately = false}
          },
          ["17483503991213343"] = {
            key = "17483503991213343",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1023.8000000000002, y = -596.7},
            propsData = {
              ModeType = 1,
              Id = 101703,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17483503991213344"] = {
            key = "17483503991213344",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1736.3519110643456, y = 1377.9800687557802},
            propsData = {}
          },
          ["17483503991223347"] = {
            key = "17483503991223347",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2247.82864725572, y = 567.5501427880706},
            propsData = {
              SendMessage = "",
              FinishCondition = "Sew03BossEnd"
            }
          },
          ["17483503991223348"] = {
            key = "17483503991223348",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3866.901336486001, y = 626.7270062239127},
            propsData = {}
          },
          ["17483503991223350"] = {
            key = "17483503991223350",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1789.8312558958123, y = 413.3817258077284},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Sew03BossStart",
              UnitId = -1
            }
          },
          ["17483503991223351"] = {
            key = "17483503991223351",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2190.0614853155157, y = 133.45594982932138},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035007,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17483503991223352"] = {
            key = "17483503991223352",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1802.2201319320582, y = 143.50858140826855},
            propsData = {WaitTime = 1}
          },
          ["17483503991233353"] = {
            key = "17483503991233353",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2966.3494745193047, y = 124.61384456616346},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035013,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17483503991233354"] = {
            key = "17483503991233354",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2572.148096073189, y = 141.75419544335648},
            propsData = {WaitTime = 10}
          },
          ["17483503991233355"] = {
            key = "17483503991233355",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 3124.7283000109674, y = 647.292682687107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035016,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple46",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100327,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100340,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100341,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100342,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100343,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100327},
                {TalkActorType = "Npc", TalkActorId = 200022},
                {TalkActorType = "Npc", TalkActorId = 100340},
                {TalkActorType = "Npc", TalkActorId = 100341},
                {TalkActorType = "Npc", TalkActorId = 100342},
                {TalkActorType = "Npc", TalkActorId = 100343}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17483503991263365"] = {
            key = "17483503991263365",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 690.6286982335605, y = 617.6639753615559},
            propsData = {
              FunctionName = "Equal",
              VarName = "sew100303",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "3"}
              }
            }
          },
          ["17483503991263366"] = {
            key = "17483503991263366",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1542.7046350997728, y = 982.3360246384442},
            propsData = {VarName = "sew100303"}
          },
          ["17483503991273372"] = {
            key = "17483503991273372",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2306, y = 1738},
            propsData = {
              MessageType = "GameMode",
              MessageContent = -1,
              UnitId = -1
            }
          },
          ["17483503991273377"] = {
            key = "17483503991273377",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2850.918192918193, y = 579.223260399731},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/Sew03/cp2fixsimple46_Sequencer",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          ["174851674836718893388"] = {
            key = "174851674836718893388",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2559.301143301144, y = 449.51637251637266},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851674836718893389"] = {
            key = "174851674836718893389",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 3303.4281274281275, y = 453.960816960817},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17485227567615120"] = {
            key = "17485227567615120",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3530, y = 590},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1720553,
                1720554,
                1720555,
                1720556,
                1720557,
                1720558,
                1720559,
                1720560,
                1720561,
                1720562,
                1720563,
                1720564,
                1720567,
                1720568,
                1720569,
                1720570,
                1720573,
                1720574,
                1720575,
                1720576,
                1720577,
                1720578,
                1720579,
                1720580,
                1720581,
                1720582,
                1720583,
                1720584,
                1720585,
                1720586,
                1720587,
                1720588,
                1720589,
                1720590,
                1720591,
                1720594,
                1720539,
                1720540,
                1720541,
                1720542,
                1720543,
                1720544,
                1720545,
                1720546,
                1720547,
                1720548,
                1720549,
                1720550,
                1720594,
                1720595,
                1720596,
                1720597,
                1720598,
                1720599,
                1720600,
                1720601,
                1720602,
                1720603,
                1720572,
                1720605
              }
            }
          },
          ["17496318501493969"] = {
            key = "17496318501493969",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1456.6153846153848, y = 125.38461538461532},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0060_boss_ex01_lizhanzhe_loop",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["1754621234190599016"] = {
            key = "1754621234190599016",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = 1242, y = 502},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC002/SQ_OBT0103_SC002_B",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
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
          ["17570423189393039"] = {
            key = "17570423189393039",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 985.9194444444443, y = 430.3502136752137},
            propsData = {
              NewDescription = "QuestName_100303sp206",
              NewDetail = "QuestDesc_100303sp206",
              SubTaskTargetIndex = 0
            }
          },
          ["17570423189393040"] = {
            key = "17570423189393040",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 866.0805555555553, y = 309.6497863247862},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0074_story_encounter_with_blues",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17570566649563833756"] = {
            key = "17570566649563833756",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1654.5057836899944, y = 593.3649508386352},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2sew03boss",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
