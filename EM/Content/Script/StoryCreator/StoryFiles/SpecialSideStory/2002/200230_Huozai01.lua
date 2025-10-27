return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17447202908221628737",
      startPort = "Success",
      endStory = "17447202917261628807",
      endPort = "In"
    },
    {
      startStory = "17447202960861629129",
      startPort = "Success",
      endStory = "17447202971411629212",
      endPort = "In"
    },
    {
      startStory = "17447202971411629212",
      startPort = "Success",
      endStory = "17447202886791628640",
      endPort = "StoryEnd"
    },
    {
      startStory = "17447202917261628807",
      startPort = "Success",
      endStory = "17479782656819670653",
      endPort = "In"
    },
    {
      startStory = "17479782656819670653",
      startPort = "Success",
      endStory = "17447202937811628953",
      endPort = "In"
    },
    {
      startStory = "17447202937811628953",
      startPort = "Success",
      endStory = "17447202960861629129",
      endPort = "In"
    },
    {
      startStory = "17447202886791628637",
      startPort = "StoryStart",
      endStory = "175127159377512421401",
      endPort = "In"
    },
    {
      startStory = "175127159377512421401",
      startPort = "Success",
      endStory = "17447202908221628737",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17447202886791628637"] = {
      isStoryNode = true,
      key = "17447202886791628637",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 843.0434782608696, y = 315.6521739130435},
      propsData = {QuestChainId = 200230},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17447202886791628640"] = {
      isStoryNode = true,
      key = "17447202886791628640",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1967.8260869565215, y = 558.5507246376812},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17447202908221628737"] = {
      isStoryNode = true,
      key = "17447202908221628737",
      type = "StoryNode",
      name = "\228\184\142\232\150\135\229\165\165\232\142\177\229\161\148\229\175\185\232\175\157+\231\186\191\231\180\1624    ",
      pos = {x = 1119.7527925506477, y = 309.8599034130392},
      propsData = {
        QuestId = 20023001,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200230_1",
        QuestDeatil = "Content_200230_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Violetta_SSS_1191508"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447202908221628738",
            startPort = "QuestStart",
            endQuest = "17447204851251632358",
            endPort = "In"
          },
          {
            startQuest = "17447204987571632483",
            startPort = "Out",
            endQuest = "17474653364381751337",
            endPort = "In"
          },
          {
            startQuest = "17447204851251632358",
            startPort = "Out",
            endQuest = "1744788071819824313",
            endPort = "In"
          },
          {
            startQuest = "1744788071819824313",
            startPort = "Out",
            endQuest = "17447204987571632483",
            endPort = "In"
          },
          {
            startQuest = "17501283182784548",
            startPort = "Out",
            endQuest = "17501283182784549",
            endPort = "Input"
          },
          {
            startQuest = "17501283182784546",
            startPort = "true",
            endQuest = "17501283182784547",
            endPort = "Input"
          },
          {
            startQuest = "17501283182784547",
            startPort = "Out",
            endQuest = "17501283182784550",
            endPort = "In"
          },
          {
            startQuest = "17501283182784550",
            startPort = "Out",
            endQuest = "17501283182784548",
            endPort = "Input"
          },
          {
            startQuest = "17501283182784546",
            startPort = "false",
            endQuest = "17501283182784548",
            endPort = "Input"
          },
          {
            startQuest = "17501283182784549",
            startPort = "Out",
            endQuest = "17447202908221628741",
            endPort = "Success"
          },
          {
            startQuest = "1744788071819824313",
            startPort = "Out",
            endQuest = "17601736069901760",
            endPort = "In"
          },
          {
            startQuest = "17447204987571632483",
            startPort = "Out",
            endQuest = "17601736173342118",
            endPort = "In"
          },
          {
            startQuest = "17601736173342118",
            startPort = "Out",
            endQuest = "17501283182784546",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447202908221628738"] = {
            key = "17447202908221628738",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 828.8705882352941, y = 296.89411764705886},
            propsData = {ModeType = 0}
          },
          ["17447202908221628741"] = {
            key = "17447202908221628741",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3389.2589264286717, y = 303.4728873943312},
            propsData = {ModeType = 0}
          },
          ["17447202908221628744"] = {
            key = "17447202908221628744",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1585.5136924627705, y = 1029.547299140137},
            propsData = {}
          },
          ["17447204851251632358"] = {
            key = "17447204851251632358",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\150\135\229\165\165\232\142\177\229\161\148\228\184\142\232\180\185\230\129\169",
            pos = {x = 1105.1721925133688, y = 297.21212123547417},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191506, 1191508}
            }
          },
          ["17447204987571632483"] = {
            key = "17447204987571632483",
            type = "TalkNode",
            name = "\228\184\142\232\150\135\232\142\177\229\165\165\229\161\148\229\175\185\232\175\157",
            pos = {x = 1659.8259073311713, y = 310.70728961441034},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009410,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023001",
              BlendInTime = 1,
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
                  TalkActorId = 700300,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700306,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700300},
                {TalkActorType = "Npc", TalkActorId = 700306}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17447206990971634481"] = {
            key = "17447206990971634481",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 1163.0504547309831, y = 932.6672310961352},
            propsData = {
              ResourceType = "Resource",
              ResourceId = -1,
              ResourceSType = "None",
              NeedCount = 0,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = ""
            }
          },
          ["1744788071819824313"] = {
            key = "1744788071819824313",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1393.0054052939458, y = 297.43783808862145},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191505,
              GuideType = "N",
              GuidePointName = "Npc_Violetta_SSS_1191508"
            }
          },
          ["17474653364381751337"] = {
            key = "17474653364381751337",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\180\185\230\129\169",
            pos = {x = 1448.4178183727945, y = -168.4368077120458},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191506}
            }
          },
          ["17501283182784546"] = {
            key = "17501283182784546",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "0\230\156\170\232\167\163\233\148\129\230\142\168\231\144\134\233\151\174\233\162\152\239\188\1401\228\184\186\229\183\178\232\167\163\233\148\129",
            pos = {x = 2092.2018308104375, y = 262.60078401832857},
            propsData = {
              FunctionName = "Equal",
              VarName = "Huozai04Side",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17501283182784547"] = {
            key = "17501283182784547",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 2285.251207624027, y = 127.55541387648361},
            propsData = {
              QuestionIds = {2002},
              OpenToast = false
            }
          },
          ["17501283182784548"] = {
            key = "17501283182784548",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2820.5492639987433, y = 285.37356656107124},
            propsData = {
              AnswerIds = {200204}
            }
          },
          ["17501283182784549"] = {
            key = "17501283182784549",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 3106.172132052823, y = 284.3886372752211},
            propsData = {AnswerId = 200204, AutoOpenDetectiveGameUI = false}
          },
          ["17501283182784550"] = {
            key = "17501283182784550",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2559.0059578813816, y = 139.71017032320526},
            propsData = {
              VarName = "Huozai04Side",
              VarValue = 1
            }
          },
          ["17601736069901760"] = {
            key = "17601736069901760",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\229\185\189\233\187\152",
            pos = {x = 1681.7575761312223, y = 529.4545447539582},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 2,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0033_story_humour",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              SoundUnitKey = "Huozai01-humour"
            }
          },
          ["17601736173342118"] = {
            key = "17601736173342118",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\229\185\189\233\187\152",
            pos = {x = 1862.060603655257, y = -79.63635494908263},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "Huozai01-humour"
            }
          }
        },
        commentData = {
          ["17501286998828345"] = {
            key = "17501286998828345",
            name = "\232\142\183\229\190\151\231\186\191\231\180\1624",
            position = {x = 1914.0381308258784, y = 12.362631374570128},
            size = {width = 1436.0000000000002, height = 616}
          }
        }
      }
    },
    ["17447202917261628807"] = {
      isStoryNode = true,
      key = "17447202917261628807",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\159\142\229\164\150&\228\184\142\229\163\171\229\133\181\229\175\185\232\175\157",
      pos = {x = 1385.854327772965, y = 299.48484850820137},
      propsData = {
        QuestId = 20023002,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200230_2",
        QuestDeatil = "Content_200230_2",
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
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_2002300201Soilder_1191509"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447202917261628808",
            startPort = "QuestStart",
            endQuest = "17447207277801634987",
            endPort = "In"
          },
          {
            startQuest = "17447207196511634885",
            startPort = "Out",
            endQuest = "17447207401481635278",
            endPort = "In"
          },
          {
            startQuest = "17447207277801634987",
            startPort = "Out",
            endQuest = "174766160945017111698",
            endPort = "In"
          },
          {
            startQuest = "174766160945017111698",
            startPort = "Out",
            endQuest = "17447207196511634885",
            endPort = "In"
          },
          {
            startQuest = "1753084042312650056",
            startPort = "Out",
            endQuest = "17447202917261628811",
            endPort = "Success"
          },
          {
            startQuest = "17447207196511634885",
            startPort = "Out",
            endQuest = "17601736331042463",
            endPort = "In"
          },
          {
            startQuest = "17447207401481635278",
            startPort = "Out",
            endQuest = "17601736493072775",
            endPort = "In"
          },
          {
            startQuest = "17601736493072775",
            startPort = "Out",
            endQuest = "1753084042312650056",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447202917261628808"] = {
            key = "17447202917261628808",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17447202917261628811"] = {
            key = "17447202917261628811",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2515.9780199624815, y = 297.6983206955569},
            propsData = {ModeType = 0}
          },
          ["17447202917261628814"] = {
            key = "17447202917261628814",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1888.75, y = 810.25},
            propsData = {}
          },
          ["17447207196511634885"] = {
            key = "17447207196511634885",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1406.2325560042123, y = 304.9767440003663},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191509,
              GuideType = "M",
              GuidePointName = "Mechanism_2002300201Soilder_1191509"
            }
          },
          ["17447207277801634987"] = {
            key = "17447207277801634987",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 1060, y = 306},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191511}
            }
          },
          ["17447207401481635278"] = {
            key = "17447207401481635278",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1680.2325560042123, y = 304.9767440003663},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009448,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023002",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorId = 700313,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700313}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174766160945017111698"] = {
            key = "174766160945017111698",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\230\184\184\230\136\143",
            pos = {x = 1053.7086736227775, y = 475.0973724198928},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191512}
            }
          },
          ["17479680532951744501"] = {
            key = "17479680532951744501",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\189\149\233\159\179\230\156\186",
            pos = {x = 1709.7906486655456, y = 659.2292323828125},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191520}
            }
          },
          ["1753084042312650056"] = {
            key = "1753084042312650056",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = 2215.440212950527, y = 298.40383310834375},
            propsData = {
              StaticCreatorIdList = {1191512},
              ManualItemIdList = {},
              StateId = 602,
              QuestId = 0
            }
          },
          ["17601736331042463"] = {
            key = "17601736331042463",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\229\185\189\233\187\152",
            pos = {x = 1678, y = 80},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 2,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0033_story_humour",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              SoundUnitKey = "Huozai01-humour"
            }
          },
          ["17601736493072775"] = {
            key = "17601736493072775",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\229\185\189\233\187\152",
            pos = {x = 1952, y = 308},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "Huozai01-humour"
            }
          }
        },
        commentData = {}
      }
    },
    ["17447202937811628953"] = {
      isStoryNode = true,
      key = "17447202937811628953",
      type = "StoryNode",
      name = "\229\174\140\230\136\144\232\176\131\233\162\145\229\144\142\228\184\142\229\163\171\229\133\181\229\175\185\232\175\157",
      pos = {x = 1961.8026029356038, y = 307.08162550925215},
      propsData = {
        QuestId = 20023004,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200230_4",
        QuestDeatil = "Content_200230_4",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Soilder200230_SSS_1191511"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447202937811628954",
            startPort = "QuestStart",
            endQuest = "17447209628121638770",
            endPort = "In"
          },
          {
            startQuest = "17447209466161638482",
            startPort = "Out",
            endQuest = "17448049117431652729",
            endPort = "In"
          },
          {
            startQuest = "17448049117431652729",
            startPort = "Out",
            endQuest = "17448049126551652810",
            endPort = "In"
          },
          {
            startQuest = "17483375599513555292",
            startPort = "Success",
            endQuest = "17447202937811628957",
            endPort = "Success"
          },
          {
            startQuest = "17483375599513555292",
            startPort = "Fail",
            endQuest = "17447202937811628960",
            endPort = "Fail"
          },
          {
            startQuest = "17483375599513555292",
            startPort = "PassiveFail",
            endQuest = "17447202937811628960",
            endPort = "Fail"
          },
          {
            startQuest = "17447209628121638770",
            startPort = "Out",
            endQuest = "1760173679699934370",
            endPort = "In"
          },
          {
            startQuest = "17447209628121638770",
            startPort = "Out",
            endQuest = "17447209466161638482",
            endPort = "In"
          },
          {
            startQuest = "17448049126551652810",
            startPort = "Out",
            endQuest = "1760173699031935044",
            endPort = "In"
          },
          {
            startQuest = "1760173699031935044",
            startPort = "Out",
            endQuest = "17483375599513555292",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447202937811628954"] = {
            key = "17447202937811628954",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17447202937811628957"] = {
            key = "17447202937811628957",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2354.870166146974, y = 559.2328391658093},
            propsData = {ModeType = 0}
          },
          ["17447202937811628960"] = {
            key = "17447202937811628960",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2353.142851563538, y = 710.857139717154},
            propsData = {}
          },
          ["17447209466161638482"] = {
            key = "17447209466161638482",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1366, y = 287.9024391756771},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009457,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023004",
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
                  TalkActorId = 700313,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700313}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17447209628121638770"] = {
            key = "17447209628121638770",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1096, y = 292},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191509,
              GuideType = "N",
              GuidePointName = "Npc_Soilder200230_SSS_1191511"
            }
          },
          ["17447210108201639385"] = {
            key = "17447210108201639385",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\163\171\229\133\181",
            pos = {x = 1676.5957121648319, y = -130.90002957052607},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191511}
            }
          },
          ["17448049117431652729"] = {
            key = "17448049117431652729",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1365.1999999999998, y = 458.79999999999995},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009462,
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
          ["17448049126551652810"] = {
            key = "17448049126551652810",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1370.4585364832471, y = 643.2195121648646},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009463,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023004",
              BlendInTime = 0,
              BlendOutTime = 2,
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
                  TalkActorId = 700313,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700313}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174798309180713190060"] = {
            key = "174798309180713190060",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\176\143\230\184\184\230\136\143",
            pos = {x = 1411.5233579342007, y = -256.5798921016433},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191512}
            }
          },
          ["17483375313273554674"] = {
            key = "17483375313273554674",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\189\149\233\159\179\230\156\186",
            pos = {x = 1681.7142916050084, y = 6.43386835925702},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191520}
            }
          },
          ["17483375599513555292"] = {
            key = "17483375599513555292",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\228\184\142\229\163\171\229\133\181\230\136\152\230\150\151\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1994.857148799766, y = 652.433856733513},
            propsData = {SpecialConfigId = 1049, BlackScreenImmediately = true}
          },
          ["17484071132721774341"] = {
            key = "17484071132721774341",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 820.0606267746339, y = 1383.9393763079497},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 0,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1760173679699934370"] = {
            key = "1760173679699934370",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\229\185\189\233\187\152",
            pos = {x = 1346, y = 132},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 2,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0033_story_humour",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              SoundUnitKey = "Huozai01-humour"
            }
          },
          ["1760173699031935044"] = {
            key = "1760173699031935044",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\229\185\189\233\187\152",
            pos = {x = 1656, y = 644},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "Huozai01-humour"
            }
          }
        },
        commentData = {}
      }
    },
    ["17447202960861629129"] = {
      isStoryNode = true,
      key = "17447202960861629129",
      type = "StoryNode",
      name = "\230\136\152\232\131\156\229\144\142\228\184\142\229\163\171\229\133\181\229\175\185\232\175\157",
      pos = {x = 1401.1781205972634, y = 545.8695652173914},
      propsData = {
        QuestId = 20023006,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200230_6",
        QuestDeatil = "Content_200230_6",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Soilder200230_SSS_1191511"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447202960861629130",
            startPort = "QuestStart",
            endQuest = "17447211024331642191",
            endPort = "In"
          },
          {
            startQuest = "17483418022805326272",
            startPort = "Out",
            endQuest = "17447202960861629133",
            endPort = "Success"
          },
          {
            startQuest = "17483418022805326271",
            startPort = "Out",
            endQuest = "17483418022805326272",
            endPort = "In"
          },
          {
            startQuest = "17447202960861629130",
            startPort = "QuestStart",
            endQuest = "1760173712857935310",
            endPort = "In"
          },
          {
            startQuest = "17447211024331642191",
            startPort = "Out",
            endQuest = "1760173719130935501",
            endPort = "In"
          },
          {
            startQuest = "1760173719130935501",
            startPort = "Out",
            endQuest = "17483418022805326271",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447202960861629130"] = {
            key = "17447202960861629130",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 956.8965496603006, y = 296.5517241832901},
            propsData = {ModeType = 0}
          },
          ["17447202960861629133"] = {
            key = "17447202960861629133",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2258.847283428303, y = 263.86206928303073},
            propsData = {ModeType = 0}
          },
          ["17447202960861629136"] = {
            key = "17447202960861629136",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1728, y = 484},
            propsData = {}
          },
          ["17447211024331642191"] = {
            key = "17447211024331642191",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1313.6734723688644, y = 287.8775512110636},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009480,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023004",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorId = 700313,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700313}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17483418022805326271"] = {
            key = "17483418022805326271",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\163\171\229\133\181",
            pos = {x = 1588.5139532567734, y = 284.3336947291706},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191511}
            }
          },
          ["17483418022805326272"] = {
            key = "17483418022805326272",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\189\149\233\159\179\230\156\186",
            pos = {x = 1869.4945980337422, y = 276.84000835713783},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191512}
            }
          },
          ["1760173712857935310"] = {
            key = "1760173712857935310",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\229\185\189\233\187\152",
            pos = {x = 1256, y = 60},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 2,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0033_story_humour",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              SoundUnitKey = "Huozai01-humour"
            }
          },
          ["1760173719130935501"] = {
            key = "1760173719130935501",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\229\185\189\233\187\152",
            pos = {x = 1588, y = 106},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "Huozai01-humour"
            }
          }
        },
        commentData = {}
      }
    },
    ["17447202971411629212"] = {
      isStoryNode = true,
      key = "17447202971411629212",
      type = "StoryNode",
      name = "\229\142\187\230\137\190\232\150\135\229\165\165\232\142\177\229\161\148\229\164\141\229\145\189+\231\186\191\231\180\1626    ",
      pos = {x = 1688.229371922707, y = 541.8394109793866},
      propsData = {
        QuestId = 20023007,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200230_7",
        QuestDeatil = "Content_200230_7",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Violetta_SSS_1191508"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17447202971411629213",
            startPort = "QuestStart",
            endQuest = "17447212331851644338",
            endPort = "In"
          },
          {
            startQuest = "17447212331851644338",
            startPort = "Out",
            endQuest = "17447211937581643771",
            endPort = "In"
          },
          {
            startQuest = "17448050255601654536",
            startPort = "Out",
            endQuest = "174775104721427388588",
            endPort = "In"
          },
          {
            startQuest = "17447211937581643771",
            startPort = "Out",
            endQuest = "17482499314497342",
            endPort = "In"
          },
          {
            startQuest = "17482499314497342",
            startPort = "Out",
            endQuest = "1748250711992891348",
            endPort = "In"
          },
          {
            startQuest = "1748250711992891348",
            startPort = "Out",
            endQuest = "17448050255601654536",
            endPort = "In"
          },
          {
            startQuest = "1750128926360952852",
            startPort = "Out",
            endQuest = "1750128926360952853",
            endPort = "Input"
          },
          {
            startQuest = "1750128926360952850",
            startPort = "true",
            endQuest = "1750128926360952851",
            endPort = "Input"
          },
          {
            startQuest = "1750128926360952851",
            startPort = "Out",
            endQuest = "1750128926360952854",
            endPort = "In"
          },
          {
            startQuest = "1750128926360952854",
            startPort = "Out",
            endQuest = "1750128926360952852",
            endPort = "Input"
          },
          {
            startQuest = "1750128926360952850",
            startPort = "false",
            endQuest = "1750128926360952852",
            endPort = "Input"
          },
          {
            startQuest = "1750128926360952853",
            startPort = "Out",
            endQuest = "17447202971411629216",
            endPort = "Success"
          },
          {
            startQuest = "17448050255601654536",
            startPort = "Out",
            endQuest = "1750128926360952850",
            endPort = "In"
          }
        },
        nodeData = {
          ["17447202971411629213"] = {
            key = "17447202971411629213",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 871.0526315789474, y = 285.7894736842105},
            propsData = {ModeType = 0}
          },
          ["17447202971411629216"] = {
            key = "17447202971411629216",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3992.5645515827155, y = 366.48335441523193},
            propsData = {ModeType = 0}
          },
          ["17447202971411629219"] = {
            key = "17447202971411629219",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2320.785703672033, y = 521.6964282340745},
            propsData = {}
          },
          ["17447211937581643771"] = {
            key = "17447211937581643771",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1405.125, y = 284.32236842105266},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009488,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023007",
              BlendInTime = 1,
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
                  TalkActorId = 700306,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700300,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700306},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700300}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17447212331851644338"] = {
            key = "17447212331851644338",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1127.625, y = 284.125},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191505,
              GuideType = "N",
              GuidePointName = "Npc_Violetta_SSS_1191508"
            }
          },
          ["17448050255601654536"] = {
            key = "17448050255601654536",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2262.1804405141384, y = 307.20300718144284},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009513,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 1,
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
          ["174775104721427388588"] = {
            key = "174775104721427388588",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2552.7529526612657, y = -43.42652882968237},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191506, 1191508}
            }
          },
          ["17482499314497342"] = {
            key = "17482499314497342",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1695.5413277041228, y = 293.49804002528265},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009509,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 1,
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
          ["1748250711992891348"] = {
            key = "1748250711992891348",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1988.3984634249273, y = 292.06946589787776},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009510,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023007",
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
                  TalkActorId = 700306,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700300,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700306},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700300}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750128926360952850"] = {
            key = "1750128926360952850",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "0\230\156\170\232\167\163\233\148\129\230\142\168\231\144\134\233\151\174\233\162\152\239\188\1401\228\184\186\229\183\178\232\167\163\233\148\129",
            pos = {x = 2598.024616692121, y = 331.57345118794956},
            propsData = {
              FunctionName = "Equal",
              VarName = "Huozai04Side",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1750128926360952851"] = {
            key = "1750128926360952851",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 2835.8931518845684, y = 188.46356501630999},
            propsData = {
              QuestionIds = {2002},
              OpenToast = false
            }
          },
          ["1750128926360952852"] = {
            key = "1750128926360952852",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 3369.578305053326, y = 368.86236258432245},
            propsData = {
              AnswerIds = {200206}
            }
          },
          ["1750128926360952853"] = {
            key = "1750128926360952853",
            type = "OpenDetectiveAnswerUINode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\232\142\183\229\190\151\230\150\176\231\186\191\231\180\162\230\143\144\231\164\186UI",
            pos = {x = 3649.1366570776113, y = 371.10323971039014},
            propsData = {AnswerId = 200206, AutoOpenDetectiveGameUI = false}
          },
          ["1750128926360952854"] = {
            key = "1750128926360952854",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 3090.293063670417, y = 186.10219260940147},
            propsData = {
              VarName = "Huozai04Side",
              VarValue = 1
            }
          }
        },
        commentData = {
          ["1750128969559954203"] = {
            key = "1750128969559954203",
            name = "\232\142\183\229\190\151\231\186\191\231\180\1626",
            position = {x = 2574.193548089384, y = 91.56619375490362},
            size = {width = 1351.6128865935673, height = 574.1935413213725}
          }
        }
      }
    },
    ["17479782656819670653"] = {
      isStoryNode = true,
      key = "17479782656819670653",
      type = "StoryNode",
      name = "\229\176\143\230\184\184\230\136\143-\232\176\131\233\162\145",
      pos = {x = 1667.2172028038333, y = 300.5934501171638},
      propsData = {
        QuestId = 20023003,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200230_3",
        QuestDeatil = "Content_200230_3",
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
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_Minigame_SSS_1191512"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17479782656819670658",
            startPort = "QuestStart",
            endQuest = "17506629570585666",
            endPort = "In"
          },
          {
            startQuest = "17506629570585666",
            startPort = "Out",
            endQuest = "17479782656819670659",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17479782656819670658"] = {
            key = "17479782656819670658",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17479782656819670659"] = {
            key = "17479782656819670659",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1517.6410239146724, y = 312.71794874720894},
            propsData = {ModeType = 0}
          },
          ["17479782656819670660"] = {
            key = "17479782656819670660",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1678, y = 548},
            propsData = {}
          },
          ["17479782656819670661"] = {
            key = "17479782656819670661",
            type = "MiniGameOpenGateNode",
            name = "\229\174\140\230\136\144\229\176\143\230\184\184\230\136\143",
            pos = {x = 1128, y = -20},
            propsData = {
              StaticCreatorId = 1191512,
              bGuideUIEnable = true,
              GuideType = "M",
              GuidePointName = "Mechanism_Minigame_SSS_1191512"
            }
          },
          ["17506629570585666"] = {
            key = "17506629570585666",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1172, y = 324},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1191512,
              StateId = 604,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Minigame_SSS_1191512"
            }
          }
        },
        commentData = {}
      }
    },
    ["175127159377512421401"] = {
      isStoryNode = true,
      key = "175127159377512421401",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 1029.2100469756606, y = 154.04094116663217},
      propsData = {
        QuestId = 20023000,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Fane_SSS_1191504"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175127159377512421408",
            startPort = "Out",
            endQuest = "175127159377512421409",
            endPort = "Input"
          },
          {
            startQuest = "175127159377512421405",
            startPort = "QuestStart",
            endQuest = "175127159377512421411",
            endPort = "In"
          },
          {
            startQuest = "175127159377512421411",
            startPort = "true",
            endQuest = "175127159377512421408",
            endPort = "In"
          },
          {
            startQuest = "175127159377512421409",
            startPort = "CancelOut",
            endQuest = "175127159377512421413",
            endPort = "In"
          },
          {
            startQuest = "175127159377512421413",
            startPort = "Out",
            endQuest = "175127159377512421407",
            endPort = "Fail"
          },
          {
            startQuest = "175127159377512421412",
            startPort = "Out",
            endQuest = "175127159377512421409",
            endPort = "Input"
          },
          {
            startQuest = "175127159377512421411",
            startPort = "false",
            endQuest = "175127159377512421412",
            endPort = "In"
          },
          {
            startQuest = "175127159377512421409",
            startPort = "ApproveOut",
            endQuest = "175127159377512421406",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175127159377512421405"] = {
            key = "175127159377512421405",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 944, y = 348},
            propsData = {ModeType = 0}
          },
          ["175127159377512421406"] = {
            key = "175127159377512421406",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2670.790692011172, y = 306.04651199926747},
            propsData = {ModeType = 0}
          },
          ["175127159377512421407"] = {
            key = "175127159377512421407",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2602.5714260542472, y = 545.9999998183478},
            propsData = {}
          },
          ["175127159377512421408"] = {
            key = "175127159377512421408",
            type = "TalkNode",
            name = "\230\139\146\231\187\157\229\144\142\229\134\141\232\167\129\232\180\185\230\129\169",
            pos = {x = 1654.5692848611914, y = 183.3046352876293},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700306,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Fane_SSS_1191504",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009407,
              FlowAssetPath = "",
              TalkType = "Impression",
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
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175127159377512421409"] = {
            key = "175127159377512421409",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 2098.943633331868, y = 349.79242247609443},
            propsData = {
              SideQuestChainId = 200230,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["175127159377512421411"] = {
            key = "175127159377512421411",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "1\228\184\186\230\139\146\231\187\157\228\187\187\229\138\161\239\188\1400\228\184\186\230\142\165\229\143\151\228\187\187\229\138\161",
            pos = {x = 1244, y = 330},
            propsData = {
              FunctionName = "Equal",
              VarName = "FaneSide",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["175127159377512421412"] = {
            key = "175127159377512421412",
            type = "TalkNode",
            name = "\229\136\157\232\167\129\232\180\185\230\129\169",
            pos = {x = 1683.375575117646, y = 494.0226854331334},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700306,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Fane_SSS_1191504",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009401,
              FlowAssetPath = "",
              TalkType = "Impression",
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
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175127159377512421413"] = {
            key = "175127159377512421413",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2358.285705670207, y = 505.7142774361332},
            propsData = {VarName = "FaneSide", VarValue = 1}
          },
          ["175127159377512421414"] = {
            key = "175127159377512421414",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1515.384874092068, y = 666.3898350479058},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191503,
              GuideType = "N",
              GuidePointName = "Npc_Fane_SSS_1191504"
            }
          },
          ["175127159377512421415"] = {
            key = "175127159377512421415",
            type = "TalkNode",
            name = "\229\136\157\232\167\129\232\180\185\230\129\169",
            pos = {x = 2187.126488183953, y = 843.1989888171636},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009401,
              FlowAssetPath = "",
              TalkType = "Impression",
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
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
