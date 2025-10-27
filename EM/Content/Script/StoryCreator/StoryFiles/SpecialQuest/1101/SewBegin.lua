return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102422395051",
      startPort = "StoryStart",
      endStory = "1721630102422395053",
      endPort = "In"
    },
    {
      startStory = "1721630102422395053",
      startPort = "Success",
      endStory = "1721630102422395052",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102422395051"] = {
      isStoryNode = true,
      key = "1721630102422395051",
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
    ["1721630102422395052"] = {
      isStoryNode = true,
      key = "1721630102422395052",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1454.6153846153848, y = 362.3076923076923},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102422395053"] = {
      isStoryNode = true,
      key = "1721630102422395053",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147\229\188\128\229\164\180",
      pos = {x = 1085.5203700010393, y = 358.7059248004101},
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
        ResurgencePoint = "REStartPoint",
        bUseQuestCoordinate = true,
        bDeadTriggerQuestFail = true,
        IsFairyLand = false,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "",
        FailBlackScreenText = "",
        FadeInTime = 1,
        FadeOutTime = 1,
        ContinueTime = 1
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1721209716404140663",
            startPort = "Out",
            endQuest = "1721209716404140664",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "1721630102422395058",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "1721209724141140954",
            endPort = "In"
          },
          {
            startQuest = "1721212792893152448",
            startPort = "Out",
            endQuest = "1721212310463151595",
            endPort = "In"
          },
          {
            startQuest = "1721212310463151595",
            startPort = "Out",
            endQuest = "1721212803798153009",
            endPort = "In"
          },
          {
            startQuest = "1721209716404140664",
            startPort = "Out",
            endQuest = "1721212792893152448",
            endPort = "In"
          },
          {
            startQuest = "1721212803798153009",
            startPort = "Out",
            endQuest = "1721209716404140665",
            endPort = "In"
          },
          {
            startQuest = "1721209716404140665",
            startPort = "Out",
            endQuest = "1721209716404140666",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "1733380183841608",
            endPort = "In"
          },
          {
            startQuest = "1733380452193629772",
            startPort = "Out",
            endQuest = "1721209716404140663",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395058",
            startPort = "Out",
            endQuest = "1721630102422395056",
            endPort = "Fail"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "173590195512322862387",
            endPort = "In"
          },
          {
            startQuest = "173590196790022862729",
            startPort = "Out",
            endQuest = "1721630102422395057",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "1750236974939648",
            endPort = "In"
          },
          {
            startQuest = "1750236974939648",
            startPort = "Out",
            endQuest = "1733380452193629772",
            endPort = "In"
          },
          {
            startQuest = "1721209716404140666",
            startPort = "Out",
            endQuest = "173590196790022862729",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "1755776662928644",
            endPort = "In"
          },
          {
            startQuest = "1721630102422395054",
            startPort = "QuestStart",
            endQuest = "17557766802251066",
            endPort = "In"
          },
          {
            startQuest = "17557766802251066",
            startPort = "Out",
            endQuest = "17557766969971253",
            endPort = "In"
          },
          {
            startQuest = "1733380452193629772",
            startPort = "Out",
            endQuest = "17558440994521346",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721209716404140663"] = {
            key = "1721209716404140663",
            type = "GoToNode",
            name = "GOTO - \228\184\139\230\176\180\233\129\147\232\181\183\231\130\185",
            pos = {x = 198.13461125228346, y = 196.12466792379598},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011201,
              GuideType = "M",
              GuidePointName = "questpoint1111011201"
            }
          },
          ["1721209716404140664"] = {
            key = "1721209716404140664",
            type = "GoToNode",
            name = "GOTO - \233\128\131\231\166\187",
            pos = {x = 171.32841447658998, y = 384.32969671367505},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011202,
              GuideType = "M",
              GuidePointName = "questpoint1111011202"
            }
          },
          ["1721209716404140665"] = {
            key = "1721209716404140665",
            type = "GoToNode",
            name = "GOTO - \233\128\131\231\166\187",
            pos = {x = 460.9981585209108, y = 392.65615143744094},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011203,
              GuideType = "M",
              GuidePointName = "questpoint1111011203"
            }
          },
          ["1721209716404140666"] = {
            key = "1721209716404140666",
            type = "GoToNode",
            name = "GOTO - \233\128\131\231\166\187",
            pos = {x = 471.5808693429694, y = 561.7886293714062},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011204,
              GuideType = "M",
              GuidePointName = "questpoint1111011204"
            }
          },
          ["1721209724141140954"] = {
            key = "1721209724141140954",
            type = "TalkNode",
            name = "\230\179\149\233\156\178\232\140\156\229\185\191\230\146\173",
            pos = {x = -48.425415498356294, y = -175.62628831436894},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11014601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1721212310463151595"] = {
            key = "1721212310463151595",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 472.54602381622607, y = 120.95508423465061},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1670004,
              StateId = 573,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1721212792893152448"] = {
            key = "1721212792893152448",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 468.79602381622607, y = -8.419915765349387},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "Mechanism_1670004_Point"
            }
          },
          ["1721212803798153009"] = {
            key = "1721212803798153009",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 473.79602381622607, y = 267.2050842346506},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "Mechanism_1670004_Point"
            }
          },
          ["1721630102422395054"] = {
            key = "1721630102422395054",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -839.6528537252209, y = 463.8813795853269},
            propsData = {ModeType = 0}
          },
          ["1721630102422395055"] = {
            key = "1721630102422395055",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1798.3911952923463, y = 562.3341537405477},
            propsData = {ModeType = 0}
          },
          ["1721630102422395056"] = {
            key = "1721630102422395056",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 483.9104978354982, y = 768.9058632543928},
            propsData = {}
          },
          ["1721630102422395057"] = {
            key = "1721630102422395057",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1420.754346549157, y = 558.9120941015075},
            propsData = {}
          },
          ["1721630102422395058"] = {
            key = "1721630102422395058",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 154.61123881520632, y = 764.7952386743259},
            propsData = {}
          },
          ["1733380183841608"] = {
            key = "1733380183841608",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -42.110338362002146, y = 23.6380817773335},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0061_scene_ex01_escape.0061_scene_ex01_escape'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102103},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1733380452193629772"] = {
            key = "1733380452193629772",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 216.96551413346253, y = 10.438081777333515},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1670023,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_1670023"
            }
          },
          ["173590195512322862387"] = {
            key = "173590195512322862387",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 252.69480519480547, y = -211.93578643578638},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1670026}
            }
          },
          ["173590196790022862729"] = {
            key = "173590196790022862729",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1118.6363696689787, y = 566.0231507622814},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1670026}
            }
          },
          ["1750236974939648"] = {
            key = "1750236974939648",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -138, y = 408},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "SewWarm_OpenGateStart",
              UnitId = -1
            }
          },
          ["1755776662928644"] = {
            key = "1755776662928644",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -205.75, y = 868.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1670028}
            }
          },
          ["17557766802251066"] = {
            key = "17557766802251066",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = -205.74999999999986, y = 1066},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1670004,
              StateId = 573,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17557766969971253"] = {
            key = "17557766969971253",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 113.00000000000023, y = 1097.25},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1670028},
              StateId = 1170101,
              QuestId = 110108
            }
          },
          ["17558440994521346"] = {
            key = "17558440994521346",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 549.1799765451944, y = -292.68589486671317},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {1670028},
              StateId = 1170100,
              QuestId = 110108
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
