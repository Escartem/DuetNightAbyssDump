return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979267203300",
      startPort = "StoryStart",
      endStory = "1722414723994163418",
      endPort = "In"
    },
    {
      startStory = "1722414723994163418",
      startPort = "Success",
      endStory = "17314983895465514394",
      endPort = "In"
    },
    {
      startStory = "1723796482259875289",
      startPort = "Success",
      endStory = "17315866040981240094",
      endPort = "In"
    },
    {
      startStory = "1723796482260875292",
      startPort = "Success",
      endStory = "1704175979267203301",
      endPort = "StoryEnd"
    },
    {
      startStory = "17315866040981240094",
      startPort = "Success",
      endStory = "17346895450532728956",
      endPort = "In"
    },
    {
      startStory = "17346895450532728956",
      startPort = "Success",
      endStory = "1723796482260875292",
      endPort = "In"
    },
    {
      startStory = "1722414723994163417",
      startPort = "Success",
      endStory = "173589882538320523035",
      endPort = "In"
    },
    {
      startStory = "173589882589420523108",
      startPort = "Success",
      endStory = "1723796482259875289",
      endPort = "In"
    },
    {
      startStory = "173589882538320523035",
      startPort = "Success",
      endStory = "173589882589420523108",
      endPort = "In"
    },
    {
      startStory = "17314983895465514394",
      startPort = "Success",
      endStory = "1736497070249238937",
      endPort = "In"
    },
    {
      startStory = "1736497070249238937",
      startPort = "Success",
      endStory = "1723796482260875291",
      endPort = "In"
    },
    {
      startStory = "1723796482260875291",
      startPort = "Success",
      endStory = "1722414723994163417",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1704175979267203300"] = {
      isStoryNode = true,
      key = "1704175979267203300",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -655.4846819846819, y = -38.67023254523255},
      propsData = {QuestChainId = 110103},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979267203301"] = {
      isStoryNode = true,
      key = "1704175979267203301",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 246.51943927721265, y = 737.8468675029928},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722414723994163417"] = {
      isStoryNode = true,
      key = "1722414723994163417",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\228\184\128",
      pos = {x = 357.8814418713742, y = 295.0081775046686},
      propsData = {
        QuestId = 11010303,
        QuestDescriptionComment = "\229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\239\188\140\230\133\162\231\171\153\230\161\169",
        QuestDescription = "Description_110104_3",
        QuestDeatil = "Content_110104_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010410"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1722414723996163433",
            startPort = "QuestStart",
            endQuest = "1722414723996163437",
            endPort = "In"
          },
          {
            startQuest = "1722414723996163433",
            startPort = "QuestStart",
            endQuest = "1734685095865911334",
            endPort = "In"
          },
          {
            startQuest = "1722414723996163437",
            startPort = "Out",
            endQuest = "1722414723996163434",
            endPort = "Success"
          },
          {
            startQuest = "1722414723996163433",
            startPort = "QuestStart",
            endQuest = "17419362198357503156",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722414723996163433"] = {
            key = "1722414723996163433",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1609.7665393602877, y = -119.83211039461725},
            propsData = {ModeType = 0}
          },
          ["1722414723996163434"] = {
            key = "1722414723996163434",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -647.3541929760559, y = 141.83812541209215},
            propsData = {ModeType = 0}
          },
          ["1722414723996163435"] = {
            key = "1722414723996163435",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 34.94551431350931, y = 442.9994544168044},
            propsData = {}
          },
          ["1722414723996163437"] = {
            key = "1722414723996163437",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
            pos = {x = -1177.6752890244195, y = 142.20023362109706},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010405,
              GuideType = "M",
              GuidePointName = "questpoint1111010405"
            }
          },
          ["1734685095865911334"] = {
            key = "1734685095865911334",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\142\171\229\166\174\229\141\161",
            pos = {x = -1227.265458932691, y = -43.55505326591919},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1211010401}
            }
          },
          ["17419362198357503156"] = {
            key = "17419362198357503156",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1187.947638146167, y = -269.91866028708137},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011201,
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
    ["1722414723994163418"] = {
      isStoryNode = true,
      key = "1722414723994163418",
      type = "StoryNode",
      name = "\229\137\141\232\191\155",
      pos = {x = -292.2717987296102, y = -58.92668041729934},
      propsData = {
        QuestId = 11010301,
        QuestDescriptionComment = "\229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
        QuestDescription = "Description_110104_1",
        QuestDeatil = "Content_110104_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
        bIsStartChapter = true,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010402",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1722414724009163502",
            startPort = "Out",
            endQuest = "1722414724009163501",
            endPort = "In"
          },
          {
            startQuest = "1722414724010163512",
            startPort = "Out",
            endQuest = "1722414724009163506",
            endPort = "In"
          },
          {
            startQuest = "1722414724010163511",
            startPort = "Out",
            endQuest = "1722414724010163512",
            endPort = "In"
          },
          {
            startQuest = "1722414724009163506",
            startPort = "Out",
            endQuest = "1722414724009163504",
            endPort = "Success"
          },
          {
            startQuest = "1722414724009163503",
            startPort = "QuestStart",
            endQuest = "1722414724009163502",
            endPort = "In"
          },
          {
            startQuest = "1722414724009163503",
            startPort = "QuestStart",
            endQuest = "1728391958638568742",
            endPort = "In"
          },
          {
            startQuest = "1722414724009163503",
            startPort = "QuestStart",
            endQuest = "1722414724010163511",
            endPort = "In"
          },
          {
            startQuest = "1728391958638568742",
            startPort = "Out",
            endQuest = "1747118638263575483",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722414724009163501"] = {
            key = "1722414724009163501",
            type = "TalkNode",
            name = "\229\188\128\232\189\166 - \228\189\160\230\128\142\228\185\136\228\187\128\228\185\136\233\131\189\228\184\141\233\151\174\239\188\159",
            pos = {x = -1252.6655592165614, y = 564.6381421781876},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1722414724009163502"] = {
            key = "1722414724009163502",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
            pos = {x = -1507.7640015193183, y = 572.3878907627127},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1640542,
              GuideType = "M",
              GuidePointName = "Mechanism_1640542"
            }
          },
          ["1722414724009163503"] = {
            key = "1722414724009163503",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2161.2630809956163, y = 225.92764541021862},
            propsData = {ModeType = 0}
          },
          ["1722414724009163504"] = {
            key = "1722414724009163504",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -708.6390957662381, y = 238.27706078466935},
            propsData = {ModeType = 0}
          },
          ["1722414724009163505"] = {
            key = "1722414724009163505",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 911.6954121052429, y = 618.6176469203958},
            propsData = {}
          },
          ["1722414724009163506"] = {
            key = "1722414724009163506",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
            pos = {x = -1032.9135811239835, y = 240.81912348507555},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010402,
              GuideType = "M",
              GuidePointName = "questpoint1111010402"
            }
          },
          ["1722414724010163511"] = {
            key = "1722414724010163511",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = -1540.7125386638447, y = 237.86495650891902},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1640642}
            }
          },
          ["1722414724010163512"] = {
            key = "1722414724010163512",
            type = "SendMessageNode",
            name = "\230\137\147\229\188\128\233\128\154\229\190\128\228\184\139\228\184\170\229\140\186\229\159\159\231\154\132\233\151\168",
            pos = {x = -1282.143246307763, y = 237.12669438927603},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "GotoTongYong",
              UnitId = -1
            }
          },
          ["1728391958638568742"] = {
            key = "1728391958638568742",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -1916.7779434574627, y = -71.92969489598659},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0058_scene_ex01_action.0058_scene_ex01_action'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1747118638263575483"] = {
            key = "1747118638263575483",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144NPC",
            pos = {x = -1561.781801495554, y = -65.9396814323529},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640037,
                1640033,
                1640032,
                1640035,
                1640121,
                1640236,
                1640235,
                1640640
              }
            }
          }
        },
        commentData = {
          ["17212890381031125110"] = {
            key = "17212890381031125110",
            name = "\233\135\141\230\150\176\229\143\172\229\148\164\232\191\153\228\184\170\228\187\187\229\138\161\233\147\190\231\154\132\233\173\133\229\189\177\239\188\140\229\136\157\229\167\139\229\140\150\229\176\143\230\136\191\233\151\180\230\136\152\230\150\151",
            position = {x = -1582.6962653292467, y = 109.24121816174569},
            size = {width = 789.4736842105264, height = 317.3684210526317}
          },
          ["17212890717151125932"] = {
            key = "17212890717151125932",
            name = "\232\183\175\233\128\148\228\184\173\232\167\166\229\143\145\231\154\132\229\188\128\232\189\166",
            position = {x = -1575.2693647444514, y = 468.8903409687634},
            size = {width = 570.5409234252882, height = 240.13733366625019}
          }
        }
      }
    },
    ["1723796482259875289"] = {
      isStoryNode = true,
      key = "1723796482259875289",
      type = "StoryNode",
      name = "\232\131\189\230\186\144\229\174\164\228\184\138\229\177\130\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = -395.6798652053665, y = 566.9166680811546},
      propsData = {
        QuestId = 11010305,
        QuestDescriptionComment = "A\230\156\186\229\133\179\231\142\169\230\179\149",
        QuestDescription = "Description_110105_1",
        QuestDeatil = "Content_110105_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010502"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17247590229025072201",
            startPort = "Out",
            endQuest = "1731586396290832753",
            endPort = "In"
          },
          {
            startQuest = "1731586396290832753",
            startPort = "Success",
            endQuest = "1723796482273875352",
            endPort = "Success"
          },
          {
            startQuest = "1731586396290832753",
            startPort = "Fail",
            endQuest = "1731586460761833467",
            endPort = "In"
          },
          {
            startQuest = "1731586460761833467",
            startPort = "Out",
            endQuest = "1723796482273875353",
            endPort = "Fail"
          },
          {
            startQuest = "1723796482272875351",
            startPort = "QuestStart",
            endQuest = "1735196316056240910",
            endPort = "In"
          },
          {
            startQuest = "1731586396290832753",
            startPort = "PassiveFail",
            endQuest = "1731586460761833467",
            endPort = "In"
          },
          {
            startQuest = "1742021558623786653",
            startPort = "Out",
            endQuest = "17247590229025072201",
            endPort = "In"
          },
          {
            startQuest = "17455628012681403",
            startPort = "Out",
            endQuest = "1742021558623786653",
            endPort = "In"
          },
          {
            startQuest = "1723796482272875351",
            startPort = "QuestStart",
            endQuest = "17455628012681403",
            endPort = "In"
          }
        },
        nodeData = {
          ["1723796482272875351"] = {
            key = "1723796482272875351",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2253.7706385119104, y = 298.25655914018233},
            propsData = {ModeType = 0}
          },
          ["1723796482273875352"] = {
            key = "1723796482273875352",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -103.39794869185003, y = 227.91950591488333},
            propsData = {ModeType = 0}
          },
          ["1723796482273875353"] = {
            key = "1723796482273875353",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -89.01052964253213, y = 430.4390148563663},
            propsData = {}
          },
          ["17247590229025072201"] = {
            key = "17247590229025072201",
            type = "GoToNode",
            name = "GOTO - \229\188\128\229\167\139\228\187\187\229\138\161",
            pos = {x = -973.9480553527278, y = 253.68121327747724},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010502,
              GuideType = "M",
              GuidePointName = "questpoint1111010502"
            }
          },
          ["1731586396290832753"] = {
            key = "1731586396290832753",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -656.5732499765692, y = 240.141585581601},
            propsData = {SpecialConfigId = 1023, BlackScreenImmediately = false}
          },
          ["1731586460761833467"] = {
            key = "1731586460761833467",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -361.1599907626781, y = 351.0722488270251},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_StopPowerRE",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1735196316056240910"] = {
            key = "1735196316056240910",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1168.6479835953521, y = 12.478468899521545},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742021558623786653"] = {
            key = "1742021558623786653",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1275.3392873799232, y = 275.6620553359683},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeUpJieMi1Start",
              UnitId = -1
            }
          },
          ["17455628012681403"] = {
            key = "17455628012681403",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1611.6696436899615, y = 286},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineUpLSFinish",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1723796482260875291"] = {
      isStoryNode = true,
      key = "1723796482260875291",
      type = "StoryNode",
      name = "\228\186\164\228\186\146\230\147\141\228\189\156\229\143\176",
      pos = {x = 619.2238515142553, y = 114.25157990532293},
      propsData = {
        QuestId = 11010307,
        QuestDescriptionComment = "\231\166\187\229\188\128\232\191\153\233\135\140",
        QuestDescription = "Description_110104_2",
        QuestDeatil = "Content_110104_2",
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010404"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17352212838693758058",
            startPort = "Out",
            endQuest = "17352213683924696073",
            endPort = "In"
          },
          {
            startQuest = "17352213683924696073",
            startPort = "Out",
            endQuest = "1723796482296875469",
            endPort = "Success"
          },
          {
            startQuest = "17356152698088387987",
            startPort = "Out",
            endQuest = "17356152698088387989",
            endPort = "In"
          },
          {
            startQuest = "1723796482296875468",
            startPort = "QuestStart",
            endQuest = "17356152698088387987",
            endPort = "In"
          },
          {
            startQuest = "17356152698088387987",
            startPort = "Out",
            endQuest = "17412523471142384997",
            endPort = "In"
          },
          {
            startQuest = "17412523471142384997",
            startPort = "Out",
            endQuest = "17352212838693758058",
            endPort = "In"
          },
          {
            startQuest = "17352212838693758058",
            startPort = "Out",
            endQuest = "17567949592361674",
            endPort = "In"
          }
        },
        nodeData = {
          ["1723796482296875468"] = {
            key = "1723796482296875468",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2905.5245280820923, y = 151.13048359034516},
            propsData = {ModeType = 0}
          },
          ["1723796482296875469"] = {
            key = "1723796482296875469",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -1402.4778840861813, y = 223.57997191171813},
            propsData = {ModeType = 0}
          },
          ["1723796482296875470"] = {
            key = "1723796482296875470",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 966.560898928894, y = 1056.1533005706506},
            propsData = {}
          },
          ["17352212838693758058"] = {
            key = "17352212838693758058",
            type = "TalkNode",
            name = "\231\171\153\230\161\169  - \228\189\156\230\136\152\232\174\161\229\136\146\228\185\166\228\184\138\229\134\153\231\154\132\230\152\175",
            pos = {x = -2068.5239755933717, y = 167.64439095387385},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011302,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_07",
              BlendInTime = 1,
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
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110010},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17352213683924696073"] = {
            key = "17352213683924696073",
            type = "TalkNode",
            name = "\229\133\179\229\141\161\230\188\148\229\135\186",
            pos = {x = -1756.5881271660965, y = 176.5550723110564},
            propsData = {
              IsNpcNode = false,
              TalkType = "LevelSequence",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Level/Sequencer/Region/Fort/LS_Fort01_BridgeDown",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = true,
              PauseGameGlobal = false,
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17356152698088387987"] = {
            key = "17356152698088387987",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
            pos = {x = -2611.9451063500874, y = 154.35808373348132},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010404,
              GuideType = "M",
              GuidePointName = "questpoint1111010404"
            }
          },
          ["17356152698088387989"] = {
            key = "17356152698088387989",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\229\133\136\229\129\156\228\184\139\230\157\165\230\149\180\231\144\134\228\184\128\228\184\139",
            pos = {x = -2390.4834650784846, y = -125.47127638242931},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17412523471142384997"] = {
            key = "17412523471142384997",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -2319.647509578546, y = 172.0570532915361},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1640453,
              GuideType = "M",
              GuidePointName = "Mechanism_1640453"
            }
          },
          ["17567949592361674"] = {
            key = "17567949592361674",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1700, y = -20},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018202,
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
    ["1723796482260875292"] = {
      isStoryNode = true,
      key = "1723796482260875292",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = -191.45279514970537, y = 747.1585186940989},
      propsData = {
        QuestId = 11010308,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_2",
        QuestDeatil = "Content_110106_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = false,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010605"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1723796482303875502",
            startPort = "QuestStart",
            endQuest = "1723796482304875505",
            endPort = "In"
          },
          {
            startQuest = "1723796482304875505",
            startPort = "Out",
            endQuest = "1723796482303875503",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1723796482303875502"] = {
            key = "1723796482303875502",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1632.5, y = 292.5},
            propsData = {ModeType = 0}
          },
          ["1723796482303875503"] = {
            key = "1723796482303875503",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2550.6998113846394, y = 297.97083716206475},
            propsData = {ModeType = 0}
          },
          ["1723796482303875504"] = {
            key = "1723796482303875504",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3163.749625187416, y = 571.6611694152948},
            propsData = {}
          },
          ["1723796482304875505"] = {
            key = "1723796482304875505",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2273.9640541552235, y = 289.18543778716946},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_09",
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
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17343411863532136"] = {
            key = "17343411863532136",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2233.6, y = 58.49999999999994},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "fix0901",
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
    },
    ["17314983895465514394"] = {
      isStoryNode = true,
      key = "17314983895465514394",
      type = "StoryNode",
      name = "\229\176\143\230\136\191\233\151\180\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = -42.89553188106292, y = -50.81200623179918},
      propsData = {
        QuestId = 11010311,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110104_1",
        QuestDeatil = "Content_110104_1",
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010403"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17314984084875514940",
            startPort = "Success",
            endQuest = "17314983895465514398",
            endPort = "Success"
          },
          {
            startQuest = "17314983895465514395",
            startPort = "QuestStart",
            endQuest = "17314984677696323022",
            endPort = "In"
          },
          {
            startQuest = "17314984084875514940",
            startPort = "Fail",
            endQuest = "1731585891171413700",
            endPort = "In"
          },
          {
            startQuest = "1731585891171413700",
            startPort = "Out",
            endQuest = "17314983895465514401",
            endPort = "Fail"
          },
          {
            startQuest = "17314984677696323022",
            startPort = "Out",
            endQuest = "17314984084875514940",
            endPort = "In"
          },
          {
            startQuest = "17314984084875514940",
            startPort = "PassiveFail",
            endQuest = "1731585891171413700",
            endPort = "In"
          }
        },
        nodeData = {
          ["17314983895465514395"] = {
            key = "17314983895465514395",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 557.3737373737375, y = 253.53535353535355},
            propsData = {ModeType = 0}
          },
          ["17314983895465514398"] = {
            key = "17314983895465514398",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1767.0614249880553, y = 247.41874701385566},
            propsData = {ModeType = 0}
          },
          ["17314983895465514401"] = {
            key = "17314983895465514401",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2165.7571433413823, y = 487.8634016541625},
            propsData = {}
          },
          ["17314984084875514940"] = {
            key = "17314984084875514940",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1309.2934594010108, y = 267.30829582317},
            propsData = {SpecialConfigId = 1021, BlackScreenImmediately = false}
          },
          ["17314984677696323022"] = {
            key = "17314984677696323022",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
            pos = {x = 950.7270894567805, y = 271.21974014294153},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010403,
              GuideType = "M",
              GuidePointName = "questpoint1111010403"
            }
          },
          ["1731585891171413700"] = {
            key = "1731585891171413700",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1604.515489202605, y = 492.3785373679477},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_SmallBattleRE",
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
    },
    ["17315866040981240094"] = {
      isStoryNode = true,
      key = "17315866040981240094",
      type = "StoryNode",
      name = "\232\131\189\230\186\144\229\174\164\228\184\139\229\177\130\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = -761.8588002263723, y = 736.1807947287576},
      propsData = {
        QuestId = 11010306,
        QuestDescriptionComment = "\230\163\128\230\159\165\229\134\133\233\131\168\231\187\147\230\158\132",
        QuestDescription = "Description_110105_3",
        QuestDeatil = "Content_110105_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010507"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17315866040981240101",
            startPort = "Success",
            endQuest = "17315866040981240099",
            endPort = "Success"
          },
          {
            startQuest = "17315866040981240103",
            startPort = "Out",
            endQuest = "17315866040981240100",
            endPort = "Fail"
          },
          {
            startQuest = "17315866040981240101",
            startPort = "Fail",
            endQuest = "17315866040991240108",
            endPort = "In"
          },
          {
            startQuest = "17315866040991240108",
            startPort = "Out",
            endQuest = "17315866040981240103",
            endPort = "In"
          },
          {
            startQuest = "17315866040981240101",
            startPort = "PassiveFail",
            endQuest = "17315866040991240108",
            endPort = "In"
          },
          {
            startQuest = "17601019900401740",
            startPort = "Out",
            endQuest = "17601019900401744",
            endPort = "In"
          },
          {
            startQuest = "17601019900401740",
            startPort = "Out",
            endQuest = "17601019900401742",
            endPort = "In"
          },
          {
            startQuest = "17601019900401740",
            startPort = "Out",
            endQuest = "17601019900401741",
            endPort = "In"
          },
          {
            startQuest = "17601019900401741",
            startPort = "Out",
            endQuest = "17601019900401743",
            endPort = "In"
          },
          {
            startQuest = "17315866040981240098",
            startPort = "QuestStart",
            endQuest = "17601019900401740",
            endPort = "In"
          },
          {
            startQuest = "17601019900401743",
            startPort = "Out",
            endQuest = "17315866040981240101",
            endPort = "In"
          }
        },
        nodeData = {
          ["17315866040981240098"] = {
            key = "17315866040981240098",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1975.8819813744144, y = 583.0719395028538},
            propsData = {ModeType = 0}
          },
          ["17315866040981240099"] = {
            key = "17315866040981240099",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -221.92720061841607, y = 337.1761817501519},
            propsData = {ModeType = 0}
          },
          ["17315866040981240100"] = {
            key = "17315866040981240100",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 69.0846361565784, y = 500.7668777829119},
            propsData = {}
          },
          ["17315866040981240101"] = {
            key = "17315866040981240101",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\229\188\128\229\167\139\232\131\189\230\186\144\229\174\164\228\184\139\229\177\130\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -656.6437966555485, y = 523.0067066643594},
            propsData = {SpecialConfigId = 1005, BlackScreenImmediately = false}
          },
          ["17315866040981240103"] = {
            key = "17315866040981240103",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\164\177\232\180\165\229\144\142\228\188\160\233\128\129\229\155\158\228\184\138\229\177\130",
            pos = {x = -213.0740281838688, y = 487.36797243565024},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_NengyuanSPQuest",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17315866040991240108"] = {
            key = "17315866040991240108",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -397.1596384104533, y = 506.3971975614808},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17601019900401740"] = {
            key = "17601019900401740",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\229\134\133\233\131\168",
            pos = {x = -1663.8253259112719, y = 565.7980674388957},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1640273,
              GuideType = "M",
              GuidePointName = "Mechanism_DongliKaiche04_1640273"
            }
          },
          ["17601019900401741"] = {
            key = "17601019900401741",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1197.1136078616794, y = 597.2287961372203},
            propsData = {
              IsNpcNode = false,
              TalkType = "LevelSequence",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/AssetDesign/Level/Sequencer/Region/Fort/LS_Fort01_EngineeUp02.LS_Fort01_EngineeUp02'",
              BlendInTime = 1,
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              OverrideFailBlend = false
            }
          },
          ["17601019900401742"] = {
            key = "17601019900401742",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -1084.3048378408344, y = 346.43079477174774},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0061_scene_ex01_escape.0061_scene_ex01_escape'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17601019900401743"] = {
            key = "17601019900401743",
            type = "TalkNode",
            name = "\230\156\186\229\133\179\231\138\182\230\128\129\230\188\148\229\135\186",
            pos = {x = -932.5080074220623, y = 555.0764404820944},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017516,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_donglishishang",
              BlendInTime = 0,
              BlendOutTime = 1,
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
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110020,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 110010},
                {TalkActorType = "Npc", TalkActorId = 110020},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17601019900401744"] = {
            key = "17601019900401744",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -952.5266638895052, y = 928.2358718949192},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineUpRestart",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17346895450532728956"] = {
      isStoryNode = true,
      key = "17346895450532728956",
      type = "StoryNode",
      name = "\233\128\131\231\166\187\229\138\168\229\138\155\229\174\164",
      pos = {x = -469.5453870146942, y = 734.0718505392766},
      propsData = {
        QuestId = 11010309,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_2",
        QuestDeatil = "Content_110106_1",
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010605"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17346895450532728965",
            startPort = "Out",
            endQuest = "17346895450532728966",
            endPort = "In"
          },
          {
            startQuest = "17346895450532728960",
            startPort = "QuestStart",
            endQuest = "17346895450532728965",
            endPort = "In"
          },
          {
            startQuest = "17346895450532728963",
            startPort = "Out",
            endQuest = "17346895450532728961",
            endPort = "Success"
          },
          {
            startQuest = "17346895450532728965",
            startPort = "Out",
            endQuest = "173494999530210023906",
            endPort = "In"
          },
          {
            startQuest = "173495002667210024450",
            startPort = "Out",
            endQuest = "173495002667210024449",
            endPort = "In"
          },
          {
            startQuest = "173495020052310024922",
            startPort = "Out",
            endQuest = "17346895450532728963",
            endPort = "In"
          },
          {
            startQuest = "17346895450532728965",
            startPort = "Out",
            endQuest = "173495002667210024450",
            endPort = "In"
          },
          {
            startQuest = "17346895450532728966",
            startPort = "Out",
            endQuest = "173495020052310024922",
            endPort = "In"
          },
          {
            startQuest = "173494999530210023906",
            startPort = "Out",
            endQuest = "17479157857307496232",
            endPort = "In"
          }
        },
        nodeData = {
          ["17346895450532728960"] = {
            key = "17346895450532728960",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 543.7687969924812, y = 544.8308270676691},
            propsData = {ModeType = 0}
          },
          ["17346895450532728961"] = {
            key = "17346895450532728961",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2287.1687840290383, y = 401.59709618874774},
            propsData = {ModeType = 0}
          },
          ["17346895450532728962"] = {
            key = "17346895450532728962",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2010.5263157894735, y = 693.6842105263158},
            propsData = {}
          },
          ["17346895450532728963"] = {
            key = "17346895450532728963",
            type = "GoToNode",
            name = "GOTO - \231\166\187\229\188\128\232\191\153\233\135\140",
            pos = {x = 1818.5375269917104, y = 495.51328858113624},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010606,
              GuideType = "M",
              GuidePointName = "questpoint1111010606"
            }
          },
          ["17346895450532728965"] = {
            key = "17346895450532728965",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-SC005-\231\136\134\231\130\184\233\128\131\231\148\159",
            pos = {x = 907.6629978840026, y = 505.8529213626392},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC005/SQ_OBT0102_SC005",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              EndNewTargetPointName = "pNanzhuEscape",
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
          ["17346895450532728966"] = {
            key = "17346895450532728966",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1200.8387078176984, y = 521.3191082201275},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0057_scene_ex01_prepare.0057_scene_ex01_prepare'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["173494999530210023906"] = {
            key = "173494999530210023906",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1031.063492063492, y = 152.2593795093795},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeEscaped",
              UnitId = -1
            }
          },
          ["173495002667210024449"] = {
            key = "173495002667210024449",
            type = "ChangeStaticCreatorNode",
            name = "\229\156\168\229\164\150\233\157\162\231\148\159\230\136\144\233\152\191\231\147\166\229\176\148",
            pos = {x = 1095.6045487568101, y = 776.9247061961029},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640016, 1640561}
            }
          },
          ["173495002667210024450"] = {
            key = "173495002667210024450",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\160\233\153\164\229\137\141\228\184\128\228\184\170\233\152\191\231\147\166\229\176\148",
            pos = {x = 830.2913140887094, y = 762.4853571704822},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640133, 1211010401}
            }
          },
          ["173495020052310024922"] = {
            key = "173495020052310024922",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1472.586219336219, y = 516.3502886002886},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "PowerEscape",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17479157857307496232"] = {
            key = "17479157857307496232",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1277.6545837050453, y = 166.437797584724},
            propsData = {
              ActionType = 0,
              Condition = "fort01",
              SaveToServer = true
            }
          }
        },
        commentData = {}
      }
    },
    ["173589882538320523035"] = {
      isStoryNode = true,
      key = "173589882538320523035",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\228\186\140",
      pos = {x = 614.1637574146118, y = 297.5073926465809},
      propsData = {
        QuestId = 11010312,
        QuestDescriptionComment = "\229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\239\188\140\230\133\162\231\171\153\230\161\169",
        QuestDescription = "Description_110104_3",
        QuestDeatil = "Content_110104_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010406"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173589882538320523039",
            startPort = "QuestStart",
            endQuest = "173589882538320523042",
            endPort = "In"
          },
          {
            startQuest = "173589882538320523042",
            startPort = "Out",
            endQuest = "173589882538320523040",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173589882538320523039"] = {
            key = "173589882538320523039",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1359.7665393602877, y = 61.5964610339542},
            propsData = {ModeType = 0}
          },
          ["173589882538320523040"] = {
            key = "173589882538320523040",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -474.03339097104333, y = 120.18399007374632},
            propsData = {ModeType = 0}
          },
          ["173589882538320523041"] = {
            key = "173589882538320523041",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 34.94551431350931, y = 442.9994544168044},
            propsData = {}
          },
          ["173589882538320523042"] = {
            key = "173589882538320523042",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\231\154\132\232\183\175\228\184\138",
            pos = {x = -914.097154546418, y = 120.28426302539337},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010406,
              GuideType = "M",
              GuidePointName = "questpoint1111010406"
            }
          }
        },
        commentData = {}
      }
    },
    ["173589882589420523108"] = {
      isStoryNode = true,
      key = "173589882589420523108",
      type = "StoryNode",
      name = "\232\142\171\229\166\174\229\141\161\229\175\185\232\175\157",
      pos = {x = -701.601439598131, y = 578.8933232190473},
      propsData = {
        QuestId = 11010313,
        QuestDescriptionComment = "\229\137\141\229\190\128\231\158\173\230\156\155\229\143\176\239\188\140\230\133\162\231\171\153\230\161\169",
        QuestDescription = "Description_110104_3",
        QuestDeatil = "Content_110104_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "questpoint1111010407"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173589882589420523117",
            startPort = "Out",
            endQuest = "173589882589420523119",
            endPort = "In"
          },
          {
            startQuest = "173589882589420523112",
            startPort = "QuestStart",
            endQuest = "173589882589420523117",
            endPort = "In"
          },
          {
            startQuest = "173589882589420523119",
            startPort = "Out",
            endQuest = "173589882589420523120",
            endPort = "In"
          },
          {
            startQuest = "173589882589420523120",
            startPort = "Out",
            endQuest = "173589882589420523122",
            endPort = "In"
          },
          {
            startQuest = "173589882589420523122",
            startPort = "Out",
            endQuest = "173589882589420523113",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173589882589420523112"] = {
            key = "173589882589420523112",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -985.4808250745733, y = 93.02503246252562},
            propsData = {ModeType = 0}
          },
          ["173589882589420523113"] = {
            key = "173589882589420523113",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 486.4808947432425, y = 84.53637102612728},
            propsData = {ModeType = 0}
          },
          ["173589882589420523114"] = {
            key = "173589882589420523114",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 34.94551431350931, y = 442.9994544168044},
            propsData = {}
          },
          ["173589882589420523117"] = {
            key = "173589882589420523117",
            type = "GoToNode",
            name = "GOTO - \229\136\176\232\190\190\231\158\173\230\156\155\229\143\176",
            pos = {x = -610.2738669866264, y = 97.10858639245653},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010407,
              GuideType = "M",
              GuidePointName = "questpoint1111010407"
            }
          },
          ["173589882589420523119"] = {
            key = "173589882589420523119",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\167\129\229\136\176\232\142\171\229\166\174\229\141\161",
            pos = {x = -330.83630841187215, y = 84.77055073247253},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_08",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
                  TalkActorId = 110020,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110010,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110010},
                {TalkActorType = "Npc", TalkActorId = 110020},
                {TalkActorType = "Npc", TalkActorId = 110022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173589882589420523120"] = {
            key = "173589882589420523120",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = -63.5397262935916, y = 93.20476492922974},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1640576}
            }
          },
          ["173589882589420523122"] = {
            key = "173589882589420523122",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\152\191\231\147\166\229\176\148",
            pos = {x = 210.5277265253913, y = 86.66124798752645},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640133}
            }
          }
        },
        commentData = {}
      }
    },
    ["1736497070249238937"] = {
      isStoryNode = true,
      key = "1736497070249238937",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\147\141\228\189\156\229\143\176",
      pos = {x = 361.78021978021957, y = 113.33314054366676},
      propsData = {
        QuestId = 11010314,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110104_2",
        QuestDeatil = "Content_110104_2",
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
        SubRegionId = 102101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_questpoint_1640551"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1736497070250238938",
            startPort = "QuestStart",
            endQuest = "1736497142592240449",
            endPort = "In"
          },
          {
            startQuest = "1736497070250238938",
            startPort = "QuestStart",
            endQuest = "1736497144100240522",
            endPort = "In"
          },
          {
            startQuest = "1736497142592240449",
            startPort = "Out",
            endQuest = "1736497070250238941",
            endPort = "Success"
          },
          {
            startQuest = "1736497144100240522",
            startPort = "Out",
            endQuest = "1736497182945241288",
            endPort = "In"
          },
          {
            startQuest = "1736497070250238938",
            startPort = "QuestStart",
            endQuest = "17419350162152078383",
            endPort = "In"
          }
        },
        nodeData = {
          ["1736497070250238938"] = {
            key = "1736497070250238938",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1736497070250238941"] = {
            key = "1736497070250238941",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1807.2727272727275, y = 345},
            propsData = {ModeType = 0}
          },
          ["1736497070250238944"] = {
            key = "1736497070250238944",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1736497142592240449"] = {
            key = "1736497142592240449",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1344, y = 304},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1640551,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_1640551"
            }
          },
          ["1736497144100240522"] = {
            key = "1736497144100240522",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1328, y = 676},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1640552,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_1640552"
            }
          },
          ["1736497182945241288"] = {
            key = "1736497182945241288",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1787.2727272727275, y = 691.090909090909},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018402,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17419350162152078383"] = {
            key = "17419350162152078383",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1082.6666666666665, y = 23.999999999999943},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1640576}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {
    ["173589889691120525804"] = {
      key = "173589889691120525804",
      name = "\229\137\141\229\190\128\232\131\189\230\186\144\229\174\164\231\158\173\230\156\155\229\143\176",
      position = {x = 316.99267481939, y = 8.859938339940129},
      size = {width = 592.1739130434783, height = 473.47826086956525}
    },
    ["173589895942120527137"] = {
      key = "173589895942120527137",
      name = "\229\138\168\229\138\155\229\174\164\228\187\187\229\138\161",
      position = {x = -787.6734371007267, y = 480.8625733860535},
      size = {width = 818.3333333333335, height = 440.0000000000001}
    },
    ["173589899110020528211"] = {
      key = "173589899110020528211",
      name = "\229\176\143\230\136\191\233\151\180\229\159\139\228\188\143",
      position = {x = -365.67343710072646, y = -181.4707599472797},
      size = {width = 600, height = 400}
    }
  }
}
