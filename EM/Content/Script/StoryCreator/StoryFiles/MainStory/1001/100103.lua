return {
  storyName = "\229\188\128\229\167\139\230\137\147\230\158\182",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1685432317574210",
      startPort = "Success",
      endStory = "story_1685529296839670",
      endPort = "In"
    },
    {
      startStory = "story_1685529296839670",
      startPort = "Success",
      endStory = "story_1685529297637696",
      endPort = "In"
    },
    {
      startStory = "story_1685529297637696",
      startPort = "Success",
      endStory = "story_1685533849403792",
      endPort = "In"
    },
    {
      startStory = "story_1685533849403792",
      startPort = "Success",
      endStory = "story_1685588427049905",
      endPort = "In"
    },
    {
      startStory = "story_16939873271691836",
      startPort = "Success",
      endStory = "1705564125826174068",
      endPort = "In"
    },
    {
      startStory = "1705564125826174068",
      startPort = "Success",
      endStory = "story_1685432312767208",
      endPort = "StoryEnd"
    },
    {
      startStory = "story_1685588427049905",
      startPort = "Success",
      endStory = "1730296950039212168",
      endPort = "In"
    },
    {
      startStory = "1730296950039212168",
      startPort = "Success",
      endStory = "17465155350503056",
      endPort = "In"
    },
    {
      startStory = "17465155350503056",
      startPort = "Success",
      endStory = "story_16939873271691836",
      endPort = "In"
    },
    {
      startStory = "story_1685432312767206",
      startPort = "StoryStart",
      endStory = "17467774050423068",
      endPort = "In"
    },
    {
      startStory = "17467774050423068",
      startPort = "Success",
      endStory = "17468601216233215",
      endPort = "In"
    },
    {
      startStory = "17468601216233215",
      startPort = "Success",
      endStory = "story_1685432317574210",
      endPort = "In"
    }
  },
  storyNodeData = {
    story_1685432312767206 = {
      isStoryNode = true,
      key = "story_1685432312767206",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 106.81818181818181, y = 120.9090909090909},
      propsData = {QuestChainId = 100103},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1685432312767208 = {
      isStoryNode = true,
      key = "story_1685432312767208",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1297.5000872265903, y = 358.5380238082479},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1685432317574210 = {
      isStoryNode = true,
      key = "story_1685432317574210",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\228\186\145\230\181\183",
      pos = {x = 392.6217590662661, y = 117.54334448199542},
      propsData = {
        QuestId = 10010301,
        QuestDescriptionComment = "\231\187\167\231\187\173\229\144\145\229\137\141\230\142\162\231\180\162",
        QuestDescription = "Description_100103_1",
        QuestDeatil = "Description_100103_1",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_NewTargetPoint10010301"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1685432317574214",
            startPort = "QuestStart",
            endQuest = "169865023512333864",
            endPort = "Input"
          },
          {
            startQuest = "quest_1685522511919413",
            startPort = "Out",
            endQuest = "169865579225622962",
            endPort = "In"
          },
          {
            startQuest = "quest_1685525339753435",
            startPort = "Out",
            endQuest = "quest_1685522689614417",
            endPort = "In"
          },
          {
            startQuest = "169865023512333864",
            startPort = "BeginOverlap",
            endQuest = "1708484335215205338",
            endPort = "In"
          },
          {
            startQuest = "1708484335215205338",
            startPort = "Out",
            endQuest = "169865023512333864",
            endPort = "Input"
          },
          {
            startQuest = "1708484354919206205",
            startPort = "Out",
            endQuest = "quest_1685525339753435",
            endPort = "In"
          },
          {
            startQuest = "169865579225622962",
            startPort = "Out",
            endQuest = "1708484354919206205",
            endPort = "In"
          },
          {
            startQuest = "169865023512333864",
            startPort = "EndOverlap",
            endQuest = "170970511650323421",
            endPort = "In"
          },
          {
            startQuest = "170970511650323421",
            startPort = "Out",
            endQuest = "169865023512333864",
            endPort = "Input"
          },
          {
            startQuest = "quest_1685522689614417",
            startPort = "Out",
            endQuest = "quest_1685432317574216",
            endPort = "Success"
          },
          {
            startQuest = "17467730310034502637",
            startPort = "Out",
            endQuest = "17431456850486523952",
            endPort = "In"
          },
          {
            startQuest = "quest_1685522511919413",
            startPort = "Out",
            endQuest = "17467742041545349183",
            endPort = "In"
          },
          {
            startQuest = "17467742041545349183",
            startPort = "Out",
            endQuest = "17467742044755349198",
            endPort = "In"
          },
          {
            startQuest = "quest_1685432317574214",
            startPort = "QuestStart",
            endQuest = "quest_1685522511919413",
            endPort = "In"
          },
          {
            startQuest = "17467742044755349198",
            startPort = "Out",
            endQuest = "17467730310034502637",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685432317574214 = {
            key = "quest_1685432317574214",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -54.09090909090909, y = 129.0909090909091},
            propsData = {ModeType = 0}
          },
          quest_1685432317574216 = {
            key = "quest_1685432317574216",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1959.444719480749, y = 189.02256215140338},
            propsData = {ModeType = 0}
          },
          quest_1685432317574218 = {
            key = "quest_1685432317574218",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1651.6443569299804, y = 452.5485461589694},
            propsData = {}
          },
          quest_1685522511919413 = {
            key = "quest_1685522511919413",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 382.90695266958596, y = 158.12329130827675},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010411,
              GuideType = "P",
              GuidePointName = "BP_NewTargetPoint10010301"
            }
          },
          quest_1685522689614417 = {
            key = "quest_1685522689614417",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 1689.2016195236893, y = 193.97531055844374},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1310010401,
                1310010405,
                1310010406,
                1310010407,
                1310010408,
                1310010409,
                1310010410,
                1310010411,
                1310010412,
                1310010413,
                1310010414,
                1310010415,
                1580213,
                1580214,
                1580215,
                1580216,
                1580217,
                1580218,
                1580219,
                1580220,
                1580221,
                1580222,
                1580223,
                1580224
              }
            }
          },
          quest_1685525339753435 = {
            key = "quest_1685525339753435",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100116-\229\163\171\229\133\181\230\137\190\228\186\186-SC07",
            pos = {x = 1394.4184713227282, y = 178.75162466506063},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC007/SQ_OBT0100_SC007",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
          quest_1685947271598238 = {
            key = "quest_1685947271598238",
            type = "PlayOrStopBGMNode",
            name = "bgm - _zaoyudiguojun  - start",
            pos = {x = 1226.6987634392997, y = 452.42785052644496},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0007_story_zaoyudiguojun.0007_story_zaoyudiguojun'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["169449332523433201"] = {
            key = "169449332523433201",
            type = "PlayOrStopBGMNode",
            name = "BGM - 07- end",
            pos = {x = 1794.3673970004063, y = -80.0018846523425},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["169864881121635407"] = {
            key = "169864881121635407",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - end",
            pos = {x = 765.7850797541873, y = 496.9032638882757},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["169865023512333863"] = {
            key = "169865023512333863",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 1648.614354562295, y = -498.7774523789113},
            propsData = {SoundStateType = 1, SoundType = 0}
          },
          ["169865023512333864"] = {
            key = "169865023512333864",
            type = "CollisionBoxNode",
            name = "\233\159\179\228\185\144\229\136\164\229\174\154\231\155\146",
            pos = {x = 471.4082142114175, y = -260.9134172911921},
            propsData = {StaticCreatorId = 1110010412}
          },
          ["169865023512333865"] = {
            key = "169865023512333865",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - resume",
            pos = {x = 1639.3687405272071, y = -343.51780325610434},
            propsData = {SoundStateType = 2, SoundType = 0}
          },
          ["169865579225622962"] = {
            key = "169865579225622962",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\160\233\153\164\233\159\179\228\185\144\229\136\164\229\174\154\231\155\146",
            pos = {x = 729.1923414304997, y = 191.38054993252385},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010412}
            }
          },
          ["169865582252825608"] = {
            key = "169865582252825608",
            type = "PlayOrStopBGMNode",
            name = "bgm - _zaoyudiguojun  - resume",
            pos = {x = 1463.9630816170866, y = 582.9551868802445},
            propsData = {SoundStateType = 2, SoundType = 0}
          },
          ["1708484335215205338"] = {
            key = "1708484335215205338",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - Stop(MUTE)",
            pos = {x = 751.5369919386444, y = -359.44573905250274},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1708484335215205339"] = {
            key = "1708484335215205339",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji\228\184\138\229\177\130 - Play",
            pos = {x = 1123.5699493321283, y = -195.1146613582672},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0029_atmos_shendianshangceng.0029_atmos_shendianshangceng'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1708484354919206205"] = {
            key = "1708484354919206205",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - Stop(MUTE)",
            pos = {x = 1099.6861629430787, y = 175.35441517923041},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["170970511650323421"] = {
            key = "170970511650323421",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 752.6459287616419, y = -203.59210215682765},
            propsData = {WaitTime = 0.1}
          },
          ["17431456850486523952"] = {
            key = "17431456850486523952",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 1572.21645243746, y = 7.758873310597323},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["1743661670094819267"] = {
            key = "1743661670094819267",
            type = "SetGlobalSoundParamNode",
            name = "\232\174\190\231\189\174\229\133\168\229\177\128\233\159\179\230\149\136\229\143\130\230\149\176",
            pos = {x = 1235.88551178956, y = -377.39023588854917},
            propsData = {ParamName = "", ParamValue = 0}
          },
          ["1743661674725819333"] = {
            key = "1743661674725819333",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1094.067329971378, y = -511.02659952491285},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17467730310034502637"] = {
            key = "17467730310034502637",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1305.258249661923, y = 22.59001012561734},
            propsData = {WaitTime = 2}
          },
          ["17467742041545349183"] = {
            key = "17467742041545349183",
            type = "CreatePhantomNode",
            name = "\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 787.710577550906, y = 43.693585294764404},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = true,
              StaticCreatorIdList = {1570203}
            }
          },
          ["17467742044755349198"] = {
            key = "17467742044755349198",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1046.3312672060786, y = 40.590137018902354},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = true,
              StaticCreatorIdList = {1580211}
            }
          }
        },
        commentData = {
          ["169865024173834682"] = {
            key = "169865024173834682",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159\233\159\179\228\185\144\229\129\156\230\173\162",
            position = {x = 434.96084579036494, y = -448.41341729119205},
            size = {width = 600, height = 400}
          }
        }
      }
    },
    story_1685529296839670 = {
      isStoryNode = true,
      key = "story_1685529296839670",
      type = "StoryNode",
      name = "\230\157\128\230\128\170",
      pos = {x = 695.5201093110774, y = 118.494724605156},
      propsData = {
        QuestId = 10010302,
        QuestDescriptionComment = "\229\135\187\232\180\165\230\149\140\228\186\186",
        QuestDescription = "Description_100103_2",
        QuestDeatil = "Description_100103_2",
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
        SubRegionId = 100103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint10504"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1685529502527726",
            startPort = "Out",
            endQuest = "quest_1685939823934590",
            endPort = "In"
          },
          {
            startQuest = "171031112393312212",
            startPort = "Out",
            endQuest = "171031116265314229",
            endPort = "In"
          },
          {
            startQuest = "171031116265314229",
            startPort = "Out",
            endQuest = "171031112393312211",
            endPort = "In"
          },
          {
            startQuest = "171031112393312211",
            startPort = "Out",
            endQuest = "171031112393312210",
            endPort = "In"
          },
          {
            startQuest = "171031112393312210",
            startPort = "Out",
            endQuest = "170479445521353718",
            endPort = "In"
          },
          {
            startQuest = "171031112393312210",
            startPort = "Out",
            endQuest = "quest_1685529502527726",
            endPort = "In"
          },
          {
            startQuest = "quest_1685939823934590",
            startPort = "Out",
            endQuest = "quest_1690886158904333",
            endPort = "In"
          },
          {
            startQuest = "quest_1690886158904333",
            startPort = "Out",
            endQuest = "1704175979099186299",
            endPort = "Success"
          },
          {
            startQuest = "1704175979099186298",
            startPort = "QuestStart",
            endQuest = "171031112393312212",
            endPort = "In"
          },
          {
            startQuest = "1704175979099186298",
            startPort = "QuestStart",
            endQuest = "17467730628824503892",
            endPort = "In"
          },
          {
            startQuest = "17467730628824503892",
            startPort = "Out",
            endQuest = "17443765777901616611",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685529502527726 = {
            key = "quest_1685529502527726",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 17.731416880418905, y = 113.63864097023055},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 40,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          quest_1685939823934590 = {
            key = "quest_1685939823934590",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 283.34615384615387, y = 114.8479020979021},
            propsData = {WaitTime = 1}
          },
          quest_1689082480631322 = {
            key = "quest_1689082480631322",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175\239\188\136\231\167\187\229\138\168\229\136\176\229\137\141\228\184\128\228\184\170\228\187\187\229\138\161\230\156\171\229\176\190\239\188\137",
            pos = {x = -183.97251931196865, y = 378.22899888558936},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiStart",
              UnitId = -1
            }
          },
          quest_1690886158904333 = {
            key = "quest_1690886158904333",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 544.3762838697993, y = 113.39909135046818},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990301,
                990302,
                990303,
                990304,
                990305,
                990306,
                990307,
                990308,
                990309,
                990310,
                990311,
                990312,
                990313,
                990314,
                990315,
                990316,
                990317
              }
            }
          },
          quest_1690886158905336 = {
            key = "quest_1690886158905336",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 1276.174893318684, y = 547.1297625969002},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580001}
            }
          },
          ["1704175979099186298"] = {
            key = "1704175979099186298",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1393.3130984417048, y = 112.17522998936101},
            propsData = {ModeType = 0}
          },
          ["1704175979099186299"] = {
            key = "1704175979099186299",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1170.12125432574, y = 111.32811508929844},
            propsData = {ModeType = 0}
          },
          ["1704175979099186300"] = {
            key = "1704175979099186300",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1651.6443569299804, y = 452.5485461589694},
            propsData = {}
          },
          ["170479445521353718"] = {
            key = "170479445521353718",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-\231\187\157\233\157\158\229\150\132\231\177\187",
            pos = {x = 20.215188944631876, y = -91.23475026790457},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011605,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["171031112393312210"] = {
            key = "171031112393312210",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -302.8836238935228, y = 110.59097773123729},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint10504",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["171031112393312211"] = {
            key = "171031112393312211",
            type = "SendMessageNode",
            name = "\229\188\128\229\144\175\231\169\186\230\176\148\229\162\153",
            pos = {x = -586.5689834213142, y = 109.02494676871021},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "AirWallOn",
              UnitId = -1
            }
          },
          ["171031112393312212"] = {
            key = "171031112393312212",
            type = "SendMessageNode",
            name = "YunhaiStart",
            pos = {x = -1122.9117180468095, y = 109.75694730059725},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiStart",
              UnitId = -1
            }
          },
          ["171031116265314229"] = {
            key = "171031116265314229",
            type = "SwitchStoryModeNode",
            name = "\229\188\128\229\144\175 \229\137\167\230\131\133\230\168\161\229\188\143",
            pos = {x = -843.1675992039782, y = 106.52910492939117},
            propsData = {IsOpen = true}
          },
          ["17443765777901616611"] = {
            key = "17443765777901616611",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = -893.4216435738176, y = 293.0771619684663},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467730628824503892"] = {
            key = "17467730628824503892",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -1144.0910990558664, y = 299.35676461219913},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_1685529297637696 = {
      isStoryNode = true,
      key = "story_1685529297637696",
      type = "StoryNode",
      name = "\233\128\131\232\183\145",
      pos = {x = 990.6616625106162, y = 119.03100893192969},
      propsData = {
        QuestId = 10010303,
        QuestDescriptionComment = "\233\128\131\231\166\187\232\191\153\233\135\140",
        QuestDescription = "Description_100103_3",
        QuestDeatil = "Description_100103_3",
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
        SubRegionId = 100103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint10502"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17204273903738495",
            startPort = "Out",
            endQuest = "17204273903738492",
            endPort = "In"
          },
          {
            startQuest = "17204273903738491",
            startPort = "Out",
            endQuest = "17204273903738493",
            endPort = "In"
          },
          {
            startQuest = "17204273903738494",
            startPort = "Out",
            endQuest = "17204273903738491",
            endPort = "In"
          },
          {
            startQuest = "1720428418099422115",
            startPort = "Out",
            endQuest = "1720428418099422116",
            endPort = "In"
          },
          {
            startQuest = "1720428418099422116",
            startPort = "Out",
            endQuest = "quest_1685532723039754",
            endPort = "In"
          },
          {
            startQuest = "1704175979099186301",
            startPort = "QuestStart",
            endQuest = "17467730792584504548",
            endPort = "In"
          },
          {
            startQuest = "17467730792584504548",
            startPort = "Out",
            endQuest = "17443765829181616815",
            endPort = "In"
          },
          {
            startQuest = "1704175979099186301",
            startPort = "QuestStart",
            endQuest = "1720428418099422115",
            endPort = "In"
          },
          {
            startQuest = "quest_1685532723039754",
            startPort = "Out",
            endQuest = "1704175979099186302",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_1685532723039754 = {
            key = "quest_1685532723039754",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100122-\229\133\176\232\191\170\232\191\189\228\186\186-SC15",
            pos = {x = 431.787883507276, y = 202.81109189971045},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC015/SQ_OBT0100_SC015",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
          quest_16908846883863314 = {
            key = "quest_16908846883863314",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 422.69565217391306, y = -50},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580001}
            }
          },
          quest_16908847093603318 = {
            key = "quest_16908847093603318",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 1255.0434782608695, y = -73.30434782608697},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1580001}
            }
          },
          ["1704175979099186301"] = {
            key = "1704175979099186301",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -411.2857142857143, y = 189.73214285714286},
            propsData = {ModeType = 0}
          },
          ["1704175979099186302"] = {
            key = "1704175979099186302",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 793.3272112213643, y = 191.837928180568},
            propsData = {ModeType = 0}
          },
          ["1704175979099186303"] = {
            key = "1704175979099186303",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1113.3128521929038, y = 694.7517512007249},
            propsData = {}
          },
          ["17204273903738491"] = {
            key = "17204273903738491",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\226\128\148\226\128\148\233\152\178\230\173\162\231\142\169\229\174\182\232\183\179\232\191\135",
            pos = {x = 486.6053940344418, y = 862.1526678750345},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1110010507,
              GuideType = "M",
              GuidePointName = "QuestTrigger10507"
            }
          },
          ["17204273903738492"] = {
            key = "17204273903738492",
            type = "ChangeStaticCreatorNode",
            name = "\230\184\133\233\153\164\230\148\175\232\183\175\229\136\164\229\174\154\231\155\146",
            pos = {x = 487.2296237263183, y = 688.6207351019252},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010507}
            }
          },
          ["17204273903738493"] = {
            key = "17204273903738493",
            type = "ChangeStaticCreatorNode",
            name = "\230\184\133\233\153\164\230\148\175\232\183\175\229\136\164\229\174\154\231\155\146",
            pos = {x = 748.5636573397638, y = 865.353928379236},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010501}
            }
          },
          ["17204273903738494"] = {
            key = "17204273903738494",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 222.7212644385472, y = 870.6535552229807},
            propsData = {WaitTime = 0.5}
          },
          ["17204273903738495"] = {
            key = "17204273903738495",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 215.43909764518858, y = 679.673340791222},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010501,
              GuideType = "M",
              GuidePointName = "QuestTrigger10501"
            }
          },
          ["1720428418099422115"] = {
            key = "1720428418099422115",
            type = "TalkNode",
            name = "\233\187\145\229\177\143-100275-\229\143\166\228\184\128\232\190\185",
            pos = {x = -114.89736457979961, y = 205.53919762645717},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10027501,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
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
          ["1720428418099422116"] = {
            key = "1720428418099422116",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100117-\232\181\171\229\141\161\232\146\130\229\133\176\232\191\170\229\147\148\229\147\148-SC14",
            pos = {x = 186.00189060073285, y = 206.76473708692052},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC014/SQ_OBT0100_SC014",
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
          ["17443765829181616815"] = {
            key = "17443765829181616815",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 62.83333333333334, y = 61.833333333333314},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467730792584504548"] = {
            key = "17467730792584504548",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -188.08045977011489, y = 44.49796530306287},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_1685533849403792 = {
      isStoryNode = true,
      key = "story_1685533849403792",
      type = "StoryNode",
      name = "\229\177\177\230\180\158\232\191\189\233\128\144\230\136\152",
      pos = {x = 1292.505994866564, y = 127.01741194369826},
      propsData = {
        QuestId = 10010304,
        QuestDescriptionComment = "\233\128\131\231\166\187\229\163\171\229\133\181\231\154\132\229\140\133\229\155\180",
        QuestDescription = "Description_100103_4",
        QuestDeatil = "Description_100103_4",
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
        SubRegionId = 100103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint10502"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1685586292487872",
            startPort = "Out",
            endQuest = "16968455848153715",
            endPort = "In"
          },
          {
            startQuest = "169935312103715721",
            startPort = "Out",
            endQuest = "quest_16940706250363385",
            endPort = "In"
          },
          {
            startQuest = "170530636966423906",
            startPort = "Out",
            endQuest = "170530639730025119",
            endPort = "In"
          },
          {
            startQuest = "170530639730025119",
            startPort = "Out",
            endQuest = "170530639951225225",
            endPort = "In"
          },
          {
            startQuest = "1706009918851153372",
            startPort = "Out",
            endQuest = "quest_1685533849403798",
            endPort = "Success"
          },
          {
            startQuest = "quest_1685586292487872",
            startPort = "Out",
            endQuest = "1706009918851153372",
            endPort = "In"
          },
          {
            startQuest = "17170602476661381128",
            startPort = "Out",
            endQuest = "17170602476661381129",
            endPort = "In"
          },
          {
            startQuest = "17170602476661381129",
            startPort = "Out",
            endQuest = "17170602476661381130",
            endPort = "In"
          },
          {
            startQuest = "17170602579201381638",
            startPort = "PC",
            endQuest = "170530636966423906",
            endPort = "In"
          },
          {
            startQuest = "17170602579201381638",
            startPort = "Mobile",
            endQuest = "17170602476661381128",
            endPort = "In"
          },
          {
            startQuest = "17170602579201381638",
            startPort = "PC",
            endQuest = "17175012325521976042",
            endPort = "In"
          },
          {
            startQuest = "quest_1685586292487878",
            startPort = "Out",
            endQuest = "quest_1685586292487872",
            endPort = "In"
          },
          {
            startQuest = "170530639951225225",
            startPort = "Out",
            endQuest = "17175015066241978629",
            endPort = "In"
          },
          {
            startQuest = "17175015066241978629",
            startPort = "Out",
            endQuest = "quest_1685586292487878",
            endPort = "In"
          },
          {
            startQuest = "17170602476661381130",
            startPort = "Out",
            endQuest = "quest_1685586292487878",
            endPort = "In"
          },
          {
            startQuest = "169778744263517127",
            startPort = "Out",
            endQuest = "quest_1686040813794431",
            endPort = "In"
          },
          {
            startQuest = "quest_1686040813794431",
            startPort = "Out",
            endQuest = "1743662138436821656",
            endPort = "In"
          },
          {
            startQuest = "1743662138436821656",
            startPort = "Out",
            endQuest = "17170602579201381638",
            endPort = "Input"
          },
          {
            startQuest = "17467730965504505263",
            startPort = "Out",
            endQuest = "17443765943771617280",
            endPort = "In"
          },
          {
            startQuest = "quest_1685533849403796",
            startPort = "QuestStart",
            endQuest = "quest_1685533939052807",
            endPort = "In"
          },
          {
            startQuest = "quest_16940706250363385",
            startPort = "Out",
            endQuest = "169778744263517127",
            endPort = "In"
          },
          {
            startQuest = "quest_1685533939052807",
            startPort = "Out",
            endQuest = "17467730965504505263",
            endPort = "In"
          },
          {
            startQuest = "quest_1685533939052807",
            startPort = "Out",
            endQuest = "169935312103715721",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685533849403796 = {
            key = "quest_1685533849403796",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -773.9869281045752, y = -286.33986928104576},
            propsData = {ModeType = 0}
          },
          quest_1685533849403798 = {
            key = "quest_1685533849403798",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2062.263266510213, y = 63.15147016536332},
            propsData = {ModeType = 0}
          },
          quest_1685533849403800 = {
            key = "quest_1685533849403800",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2505.4256581941577, y = 921.3880543562644},
            propsData = {}
          },
          quest_1685533939052807 = {
            key = "quest_1685533939052807",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -540.1307788536018, y = -402.8350541826827},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint10502",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          quest_1685586292487872 = {
            key = "quest_1685586292487872",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1420.6288173164694, y = 77.01375457133167},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiRunStart",
              UnitId = -1
            }
          },
          quest_1685586292487878 = {
            key = "quest_1685586292487878",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1071.0389543113208, y = 65.49404245642152},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "RockBlock",
              UnitId = -1
            }
          },
          quest_1686040813794431 = {
            key = "quest_1686040813794431",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = -68.55594178240344, y = -41.30404878202041},
            propsData = {
              HPPercent = -1,
              ESPercent = -1,
              SPPercent = 1,
              BuffList = {},
              RecoverPlayer = false
            }
          },
          quest_16940706250363385 = {
            key = "quest_16940706250363385",
            type = "PlayOrStopBGMNode",
            name = "bgm - zhuizhuzhan  - start",
            pos = {x = 125.98995020702147, y = -325.93596488811124},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0008_combat_zhuizhuzhan",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["16968455848153715"] = {
            key = "16968455848153715",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1699.8901098901101, y = -114.78021978021957},
            propsData = {
              ShowEnable = true,
              MessageId = 100005,
              MessageNote = "\229\141\177\233\153\169\239\188\140\229\138\160\233\128\159\233\128\131\231\166\187",
              LastTime = -1,
              Style = "Warning"
            }
          },
          ["169778744263517127"] = {
            key = "169778744263517127",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -310.3380333226841, y = -42.67134947779536},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "AirWallOff",
              UnitId = -1
            }
          },
          ["169935312103715721"] = {
            key = "169935312103715721",
            type = "PlayOrStopBGMNode",
            name = "bgm - _zaoyudiguojun  - end",
            pos = {x = -138.59850016824794, y = -322.3764844220701},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17053060723439412"] = {
            key = "17053060723439412",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = 208.04531304608707, y = 920.6143724696356},
            propsData = {}
          },
          ["170530636966423906"] = {
            key = "170530636966423906",
            type = "ShowGuideNode",
            name = "\228\184\137\232\191\158E",
            pos = {x = 243.1333623081758, y = -34.40483417055874},
            propsData = {
              MessageId = 200032,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "",
              UICompName = "",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170530639730025119"] = {
            key = "170530639730025119",
            type = "ShowGuideNode",
            name = "\228\184\137\232\191\158E",
            pos = {x = 496.8251837900515, y = -7.068589536277614},
            propsData = {
              MessageId = 200018,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "",
              UICompName = "",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170530639951225225"] = {
            key = "170530639951225225",
            type = "ShowGuideNode",
            name = "\228\184\137\232\191\158E",
            pos = {x = 771.4085171233852, y = -32.485256202944356},
            propsData = {
              MessageId = 200018,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "",
              UICompName = "",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1706009918851153372"] = {
            key = "1706009918851153372",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1720.9539370910757, y = 63.615788298803864},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010503,
              GuideType = "M",
              GuidePointName = "QuestTrigger10503"
            }
          },
          ["17170602476661381128"] = {
            key = "17170602476661381128",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 173.23414490949352, y = 235.8761828141482},
            propsData = {
              MessageId = 200032,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "BattleMain.Char_Skill.Skill.CharSkill_1",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170602476661381129"] = {
            key = "17170602476661381129",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 405.21361796098705, y = 236.8174671259093},
            propsData = {
              MessageId = 200018,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "BattleMain.Char_Skill.Skill.CharSkill_1",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170602476661381130"] = {
            key = "17170602476661381130",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 728.3822515013593, y = 235.91119948051127},
            propsData = {
              MessageId = 200018,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "BattleMain.Char_Skill.Skill.CharSkill_1",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170602579201381638"] = {
            key = "17170602579201381638",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = -348.02237015094806, y = 292.1177543095066},
            propsData = {}
          },
          ["17175012325521976042"] = {
            key = "17175012325521976042",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 249.6959136352926, y = 93.54348093253918},
            propsData = {ShowEnable = true, SkillType = "Skill1"}
          },
          ["17175015066241978629"] = {
            key = "17175015066241978629",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1064.4925576836215, y = -90.52263203363657},
            propsData = {ShowEnable = false, SkillType = "Skill1"}
          },
          ["1743662138436821656"] = {
            key = "1743662138436821656",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = -341.80825322181244, y = 142.28354534597162},
            propsData = {
              ActionType = 0,
              Condition = "warzone",
              SaveToServer = true
            }
          },
          ["17443765943771617280"] = {
            key = "17443765943771617280",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 117.74748496699922, y = -452.3528990199094},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467730965504505263"] = {
            key = "17467730965504505263",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -105.46103615054997, y = -459.6755011546349},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_1685588427049905 = {
      isStoryNode = true,
      key = "story_1685588427049905",
      type = "StoryNode",
      name = "\229\177\177\229\180\150\232\183\145\233\133\183",
      pos = {x = 1596.0087186099354, y = 123.86365150608687},
      propsData = {
        QuestId = 10010305,
        QuestDescriptionComment = "\233\128\131\231\166\187\232\191\153\233\135\140",
        QuestDescription = "Description_100103_3",
        QuestDeatil = "Description_100103_3",
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
        SubRegionId = 0,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10504"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1685588471129919",
            startPort = "Out",
            endQuest = "quest_1685948611447246",
            endPort = "In"
          },
          {
            startQuest = "quest_1685948611447246",
            startPort = "Out",
            endQuest = "quest_1685948762953250",
            endPort = "In"
          },
          {
            startQuest = "169935322288426437",
            startPort = "Out",
            endQuest = "169935322288426436",
            endPort = "In"
          },
          {
            startQuest = "quest_1685588471129919",
            startPort = "Out",
            endQuest = "170427749309462473",
            endPort = "In"
          },
          {
            startQuest = "170530644981027397",
            startPort = "Out",
            endQuest = "170530644981027398",
            endPort = "In"
          },
          {
            startQuest = "17433890957369592",
            startPort = "Out",
            endQuest = "17433893544609971",
            endPort = "In"
          },
          {
            startQuest = "170530644981027399",
            startPort = "Out",
            endQuest = "17433890957369592",
            endPort = "In"
          },
          {
            startQuest = "17433893544609971",
            startPort = "Out",
            endQuest = "170427742587461800",
            endPort = "In"
          },
          {
            startQuest = "17433893544609971",
            startPort = "Out",
            endQuest = "quest_1685588471129919",
            endPort = "In"
          },
          {
            startQuest = "17433893544609971",
            startPort = "Out",
            endQuest = "16968456342566753",
            endPort = "In"
          },
          {
            startQuest = "170530644981027398",
            startPort = "Out",
            endQuest = "17435928501951644541",
            endPort = "In"
          },
          {
            startQuest = "17435928501951644541",
            startPort = "Out",
            endQuest = "170530644981027399",
            endPort = "In"
          },
          {
            startQuest = "quest_1685588502569923",
            startPort = "Out",
            endQuest = "17103106318982657",
            endPort = "In"
          },
          {
            startQuest = "quest_1685948762953250",
            startPort = "Out",
            endQuest = "1743662203399823857",
            endPort = "In"
          },
          {
            startQuest = "1743662203399823857",
            startPort = "Out",
            endQuest = "quest_1685588502569923",
            endPort = "In"
          },
          {
            startQuest = "quest_1685588427049909",
            startPort = "QuestStart",
            endQuest = "170530644981027397",
            endPort = "In"
          },
          {
            startQuest = "17467731245754506353",
            startPort = "Out",
            endQuest = "17443766006701617577",
            endPort = "In"
          },
          {
            startQuest = "quest_1685588427049909",
            startPort = "QuestStart",
            endQuest = "17467731245754506353",
            endPort = "In"
          },
          {
            startQuest = "17103106318982657",
            startPort = "Out",
            endQuest = "17496305714423772",
            endPort = "In"
          },
          {
            startQuest = "17496305714423772",
            startPort = "Out",
            endQuest = "quest_1685588427049911",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_1685588427049909 = {
            key = "quest_1685588427049909",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1252.93351506143, y = 92.67165565237815},
            propsData = {ModeType = 0}
          },
          quest_1685588427049911 = {
            key = "quest_1685588427049911",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2044.5775556499102, y = 142.7724142944828},
            propsData = {ModeType = 0}
          },
          quest_1685588427049913 = {
            key = "quest_1685588427049913",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1309.9572328124152, y = 482.16939835407095},
            propsData = {}
          },
          quest_1685588428815915 = {
            key = "quest_1685588428815915",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175\239\188\136\231\167\187\229\138\168\229\136\176\229\137\141\228\184\128\228\184\170\228\187\187\229\138\161\230\156\171\229\176\190\239\188\137",
            pos = {x = 267.74928920834117, y = 712.009769988088},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiPaojiStart",
              UnitId = -1
            }
          },
          quest_1685588471129919 = {
            key = "quest_1685588471129919",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 284.51545734027957, y = 111.09448824677656},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010505,
              GuideType = "M",
              GuidePointName = "QuestTrigger10505"
            }
          },
          quest_1685588502569923 = {
            key = "quest_1685588502569923",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100185-\232\183\179\229\164\167\231\155\152\229\173\144-SC09",
            pos = {x = 1221.476698968845, y = 153.00552158716033},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC009/SQ_OBT0100_SC009",
              BlendInTime = 0.5,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = false,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "QuestPoint10507",
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
          quest_1685948611447246 = {
            key = "quest_1685948611447246",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 591.8521340344288, y = 159.61354496903078},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiPaojiEnd",
              UnitId = -1
            }
          },
          quest_1685948762953250 = {
            key = "quest_1685948762953250",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 822.8659890434215, y = 164.98519068063536},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiRunEnd",
              UnitId = -1
            }
          },
          ["16968456342566753"] = {
            key = "16968456342566753",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 309.9695681892478, y = -64.88983823194354},
            propsData = {
              ShowEnable = false,
              MessageId = 100005,
              MessageNote = "\229\141\177\233\153\169\239\188\140\229\138\160\233\128\159\233\128\131\231\166\187",
              LastTime = -1,
              Style = "Warning"
            }
          },
          ["169935322288426436"] = {
            key = "169935322288426436",
            type = "PlayOrStopBGMNode",
            name = "bgm - xibi_p1  - start",
            pos = {x = 870.3832696595399, y = 736.1989489532624},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0009_combat_xibi_p1.0009_combat_xibi_p1'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["169935322288426437"] = {
            key = "169935322288426437",
            type = "PlayOrStopBGMNode",
            name = "bgm - 09  - end",
            pos = {x = 618.3511983895728, y = 697.7234946530898},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["170427742587461800"] = {
            key = "170427742587461800",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 291.84772995567425, y = 282.08188944019304},
            propsData = {
              ShowEnable = true,
              MessageId = 100010,
              MessageNote = "\229\141\177\233\153\169\239\188\140\229\138\160\233\128\159\233\128\131\231\166\187",
              LastTime = -1,
              Style = "Warning"
            }
          },
          ["170427749309462473"] = {
            key = "170427749309462473",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 617.2957373258782, y = -30.976165776901112},
            propsData = {
              ShowEnable = false,
              MessageId = 100010,
              MessageNote = "\229\141\177\233\153\169\239\188\140\229\138\160\233\128\159\233\128\131\231\166\187",
              LastTime = -1,
              Style = "Warning"
            }
          },
          ["170530644981027397"] = {
            key = "170530644981027397",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -971.9419240353473, y = 102.91286887915719},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010504,
              GuideType = "M",
              GuidePointName = "QuestTrigger10504"
            }
          },
          ["170530644981027398"] = {
            key = "170530644981027398",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100103-\231\130\174\229\135\187-SC08",
            pos = {x = -710.4491075880499, y = 108.21465982223759},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC008/SQ_OBT0100_SC008",
              BlendOutTime = 0,
              InType = "BlendIn",
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
              EndNewTargetPointName = "QuestPoint0205",
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
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["170530644981027399"] = {
            key = "170530644981027399",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -447.04070906413006, y = 124.45860023299615},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiPaojiStart",
              UnitId = -1
            }
          },
          ["17103106318982657"] = {
            key = "17103106318982657",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1543.252059955235, y = 157.03451425175035},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010509,
              GuideType = "M",
              GuidePointName = "QuestTrigger10509"
            }
          },
          ["17433890957369592"] = {
            key = "17433890957369592",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -189.86479408412328, y = 105.38861317373367},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1580212,
              GuideType = "M",
              GuidePointName = "Mechanism_10010305Box_1580212"
            }
          },
          ["17433893544609971"] = {
            key = "17433893544609971",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 41.66130562262158, y = 116.48069528517064},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "YunhaiPaojiStart2",
              UnitId = -1
            }
          },
          ["17435928501951644541"] = {
            key = "17435928501951644541",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = -538.990145723842, y = -180.70186335403713},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1580225,
                1580226,
                1580227,
                1580228
              }
            }
          },
          ["1743662203399823857"] = {
            key = "1743662203399823857",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1007.67229293401, y = 27.01822780206797},
            propsData = {ActionType = 1, Condition = "warzone"}
          },
          ["17443766006701617577"] = {
            key = "17443766006701617577",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = -866.7536945812808, y = 302.33866995073885},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467731245754506353"] = {
            key = "17467731245754506353",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -1108.257871064468, y = 299.4549543410114},
            propsData = {WaitTime = 2}
          },
          ["17496305714423772"] = {
            key = "17496305714423772",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1811.7815889849192, y = 149.88947500084925},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1580211}
            }
          }
        },
        commentData = {}
      }
    },
    story_1686818608892205 = {
      isStoryNode = true,
      key = "story_1686818608892205",
      type = "StoryNode",
      name = "\229\188\128\229\167\139\230\137\147\230\158\182",
      pos = {x = 409.3428044515472, y = 539.5887606823266},
      propsData = {
        QuestId = 10010306,
        QuestDescriptionComment = "\230\138\181\229\190\161\232\165\191\230\175\148\229\176\148\231\154\132\230\148\187\229\135\187",
        QuestDescription = "Description_100103_5",
        QuestDeatil = "Description_100103_5",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1686818628614264",
            startPort = "Out",
            endQuest = "quest_1686818628614267",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656143285",
            startPort = "Out",
            endQuest = "quest_1686818656143291",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818628614267",
            startPort = "Out",
            endQuest = "quest_1686818656142273",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818628614267",
            startPort = "Out",
            endQuest = "quest_1686818656144300",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818628614267",
            startPort = "Out",
            endQuest = "quest_1686818656142279",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656142273",
            startPort = "Out",
            endQuest = "quest_1686818714349325",
            endPort = "In"
          },
          {
            startQuest = "quest_1685950005860579",
            startPort = "Out",
            endQuest = "quest_168595071741884",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656144300",
            startPort = "Out",
            endQuest = "quest_1688613859891321",
            endPort = "In"
          },
          {
            startQuest = "quest_1689214271175321",
            startPort = "Out",
            endQuest = "quest_1686818628613261",
            endPort = "In"
          },
          {
            startQuest = "quest_1685950005860579",
            startPort = "Out",
            endQuest = "quest_16926743134633260",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818628614267",
            startPort = "Out",
            endQuest = "quest_16940707345323398",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818628613261",
            startPort = "Out",
            endQuest = "quest_16941646614348815",
            endPort = "In"
          },
          {
            startQuest = "quest_16941646614348815",
            startPort = "Out",
            endQuest = "quest_1686818628614264",
            endPort = "In"
          },
          {
            startQuest = "quest_1689214271175321",
            startPort = "Out",
            endQuest = "169864928140556291",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656142273",
            startPort = "Out",
            endQuest = "169864936975962581",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656142279",
            startPort = "Out",
            endQuest = "quest_1686818656143285",
            endPort = "In"
          },
          {
            startQuest = "quest_168595071741884",
            startPort = "Out",
            endQuest = "quest_1686818656143282",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656143282",
            startPort = "Out",
            endQuest = "quest_1689214271175321",
            endPort = "In"
          },
          {
            startQuest = "quest_1685948998584303",
            startPort = "Out",
            endQuest = "quest_1685950005860579",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656142273",
            startPort = "Out",
            endQuest = "170712791945098691",
            endPort = "In"
          },
          {
            startQuest = "170712791945098691",
            startPort = "Out",
            endQuest = "170547835666490370",
            endPort = "In"
          },
          {
            startQuest = "170661294856788888",
            startPort = "Out",
            endQuest = "quest_1685948998584303",
            endPort = "In"
          },
          {
            startQuest = "quest_1685950005860579",
            startPort = "Out",
            endQuest = "17170603691311386800",
            endPort = "Input"
          },
          {
            startQuest = "17170603691311386800",
            startPort = "Mobile",
            endQuest = "17170603566591386386",
            endPort = "In"
          },
          {
            startQuest = "17170603873801387373",
            startPort = "Out",
            endQuest = "17170603873801387372",
            endPort = "In"
          },
          {
            startQuest = "quest_1686818656143285",
            startPort = "Out",
            endQuest = "17170603941311387685",
            endPort = "Input"
          },
          {
            startQuest = "17170603941311387685",
            startPort = "PC",
            endQuest = "quest_16891500071463544",
            endPort = "In"
          },
          {
            startQuest = "17170603941311387685",
            startPort = "Mobile",
            endQuest = "17170603873801387373",
            endPort = "In"
          },
          {
            startQuest = "17170603873801387372",
            startPort = "Out",
            endQuest = "17174982646351069733",
            endPort = "In"
          },
          {
            startQuest = "17170603873801387372",
            startPort = "Out",
            endQuest = "17174982646351069734",
            endPort = "In"
          },
          {
            startQuest = "17170603941311387685",
            startPort = "PC",
            endQuest = "17175015375262107726",
            endPort = "In"
          },
          {
            startQuest = "quest_16891500071463544",
            startPort = "Out",
            endQuest = "17175015776702108097",
            endPort = "In"
          },
          {
            startQuest = "17175015776702108097",
            startPort = "Out",
            endQuest = "17175015915912108513",
            endPort = "In"
          },
          {
            startQuest = "17175015915912108513",
            startPort = "Out",
            endQuest = "17175016482532109281",
            endPort = "In"
          },
          {
            startQuest = "17175016482532109281",
            startPort = "Out",
            endQuest = "17175016549962109430",
            endPort = "In"
          },
          {
            startQuest = "17170603873801387373",
            startPort = "Out",
            endQuest = "17175015915912108513",
            endPort = "In"
          },
          {
            startQuest = "1721130722211141839",
            startPort = "Out",
            endQuest = "17211306451933199",
            endPort = "In"
          },
          {
            startQuest = "17223508369362567961",
            startPort = "Out",
            endQuest = "17223508667972568475",
            endPort = "In"
          },
          {
            startQuest = "quest_16892179358513407",
            startPort = "Out",
            endQuest = "17249168347961342795",
            endPort = "In"
          },
          {
            startQuest = "17249168347961342795",
            startPort = "Out",
            endQuest = "17223508369362567961",
            endPort = "In"
          },
          {
            startQuest = "17223508667972568475",
            startPort = "Out",
            endQuest = "1721130722211141839",
            endPort = "In"
          },
          {
            startQuest = "17211306451933199",
            startPort = "Out",
            endQuest = "quest_168594603684010",
            endPort = "Success"
          },
          {
            startQuest = "17170603691311386800",
            startPort = "PC",
            endQuest = "1731317289790940641",
            endPort = "In"
          },
          {
            startQuest = "quest_16891500071463544",
            startPort = "Out",
            endQuest = "1731317312927941069",
            endPort = "In"
          },
          {
            startQuest = "1731317312927941069",
            startPort = "Out",
            endQuest = "17174982325731068956",
            endPort = "In"
          },
          {
            startQuest = "1731317312927941069",
            startPort = "Out",
            endQuest = "17174982480951069315",
            endPort = "In"
          },
          {
            startQuest = "quest_16859460368408",
            startPort = "QuestStart",
            endQuest = "170661294856788888",
            endPort = "In"
          },
          {
            startQuest = "170547835666490370",
            startPort = "Out",
            endQuest = "quest_16892179358513407",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16859460368408 = {
            key = "quest_16859460368408",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -321.63621945230943, y = -268.23440478320055},
            propsData = {ModeType = 0}
          },
          quest_168594603684010 = {
            key = "quest_168594603684010",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3132.8702544686194, y = 777.9238878254399},
            propsData = {
              ModeType = 1,
              Id = 100104,
              StartIndex = 1,
              IsWhite = false
            }
          },
          quest_168594603684012 = {
            key = "quest_168594603684012",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2636.1997991666003, y = 1349.1802036816387},
            propsData = {}
          },
          quest_1685948998584303 = {
            key = "quest_1685948998584303",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181-\229\136\155\229\187\186",
            pos = {x = 871.3662736804329, y = -236.14826202212774},
            propsData = {
              SendMessage = "BossXibi_P1Start",
              FinishCondition = "BossXibi_Create"
            }
          },
          quest_1685950005860579 = {
            key = "quest_1685950005860579",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1164.5247318137658, y = -240.72650348836228},
            propsData = {GuideId = 3}
          },
          quest_168595071741884 = {
            key = "quest_168595071741884",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181-P1",
            pos = {x = 1531.652567851833, y = -112.27937037045022},
            propsData = {
              SendMessage = "",
              FinishCondition = "BossXibi_P1End"
            }
          },
          quest_1686818628613261 = {
            key = "quest_1686818628613261",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100102-\229\128\146\229\143\153-SC18",
            pos = {x = 499.41695905411234, y = 153.1926991287085},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC018/SQ_OBT0100_SC018",
              InType = "BlendIn",
              OutType = "BlendOut",
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
          quest_1686818628614264 = {
            key = "quest_1686818628614264",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100120-\229\143\145\231\142\176\233\187\145\230\161\131\232\186\171\228\187\189-SC16",
            pos = {x = 931.6403630946855, y = 156.71363085123104},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC016/SQ_OBT0100_SC016",
              InType = "BlendIn",
              OutType = "BlendOut",
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
          quest_1686818628614267 = {
            key = "quest_1686818628614267",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100186-\229\144\136\228\189\147-SC10",
            pos = {x = 1151.7538281485533, y = 154.2386996219924},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC010/SQ_OBT0100_SC010",
              BlendOutTime = 0.5,
              InType = "BlendIn",
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
              EndNewTargetPointName = "QuestPoint10507",
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
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          quest_1686818656142273 = {
            key = "quest_1686818656142273",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181-P2",
            pos = {x = 343.9829693749603, y = 707.023710577782},
            propsData = {
              SendMessage = "",
              FinishCondition = "BossXibi_StoryEnd"
            }
          },
          quest_1686818656142279 = {
            key = "quest_1686818656142279",
            type = "ActivePlayerSkillsNode",
            name = "\230\191\128\230\180\187/\229\164\177\230\149\136 \231\142\169\229\174\182\230\138\128\232\131\189",
            pos = {x = 1393.606129091043, y = 307.39631249171293},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {"Skill2"}
            }
          },
          quest_1686818656143282 = {
            key = "quest_1686818656143282",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 1790.558123636521, y = -110.034833514536},
            propsData = {
              HPPercent = 1,
              ESPercent = 1,
              SPPercent = 1,
              BuffList = {},
              RecoverPlayer = false
            }
          },
          quest_1686818656143285 = {
            key = "quest_1686818656143285",
            type = "ShowGuideMainNode",
            name = "\229\155\190\230\150\135 - \228\186\140\230\138\128\232\131\189\229\188\149\229\175\188",
            pos = {x = 1900.699166360345, y = 301.9544194528037},
            propsData = {GuideId = 4}
          },
          quest_1686818656143291 = {
            key = "quest_1686818656143291",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-10012101-\233\155\182\229\143\183\231\154\132\229\138\155\233\135\143",
            pos = {x = 2281.85530605866, y = 506.98461380741105},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10012101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_1686818656144300 = {
            key = "quest_1686818656144300",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1391.570532591154, y = 160.05349178303226},
            propsData = {WaitTime = 0.5}
          },
          quest_1686818714349325 = {
            key = "quest_1686818714349325",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 660.45313996945, y = 1157.1211732987904},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210010503, 1610010601}
            }
          },
          quest_1688613859891321 = {
            key = "quest_1688613859891321",
            type = "BossBattleFinishNode",
            name = "\229\188\128\229\167\139BOSS\230\136\152\233\152\182\230\174\181-P2",
            pos = {x = 1644.939460893392, y = 168.23274288810603},
            propsData = {
              SendMessage = "BossXibi_P2Start",
              FinishCondition = ""
            }
          },
          quest_16891500071463544 = {
            key = "quest_16891500071463544",
            type = "ShowGuideNode",
            name = "\230\143\144\231\164\186 - \228\186\140\230\138\128\232\131\189\229\188\149\229\175\188",
            pos = {x = 2477.933752855284, y = 189.69228182134967},
            propsData = {
              MessageId = 200009,
              SkillNameList = {"Skill2"},
              LastTime = -1,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "",
              UICompName = "",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          quest_1689214271175321 = {
            key = "quest_1689214271175321",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-sc001-\233\187\145\230\161\131\230\136\152\230\150\151",
            pos = {x = 282.34574440854965, y = 153.83116493460668},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC001/SQ_OBT0100_SC001",
              InType = "BlendIn",
              OutType = "BlendOut",
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
          quest_16892179358513407 = {
            key = "quest_16892179358513407",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1422.1173582274778, y = 815.8296210336723},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "FinishQuest",
              UnitId = -1
            }
          },
          quest_1691486327789341 = {
            key = "quest_1691486327789341",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-100118-\229\155\176\229\133\189\228\185\139\230\150\151",
            pos = {x = 2564.342036565813, y = -287.2260659070024},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
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
          quest_16926743134633260 = {
            key = "quest_16926743134633260",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100118-\229\155\176\229\133\189\228\185\139\230\150\151",
            pos = {x = 1531.5824909287403, y = -257.5561274354689},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_16940707345323398 = {
            key = "quest_16940707345323398",
            type = "PlayOrStopBGMNode",
            name = "bgm - xibi p2  - start",
            pos = {x = 1406.822694670211, y = 441.58239128861516},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0011_combat_xibi_p2.0011_combat_xibi_p2'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          quest_16941646614348815 = {
            key = "quest_16941646614348815",
            type = "TalkNode",
            name = "\229\155\158\229\191\134\233\151\170\229\155\190",
            pos = {x = 713.4743661835383, y = 153.9128100134026},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010204,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_100102",
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
                }
              },
              RemoveTalkActors = {
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
          ["169864928140556291"] = {
            key = "169864928140556291",
            type = "PlayOrStopBGMNode",
            name = "bgm - xibi_p1  - end",
            pos = {x = 494.32492793247883, y = 356.04985148322754},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["169864936975962581"] = {
            key = "169864936975962581",
            type = "PlayOrStopBGMNode",
            name = "bgm - xibi p2  - end",
            pos = {x = 639.3223765765778, y = 988.934361937282},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["170547835666490370"] = {
            key = "170547835666490370",
            type = "SwitchStoryModeNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173 \229\137\167\230\131\133\230\168\161\229\188\143",
            pos = {x = 804.8681219536495, y = 718.4149380560364},
            propsData = {IsOpen = false}
          },
          ["170661294856788888"] = {
            key = "170661294856788888",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\229\164\167\230\139\155\233\129\191\229\133\141\233\135\141\229\144\175\228\187\165\229\144\142\232\167\163\233\148\129",
            pos = {x = 328.349686428293, y = -242.78129660106032},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {"Skill2"}
            }
          },
          ["170712785088096707"] = {
            key = "170712785088096707",
            type = "ShowGuideNode",
            name = "\229\133\179\233\151\173\230\143\144\231\164\186 - \228\186\140\230\138\128\232\131\189\229\188\149\229\175\188",
            pos = {x = 1609.3990834463636, y = 617.751250147694},
            propsData = {
              MessageId = 200009,
              SkillNameList = {"Skill2"},
              LastTime = -1,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "",
              UICompName = "",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170712791945098691"] = {
            key = "170712791945098691",
            type = "ShowGuideToastNode",
            name = "\229\133\179\233\151\173\230\143\144\231\164\186 - \228\186\140\230\138\128\232\131\189\229\188\149\229\175\188",
            pos = {x = 575.6577041360191, y = 733.3646625973133},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = -1,
              Style = "Normal"
            }
          },
          ["17170603566591386386"] = {
            key = "17170603566591386386",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1751.5079609771935, y = -523.2646046677793},
            propsData = {
              ShowEnable = true,
              MessageId = 200016,
              MessageNote = "",
              LastTime = 6,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.AimLocked",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170603691311386800"] = {
            key = "17170603691311386800",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1371.5079609771935, y = -588.7444808287698},
            propsData = {}
          },
          ["17170603873801387372"] = {
            key = "17170603873801387372",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 3033.33250917684, y = 356.57516016581195},
            propsData = {
              MessageId = 200023,
              SkillNameList = {},
              LastTime = 3,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.AtkMelee",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170603873801387373"] = {
            key = "17170603873801387373",
            type = "ShowGuideNode",
            name = "\230\143\144\231\164\186 - \228\186\140\230\138\128\232\131\189\229\188\149\229\175\188",
            pos = {x = 2443.6799996821046, y = 349.3903840722301},
            propsData = {
              MessageId = 200009,
              SkillNameList = {"Skill2"},
              LastTime = -1,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.Skill",
              UICompName = "Button_Area_2",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170603941311387685"] = {
            key = "17170603941311387685",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 2172.5373727418996, y = 249.30974934508026},
            propsData = {}
          },
          ["17174982325731068956"] = {
            key = "17174982325731068956",
            type = "ShowOrHideUINode",
            name = "\229\183\166\228\190\167\230\160\143-Q\230\138\128\232\131\189",
            pos = {x = 3400.312232746898, y = 111.34793166142984},
            propsData = {
              Function = "SetContinuedPCGuideVisibility",
              UIParam = "None",
              ActionParam = "Skill2",
              ShowOrHide = false
            }
          },
          ["17174982480951069315"] = {
            key = "17174982480951069315",
            type = "ShowOrHideUINode",
            name = "\229\183\166\228\190\167\230\160\143-Q\230\138\128\232\131\189\230\153\174\230\148\187",
            pos = {x = 3404.0320395101835, y = 241.78271427012544},
            propsData = {
              Function = "SetContinuedPCGuideVisibility",
              UIParam = "None",
              ActionParam = "Skill2Attack",
              ShowOrHide = false
            }
          },
          ["17174982646351069733"] = {
            key = "17174982646351069733",
            type = "ShowOrHideUINode",
            name = "\229\183\166\228\190\167\230\160\143-Q\230\138\128\232\131\189",
            pos = {x = 3412.0513631816807, y = 382.6522794875168},
            propsData = {
              Function = "SetContinuedPCGuideVisibility",
              UIParam = "None",
              ActionParam = "Skill2",
              ShowOrHide = false
            }
          },
          ["17174982646351069734"] = {
            key = "17174982646351069734",
            type = "ShowOrHideUINode",
            name = "\229\183\166\228\190\167\230\160\143-Q\230\138\128\232\131\189\230\153\174\230\148\187",
            pos = {x = 3416.0886302624262, y = 513.0870620962124},
            propsData = {
              Function = "SetContinuedPCGuideVisibility",
              UIParam = "None",
              ActionParam = "Skill2Attack",
              ShowOrHide = false
            }
          },
          ["17175015375262107726"] = {
            key = "17175015375262107726",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2463.3115707961133, y = 80.83916920859963},
            propsData = {ShowEnable = true, SkillType = "Skill2"}
          },
          ["17175015776702108097"] = {
            key = "17175015776702108097",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2760.8387996059505, y = 97.79628697006508},
            propsData = {ShowEnable = false, SkillType = "Skill2"}
          },
          ["17175015915912108513"] = {
            key = "17175015915912108513",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2623.3873283718713, y = 588.5657204351509},
            propsData = {ShowEnable = true, SkillType = "Attack"}
          },
          ["17175016482532109281"] = {
            key = "17175016482532109281",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2895.942009439596, y = 598.4193339713732},
            propsData = {WaitTime = 8}
          },
          ["17175016549962109430"] = {
            key = "17175016549962109430",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3158.101100348687, y = 601.3738794259186},
            propsData = {ShowEnable = false, SkillType = "Attack"}
          },
          ["17211306451933199"] = {
            key = "17211306451933199",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2817.452033143192, y = 811.2859422008871},
            propsData = {ShowEnable = false, SkillType = "Attack"}
          },
          ["1721130722211141839"] = {
            key = "1721130722211141839",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2541.0538470581787, y = 830.92367054955},
            propsData = {ShowEnable = false, SkillType = "Skill2"}
          },
          ["17223508369362567961"] = {
            key = "17223508369362567961",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1970.358780209834, y = 838.8274488177794},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.Skill",
              UICompName = "Button_Area_2",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17223508667972568475"] = {
            key = "17223508667972568475",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2269.4659230669768, y = 827.5774488177797},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.AtkMelee",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17249168347961342795"] = {
            key = "17249168347961342795",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100120-\232\165\191\230\175\148\229\136\134\229\188\128\228\184\164\228\186\186-SC11",
            pos = {x = 1695.5872744839462, y = 825.6096593142116},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC011/SQ_OBT0100_SC011",
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
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
          ["1731317289790940641"] = {
            key = "1731317289790940641",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1741.5074754334896, y = -703.0756678296137},
            propsData = {
              ShowEnable = true,
              MessageId = 200016,
              MessageNote = "",
              LastTime = 6,
              Style = "Normal"
            }
          },
          ["1731317312927941069"] = {
            key = "1731317312927941069",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3065.4602041466183, y = 162.48481026804464},
            propsData = {
              ShowEnable = true,
              MessageId = 200023,
              MessageNote = "",
              LastTime = 3,
              Style = "Normal"
            }
          }
        },
        commentData = {
          comment1686818886837339 = {
            key = "comment1686818886837339",
            name = "\229\136\155\229\187\186BOSS",
            position = {x = 297.3858049961859, y = -331.19430550286563},
            size = {
              x = 815.7433585185784,
              y = 284.8396629335983,
              width = 818.6141950038142,
              height = 232.0514483600085
            }
          },
          comment1686819035282340 = {
            key = "comment1686819035282340",
            name = "P1",
            position = {x = 1146.0769669425792, y = -334.6186409593354},
            size = {
              x = 1325.2258255058643,
              y = 375.85553833064415,
              width = 920.0950127804841,
              height = 350.5950298954766
            }
          },
          comment1686819069090341 = {
            key = "comment1686819069090341",
            name = "P2",
            position = {x = 272.0410145523725, y = 35.78342308526658},
            size = {
              x = 2142.5265661146964,
              y = 523.0223885131701,
              width = 3478.3261117992965,
              height = 690.1232064407935
            }
          },
          comment1686819138729342 = {
            key = "comment1686819138729342",
            name = "P2\231\187\147\230\157\159",
            position = {x = 278.9901454271356, y = 624.5888259713729},
            size = {
              x = 1613.845397786313,
              y = 665.1635791017773,
              width = 1254.9856519952568,
              height = 698.6242140845462
            }
          },
          comment16892180555923412 = {
            key = "comment16892180555923412",
            name = "\229\133\179\229\141\161\229\144\140\229\173\166\233\156\128\230\177\130",
            position = {x = 1326.688854075218, y = 713.4726079623956},
            size = {
              x = 300,
              y = 200,
              width = 346.8649929829606,
              height = 303.7010625871545
            }
          }
        }
      }
    },
    story_16939873271691836 = {
      isStoryNode = true,
      key = "story_16939873271691836",
      type = "StoryNode",
      name = "\232\153\154\231\169\186\231\171\153\230\161\169",
      pos = {x = 698.4276648707674, y = 349.4598256057594},
      propsData = {
        QuestId = 10010307,
        QuestDescriptionComment = "\229\156\168\233\133\146\233\166\134\226\128\166\226\128\166",
        QuestDescription = "Description_100103_6",
        QuestDeatil = "Description_100103_6",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1708484399604207505",
            startPort = "Out",
            endQuest = "170970535308526239",
            endPort = "In"
          },
          {
            startQuest = "170970524420825041",
            startPort = "Out",
            endQuest = "1708484399604207504",
            endPort = "In"
          },
          {
            startQuest = "170970535308526239",
            startPort = "Out",
            endQuest = "quest_16939873271691842",
            endPort = "Success"
          },
          {
            startQuest = "17249169040581344172",
            startPort = "Out",
            endQuest = "17249169040581344171",
            endPort = "In"
          },
          {
            startQuest = "17249169040581344173",
            startPort = "Out",
            endQuest = "17249169040581344174",
            endPort = "In"
          },
          {
            startQuest = "17249169040581344174",
            startPort = "Out",
            endQuest = "17249169040581344172",
            endPort = "In"
          },
          {
            startQuest = "17229441693341031791",
            startPort = "Out",
            endQuest = "170970524420825041",
            endPort = "In"
          },
          {
            startQuest = "17229441693341031791",
            startPort = "Out",
            endQuest = "1708484399604207502",
            endPort = "In"
          },
          {
            startQuest = "quest_16939873271691840",
            startPort = "QuestStart",
            endQuest = "17498039093553688",
            endPort = "In"
          },
          {
            startQuest = "17498039093553688",
            startPort = "Out",
            endQuest = "17229441693341031791",
            endPort = "In"
          },
          {
            startQuest = "17165389291613464",
            startPort = "Out",
            endQuest = "1708484399604207503",
            endPort = "In"
          },
          {
            startQuest = "1708484399604207502",
            startPort = "Out",
            endQuest = "1708484399604207505",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16939873271691840 = {
            key = "quest_16939873271691840",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1898.2167881440648, y = 160.95419315391558},
            propsData = {ModeType = 0}
          },
          quest_16939873271691842 = {
            key = "quest_16939873271691842",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 307.64513071760973, y = 348.4219325050595},
            propsData = {
              ModeType = 1,
              Id = 101107,
              StartIndex = 1,
              IsWhite = false
            }
          },
          quest_16939873271701844 = {
            key = "quest_16939873271701844",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 848.4, y = 662.8},
            propsData = {}
          },
          ["1708484399604207502"] = {
            key = "1708484399604207502",
            type = "TalkNode",
            name = "\231\171\153\230\161\169\231\172\172\228\184\128\229\143\165",
            pos = {x = -747.7666424233889, y = 302.6419767053829},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10012701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStage_10012701",
              BlendInTime = 0,
              BlendOutTime = 1.5,
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
                  TalkActorId = 100014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 100014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1708484399604207503"] = {
            key = "1708484399604207503",
            type = "TalkNode",
            name = "\231\171\153\230\161\169\229\144\142\231\187\173",
            pos = {x = -557.031032106679, y = 474.9360674966414},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10012710,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStage_10012701",
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
                  TalkActorId = 100014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 100014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1708484399604207504"] = {
            key = "1708484399604207504",
            type = "PlayOrStopBGMNode",
            name = "BGM - \230\178\153\230\181\1832 - Play",
            pos = {x = -331.5293981597799, y = 205.06304963043453},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0028_story_shahai_part2.0028_story_shahai_part2'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1708484399604207505"] = {
            key = "1708484399604207505",
            type = "PlayOrStopBGMNode",
            name = "BGM - \230\178\153\230\181\1832 - Stop",
            pos = {x = -270.83421083369694, y = 369.7293637600614},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["170970524420825041"] = {
            key = "170970524420825041",
            type = "PlayOrStopBGMNode",
            name = "prologue_void_2d - noise - Play",
            pos = {x = -586.5138798507985, y = 156.71858364859511},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 1,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/ambience/2d/prologue_void_2d.prologue_void_2d'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["170970535308526239"] = {
            key = "170970535308526239",
            type = "PlayOrStopBGMNode",
            name = "prologue_void_2d - noise - Stop",
            pos = {x = -13.77831366260068, y = 354.72607966135416},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 1
            }
          },
          ["17165389291613464"] = {
            key = "17165389291613464",
            type = "PrologueGachaNode",
            name = "\229\186\143\231\171\160\231\137\185\228\190\155\230\138\189\229\141\161",
            pos = {x = -803.7839105309231, y = 503.68333757670814},
            propsData = {}
          },
          ["17229441693341031791"] = {
            key = "17229441693341031791",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = -1322.0206735110655, y = 185.3756040537471},
            propsData = {QuestRoleId = 1010101, IsPlayFX = false}
          },
          ["17249169040581344171"] = {
            key = "17249169040581344171",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -1149.573427764186, y = -41.086670931095114},
            propsData = {ShowEnable = false, SkillType = "Attack"}
          },
          ["17249169040581344172"] = {
            key = "17249169040581344172",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -1430.9716138491995, y = -57.83223777694025},
            propsData = {ShowEnable = false, SkillType = "Skill2"}
          },
          ["17249169040581344173"] = {
            key = "17249169040581344173",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -1443.1454256368147, y = -217.83362585266423},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.Skill",
              UICompName = "Button_Area_2",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17249169040581344174"] = {
            key = "17249169040581344174",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -1178.5628823220063, y = -200.137973678751},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.AtkMelee",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1735182013971244455"] = {
            key = "1735182013971244455",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = -1412.2337462950309, y = 439.41655493922826},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {0}
            }
          },
          ["17498039093553688"] = {
            key = "17498039093553688",
            type = "SkipRegionNode",
            name = "\228\191\157\229\186\149\228\188\160\233\128\129\231\142\169\229\174\182\229\142\187\230\178\153\230\181\183",
            pos = {x = -1602.2639517345397, y = 188.6199095022624},
            propsData = {
              ModeType = 1,
              Id = 100104,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1705564125826174068"] = {
      isStoryNode = true,
      key = "1705564125826174068",
      type = "StoryNode",
      name = "\233\133\146\233\166\134\231\165\158\231\167\152\228\186\186",
      pos = {x = 986.021404419448, y = 353.5722238482405},
      propsData = {
        QuestId = 10010308,
        QuestDescriptionComment = "\229\156\168\233\133\146\233\166\134\226\128\166\226\128\166",
        QuestDescription = "Description_100103_6",
        QuestDeatil = "Description_100103_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "170651641639434506",
            startPort = "Out",
            endQuest = "1705564125827174075",
            endPort = "In"
          },
          {
            startQuest = "1705564125827174075",
            startPort = "Out",
            endQuest = "17403662132318153",
            endPort = "In"
          },
          {
            startQuest = "17403662132318153",
            startPort = "Out",
            endQuest = "1705564125827174077",
            endPort = "In"
          },
          {
            startQuest = "1705564125827174077",
            startPort = "Out",
            endQuest = "1744813715022813588",
            endPort = "In"
          },
          {
            startQuest = "1744813715022813588",
            startPort = "Out",
            endQuest = "1705564125827174073",
            endPort = "Success"
          },
          {
            startQuest = "1746692200908864391",
            startPort = "Region_1",
            endQuest = "170651641639434506",
            endPort = "In"
          },
          {
            startQuest = "1746692200908864391",
            startPort = "LastDefaultOut",
            endQuest = "1746692276771865036",
            endPort = "In"
          },
          {
            startQuest = "1746692276771865036",
            startPort = "Out",
            endQuest = "170651641639434506",
            endPort = "In"
          },
          {
            startQuest = "1705564125827174072",
            startPort = "QuestStart",
            endQuest = "1746692200908864391",
            endPort = "In"
          }
        },
        nodeData = {
          ["1705564125827174072"] = {
            key = "1705564125827174072",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -761.044087491456, y = 168.11004784688993},
            propsData = {ModeType = 0}
          },
          ["1705564125827174073"] = {
            key = "1705564125827174073",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1125.8942990930937, y = 216.03947368421058},
            propsData = {ModeType = 0}
          },
          ["1705564125827174074"] = {
            key = "1705564125827174074",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1705564125827174075"] = {
            key = "1705564125827174075",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100194-\231\165\158\231\167\152\228\186\186",
            pos = {x = 223.43051770903782, y = 175.9604329653434},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC019/SQ_OBT0100_SC019",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
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
          ["1705564125827174077"] = {
            key = "1705564125827174077",
            type = "SkipRegionNode",
            name = "\228\188\160\233\128\129\229\133\172\232\183\175",
            pos = {x = 849.2404738937338, y = 242.54498313251628},
            propsData = {
              ModeType = 1,
              Id = 101103,
              StartIndex = 10,
              IsWhite = false
            }
          },
          ["1705564125828174079"] = {
            key = "1705564125828174079",
            type = "SkipRegionNode",
            name = "\228\188\160\233\128\129\233\133\146\233\166\134",
            pos = {x = -104.33073082532493, y = 391.0080890244859},
            propsData = {
              ModeType = 1,
              Id = 101107,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["170651641639434506"] = {
            key = "170651641639434506",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\230\136\150\230\154\130\229\129\156\230\136\150\229\133\179\233\151\173\229\163\176\233\159\179",
            pos = {x = -8.177242293758866, y = 93.8118729134344},
            propsData = {SoundStateType = 1, SoundType = 0}
          },
          ["17403661416947805"] = {
            key = "17403661416947805",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 793.7941696870761, y = -66.88070251331116},
            propsData = {}
          },
          ["17403662132318153"] = {
            key = "17403662132318153",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 585.1021119226502, y = 158.2806912138721},
            propsData = {QuestRoleId = 1010101, IsPlayFX = false}
          },
          ["1744813715022813588"] = {
            key = "1744813715022813588",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\230\136\150\230\154\130\229\129\156\230\136\150\229\133\179\233\151\173\229\163\176\233\159\179",
            pos = {x = 963.2986071139906, y = 470.8341097308489},
            propsData = {SoundStateType = 2, SoundType = 0}
          },
          ["1746692179690864028"] = {
            key = "1746692179690864028",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -451.5032427667102, y = 416.9418767507003},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100104,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "101132Point5"
            }
          },
          ["1746692200908864391"] = {
            key = "1746692200908864391",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = -495.0274064171118, y = 106.60096765979118},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {101107}
            }
          },
          ["1746692276771865036"] = {
            key = "1746692276771865036",
            type = "SkipRegionNode",
            name = "\230\138\138\231\142\169\229\174\182\228\188\160\233\128\129\229\136\176\233\133\146\233\166\134",
            pos = {x = -241.81773618538364, y = 260.749809014515},
            propsData = {
              ModeType = 1,
              Id = 101107,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1730296950039212168"] = {
      isStoryNode = true,
      key = "1730296950039212168",
      type = "StoryNode",
      name = "\229\188\128\229\167\139\230\137\147\230\158\182\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 419.11774827856055, y = 356.7729976637301},
      propsData = {
        QuestId = 10010306,
        QuestDescriptionComment = "\230\138\181\229\190\161\232\165\191\230\175\148\229\176\148\231\154\132\230\148\187\229\135\187",
        QuestDescription = "Description_100103_5",
        QuestDeatil = "Description_100103_5",
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
        SubRegionId = 100103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10509"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1730296950040212172",
            startPort = "QuestStart",
            endQuest = "1730296986395213403",
            endPort = "In"
          },
          {
            startQuest = "17304493793115477",
            startPort = "Out",
            endQuest = "1730297979503218028",
            endPort = "In"
          },
          {
            startQuest = "17304494763036564",
            startPort = "Out",
            endQuest = "17304494763036563",
            endPort = "In"
          },
          {
            startQuest = "17304494763036565",
            startPort = "Out",
            endQuest = "17304494763036566",
            endPort = "In"
          },
          {
            startQuest = "17304494763036566",
            startPort = "Out",
            endQuest = "17304494763036564",
            endPort = "In"
          },
          {
            startQuest = "1730297979503218028",
            startPort = "Out",
            endQuest = "17304494763036565",
            endPort = "In"
          },
          {
            startQuest = "1730296986395213403",
            startPort = "Fail",
            endQuest = "1730296950040212174",
            endPort = "Fail"
          },
          {
            startQuest = "17328653689994057",
            startPort = "Out",
            endQuest = "17304493793115477",
            endPort = "In"
          },
          {
            startQuest = "17446193637102971",
            startPort = "Out",
            endQuest = "17328653689994057",
            endPort = "In"
          },
          {
            startQuest = "17490381168343290",
            startPort = "Out",
            endQuest = "1730296950040212173",
            endPort = "Success"
          },
          {
            startQuest = "1730296986395213403",
            startPort = "Success",
            endQuest = "17490381168343290",
            endPort = "In"
          }
        },
        nodeData = {
          ["1730296950040212172"] = {
            key = "1730296950040212172",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -544.232179048269, y = -415.82026336905915},
            propsData = {ModeType = 0}
          },
          ["1730296950040212173"] = {
            key = "1730296950040212173",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 56.328716641367464, y = -481.7965821807443},
            propsData = {ModeType = 0}
          },
          ["1730296950040212174"] = {
            key = "1730296950040212174",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -130.87162940482807, y = 19.9421084435439},
            propsData = {}
          },
          ["1730296986395213403"] = {
            key = "1730296986395213403",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -293.5938120870131, y = -281.4075949733556},
            propsData = {SpecialConfigId = 1040, BlackScreenImmediately = false}
          },
          ["1730297979503218028"] = {
            key = "1730297979503218028",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100120-\232\165\191\230\175\148\229\136\134\229\188\128\228\184\164\228\186\186-SC11",
            pos = {x = 503.6410436476381, y = -272.50941934047165},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC011/SQ_OBT0100_SC011",
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          ["17304493793115477"] = {
            key = "17304493793115477",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 255.69542884516562, y = -265.3932913854974},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "FinishQuest",
              UnitId = -1
            }
          },
          ["17304494763036563"] = {
            key = "17304494763036563",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 808.9536924587653, y = 9.780387421662944},
            propsData = {ShowEnable = false, SkillType = "Attack"}
          },
          ["17304494763036564"] = {
            key = "17304494763036564",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 576.1750715911437, y = 7.407246205108585},
            propsData = {ShowEnable = false, SkillType = "Skill2"}
          },
          ["17304494763036565"] = {
            key = "17304494763036565",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 119.72185256888605, y = 6.763276026133123},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.Skill",
              UICompName = "Button_Area_2",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17304494763036566"] = {
            key = "17304494763036566",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 352.09801716515915, y = 7.169720125511994},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.AtkMelee",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17328653689994057"] = {
            key = "17328653689994057",
            type = "SwitchStoryModeNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173 \229\137\167\230\131\133\230\168\161\229\188\143",
            pos = {x = 562.5006132057622, y = -500.474870500963},
            propsData = {IsOpen = false}
          },
          ["17446193637102971"] = {
            key = "17446193637102971",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = -36.41102153281335, y = -301.8026151625603},
            propsData = {
              VarName = "TeammateEffects",
              VarValue = 0
            }
          },
          ["17490381168343290"] = {
            key = "17490381168343290",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -41.024475524475434, y = -633.0406016397393},
            propsData = {
              ShowEnable = false,
              MessageId = 200023,
              MessageNote = "",
              LastTime = -1,
              Style = "Normal"
            }
          }
        },
        commentData = {
          ["17304494276826141"] = {
            key = "17304494276826141",
            name = "\229\133\179\229\141\161\229\144\140\229\173\166\233\156\128\230\177\130",
            position = {x = 226.29231796837053, y = -351.47492152285525},
            size = {width = 255.45454545454564, height = 223.63636363636377}
          }
        }
      }
    },
    ["17465155350503056"] = {
      isStoryNode = true,
      key = "17465155350503056",
      type = "StoryNode",
      name = "\231\137\185\230\174\138\228\187\187\229\138\161\228\185\139\229\144\142",
      pos = {x = 674.6880877742948, y = 563.6054831435956},
      propsData = {
        QuestId = 10010310,
        QuestDescriptionComment = "\230\138\181\229\190\161\232\165\191\230\175\148\229\176\148\231\154\132\230\148\187\229\135\187",
        QuestDescription = "Description_100103_5",
        QuestDeatil = "Description_100103_5",
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
        SubRegionId = 0,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10509"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17465155350503068",
            startPort = "Out",
            endQuest = "17465155350503067",
            endPort = "In"
          },
          {
            startQuest = "17465155350503069",
            startPort = "Out",
            endQuest = "17465155350503070",
            endPort = "In"
          },
          {
            startQuest = "17465155350503070",
            startPort = "Out",
            endQuest = "17465155350503068",
            endPort = "In"
          },
          {
            startQuest = "17465155350503064",
            startPort = "Fail",
            endQuest = "17465155350503063",
            endPort = "Fail"
          },
          {
            startQuest = "17465155350503071",
            startPort = "Out",
            endQuest = "17465155350503066",
            endPort = "In"
          },
          {
            startQuest = "17465155350503073",
            startPort = "Out",
            endQuest = "17465155350503071",
            endPort = "In"
          },
          {
            startQuest = "17465155350503066",
            startPort = "Out",
            endQuest = "17465155350503069",
            endPort = "In"
          },
          {
            startQuest = "17465155350503065",
            startPort = "Out",
            endQuest = "17465155350503062",
            endPort = "Success"
          },
          {
            startQuest = "17465155350503067",
            startPort = "Out",
            endQuest = "17465155350503065",
            endPort = "In"
          },
          {
            startQuest = "17465155350503061",
            startPort = "QuestStart",
            endQuest = "1751279438435988327",
            endPort = "In"
          },
          {
            startQuest = "1751279438435988327",
            startPort = "Out",
            endQuest = "17465155350503073",
            endPort = "In"
          }
        },
        nodeData = {
          ["17465155350503061"] = {
            key = "17465155350503061",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -544.232179048269, y = -415.82026336905915},
            propsData = {ModeType = 0}
          },
          ["17465155350503062"] = {
            key = "17465155350503062",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 600.2144309270818, y = -59.29658218074425},
            propsData = {ModeType = 0}
          },
          ["17465155350503063"] = {
            key = "17465155350503063",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -272.30408282097716, y = 338.40872335037625},
            propsData = {}
          },
          ["17465155350503064"] = {
            key = "17465155350503064",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -477.5223835155845, y = 266.80669074093015},
            propsData = {SpecialConfigId = 1040, BlackScreenImmediately = false}
          },
          ["17465155350503065"] = {
            key = "17465155350503065",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100120-\232\165\191\230\175\148\229\136\134\229\188\128\228\184\164\228\186\186-SC11",
            pos = {x = 306.6124722190666, y = -59.76656219761452},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC011/SQ_OBT0100_SC011",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          ["17465155350503066"] = {
            key = "17465155350503066",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 544.7811431308799, y = -420.59329138549737},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "FinishQuest",
              UnitId = -1
            }
          },
          ["17465155350503067"] = {
            key = "17465155350503067",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 383.2394067444796, y = -227.36246972119423},
            propsData = {ShowEnable = false, SkillType = "Attack"}
          },
          ["17465155350503068"] = {
            key = "17465155350503068",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 150.46078587685798, y = -229.7356109377486},
            propsData = {ShowEnable = false, SkillType = "Skill2"}
          },
          ["17465155350503069"] = {
            key = "17465155350503069",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -305.9924331453997, y = -230.37958111672404},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.Skill",
              UICompName = "Button_Area_2",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17465155350503070"] = {
            key = "17465155350503070",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = -73.61626854912657, y = -229.97313701734518},
            propsData = {
              ShowEnable = false,
              MessageId = 200009,
              MessageNote = "",
              LastTime = 10,
              DelayTime = 0,
              HighLightUIPath = "BattleMain.Char_Skill.AtkMelee",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17465155350503071"] = {
            key = "17465155350503071",
            type = "SwitchStoryModeNode",
            name = "\229\188\128\229\144\175/\229\133\179\233\151\173 \229\137\167\230\131\133\230\168\161\229\188\143",
            pos = {x = 257.4720417771907, y = -435.4462990723915},
            propsData = {IsOpen = false}
          },
          ["17465155350503072"] = {
            key = "17465155350503072",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = -410.495935330654, y = 430.2269045958299},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1580211}
            }
          },
          ["17465155350503073"] = {
            key = "17465155350503073",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = -97.00784692963879, y = -440.18991674986194},
            propsData = {
              VarName = "TeammateEffects",
              VarValue = 0
            }
          },
          ["1749024308932885184"] = {
            key = "1749024308932885184",
            type = "PlayOrStopBGMNode",
            name = "mute",
            pos = {x = -232.1821107259322, y = -603.4396117135502},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1751279438435988327"] = {
            key = "1751279438435988327",
            type = "SetStoryOptimizeTagNode",
            name = "\232\174\190\231\189\174\229\137\167\230\131\133\228\188\152\229\140\150\230\160\135\232\174\176",
            pos = {x = -314.7673356588966, y = -368.07223981139987},
            propsData = {
              TagName = "Prologue_optimization",
              TagValue = 2
            }
          }
        },
        commentData = {
          ["17304494276826141"] = {
            key = "17304494276826141",
            name = "\229\133\179\229\141\161\229\144\140\229\173\166\233\156\128\230\177\130",
            position = {x = 515.3780322540848, y = -506.67492152285524},
            size = {width = 255.45454545454564, height = 223.63636363636377}
          }
        }
      }
    },
    ["17467774050423068"] = {
      isStoryNode = true,
      key = "17467774050423068",
      type = "StoryNode",
      name = "\229\142\187\228\186\145\230\181\183\231\154\132\232\183\175\228\184\138",
      pos = {x = 371.06323974035973, y = -65.9805458177266},
      propsData = {
        QuestId = 10010311,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
        SubRegionId = 0,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_10010311MM_1570204"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17467774050433075",
            startPort = "BeginOverlap",
            endQuest = "17467774050433074",
            endPort = "In"
          },
          {
            startQuest = "17467774050433074",
            startPort = "Out",
            endQuest = "17467774050433075",
            endPort = "Input"
          },
          {
            startQuest = "17467774050433075",
            startPort = "EndOverlap",
            endQuest = "17467774050433076",
            endPort = "In"
          },
          {
            startQuest = "17467774050433076",
            startPort = "Out",
            endQuest = "17467774050433075",
            endPort = "Input"
          },
          {
            startQuest = "17467774050433082",
            startPort = "Out",
            endQuest = "17467774050433081",
            endPort = "In"
          },
          {
            startQuest = "17467775054374607",
            startPort = "Out",
            endQuest = "17467774050433082",
            endPort = "In"
          },
          {
            startQuest = "17467774050433081",
            startPort = "Out",
            endQuest = "17467774050433078",
            endPort = "Success"
          },
          {
            startQuest = "17467774050433077",
            startPort = "QuestStart",
            endQuest = "17467774050433080",
            endPort = "In"
          },
          {
            startQuest = "17467774050433080",
            startPort = "Out",
            endQuest = "17581134671463358",
            endPort = "In"
          },
          {
            startQuest = "17581134671463358",
            startPort = "Out",
            endQuest = "17467775054374607",
            endPort = "In"
          }
        },
        nodeData = {
          ["17467774050433073"] = {
            key = "17467774050433073",
            type = "PlayOrStopBGMNode",
            name = "BGM - 07- end",
            pos = {x = 938.5157705701503, y = -48.740444841493115},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/chaper_prologue_temp/07",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17467774050433074"] = {
            key = "17467774050433074",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 883.683447749809, y = -174.20630861039947},
            propsData = {SoundStateType = 1, SoundType = 0}
          },
          ["17467774050433075"] = {
            key = "17467774050433075",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 582.0167810831423, y = -137.53964194373287},
            propsData = {StaticCreatorId = 1110010412}
          },
          ["17467774050433076"] = {
            key = "17467774050433076",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 887.0167810831424, y = -55.872975277066175},
            propsData = {SoundStateType = 2, SoundType = 0}
          },
          ["17467774050433077"] = {
            key = "17467774050433077",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 71.21920981175936, y = 184.1509433962264},
            propsData = {ModeType = 0}
          },
          ["17467774050433078"] = {
            key = "17467774050433078",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1245, y = 265},
            propsData = {ModeType = 0}
          },
          ["17467774050433079"] = {
            key = "17467774050433079",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17467774050433080"] = {
            key = "17467774050433080",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 429.7752227232175, y = 157.1348344930043},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1570204,
              GuideType = "M",
              GuidePointName = "Mechanism_10010311MM_1570204"
            }
          },
          ["17467774050433081"] = {
            key = "17467774050433081",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 877.0617059740993, y = 396.59150609935716},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467774050433082"] = {
            key = "17467774050433082",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 632.8047077922079, y = 374.1571428571429},
            propsData = {WaitTime = 2}
          },
          ["17467775054374607"] = {
            key = "17467775054374607",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 726.1298858146686, y = 202.61539306104518},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = true,
              StaticCreatorIdList = {1570203}
            }
          },
          ["17468608271436328"] = {
            key = "17468608271436328",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 387.4466458224169, y = 555.4395249487354},
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
          ["17581134671463358"] = {
            key = "17581134671463358",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 454.0458645206963, y = 32.19883889695208},
            propsData = {
              HPPercent = -1,
              ESPercent = -1,
              SPPercent = -1,
              BuffList = {
                {
                  Id = 310,
                  LastTime = -1,
                  Value = -1
                }
              },
              RecoverPlayer = false
            }
          }
        },
        commentData = {
          ["169864997677917995"] = {
            key = "169864997677917995",
            name = "\229\140\186\229\159\159\230\154\130\229\129\156bgm\230\146\173\230\148\190",
            position = {x = 535.3501144164759, y = -255.87297527706622},
            size = {width = 633.3333333333331, height = 325.00000000000006}
          }
        }
      }
    },
    ["17468601216233215"] = {
      isStoryNode = true,
      key = "17468601216233215",
      type = "StoryNode",
      name = "\229\142\187\228\186\145\230\181\183\231\154\132\232\183\175\228\184\138",
      pos = {x = 671.0009989313558, y = -65.91231468584206},
      propsData = {
        QuestId = 10010312,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
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
        SubRegionId = 0,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10408"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17468601216233222",
            startPort = "BeginOverlap",
            endQuest = "17468601216233221",
            endPort = "In"
          },
          {
            startQuest = "17468601216233221",
            startPort = "Out",
            endQuest = "17468601216233222",
            endPort = "Input"
          },
          {
            startQuest = "17468601216233222",
            startPort = "EndOverlap",
            endQuest = "17468601216233223",
            endPort = "In"
          },
          {
            startQuest = "17468601216233223",
            startPort = "Out",
            endQuest = "17468601216233222",
            endPort = "Input"
          },
          {
            startQuest = "17468601216233229",
            startPort = "Out",
            endQuest = "17468601216233228",
            endPort = "In"
          },
          {
            startQuest = "17468601216233230",
            startPort = "Out",
            endQuest = "17468601216233229",
            endPort = "In"
          },
          {
            startQuest = "17468601216233224",
            startPort = "QuestStart",
            endQuest = "17468601216233227",
            endPort = "In"
          },
          {
            startQuest = "17468601216233227",
            startPort = "Out",
            endQuest = "17468601216233225",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17468601216233220"] = {
            key = "17468601216233220",
            type = "PlayOrStopBGMNode",
            name = "BGM - 07- end",
            pos = {x = 938.5157705701503, y = -48.740444841493115},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/chaper_prologue_temp/07",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17468601216233221"] = {
            key = "17468601216233221",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 883.683447749809, y = -174.20630861039947},
            propsData = {SoundStateType = 1, SoundType = 0}
          },
          ["17468601216233222"] = {
            key = "17468601216233222",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 582.0167810831423, y = -137.53964194373287},
            propsData = {StaticCreatorId = 1110010412}
          },
          ["17468601216233223"] = {
            key = "17468601216233223",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 887.0167810831424, y = -55.872975277066175},
            propsData = {SoundStateType = 2, SoundType = 0}
          },
          ["17468601216233224"] = {
            key = "17468601216233224",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 96.6909079249669, y = 140},
            propsData = {ModeType = 0}
          },
          ["17468601216233225"] = {
            key = "17468601216233225",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1245, y = 265},
            propsData = {ModeType = 0}
          },
          ["17468601216233226"] = {
            key = "17468601216233226",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17468601216233227"] = {
            key = "17468601216233227",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 682.514010098633, y = 179.4168112371904},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010408,
              GuideType = "M",
              GuidePointName = "QuestTrigger10408"
            }
          },
          ["17468601216233228"] = {
            key = "17468601216233228",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 877.0617059740993, y = 396.59150609935716},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17468601216233229"] = {
            key = "17468601216233229",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 632.8047077922079, y = 374.1571428571429},
            propsData = {WaitTime = 2}
          },
          ["17468601216233230"] = {
            key = "17468601216233230",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 344.1457649019212, y = 367.7058809085711},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = true,
              StaticCreatorIdList = {1570203}
            }
          }
        },
        commentData = {
          ["169864997677917995"] = {
            key = "169864997677917995",
            name = "\229\140\186\229\159\159\230\154\130\229\129\156bgm\230\146\173\230\148\190",
            position = {x = 535.3501144164759, y = -255.87297527706622},
            size = {width = 633.3333333333331, height = 325.00000000000006}
          }
        }
      }
    }
  },
  commentData = {}
}
