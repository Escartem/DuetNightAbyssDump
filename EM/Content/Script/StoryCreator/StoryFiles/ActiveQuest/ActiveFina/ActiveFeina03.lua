return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17478992314544455113",
      startPort = "Success",
      endStory = "174989684948119879695",
      endPort = "In"
    },
    {
      startStory = "174989684948119879695",
      startPort = "Success",
      endStory = "174989854290319887292",
      endPort = "In"
    },
    {
      startStory = "174989854290319887292",
      startPort = "Success",
      endStory = "17478992314544455114",
      endPort = "In"
    },
    {
      startStory = "17478992314544455114",
      startPort = "Success",
      endStory = "174989913535119895521",
      endPort = "In"
    },
    {
      startStory = "17446347702251621736",
      startPort = "StoryStart",
      endStory = "175751560775011532562",
      endPort = "In"
    },
    {
      startStory = "175751560775011532562",
      startPort = "Success",
      endStory = "17478992314544455113",
      endPort = "In"
    },
    {
      startStory = "174989913535119895521",
      startPort = "\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172",
      endStory = "17574009019471868619",
      endPort = "In"
    },
    {
      startStory = "17594821002364058363",
      startPort = "Success",
      endStory = "17446347702251621739",
      endPort = "StoryEnd"
    },
    {
      startStory = "174989913535119895521",
      startPort = "\229\174\140\230\136\144\229\137\175\230\156\172",
      endStory = "17594821002364058363",
      endPort = "In"
    },
    {
      startStory = "17574009019471868619",
      startPort = "Success",
      endStory = "17594821002364058363",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17446347702251621736"] = {
      isStoryNode = true,
      key = "17446347702251621736",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 587.2544393437955, y = 99.91014554642183},
      propsData = {QuestChainId = 120113},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17446347702251621739"] = {
      isStoryNode = true,
      key = "17446347702251621739",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2861.606777595692, y = 525.830008927372},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17478992314544455113"] = {
      isStoryNode = true,
      key = "17478992314544455113",
      type = "StoryNode",
      name = "\228\187\142\229\186\138\228\184\138\233\134\146\230\157\165",
      pos = {x = 1251.2105682563404, y = 102.8043326642398},
      propsData = {
        QuestId = 12011301,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_0",
        QuestDeatil = "Content_120113_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
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
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome",
        QuestUIId = 120113
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17546423067098783639",
            startPort = "Fail",
            endQuest = "17478992314544455126",
            endPort = "Fail"
          },
          {
            startQuest = "17546423067098783639",
            startPort = "PassiveFail",
            endQuest = "17478992314544455126",
            endPort = "Fail"
          },
          {
            startQuest = "17554977830881945",
            startPort = "true",
            endQuest = "17554977830881944",
            endPort = "In"
          },
          {
            startQuest = "17478992314544455124",
            startPort = "QuestStart",
            endQuest = "17554977830881945",
            endPort = "In"
          },
          {
            startQuest = "17554977830881945",
            startPort = "true",
            endQuest = "17546423067098783639",
            endPort = "In"
          },
          {
            startQuest = "17546423067098783639",
            startPort = "Success",
            endQuest = "17546423170928783817",
            endPort = "In"
          },
          {
            startQuest = "17546423170928783817",
            startPort = "Out",
            endQuest = "17478992314544455125",
            endPort = "Success"
          },
          {
            startQuest = "175751579289313389150",
            startPort = "Out",
            endQuest = "175751579289313389149",
            endPort = "In"
          },
          {
            startQuest = "175751579289313389149",
            startPort = "Out",
            endQuest = "175751579289313389151",
            endPort = "In"
          },
          {
            startQuest = "17554977830881945",
            startPort = "false",
            endQuest = "175751579289313389150",
            endPort = "In"
          },
          {
            startQuest = "175751579289313389149",
            startPort = "Out",
            endQuest = "17546423067098783639",
            endPort = "In"
          }
        },
        nodeData = {
          ["17478992314544455124"] = {
            key = "17478992314544455124",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 642.1176470588235, y = 578.3529411764706},
            propsData = {ModeType = 0}
          },
          ["17478992314544455125"] = {
            key = "17478992314544455125",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2419.9508267776523, y = 550.7543597512423},
            propsData = {ModeType = 0}
          },
          ["17478992314544455126"] = {
            key = "17478992314544455126",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2046.5853899668368, y = 810.4857758246911},
            propsData = {}
          },
          ["17546423067098783639"] = {
            key = "17546423067098783639",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1616.0317262121, y = 560.7319257830227},
            propsData = {SpecialConfigId = 2064, BlackScreenImmediately = false}
          },
          ["17546423170928783817"] = {
            key = "17546423170928783817",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2052.6813590792176, y = 548.4941035275066},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 4,
              IsWhite = false
            }
          },
          ["17554977830881944"] = {
            key = "17554977830881944",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1250.9908946722219, y = 401.061668207953},
            propsData = {
              VarName = "FeinaDay03Home",
              VarValue = 1
            }
          },
          ["17554977830881945"] = {
            key = "17554977830881945",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 966.9172671476658, y = 567.6096558240521},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay03Home",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175751579289313389149"] = {
            key = "175751579289313389149",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1332.1749059763765, y = 850.9333974848676},
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
          ["175751579289313389150"] = {
            key = "175751579289313389150",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1240.1749059763765, y = 698.4333974848676},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["175751579289313389151"] = {
            key = "175751579289313389151",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1468.1749059763765, y = 1023.4333974848677},
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
    ["17478992314544455114"] = {
      isStoryNode = true,
      key = "17478992314544455114",
      type = "StoryNode",
      name = "\229\136\176\229\174\182",
      pos = {x = 1692.6977581005908, y = 492.1421353669674},
      propsData = {
        QuestId = 12011305,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_5",
        QuestDeatil = "Content_120113_5",
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
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17548802570405835",
            startPort = "Fail",
            endQuest = "17478992314544455138",
            endPort = "Fail"
          },
          {
            startQuest = "17548802570405835",
            startPort = "PassiveFail",
            endQuest = "17478992314544455138",
            endPort = "Fail"
          },
          {
            startQuest = "17555009492176411948",
            startPort = "true",
            endQuest = "17555009492176411947",
            endPort = "In"
          },
          {
            startQuest = "17478992314544455136",
            startPort = "QuestStart",
            endQuest = "17555009492176411948",
            endPort = "In"
          },
          {
            startQuest = "17555009492176411948",
            startPort = "true",
            endQuest = "17548802570405835",
            endPort = "In"
          },
          {
            startQuest = "175751597439016170494",
            startPort = "Out",
            endQuest = "175751597439016170493",
            endPort = "In"
          },
          {
            startQuest = "175751597439016170493",
            startPort = "Out",
            endQuest = "175751597439016170495",
            endPort = "In"
          },
          {
            startQuest = "17555009492176411948",
            startPort = "false",
            endQuest = "175751597439016170494",
            endPort = "In"
          },
          {
            startQuest = "175751597439016170493",
            startPort = "Out",
            endQuest = "17548802570405835",
            endPort = "In"
          },
          {
            startQuest = "17548802570405835",
            startPort = "Success",
            endQuest = "17478992314544455137",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17478992314544455136"] = {
            key = "17478992314544455136",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 474, y = 382},
            propsData = {ModeType = 0}
          },
          ["17478992314544455137"] = {
            key = "17478992314544455137",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2306, y = 324},
            propsData = {ModeType = 0}
          },
          ["17478992314544455138"] = {
            key = "17478992314544455138",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2322, y = 522},
            propsData = {}
          },
          ["17548802570405835"] = {
            key = "17548802570405835",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1376, y = 342},
            propsData = {SpecialConfigId = 2067, BlackScreenImmediately = true}
          },
          ["17555009492176411947"] = {
            key = "17555009492176411947",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1115.9320711428102, y = 155.59107997265886},
            propsData = {
              VarName = "FeinaDay03HomeBook",
              VarValue = 1
            }
          },
          ["17555009492176411948"] = {
            key = "17555009492176411948",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 777.1525612653129, y = 351.43318523581684},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay03HomeBook",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175751597439016170493"] = {
            key = "175751597439016170493",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1104, y = 645.9999999999999},
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
          ["175751597439016170494"] = {
            key = "175751597439016170494",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1012, y = 493.4999999999999},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["175751597439016170495"] = {
            key = "175751597439016170495",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1240, y = 818.5},
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
    ["174989684948119879695"] = {
      isStoryNode = true,
      key = "174989684948119879695",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\185\191\229\156\186",
      pos = {x = 969.7663299430559, y = 504.04252009333675},
      propsData = {
        QuestId = 12011302,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_2",
        QuestDeatil = "Content_120113_2",
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
            startQuest = "175464541326710576765",
            startPort = "Fail",
            endQuest = "174989684948119879702",
            endPort = "Fail"
          },
          {
            startQuest = "175464541326710576765",
            startPort = "PassiveFail",
            endQuest = "174989684948119879702",
            endPort = "Fail"
          },
          {
            startQuest = "1755497832930915163",
            startPort = "true",
            endQuest = "1755497832930915162",
            endPort = "In"
          },
          {
            startQuest = "174989684948119879696",
            startPort = "QuestStart",
            endQuest = "1755497832930915163",
            endPort = "In"
          },
          {
            startQuest = "1755497832930915163",
            startPort = "true",
            endQuest = "175464541326710576765",
            endPort = "In"
          },
          {
            startQuest = "17555004132505494294",
            startPort = "Out",
            endQuest = "17555004132505494295",
            endPort = "In"
          },
          {
            startQuest = "17555004132505494295",
            startPort = "Out",
            endQuest = "17555004132505494296",
            endPort = "In"
          },
          {
            startQuest = "175464541326710576765",
            startPort = "Success",
            endQuest = "17555004132505494294",
            endPort = "In"
          },
          {
            startQuest = "17555004132505494296",
            startPort = "Out",
            endQuest = "174989684948119879699",
            endPort = "Success"
          },
          {
            startQuest = "175751585673814316870",
            startPort = "Out",
            endQuest = "175751585673814316869",
            endPort = "In"
          },
          {
            startQuest = "175751585673814316869",
            startPort = "Out",
            endQuest = "175751585673814316871",
            endPort = "In"
          },
          {
            startQuest = "1755497832930915163",
            startPort = "false",
            endQuest = "175751585673814316870",
            endPort = "In"
          },
          {
            startQuest = "175751585673814316869",
            startPort = "Out",
            endQuest = "175464541326710576765",
            endPort = "In"
          }
        },
        nodeData = {
          ["174989684948119879696"] = {
            key = "174989684948119879696",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 540, y = 310},
            propsData = {ModeType = 0}
          },
          ["174989684948119879699"] = {
            key = "174989684948119879699",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2775.2669027228812, y = 276.2254172156346},
            propsData = {ModeType = 0}
          },
          ["174989684948119879702"] = {
            key = "174989684948119879702",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1993.9362818590705, y = 542.2432533733133},
            propsData = {}
          },
          ["174989708393019882039"] = {
            key = "174989708393019882039",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2027.2107279693487, y = -155.70114942528733},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191598,
              GuideType = "M",
              GuidePointName = "Mechanism_TriggerBox_Feina03_1191598"
            }
          },
          ["175464541326710576765"] = {
            key = "175464541326710576765",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1436.313107933805, y = 297.42162689135785},
            propsData = {SpecialConfigId = 2065, BlackScreenImmediately = true}
          },
          ["1755497832930915162"] = {
            key = "1755497832930915162",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1176.3897549387486, y = -68.40892002734114},
            propsData = {
              VarName = "FeinaDay03Walk",
              VarValue = 1
            }
          },
          ["1755497832930915163"] = {
            key = "1755497832930915163",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 891.6102450612514, y = 301.43318523581684},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay03Walk",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17555004132505494294"] = {
            key = "17555004132505494294",
            type = "TalkNode",
            name = "\227\128\144fx19\227\128\145\229\141\161\231\143\138\229\190\183\230\139\137",
            pos = {x = 1803.584467344292, y = 282.9888159628275},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 120320101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple19",
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
                  TalkActorId = 211012,
                  TalkActorVisible = true
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
                {TalkActorType = "Npc", TalkActorId = 211012},
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
          ["17555004132505494295"] = {
            key = "17555004132505494295",
            type = "TalkNode",
            name = "\227\128\144fx20\227\128\145\229\141\161\231\143\138\229\190\183\230\139\137",
            pos = {x = 2106.5217661117763, y = 282.6607931495482},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12032020,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple20",
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
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
                {TalkActorType = "Npc", TalkActorId = 211012},
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
          ["17555004132505494296"] = {
            key = "17555004132505494296",
            type = "TalkNode",
            name = "\227\128\144fx21\227\128\145\229\146\140\229\165\179\228\184\187\229\175\185\232\175\157",
            pos = {x = 2420.415532655708, y = 279.3392068504518},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12032201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple21",
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
          ["175751585673814316869"] = {
            key = "175751585673814316869",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1218.6401098901101, y = 580.8873626373625},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook01",
              IsUseCount = false
            }
          },
          ["175751585673814316870"] = {
            key = "175751585673814316870",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1136.4478021978025, y = 430.8104395604394},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191939, 1191940}
            }
          },
          ["175751585673814316871"] = {
            key = "175751585673814316871",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1300.2664835164837, y = 743.1895604395604},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191939, 1191940}
            }
          }
        },
        commentData = {}
      }
    },
    ["174989854290319887292"] = {
      isStoryNode = true,
      key = "174989854290319887292",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\229\141\161\231\143\138\229\190\183\230\139\137",
      pos = {x = 1254.5708838478834, y = 500.1572722326375},
      propsData = {
        QuestId = 12011303,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_3",
        QuestDeatil = "Content_120113_3",
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
        StoryGuidePointName = "Mechanism_SQTrigger_Feina03_1191881"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175465027532214151370",
            startPort = "Fail",
            endQuest = "174989854290319887299",
            endPort = "Fail"
          },
          {
            startQuest = "175465027532214151370",
            startPort = "PassiveFail",
            endQuest = "174989854290319887299",
            endPort = "Fail"
          },
          {
            startQuest = "17555004449185495097",
            startPort = "true",
            endQuest = "17555004449185495096",
            endPort = "In"
          },
          {
            startQuest = "174989854290319887293",
            startPort = "QuestStart",
            endQuest = "17555004449185495097",
            endPort = "In"
          },
          {
            startQuest = "17555004449185495097",
            startPort = "true",
            endQuest = "175465027532214151370",
            endPort = "In"
          },
          {
            startQuest = "175465027532214151370",
            startPort = "Success",
            endQuest = "175465127188215046191",
            endPort = "In"
          },
          {
            startQuest = "175465127188215046191",
            startPort = "Out",
            endQuest = "174989854290319887296",
            endPort = "Success"
          },
          {
            startQuest = "175751590760115243615",
            startPort = "Out",
            endQuest = "175751590760115243614",
            endPort = "In"
          },
          {
            startQuest = "17555004449185495097",
            startPort = "false",
            endQuest = "175751590760115243615",
            endPort = "In"
          },
          {
            startQuest = "175751590760115243614",
            startPort = "Out",
            endQuest = "175465027532214151370",
            endPort = "In"
          },
          {
            startQuest = "175751590760115243614",
            startPort = "Out",
            endQuest = "175751593264015244212",
            endPort = "In"
          }
        },
        nodeData = {
          ["174989854290319887293"] = {
            key = "174989854290319887293",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -283.65516943521465, y = 264.0275862522556},
            propsData = {ModeType = 0}
          },
          ["174989854290319887296"] = {
            key = "174989854290319887296",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1279.6635514828856, y = 236.2145012540629},
            propsData = {ModeType = 0}
          },
          ["174989854290319887299"] = {
            key = "174989854290319887299",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 982.4630021911089, y = 494.76243823648724},
            propsData = {}
          },
          ["175465027532214151370"] = {
            key = "175465027532214151370",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 590.3753809532508, y = 245.67849649411227},
            propsData = {SpecialConfigId = 2066, BlackScreenImmediately = true}
          },
          ["175465127188215046191"] = {
            key = "175465127188215046191",
            type = "SkipRegionNode",
            name = "\228\188\160\233\128\129\229\136\176\229\165\165\229\147\165\229\174\182",
            pos = {x = 962.4458479785173, y = 234.19290559294595},
            propsData = {
              ModeType = 1,
              Id = 101105,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17555004449185495096"] = {
            key = "17555004449185495096",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 258.38975493874864, y = 57.59107997265886},
            propsData = {
              VarName = "FeinaDay03Catch",
              VarValue = 1
            }
          },
          ["17555004449185495097"] = {
            key = "17555004449185495097",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 1.6102450612513621, y = 251.43318523581684},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay03Catch",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175751590760115243614"] = {
            key = "175751590760115243614",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 322.282967032967, y = 553.8873626373626},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook04",
              IsUseCount = false
            }
          },
          ["175751590760115243615"] = {
            key = "175751590760115243615",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 240.09065934065939, y = 403.8104395604396},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191945, 1191946}
            }
          },
          ["175751593264015244212"] = {
            key = "175751593264015244212",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 374, y = 746},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191945, 1191946}
            }
          }
        },
        commentData = {}
      }
    },
    ["174989913535119895521"] = {
      isStoryNode = true,
      key = "174989913535119895521",
      type = "StoryNode",
      name = "\231\173\137\229\190\133\229\174\140\230\136\144",
      pos = {x = 1967.7720170486557, y = 473.4375104421699},
      propsData = {
        QuestId = 12011306,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_5",
        QuestDeatil = "Content_120113_5",
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
            startQuest = "17594819251404055208",
            startPort = "Success",
            endQuest = "17594819251404055209",
            endPort = "In"
          },
          {
            startQuest = "17594819251404055208",
            startPort = "Fail",
            endQuest = "17594819251404055210",
            endPort = "In"
          },
          {
            startQuest = "17594819251404055207",
            startPort = "Out",
            endQuest = "17594819251404055210",
            endPort = "In"
          },
          {
            startQuest = "174989913535119895522",
            startPort = "QuestStart",
            endQuest = "17574008761791867643",
            endPort = "In"
          },
          {
            startQuest = "17574008761791867643",
            startPort = "true",
            endQuest = "175755674480122295030",
            endPort = "In"
          },
          {
            startQuest = "175755674480122295030",
            startPort = "Out",
            endQuest = "17574008761791867642",
            endPort = "In"
          },
          {
            startQuest = "17574008761791867642",
            startPort = "Out",
            endQuest = "17594819251404055207",
            endPort = "In"
          },
          {
            startQuest = "17574008761791867643",
            startPort = "false",
            endQuest = "17594819251404055208",
            endPort = "In"
          }
        },
        nodeData = {
          ["174989913535119895522"] = {
            key = "174989913535119895522",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 680, y = 386},
            propsData = {ModeType = 0}
          },
          ["174989913535119895525"] = {
            key = "174989913535119895525",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2472, y = 402},
            propsData = {ModeType = 0}
          },
          ["174989913535119895528"] = {
            key = "174989913535119895528",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2478, y = 560},
            propsData = {}
          },
          ["17574008761791867642"] = {
            key = "17574008761791867642",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1551.6977903028599, y = 158.25},
            propsData = {
              VarName = "FeinaDay03UI",
              VarValue = 1
            }
          },
          ["17574008761791867643"] = {
            key = "17574008761791867643",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 969.1340698990468, y = 369.75},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay03UI",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175755674480122295030"] = {
            key = "175755674480122295030",
            type = "TalkNode",
            name = "\230\137\147\229\188\128\228\185\166\230\156\172",
            pos = {x = 1278.057142857143, y = 370.5},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/ActivityFeina/Feina03_Seq/Feina03_Book",
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
          ["17594819251404055207"] = {
            key = "17594819251404055207",
            type = "OpenSytstemUINode",
            name = "\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185",
            pos = {x = 1567.766666666666, y = 372.05476190476185},
            propsData = {
              UIName = "ActivityFeinaEventLevelSelect"
            }
          },
          ["17594819251404055208"] = {
            key = "17594819251404055208",
            type = "ConditionNode",
            name = "\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1567.166666666666, y = 591.945238095238},
            propsData = {ConditionId = 12011306}
          },
          ["17594819251404055209"] = {
            key = "17594819251404055209",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2144.8333333333335, y = 467.945238095238},
            propsData = {
              PortName = "\229\174\140\230\136\144\229\137\175\230\156\172"
            }
          },
          ["17594819251404055210"] = {
            key = "17594819251404055210",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2143.1666666666665, y = 627.9452380952381},
            propsData = {
              PortName = "\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"
            }
          }
        },
        commentData = {}
      }
    },
    ["17574009019471868619"] = {
      isStoryNode = true,
      key = "17574009019471868619",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 2256.0353407099783, y = 641.1807970282359},
      propsData = {
        QuestId = 12011307,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_5",
        QuestDeatil = "Content_120113_5",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 70153,
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
    ["175751560775011532562"] = {
      isStoryNode = true,
      key = "175751560775011532562",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 983.2169184370663, y = 103.15490551937647},
      propsData = {
        QuestId = 12011350,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_0",
        QuestDeatil = "Content_120113_0",
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
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175751571806711534439",
            startPort = "Out",
            endQuest = "175751571806711534438",
            endPort = "In"
          },
          {
            startQuest = "175751571806711534438",
            startPort = "Out",
            endQuest = "175751571806711534440",
            endPort = "In"
          },
          {
            startQuest = "175751560775011532563",
            startPort = "QuestStart",
            endQuest = "175751571806711534439",
            endPort = "In"
          },
          {
            startQuest = "175751571806711534440",
            startPort = "Out",
            endQuest = "175751560775011532566",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175751560775011532563"] = {
            key = "175751560775011532563",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 966, y = 298},
            propsData = {ModeType = 0}
          },
          ["175751560775011532566"] = {
            key = "175751560775011532566",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1828, y = 288},
            propsData = {ModeType = 0}
          },
          ["175751560775011532569"] = {
            key = "175751560775011532569",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2002, y = 576},
            propsData = {}
          },
          ["175751571806711534438"] = {
            key = "175751571806711534438",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1380, y = 298},
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
          ["175751571806711534439"] = {
            key = "175751571806711534439",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1288, y = 145.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["175751571806711534440"] = {
            key = "175751571806711534440",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1516, y = 470.5},
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
    ["17594821002364058363"] = {
      isStoryNode = true,
      key = "17594821002364058363",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2589.3698333400343, y = 513.1957148888262},
      propsData = {
        QuestId = 12011308,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_5",
        QuestDeatil = "Content_120113_5",
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
            startQuest = "17594821002364058364",
            startPort = "QuestStart",
            endQuest = "17594821385884059264",
            endPort = "In"
          },
          {
            startQuest = "17594821385884059264",
            startPort = "Out",
            endQuest = "17594821002374058367",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17594821002364058364"] = {
            key = "17594821002364058364",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17594821002374058367"] = {
            key = "17594821002374058367",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1586, y = 296},
            propsData = {ModeType = 0}
          },
          ["17594821002374058370"] = {
            key = "17594821002374058370",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17594821385884059264"] = {
            key = "17594821385884059264",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1212, y = 296},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {
    ["17594818603444053679"] = {
      key = "17594818603444053679",
      name = "Phase01_Bonfire_Start",
      position = {x = 923.3161764705884, y = 4.598426212590338},
      size = {width = 585.7894736842104, height = 295.2631578947369}
    },
    ["17594835146484066522"] = {
      key = "17594835146484066522",
      name = "Phase02_SandBox_Try&Obstruction&Challenge",
      position = {x = 927.3554769776678, y = 372.0703138469493},
      size = {width = 590.5263157894738, height = 309.4736842105265}
    },
    ["17594835325524067113"] = {
      key = "17594835325524067113",
      name = "Phase03_Labyrinth_Challenge",
      position = {x = 1636.5396875039835, y = 377.9913664785285},
      size = {width = 1183.4176372919635, height = 405.7194312376874}
    }
  }
}
