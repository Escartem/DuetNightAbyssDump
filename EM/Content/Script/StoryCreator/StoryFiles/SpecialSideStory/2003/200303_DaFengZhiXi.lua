return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17505692486902929143",
      startPort = "Success",
      endStory = "17505702619912930974",
      endPort = "In"
    },
    {
      startStory = "17505702619912930974",
      startPort = "Success",
      endStory = "17505712518582933667",
      endPort = "In"
    },
    {
      startStory = "17505712518582933667",
      startPort = "Success",
      endStory = "17505713472352934668",
      endPort = "In"
    },
    {
      startStory = "17505713472352934668",
      startPort = "Success",
      endStory = "17505692470962929079",
      endPort = "StoryEnd"
    },
    {
      startStory = "17505692470962929076",
      startPort = "StoryStart",
      endStory = "17514435175261242",
      endPort = "In"
    },
    {
      startStory = "17514435175261242",
      startPort = "Success",
      endStory = "17505692486902929143",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17505692470962929076"] = {
      isStoryNode = true,
      key = "17505692470962929076",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 802, y = 300},
      propsData = {QuestChainId = 200303},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17505692470962929079"] = {
      isStoryNode = true,
      key = "17505692470962929079",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3054.3478260869565, y = 289.5652173913044},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17505692486902929143"] = {
      isStoryNode = true,
      key = "17505692486902929143",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1428.4292803970225, y = 284.1861042183623},
      propsData = {
        QuestId = 20030301,
        QuestDescriptionComment = "Content_200303_1",
        QuestDescription = "Description_200303_1",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_Side_TongBi"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17505692486902929144",
            startPort = "QuestStart",
            endQuest = "17505699883912929503",
            endPort = "In"
          },
          {
            startQuest = "17505692486902929144",
            startPort = "QuestStart",
            endQuest = "17505700077462929732",
            endPort = "In"
          },
          {
            startQuest = "17505700077462929732",
            startPort = "Out",
            endQuest = "17505700214392929974",
            endPort = "In"
          },
          {
            startQuest = "17505700214392929974",
            startPort = "Out",
            endQuest = "17505701154372930283",
            endPort = "In"
          },
          {
            startQuest = "17505701154372930283",
            startPort = "Out",
            endQuest = "17505692486902929147",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17505692486902929144"] = {
            key = "17505692486902929144",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17505692486902929147"] = {
            key = "17505692486902929147",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2366.8, y = 388.8},
            propsData = {ModeType = 0}
          },
          ["17505692486902929150"] = {
            key = "17505692486902929150",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17505699883912929503"] = {
            key = "17505699883912929503",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1205.9380341880342, y = 155.96581196581195},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_Side_TongBi"
            }
          },
          ["17505700077462929732"] = {
            key = "17505700077462929732",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1195.7451215451215, y = 369.69157117392405},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100065}
            }
          },
          ["17505700214392929974"] = {
            key = "17505700214392929974",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1538.394694194694, y = 375.4608019431549},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11029,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17505701154372930283"] = {
            key = "17505701154372930283",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1819.975890775891, y = 368.537725020078},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030303.20030303'",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17505702619912930974"] = {
      isStoryNode = true,
      key = "17505702619912930974",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1830.0751588152793, y = 272.5827267361795},
      propsData = {
        QuestId = 20030302,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200303_2",
        QuestDeatil = "Content_200303_2",
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
        SubRegionId = 104105,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_Side_DaFeng_2060103"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17505702619912930985",
            startPort = "Out",
            endQuest = "17505702619912930980",
            endPort = "Success"
          },
          {
            startQuest = "17505702619912930979",
            startPort = "QuestStart",
            endQuest = "17505705818742931477",
            endPort = "In"
          },
          {
            startQuest = "17505705818742931477",
            startPort = "Out",
            endQuest = "17505710078662932296",
            endPort = "In"
          },
          {
            startQuest = "17505710078662932296",
            startPort = "Out",
            endQuest = "17505709821102931855",
            endPort = "In"
          },
          {
            startQuest = "17505709821102931855",
            startPort = "Out",
            endQuest = "17505709948792932064",
            endPort = "In"
          },
          {
            startQuest = "17505705818742931477",
            startPort = "Out",
            endQuest = "17505710482552933177",
            endPort = "In"
          },
          {
            startQuest = "17505709948792932064",
            startPort = "Out",
            endQuest = "17505702619912930985",
            endPort = "In"
          },
          {
            startQuest = "17505710078662932296",
            startPort = "Out",
            endQuest = "17505710177262932713",
            endPort = "In"
          }
        },
        nodeData = {
          ["17505702619912930979"] = {
            key = "17505702619912930979",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 431.6959064327485, y = 317.5438596491228},
            propsData = {ModeType = 0}
          },
          ["17505702619912930980"] = {
            key = "17505702619912930980",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2366.8, y = 388.8},
            propsData = {ModeType = 0}
          },
          ["17505702619912930981"] = {
            key = "17505702619912930981",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17505702619912930985"] = {
            key = "17505702619912930985",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1895.3231129981132, y = 371.350225020078},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030306.20030306'",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17505705818742931477"] = {
            key = "17505705818742931477",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 838.5941543836279, y = 310.55931746272296},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060103,
              GuideType = "M",
              GuidePointName = "Mechanism_Side_DaFeng_2060103"
            }
          },
          ["17505709821102931855"] = {
            key = "17505709821102931855",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1360.1324203383701, y = 372.5705048514847},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2060068,
                2060069,
                2060070,
                2060071,
                2060072
              }
            }
          },
          ["17505709948792932064"] = {
            key = "17505709948792932064",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1597.7881538751105, y = 373.52397548458924},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2060069,
                2060068,
                2060070,
                2060071,
                2060072
              }
            }
          },
          ["17505710078662932296"] = {
            key = "17505710078662932296",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1120.5239789450316, y = 347.0505455328984},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030304.20030304'",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17505710177262932713"] = {
            key = "17505710177262932713",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1432.278364909944, y = 112.43066249196272},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030305.20030305'",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17505710482552933177"] = {
            key = "17505710482552933177",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1089.2374292374295, y = 620.3838788662317},
            propsData = {
              NewDescription = "Description_200303_3",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17505712518582933667"] = {
      isStoryNode = true,
      key = "17505712518582933667",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2175.7391304347825, y = 259.3913043478261},
      propsData = {
        QuestId = 20030303,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200303_4",
        QuestDeatil = "Content_200303_4",
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
        SubRegionId = 104105,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_SideDaFeng_2060104"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17505712518592933675",
            startPort = "Out",
            endQuest = "17505712518592933673",
            endPort = "Success"
          },
          {
            startQuest = "17505712518582933672",
            startPort = "QuestStart",
            endQuest = "17505712518592933676",
            endPort = "In"
          },
          {
            startQuest = "17505712518592933677",
            startPort = "Out",
            endQuest = "17505712518592933678",
            endPort = "In"
          },
          {
            startQuest = "17505712518592933676",
            startPort = "Out",
            endQuest = "17505712518592933681",
            endPort = "In"
          },
          {
            startQuest = "17505712518592933678",
            startPort = "Out",
            endQuest = "17505712518592933675",
            endPort = "In"
          },
          {
            startQuest = "17505712518592933676",
            startPort = "Out",
            endQuest = "17505712518592933677",
            endPort = "In"
          }
        },
        nodeData = {
          ["17505712518582933672"] = {
            key = "17505712518582933672",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 602.2222222222222, y = 303.3333333333333},
            propsData = {ModeType = 0}
          },
          ["17505712518592933673"] = {
            key = "17505712518592933673",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2366.8, y = 388.8},
            propsData = {ModeType = 0}
          },
          ["17505712518592933674"] = {
            key = "17505712518592933674",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17505712518592933675"] = {
            key = "17505712518592933675",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1915.5839825633307, y = 366.1328337157302},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030307.20030307'",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17505712518592933676"] = {
            key = "17505712518592933676",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 841.5369461456417, y = 309.80416872130417},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2060104,
              GuideType = "M",
              GuidePointName = "Mechanism_SideDaFeng_2060104"
            }
          },
          ["17505712518592933677"] = {
            key = "17505712518592933677",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1342.7639992857385, y = 380.19064215125593},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2060074,
                2060075,
                2060076,
                2060077,
                2060073
              }
            }
          },
          ["17505712518592933678"] = {
            key = "17505712518592933678",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1593.8751103968498, y = 374.8283233106762},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2060074,
                2060075,
                2060076,
                2060077,
                2060073
              }
            }
          },
          ["17505712518592933681"] = {
            key = "17505712518592933681",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1091.2374292374295, y = 618.3838788662317},
            propsData = {
              NewDescription = "Description_200303_5",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17505713472352934668"] = {
      isStoryNode = true,
      key = "17505713472352934668",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2512.2173913043475, y = 250.27717391304347},
      propsData = {
        QuestId = 20030304,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200303_6",
        QuestDeatil = "Content_200303_5",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_Side_BaoXiang"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17505713472352934669",
            startPort = "QuestStart",
            endQuest = "17505715930052935020",
            endPort = "In"
          },
          {
            startQuest = "17505715930052935020",
            startPort = "Out",
            endQuest = "17505716584502935299",
            endPort = "In"
          },
          {
            startQuest = "17505716584502935299",
            startPort = "Out",
            endQuest = "17505717302442935875",
            endPort = "In"
          },
          {
            startQuest = "17505717355902936080",
            startPort = "Out",
            endQuest = "17505717355902936081",
            endPort = "In"
          },
          {
            startQuest = "17505717355902936081",
            startPort = "Out",
            endQuest = "17505717355902936082",
            endPort = "In"
          },
          {
            startQuest = "17505717361842936112",
            startPort = "Out",
            endQuest = "17505717361842936113",
            endPort = "In"
          },
          {
            startQuest = "17505717361842936113",
            startPort = "Out",
            endQuest = "17505717361842936114",
            endPort = "In"
          },
          {
            startQuest = "17505717302442935875",
            startPort = "Out",
            endQuest = "17505717355902936080",
            endPort = "In"
          },
          {
            startQuest = "17505717355902936082",
            startPort = "Out",
            endQuest = "17505717361842936112",
            endPort = "In"
          },
          {
            startQuest = "17505717361842936114",
            startPort = "Out",
            endQuest = "17505717555712936612",
            endPort = "In"
          },
          {
            startQuest = "17505717555712936612",
            startPort = "Out",
            endQuest = "17505713472352934672",
            endPort = "Success"
          },
          {
            startQuest = "17505713472352934669",
            startPort = "QuestStart",
            endQuest = "17505717775592936921",
            endPort = "In"
          },
          {
            startQuest = "17505716584502935299",
            startPort = "Out",
            endQuest = "17505717959972937236",
            endPort = "In"
          },
          {
            startQuest = "17505717355902936081",
            startPort = "Out",
            endQuest = "17505717997282937369",
            endPort = "In"
          },
          {
            startQuest = "17505717361842936113",
            startPort = "Out",
            endQuest = "17505718035642937505",
            endPort = "In"
          }
        },
        nodeData = {
          ["17505713472352934669"] = {
            key = "17505713472352934669",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17505713472352934672"] = {
            key = "17505713472352934672",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17505713472352934675"] = {
            key = "17505713472352934675",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17505715930052935020"] = {
            key = "17505715930052935020",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1131.5294117647059, y = 284.47058823529414},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060079}
            }
          },
          ["17505716584502935299"] = {
            key = "17505716584502935299",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1446.562091503268, y = 286.7058823529411},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11030,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_Side_BaoXiang",
              IsUseCount = false
            }
          },
          ["17505717302442935875"] = {
            key = "17505717302442935875",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1769.2418300653596, y = 282.45751633986913},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060079}
            }
          },
          ["17505717355902936080"] = {
            key = "17505717355902936080",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1118.2941176470586, y = 468.235294117647},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060079}
            }
          },
          ["17505717355902936081"] = {
            key = "17505717355902936081",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1400.0588235294117, y = 496.9411764705881},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11030,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_Side_BaoXiang",
              IsUseCount = false
            }
          },
          ["17505717355902936082"] = {
            key = "17505717355902936082",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1857.705882352941, y = 514.5882352941175},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060079}
            }
          },
          ["17505717361842936112"] = {
            key = "17505717361842936112",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1112.9999999999998, y = 810.5882352941178},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060079}
            }
          },
          ["17505717361842936113"] = {
            key = "17505717361842936113",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1437.1176470588234, y = 796.9411764705882},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11030,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_Side_BaoXiang",
              IsUseCount = false
            }
          },
          ["17505717361842936114"] = {
            key = "17505717361842936114",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1795.9411764705883, y = 828.7058823529411},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2060079}
            }
          },
          ["17505717555712936612"] = {
            key = "17505717555712936612",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2150.9411764705883, y = 854.9411764705881},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030309.20030309'",
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
          ["17505717775592936921"] = {
            key = "17505717775592936921",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1112.9732620320854, y = 93.95187165775388},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030308.20030308'",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17505717959972937236"] = {
            key = "17505717959972937236",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1748.5026737967912, y = 31.654061624649895},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030308_2.20030308_2'",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17505717997282937369"] = {
            key = "17505717997282937369",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1691.229946524064, y = 414.8358798064681},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030308_3.20030308_3'",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17505718035642937505"] = {
            key = "17505718035642937505",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1725.0935828877002, y = 669.9495161701045},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030308_4.20030308_4'",
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
    ["17514435175261242"] = {
      isStoryNode = true,
      key = "17514435175261242",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 1114.114409141583, y = 304.41604924442436},
      propsData = {
        QuestId = 20030300,
        QuestDescriptionComment = "",
        SubRegionId = 104109,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_RenWu_2100064"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17514435397571999",
            startPort = "Out",
            endQuest = "17514435397572000",
            endPort = "Input"
          },
          {
            startQuest = "17514435397572000",
            startPort = "ApproveOut",
            endQuest = "17514435397572001",
            endPort = "In"
          },
          {
            startQuest = "17514435175261243",
            startPort = "QuestStart",
            endQuest = "17514435397571999",
            endPort = "In"
          },
          {
            startQuest = "17514435397572001",
            startPort = "Out",
            endQuest = "17514435175261246",
            endPort = "Success"
          },
          {
            startQuest = "17514435397572000",
            startPort = "CancelOut",
            endQuest = "17514435175261254",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17514435175261243"] = {
            key = "17514435175261243",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17514435175261246"] = {
            key = "17514435175261246",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2187.727272727273, y = 290.4545454545455},
            propsData = {ModeType = 0}
          },
          ["17514435175261254"] = {
            key = "17514435175261254",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2075.909090909091, y = 537.7272727272727},
            propsData = {}
          },
          ["17514435397571999"] = {
            key = "17514435397571999",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1160.3235619453008, y = 266.7747833688051},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700322,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_RenWu_2100064",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030301.20030301'",
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
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17514435397572000"] = {
            key = "17514435397572000",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1533.596289218028, y = 268.1384197324415},
            propsData = {
              SideQuestChainId = 200303,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17514435397572001"] = {
            key = "17514435397572001",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1890.403710781972, y = 278.49794390392213},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51102012,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2003/200303/20030302.20030302'",
              TalkType = "QuestImpression",
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
              SwitchToMaster = "Player",
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
