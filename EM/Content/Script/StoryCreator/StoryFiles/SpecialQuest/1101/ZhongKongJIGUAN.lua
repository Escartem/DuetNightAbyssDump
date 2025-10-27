return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17309664088201178",
      startPort = "Success",
      endStory = "1730948035248823266",
      endPort = "In"
    },
    {
      startStory = "1730948035248823266",
      startPort = "Success",
      endStory = "17316581353841426366",
      endPort = "In"
    },
    {
      startStory = "17316581353841426366",
      startPort = "Success",
      endStory = "1732783210954581689",
      endPort = "StoryEnd"
    },
    {
      startStory = "1732783210954581688",
      startPort = "StoryStart",
      endStory = "17309664088201178",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1730948035248823266"] = {
      isStoryNode = true,
      key = "1730948035248823266",
      type = "StoryNode",
      name = "\230\156\186\229\133\179\232\167\163\229\175\134",
      pos = {x = 1983.591769180741, y = 297.4283345595178},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110111_8",
        QuestDeatil = "Content_110111_1",
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
            startQuest = "1730948035248823267",
            startPort = "QuestStart",
            endQuest = "17309487747441851215",
            endPort = "In"
          },
          {
            startQuest = "17309487747441851215",
            startPort = "Out",
            endQuest = "17309488527562466670",
            endPort = "In"
          },
          {
            startQuest = "17309488527562466670",
            startPort = "Out",
            endQuest = "1730948035248823273",
            endPort = "Fail"
          },
          {
            startQuest = "1730948035248823267",
            startPort = "QuestStart",
            endQuest = "17320919972072446842",
            endPort = "In"
          },
          {
            startQuest = "17320919972072446842",
            startPort = "Out",
            endQuest = "17309485650991234851",
            endPort = "In"
          },
          {
            startQuest = "17313125219833353117",
            startPort = "Out",
            endQuest = "1730948035248823270",
            endPort = "Success"
          },
          {
            startQuest = "17309485650991234851",
            startPort = "Out",
            endQuest = "17458294212244144766",
            endPort = "In"
          },
          {
            startQuest = "17458294212244144766",
            startPort = "Out",
            endQuest = "17458294352504145112",
            endPort = "In"
          },
          {
            startQuest = "17458294352504145112",
            startPort = "Out",
            endQuest = "17309486889351440156",
            endPort = "In"
          },
          {
            startQuest = "17309486889351440156",
            startPort = "Out",
            endQuest = "17458312837515252775",
            endPort = "In"
          },
          {
            startQuest = "17458312837515252775",
            startPort = "Out",
            endQuest = "17313125219833353117",
            endPort = "In"
          }
        },
        nodeData = {
          ["1730948035248823267"] = {
            key = "1730948035248823267",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 441.8518069366967, y = 120.55845258307069},
            propsData = {ModeType = 0}
          },
          ["1730948035248823270"] = {
            key = "1730948035248823270",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2665.3949171712115, y = -17.447587290905474},
            propsData = {ModeType = 0}
          },
          ["1730948035248823273"] = {
            key = "1730948035248823273",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1291.2930081614304, y = 256.58346185977797},
            propsData = {}
          },
          ["17309480641801028756"] = {
            key = "17309480641801028756",
            type = "BossBattleFinishNode",
            name = "\230\156\186\229\133\179\232\167\163\229\175\134\229\174\140\230\136\144",
            pos = {x = 1265.822494605842, y = -250.2820375223452},
            propsData = {
              SendMessage = "",
              FinishCondition = "CrystalPuzzleSucc"
            }
          },
          ["17309485650991234851"] = {
            key = "17309485650991234851",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1000.4731260273358, y = -30.909505141626095},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_ZhongKongJIGUAN"
            }
          },
          ["17309486889351440156"] = {
            key = "17309486889351440156",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1816.4895243815654, y = -23.652761300021965},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_ZhongKongJIGUAN"
            }
          },
          ["17309487747441851215"] = {
            key = "17309487747441851215",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 766.3494934226126, y = 246.36515110732205},
            propsData = {}
          },
          ["17309488527562466670"] = {
            key = "17309488527562466670",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1032.4924068222663, y = 255.7332363223827},
            propsData = {}
          },
          ["17313125219833353117"] = {
            key = "17313125219833353117",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2413.2543046567503, y = -60.825967178308346},
            propsData = {WaitTime = 2}
          },
          ["17320919972072446842"] = {
            key = "17320919972072446842",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\165\188\228\184\138\233\152\191\231\147\166\229\176\148\229\146\140\228\186\164\228\186\146\231\130\185",
            pos = {x = 738.4512987012986, y = -36.04545454545454},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650523, 1650700}
            }
          },
          ["17458294212244144766"] = {
            key = "17458294212244144766",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1296.1291329443504, y = -33.46319826245458},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11031,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17458294352504145112"] = {
            key = "17458294352504145112",
            type = "TalkNode",
            name = "\230\147\141\228\189\156\229\174\137\229\133\168\232\163\133\231\189\174",
            pos = {x = 1557.422127405087, y = -35.262945737202095},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018702,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17458312837515252775"] = {
            key = "17458312837515252775",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2082.5323075475253, y = -47.49534111959758},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/AssetDesign/Story/Sequence/1101EX01/EX01_fort02_Safe.EX01_fort02_Safe'",
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17309664088201178"] = {
      isStoryNode = true,
      key = "17309664088201178",
      type = "StoryNode",
      name = "\229\175\185\232\175\157",
      pos = {x = 1691.483206881448, y = 285.0880293757611},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110111_1",
        QuestDeatil = "Content_110111_1",
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
            startQuest = "17313124238982725787",
            startPort = "Out",
            endQuest = "1731325037100205534",
            endPort = "In"
          },
          {
            startQuest = "17309664088201179",
            startPort = "QuestStart",
            endQuest = "17322623938421563",
            endPort = "In"
          },
          {
            startQuest = "17322623938421563",
            startPort = "Out",
            endQuest = "17309664088201185",
            endPort = "Fail"
          },
          {
            startQuest = "17363346927332830",
            startPort = "Out",
            endQuest = "1730966427489206931",
            endPort = "In"
          },
          {
            startQuest = "1730966427489206931",
            startPort = "Out",
            endQuest = "17448868850732163063",
            endPort = "In"
          },
          {
            startQuest = "17309664088201179",
            startPort = "QuestStart",
            endQuest = "17363346927332830",
            endPort = "In"
          },
          {
            startQuest = "174774876014512100410",
            startPort = "Out",
            endQuest = "174774876014512100411",
            endPort = "In"
          },
          {
            startQuest = "17448868850732163063",
            startPort = "Out",
            endQuest = "174774876014512100410",
            endPort = "In"
          },
          {
            startQuest = "174774876014512100411",
            startPort = "Out",
            endQuest = "17309664088201182",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17309664088201179"] = {
            key = "17309664088201179",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 461.8837355515794, y = 150.7196401799101},
            propsData = {ModeType = 0}
          },
          ["17309664088201182"] = {
            key = "17309664088201182",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2626.331402480578, y = 114.49277633910314},
            propsData = {ModeType = 0}
          },
          ["17309664088201185"] = {
            key = "17309664088201185",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1237.940503432494, y = 438.8558352402746},
            propsData = {}
          },
          ["1730966427489206931"] = {
            key = "1730966427489206931",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\229\146\140\231\148\183\228\184\187\229\136\134\230\158\144\231\171\153\230\161\169",
            pos = {x = 1626.6921675188337, y = 122.68735116217702},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012902,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_17",
              BlendInTime = 0,
              BlendOutTime = 0,
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
          ["1730966427489206932"] = {
            key = "1730966427489206932",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1935.6252415906597, y = -229.98468929905067},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012908,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_17",
              BlendInTime = -1,
              BlendOutTime = 1,
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
          ["1730966427489206933"] = {
            key = "1730966427489206933",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2015.5170015552956, y = -223.04179253800035},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012911,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_17",
              BlendInTime = -1,
              BlendOutTime = 1,
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
          ["17313123048962725361"] = {
            key = "17313123048962725361",
            type = "SendMessageNode",
            name = "\229\188\128\229\167\139\230\156\186\229\133\179\232\167\163\229\175\134",
            pos = {x = 839.5847657265706, y = 6.246394618875797},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "StartCrystalPuzzle",
              UnitId = -1
            }
          },
          ["17313124238982725787"] = {
            key = "17313124238982725787",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 785.4431065254497, y = -240.1544012010774},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012904,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_17",
              BlendInTime = 2,
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
          ["1731325037100205534"] = {
            key = "1731325037100205534",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1061.5006569517436, y = -171.44605480332066},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012902,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_17",
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
          ["17322623938421563"] = {
            key = "17322623938421563",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 857.8947368421053, y = 417.15789473684214},
            propsData = {}
          },
          ["17363346927332830"] = {
            key = "17363346927332830",
            type = "TalkNode",
            name = "\230\146\173\229\133\179\233\151\168seq",
            pos = {x = 1311.6411008781326, y = 121.89171664167894},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/1101EX01/ZhongkongCloseDoor",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
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
              SwitchToMaster = "EXPlayer",
              OverrideFailBlend = false
            }
          },
          ["17448868850732163063"] = {
            key = "17448868850732163063",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1900.4257695068875, y = 102.48529921642042},
            propsData = {QuestRoleId = 1040101, IsPlayFX = false}
          },
          ["174774876014512100410"] = {
            key = "174774876014512100410",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136skill",
            pos = {x = 2014.1699831268722, y = 259.0841489667491},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Empty",
              SkillNameList = {"Skill3", "Fire"}
            }
          },
          ["174774876014512100411"] = {
            key = "174774876014512100411",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136skill",
            pos = {x = 2314.852036043889, y = 295.3335591832246},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {"Fire"}
            }
          }
        },
        commentData = {}
      }
    },
    ["17316581353841426366"] = {
      isStoryNode = true,
      key = "17316581353841426366",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2262.1754724649463, y = 312.1998069498069},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110111_1",
        QuestDeatil = "Content_110111_1",
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
            startQuest = "17316581353841426370",
            startPort = "QuestStart",
            endQuest = "17316581353861426380",
            endPort = "In"
          },
          {
            startQuest = "17316581353851426373",
            startPort = "Out",
            endQuest = "17316581353861426383",
            endPort = "In"
          },
          {
            startQuest = "17316581353861426385",
            startPort = "Option_1",
            endQuest = "17316581353871426386",
            endPort = "In"
          },
          {
            startQuest = "17316581353871426386",
            startPort = "Out",
            endQuest = "17316581353871426388",
            endPort = "In"
          },
          {
            startQuest = "17316581353861426380",
            startPort = "Out",
            endQuest = "17316581598671629439",
            endPort = "In"
          },
          {
            startQuest = "17316581598671629439",
            startPort = "Out",
            endQuest = "17316581353851426372",
            endPort = "Fail"
          },
          {
            startQuest = "17316581353841426370",
            startPort = "QuestStart",
            endQuest = "17320852859883554",
            endPort = "In"
          },
          {
            startQuest = "17320852859883554",
            startPort = "Out",
            endQuest = "17328662433924151171",
            endPort = "In"
          },
          {
            startQuest = "17328662433924151171",
            startPort = "Out",
            endQuest = "17316581353851426373",
            endPort = "In"
          },
          {
            startQuest = "17328662433924151171",
            startPort = "Out",
            endQuest = "17316581353861426381",
            endPort = "In"
          },
          {
            startQuest = "17328662588444151726",
            startPort = "Out",
            endQuest = "17316583645242237579",
            endPort = "In"
          },
          {
            startQuest = "17316581353851426376",
            startPort = "Out",
            endQuest = "17316581353861426384",
            endPort = "In"
          },
          {
            startQuest = "17328662433924151171",
            startPort = "Out",
            endQuest = "17316581353851426376",
            endPort = "In"
          },
          {
            startQuest = "17316581353861426381",
            startPort = "Out",
            endQuest = "17316581353871426387",
            endPort = "In"
          },
          {
            startQuest = "17316581353861426383",
            startPort = "Out",
            endQuest = "17328662588444151726",
            endPort = "Branch_1"
          },
          {
            startQuest = "17316581353861426384",
            startPort = "Out",
            endQuest = "17328662588444151726",
            endPort = "Branch_2"
          },
          {
            startQuest = "17316581353871426387",
            startPort = "Out",
            endQuest = "17328662588444151726",
            endPort = "Branch_3"
          },
          {
            startQuest = "174774877065912100860",
            startPort = "Out",
            endQuest = "174774877065912100861",
            endPort = "In"
          },
          {
            startQuest = "17316583645242237579",
            startPort = "Out",
            endQuest = "174774877065912100860",
            endPort = "In"
          },
          {
            startQuest = "174774877065912100861",
            startPort = "Out",
            endQuest = "17316581353861426379",
            endPort = "In"
          }
        },
        nodeData = {
          ["17316581353841426370"] = {
            key = "17316581353841426370",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 182.0332706766917, y = 196.56307435254803},
            propsData = {ModeType = 0}
          },
          ["17316581353841426371"] = {
            key = "17316581353841426371",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3408.8588779641404, y = 23.19424397113187},
            propsData = {ModeType = 0}
          },
          ["17316581353851426372"] = {
            key = "17316581353851426372",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2050.4580745341614, y = 842.0403726708075},
            propsData = {}
          },
          ["17316581353851426373"] = {
            key = "17316581353851426373",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1160.5937726752654, y = 88.18350070869586},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11004,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_1650331",
              IsUseCount = false
            }
          },
          ["17316581353851426375"] = {
            key = "17316581353851426375",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1158.7583501850454, y = -103.27221145353782},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11003,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_1650330",
              IsUseCount = false
            }
          },
          ["17316581353851426376"] = {
            key = "17316581353851426376",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1167.493953079569, y = 246.23371323979305},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11001,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_1650332",
              IsUseCount = false
            }
          },
          ["17316581353861426379"] = {
            key = "17316581353861426379",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3107.6427480474713, y = 25.823727065886892},
            propsData = {}
          },
          ["17316581353861426380"] = {
            key = "17316581353861426380",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1240.4606623985665, y = 908.8228771149226},
            propsData = {}
          },
          ["17316581353861426381"] = {
            key = "17316581353861426381",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1141.1025928331378, y = 444.89629046600095},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11002,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_1650336",
              IsUseCount = false
            }
          },
          ["17316581353861426383"] = {
            key = "17316581353861426383",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1425.2271563578274, y = 93.0480450831979},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11019409,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17316581353861426384"] = {
            key = "17316581353861426384",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1430.6740866014966, y = 245.1672639078516},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018821,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17316581353861426385"] = {
            key = "17316581353861426385",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1994.932882210922, y = 532.4611325677957},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018818,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  OptionText = "11018106",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "11018105",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17316581353871426386"] = {
            key = "17316581353871426386",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2264.406854890637, y = 339.43170279626804},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018103,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17316581353871426387"] = {
            key = "17316581353871426387",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1406.454008958242, y = 658.9797742236227},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11013101,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17316581353871426388"] = {
            key = "17316581353871426388",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2315.902251057178, y = 412.66732043027645},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018104,
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
                  OptionText = "11018105",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17316581598671629439"] = {
            key = "17316581598671629439",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1617.5728996404055, y = 916.773247347618},
            propsData = {}
          },
          ["17316583645242237579"] = {
            key = "17316583645242237579",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\165\188\228\184\138\233\152\191\231\147\166\229\176\148",
            pos = {x = 2213.2973710754036, y = 47.08383150030754},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650062, 1650700}
            }
          },
          ["17320852859883554"] = {
            key = "17320852859883554",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 566.7981304466426, y = 142.75374379440598},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650331,
                1650332,
                1650333
              }
            }
          },
          ["17328662433924151171"] = {
            key = "17328662433924151171",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = 807.6015037593986, y = 140.57040328092964},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = true,
                  BranchQuestName = "",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = true,
              IsDifftation = false
            }
          },
          ["17328662588444151726"] = {
            key = "17328662588444151726",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 1922.203947368421, y = 14.464285714285744},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["174774877065912100860"] = {
            key = "174774877065912100860",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136skill",
            pos = {x = 2480.5745579570766, y = 114.05344283077972},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Empty",
              SkillNameList = {"Skill3", "Fire"}
            }
          },
          ["174774877065912100861"] = {
            key = "174774877065912100861",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136skill",
            pos = {x = 2744.568299185781, y = 138.80370002636312},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {"Fire"}
            }
          }
        },
        commentData = {}
      }
    },
    ["1732783210954581688"] = {
      isStoryNode = true,
      key = "1732783210954581688",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1081.6666666666665, y = 303.3333333333333},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210954581689"] = {
      isStoryNode = true,
      key = "1732783210954581689",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2605.666666666667, y = 286.3095238095238},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210954581690"] = {
      isStoryNode = true,
      key = "1732783210954581690",
      type = "StoryNode",
      name = "\229\136\157\229\167\139\229\140\150\230\156\186\229\133\179",
      pos = {x = 1422.7348546828734, y = 14.38977554703365},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110111_1",
        QuestDeatil = "Content_110111_1",
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
            startQuest = "1732783210954581691",
            startPort = "QuestStart",
            endQuest = "17309489032642673062",
            endPort = "In"
          },
          {
            startQuest = "17309489032642673062",
            startPort = "Out",
            endQuest = "17316583305702034873",
            endPort = "In"
          },
          {
            startQuest = "17316583305702034873",
            startPort = "Out",
            endQuest = "1732783210954581693",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17309489032642673062"] = {
            key = "17309489032642673062",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1415.5331345906354, y = 525.5312579271827},
            propsData = {}
          },
          ["17316583305702034873"] = {
            key = "17316583305702034873",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1685.5862068965516, y = 537.3103448275862},
            propsData = {}
          },
          ["1732783210954581691"] = {
            key = "1732783210954581691",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1053.6, y = 363.55555555555554},
            propsData = {ModeType = 0}
          },
          ["1732783210954581692"] = {
            key = "1732783210954581692",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1933.111842113341, y = 295.8960996998025},
            propsData = {ModeType = 0}
          },
          ["1732783210954581693"] = {
            key = "1732783210954581693",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2006.1937619437622, y = 548.4956319956319},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
