return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1748942011596229",
      startPort = "StoryStart",
      endStory = "1748942078981663",
      endPort = "In"
    },
    {
      startStory = "1748942078981663",
      startPort = "Success",
      endStory = "17490194772693585483",
      endPort = "In"
    },
    {
      startStory = "17490194772693585483",
      startPort = "Success",
      endStory = "1748942011596232",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1748942011596229"] = {
      isStoryNode = true,
      key = "1748942011596229",
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
    ["1748942011596232"] = {
      isStoryNode = true,
      key = "1748942011596232",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1871.9999977177024, y = 295.3846161746414},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1748942078981663"] = {
      isStoryNode = true,
      key = "1748942078981663",
      type = "StoryNode",
      name = "\230\138\164\233\128\129\229\164\154\231\186\179\231\137\185\231\154\132\231\172\172\228\186\140\229\156\186\230\136\152\230\150\151",
      pos = {x = 1181.282051252791, y = 284.71794874720894},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_4",
        QuestDeatil = "Content_200231_4",
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
            startQuest = "1748943686919596768",
            startPort = "Out",
            endQuest = "1748943913298597530",
            endPort = "In"
          },
          {
            startQuest = "1748942078981664",
            startPort = "QuestStart",
            endQuest = "1748950649386599867",
            endPort = "In"
          },
          {
            startQuest = "1748943913298597530",
            startPort = "Out",
            endQuest = "17490182727232386917",
            endPort = "In"
          },
          {
            startQuest = "17490182727232386917",
            startPort = "Out",
            endQuest = "1748942078981671",
            endPort = "Success"
          },
          {
            startQuest = "1748950649386599867",
            startPort = "Out",
            endQuest = "1748942078981678",
            endPort = "Fail"
          },
          {
            startQuest = "174910991906414362021",
            startPort = "Out",
            endQuest = "17530784850832252406",
            endPort = "In"
          },
          {
            startQuest = "1748942078981664",
            startPort = "QuestStart",
            endQuest = "174910991906414362021",
            endPort = "In"
          },
          {
            startQuest = "17530784850832252406",
            startPort = "Out",
            endQuest = "17490184860522387987",
            endPort = "In"
          },
          {
            startQuest = "17490184860522387987",
            startPort = "Out",
            endQuest = "1748943686919596768",
            endPort = "In"
          }
        },
        nodeData = {
          ["1748942078981664"] = {
            key = "1748942078981664",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748942078981671"] = {
            key = "1748942078981671",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2561.0936290596164, y = 329.6616836231226},
            propsData = {ModeType = 0}
          },
          ["1748942078981678"] = {
            key = "1748942078981678",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1908.6111055007898, y = 800.9489627178316},
            propsData = {}
          },
          ["1748943686919596768"] = {
            key = "1748943686919596768",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1483.8709715148584, y = 300.10138422104797},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1270191,
                1270192,
                1270193,
                1270194,
                1270195,
                1270196,
                1270197,
                1270198,
                1270199,
                1270200
              }
            }
          },
          ["1748943913298597530"] = {
            key = "1748943913298597530",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1862.248522420031, y = 290.8755781724348},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 10,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1270191,
                1270192,
                1270193,
                1270194,
                1270195,
                1270196,
                1270197,
                1270198,
                1270199,
                1270200
              }
            }
          },
          ["1748950623585599175"] = {
            key = "1748950623585599175",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1999.410611954297, y = -92.91165942792686},
            propsData = {}
          },
          ["1748950649386599867"] = {
            key = "1748950649386599867",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1293.4704159101332, y = 779.5509528688739},
            propsData = {}
          },
          ["17490182727232386917"] = {
            key = "17490182727232386917",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2286.8838525740284, y = 324.1686582975431},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_20023107"
            }
          },
          ["17490184860522387987"] = {
            key = "17490184860522387987",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1662.8136251332955, y = 105.25863264285469},
            propsData = {
              NewDescription = "Description_200231_6",
              NewDetail = "Content_200231_6",
              SubTaskTargetIndex = 0
            }
          },
          ["174910991906414362021"] = {
            key = "174910991906414362021",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\162\147\231\162\145",
            pos = {x = 1188.596930735665, y = 294.01995996033185},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1270214}
            }
          },
          ["17530784850832252406"] = {
            key = "17530784850832252406",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1352.913286813861, y = 108.21948273175676},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1270220,
              GuideType = "P",
              GuidePointName = "QuestPoint_20023105"
            }
          }
        },
        commentData = {}
      }
    },
    ["17490194772693585483"] = {
      isStoryNode = true,
      key = "17490194772693585483",
      type = "StoryNode",
      name = "\230\138\164\233\128\129\229\164\154\231\186\179\231\137\185\231\154\132\231\172\172\228\184\137\229\156\186\230\136\152\230\150\151",
      pos = {x = 1566.8930222732959, y = 303.0924650551834},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_6",
        QuestDeatil = "Content_200231_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "17490194772693585484",
            startPort = "QuestStart",
            endQuest = "17490200217133587863",
            endPort = "In"
          },
          {
            startQuest = "17490200217133587863",
            startPort = "Out",
            endQuest = "17490200828213588201",
            endPort = "In"
          },
          {
            startQuest = "17490194772693585484",
            startPort = "QuestStart",
            endQuest = "17490201144353588618",
            endPort = "In"
          },
          {
            startQuest = "17490201144353588618",
            startPort = "Out",
            endQuest = "17490201419903589169",
            endPort = "In"
          },
          {
            startQuest = "17490194772693585484",
            startPort = "QuestStart",
            endQuest = "17490201556293589582",
            endPort = "In"
          },
          {
            startQuest = "17490201556293589582",
            startPort = "Out",
            endQuest = "17490194772693585490",
            endPort = "Fail"
          },
          {
            startQuest = "17490201419903589169",
            startPort = "Out",
            endQuest = "17490232814075986274",
            endPort = "In"
          },
          {
            startQuest = "17490232814075986274",
            startPort = "Out",
            endQuest = "17490210093624188753",
            endPort = "In"
          },
          {
            startQuest = "17490194772693585484",
            startPort = "QuestStart",
            endQuest = "17490242148767183120",
            endPort = "In"
          },
          {
            startQuest = "174903142701411968924",
            startPort = "Out",
            endQuest = "174903147480711969692",
            endPort = "In"
          },
          {
            startQuest = "17490210093624188753",
            startPort = "Out",
            endQuest = "17490210883894786611",
            endPort = "In"
          }
        },
        nodeData = {
          ["17490194772693585484"] = {
            key = "17490194772693585484",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17490194772693585487"] = {
            key = "17490194772693585487",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3090.2325223613148, y = 316.19193816007504},
            propsData = {ModeType = 0}
          },
          ["17490194772693585490"] = {
            key = "17490194772693585490",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1877.272741494647, y = 606.0606075084862},
            propsData = {}
          },
          ["17490200217133587863"] = {
            key = "17490200217133587863",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1195.4619368042884, y = 65.02291324520496},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1270203,
              GuideType = "P",
              GuidePointName = "QuestPoint_20023107"
            }
          },
          ["17490200828213588201"] = {
            key = "17490200828213588201",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1524.2424246394237, y = 66.24242541006954},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009652,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17490201144353588618"] = {
            key = "17490201144353588618",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1211.272727623021, y = 316.3030306066181},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1270204,
                1270205,
                1270206,
                1270207,
                1270208,
                1270209,
                1270210
              }
            }
          },
          ["17490201419903589169"] = {
            key = "17490201419903589169",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1549.1515172299237, y = 310.6060673784034},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 7,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1270204,
                1270205,
                1270206,
                1270207,
                1270208,
                1270209,
                1270210
              }
            }
          },
          ["17490201556293589582"] = {
            key = "17490201556293589582",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1276.4242487061742, y = 586.3636388857503},
            propsData = {}
          },
          ["17490210093624188753"] = {
            key = "17490210093624188753",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2038.8780418514368, y = 311.52994022011615},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009653,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20023107",
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
                  TalkActorId = 700301,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700317,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700301},
                {TalkActorType = "Npc", TalkActorId = 700317}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17490210883894786611"] = {
            key = "17490210883894786611",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2374.81878389451, y = 293.6933381857925},
            propsData = {}
          },
          ["17490232814075986274"] = {
            key = "17490232814075986274",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1788.3386706581077, y = 326.5548551837174},
            propsData = {WaitTime = 1}
          },
          ["17490242148767183120"] = {
            key = "17490242148767183120",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1171.2655127555229, y = -216.12806190267963},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009646,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174903142701411968924"] = {
            key = "174903142701411968924",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2281.5093893850158, y = 54.16461188642563},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009659,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
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
          ["174903147480711969692"] = {
            key = "174903147480711969692",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2541.380550084358, y = 53.035152737571366},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009660,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20023107",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700301,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700317,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700301},
                {TalkActorType = "Npc", TalkActorId = 700317}
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
    }
  },
  commentData = {}
}
