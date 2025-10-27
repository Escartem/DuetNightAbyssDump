return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979414216887",
      startPort = "StoryStart",
      endStory = "1704175979414216889",
      endPort = "In"
    },
    {
      startStory = "1704175979414216889",
      startPort = "Success",
      endStory = "169700876905268795",
      endPort = "In"
    },
    {
      startStory = "169700876905268795",
      startPort = "Success",
      endStory = "1704175979414216888",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["169700876905268795"] = {
      isStoryNode = true,
      key = "169700876905268795",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\228\187\187\229\138\161\229\144\175\229\138\168",
      pos = {x = 546.0948533563623, y = 291.6803156461263},
      propsData = {
        QuestId = 99010402,
        QuestDescriptionComment = "\232\153\154\231\169\186\226\128\166\226\128\166",
        QuestDescription = "Description_100101_0",
        QuestDeatil = "Description_100101_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979414216894",
            startPort = "QuestStart",
            endQuest = "1704175979414216898",
            endPort = "In"
          },
          {
            startQuest = "1704175979414216898",
            startPort = "Out",
            endQuest = "1704175979414216897",
            endPort = "In"
          },
          {
            startQuest = "1704175979414216898",
            startPort = "Out",
            endQuest = "1704175979414216899",
            endPort = "In"
          },
          {
            startQuest = "1704175979414216899",
            startPort = "Out",
            endQuest = "1704175979414216895",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979414216894"] = {
            key = "1704175979414216894",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 192.72727272727275, y = 149.54545454545453},
            propsData = {ModeType = 0}
          },
          ["1704175979414216895"] = {
            key = "1704175979414216895",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1242.235825901359, y = 167.57985974925455},
            propsData = {ModeType = 0}
          },
          ["1704175979414216896"] = {
            key = "1704175979414216896",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175979414216897"] = {
            key = "1704175979414216897",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 789.7368421052632, y = -46.746411483253645},
            propsData = {
              ShowEnable = true,
              MessageId = 990002,
              MessageNote = "",
              LastTime = 5,
              Style = "Normal"
            }
          },
          ["1704175979414216898"] = {
            key = "1704175979414216898",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 530.1606205411229, y = 147.7114012653126},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1000021,
              GuideType = "N",
              GuidePointName = "TestQuest_21"
            }
          },
          ["1704175979414216899"] = {
            key = "1704175979414216899",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 872.7921994884913, y = 157.18508547583895},
            propsData = {WaitTime = 0.5}
          }
        },
        commentData = {}
      }
    },
    ["1704175979414216887"] = {
      isStoryNode = true,
      key = "1704175979414216887",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -72.63815140569092, y = 227.27272727272728},
      propsData = {QuestChainId = 990104},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979414216888"] = {
      isStoryNode = true,
      key = "1704175979414216888",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 847.3942042163912, y = 323.4469054577786},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979414216889"] = {
      isStoryNode = true,
      key = "1704175979414216889",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\228\187\187\229\138\161\229\144\175\229\138\168",
      pos = {x = 255.6737967914437, y = 294.0159020546021},
      propsData = {
        QuestId = 99010401,
        QuestDescriptionComment = "\232\153\154\231\169\186\226\128\166\226\128\166",
        QuestDescription = "Description_100101_0",
        QuestDeatil = "Description_100101_0",
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
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17419492621451313204",
            startPort = "Out",
            endQuest = "17419492621451313206",
            endPort = "In"
          },
          {
            startQuest = "17419492621451313205",
            startPort = "Out",
            endQuest = "17419492621451313207",
            endPort = "In"
          },
          {
            startQuest = "17419492621451313208",
            startPort = "Out",
            endQuest = "17419492621461313209",
            endPort = "In"
          },
          {
            startQuest = "17419492621451313203",
            startPort = "Out",
            endQuest = "17419492621461313211",
            endPort = "In"
          },
          {
            startQuest = "17419492621461313211",
            startPort = "Out",
            endQuest = "17419492621451313202",
            endPort = "In"
          },
          {
            startQuest = "17419492621461313212",
            startPort = "Out",
            endQuest = "17419492621461313213",
            endPort = "In"
          },
          {
            startQuest = "17419492621461313211",
            startPort = "Out",
            endQuest = "17419492621471313214",
            endPort = "Input"
          },
          {
            startQuest = "17419492621471313214",
            startPort = "PC",
            endQuest = "17419492621451313208",
            endPort = "In"
          },
          {
            startQuest = "17419492621471313214",
            startPort = "Mobile",
            endQuest = "17419492621461313212",
            endPort = "In"
          },
          {
            startQuest = "17419492621471313216",
            startPort = "Out",
            endQuest = "17419492621471313217",
            endPort = "In"
          },
          {
            startQuest = "17419492621471313217",
            startPort = "Out",
            endQuest = "17419492621471313215",
            endPort = "In"
          },
          {
            startQuest = "17419492621471313215",
            startPort = "Out",
            endQuest = "17419492621451313203",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313218",
            startPort = "Out",
            endQuest = "17419492621471313216",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313219",
            startPort = "Out",
            endQuest = "17419492621481313221",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313222",
            startPort = "Out",
            endQuest = "17419492621451313205",
            endPort = "In"
          },
          {
            startQuest = "17419492621451313203",
            startPort = "Out",
            endQuest = "17419492621481313219",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313219",
            startPort = "Out",
            endQuest = "17419492621481313223",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313224",
            startPort = "Out",
            endQuest = "17419492621481313222",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313219",
            startPort = "Out",
            endQuest = "17419492621461313210",
            endPort = "In"
          },
          {
            startQuest = "17419492621481313221",
            startPort = "Out",
            endQuest = "17419492621481313224",
            endPort = "Input_3"
          },
          {
            startQuest = "17419492621481313223",
            startPort = "Out",
            endQuest = "17419492621481313224",
            endPort = "Input_2"
          },
          {
            startQuest = "17419492621461313210",
            startPort = "Out",
            endQuest = "17419492621481313224",
            endPort = "Input_1"
          },
          {
            startQuest = "17419492621481313222",
            startPort = "Out",
            endQuest = "17419492621451313204",
            endPort = "In"
          },
          {
            startQuest = "1704175979414216890",
            startPort = "QuestStart",
            endQuest = "17419492621481313218",
            endPort = "In"
          },
          {
            startQuest = "17419492621451313206",
            startPort = "Out",
            endQuest = "1704175979414216891",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979414216890"] = {
            key = "1704175979414216890",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1447.2727272727273, y = -340.4545454545455},
            propsData = {ModeType = 0}
          },
          ["1704175979414216891"] = {
            key = "1704175979414216891",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1288.0252995855694, y = 36.52722817030717},
            propsData = {ModeType = 0}
          },
          ["1704175979414216892"] = {
            key = "1704175979414216892",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17419492621451313202"] = {
            key = "17419492621451313202",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100110-\228\184\138\229\177\177",
            pos = {x = 211.13176804344522, y = 532.3233502703415},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17419492621451313203"] = {
            key = "17419492621451313203",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -694.1090776496796, y = -65.44880363470662},
            propsData = {WaitTime = 1}
          },
          ["17419492621451313204"] = {
            key = "17419492621451313204",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 615.2113044091332, y = 16.22976821448043},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010303,
              GuideType = "M",
              GuidePointName = "QuestTrigger0303"
            }
          },
          ["17419492621451313205"] = {
            key = "17419492621451313205",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 612.6721784296624, y = 264.327710738493},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1110010305,
              GuideType = "M",
              GuidePointName = "QuestTrigger0305"
            }
          },
          ["17419492621451313206"] = {
            key = "17419492621451313206",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 932.5460405864649, y = 32.69396757990643},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010305}
            }
          },
          ["17419492621451313207"] = {
            key = "17419492621451313207",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 925.2905195374656, y = 276.00256275710774},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010303}
            }
          },
          ["17419492621451313208"] = {
            key = "17419492621451313208",
            type = "ShowGuideToastNode",
            name = "\232\191\156\231\168\139\229\176\132\229\135\187",
            pos = {x = 201.37291440843597, y = 758.4517094037095},
            propsData = {
              ShowEnable = true,
              MessageId = 200007,
              MessageNote = "\232\191\156\231\168\139\229\176\132\229\135\187",
              LastTime = 7,
              Style = "Normal"
            }
          },
          ["17419492621461313209"] = {
            key = "17419492621461313209",
            type = "ShowGuideToastNode",
            name = "\228\184\138\229\173\144\229\188\185",
            pos = {x = 491.8764109119323, y = 754.067094019094},
            propsData = {
              ShowEnable = true,
              MessageId = 200020,
              MessageNote = "\228\184\138\229\173\144\229\188\185",
              LastTime = 7,
              Style = "Normal"
            }
          },
          ["17419492621461313210"] = {
            key = "17419492621461313210",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 88.53751813396042, y = -472.7784679090348},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010304,
              GuideType = "M",
              GuidePointName = "QuestTrigger0304"
            }
          },
          ["17419492621461313211"] = {
            key = "17419492621461313211",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -477.818143592062, y = 584.9573549218003},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17419492621461313212"] = {
            key = "17419492621461313212",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 202.11576692990053, y = 942.5581881887551},
            propsData = {
              MessageId = 200007,
              SkillNameList = {"Fire"},
              LastTime = 7,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.AtkRanged",
              UICompName = "Bg",
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
          ["17419492621461313213"] = {
            key = "17419492621461313213",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 498.16937998351347, y = 948.7784679090348},
            propsData = {
              MessageId = 200020,
              SkillNameList = {
                "ChargeBullet"
              },
              LastTime = 7,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.Bullet",
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
          ["17419492621471313214"] = {
            key = "17419492621471313214",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = -67.9495011353676, y = 773.341404971972},
            propsData = {}
          },
          ["17419492621471313215"] = {
            key = "17419492621471313215",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1004.5460405864649, y = -117.82306793159967},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ShangshanStart",
              UnitId = -1
            }
          },
          ["17419492621471313216"] = {
            key = "17419492621471313216",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = -745.1690449666658, y = -357.8577771907329},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990130,
                990131,
                990132,
                990133,
                990134,
                990135,
                990136,
                990137
              }
            }
          },
          ["17419492621471313217"] = {
            key = "17419492621471313217",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = -463.68106094681923, y = -355.5939654020576},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990141,
                990143,
                990144
              }
            }
          },
          ["17419492621481313218"] = {
            key = "17419492621481313218",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -985.2049374827552, y = -370.7003092379334},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "QuestTrigger0304"
            }
          },
          ["17419492621481313219"] = {
            key = "17419492621481313219",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -219.82693007676718, y = -212.3053006951099},
            propsData = {
              NewDescription = "Description_100102_11",
              NewDetail = "Description_100102_11",
              SubTaskTargetIndex = 0
            }
          },
          ["17419492621481313220"] = {
            key = "17419492621481313220",
            type = "ToggleShowNewMonsterPanelNode",
            name = "\229\136\135\230\141\162\230\150\176\230\128\170\231\137\169\233\157\162\230\157\191\230\152\190\231\164\186",
            pos = {x = -504.49640499782686, y = 840.9831846109985},
            propsData = {Enable = true}
          },
          ["17419492621481313221"] = {
            key = "17419492621481313221",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 65.72445310963519, y = -142.8692034308582},
            propsData = {WaitTime = 20}
          },
          ["17419492621481313222"] = {
            key = "17419492621481313222",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 167.25073466168027, y = 119.20909838428634},
            propsData = {
              NewDescription = "Description_100102_1",
              NewDetail = "Description_100102_1",
              SubTaskTargetIndex = 0
            }
          },
          ["17419492621481313223"] = {
            key = "17419492621481313223",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 81.66996064606849, y = -302.120780328057},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17419492621481313224"] = {
            key = "17419492621481313224",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 454.2538595101533, y = -304.9514837577541},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
