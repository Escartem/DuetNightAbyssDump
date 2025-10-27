return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "16993438292947278",
      startPort = "StoryStart",
      endStory = "171932091861618370",
      endPort = "In"
    },
    {
      startStory = "171932091861618370",
      startPort = "Success",
      endStory = "16993438315527637",
      endPort = "In"
    },
    {
      startStory = "1723793345700530145",
      startPort = "Success",
      endStory = "1723793345699530142",
      endPort = "In"
    },
    {
      startStory = "1723793345699530142",
      startPort = "Success",
      endStory = "1723793345699530143",
      endPort = "In"
    },
    {
      startStory = "1723793345699530143",
      startPort = "Success",
      endStory = "1723793345701530148",
      endPort = "In"
    },
    {
      startStory = "1723793345701530148",
      startPort = "Success",
      endStory = "16993438292947281",
      endPort = "StoryEnd"
    },
    {
      startStory = "16993438315527637",
      startPort = "Success",
      endStory = "1723793345700530146",
      endPort = "In"
    },
    {
      startStory = "1723793345700530146",
      startPort = "Success",
      endStory = "1723793345700530145",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["16993438292947278"] = {
      isStoryNode = true,
      key = "16993438292947278",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 530.1526928843272, y = 213.4435474570407},
      propsData = {QuestChainId = 110101},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["16993438292947281"] = {
      isStoryNode = true,
      key = "16993438292947281",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1143.417321300616, y = 707.5537683140659},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["16993438315527637"] = {
      isStoryNode = true,
      key = "16993438315527637",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\178\153\230\181\183\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 1155.0894464268272, y = 222.03743933427364},
      propsData = {
        QuestId = 11010101,
        QuestDescriptionComment = "\229\137\141\228\184\187\232\167\146\229\156\168\232\153\154\231\169\186",
        QuestDescription = "Description_110101_2",
        QuestDeatil = "Content_110101_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 100104,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Ex01_Door_1600007"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1719384245165148194",
            startPort = "Fail",
            endQuest = "1719387775945294100",
            endPort = "In"
          },
          {
            startQuest = "1719387775945294100",
            startPort = "Out",
            endQuest = "1704175979250201944",
            endPort = "Fail"
          },
          {
            startQuest = "1704175979250201942",
            startPort = "QuestStart",
            endQuest = "1719384245165148194",
            endPort = "In"
          },
          {
            startQuest = "1719384245165148194",
            startPort = "Success",
            endQuest = "1704175979250201943",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979250201942"] = {
            key = "1704175979250201942",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1488.6502338644943, y = 396.04889166102424},
            propsData = {ModeType = 0}
          },
          ["1704175979250201943"] = {
            key = "1704175979250201943",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -491.7939503155272, y = 380.55618893056953},
            propsData = {
              ModeType = 1,
              Id = 102101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1704175979250201944"] = {
            key = "1704175979250201944",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -706.4956495278093, y = 612.5718720662345},
            propsData = {}
          },
          ["1719384245165148194"] = {
            key = "1719384245165148194",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\230\178\153\230\181\183\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -1135.406531086882, y = 397.71566873360854},
            propsData = {SpecialConfigId = 1010, BlackScreenImmediately = true}
          },
          ["1719387775945294100"] = {
            key = "1719387775945294100",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\230\141\174\231\130\185",
            pos = {x = -942.3508235008419, y = 600.6946698374989},
            propsData = {
              ModeType = 1,
              Id = 210101,
              StartIndex = 1,
              IsWhite = true
            }
          }
        },
        commentData = {}
      }
    },
    ["171932091861618370"] = {
      isStoryNode = true,
      key = "171932091861618370",
      type = "StoryNode",
      name = "\230\141\174\231\130\185\232\191\155\229\133\165\232\153\154\231\169\186",
      pos = {x = 817.9798997473084, y = 225.36812572976748},
      propsData = {
        QuestId = 11010103,
        QuestDescriptionComment = "\229\137\141\228\184\187\232\167\146\229\156\168\232\153\154\231\169\186",
        QuestDescription = "Description_110101_1",
        QuestDeatil = "Content_110101_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
        bIsStartChapter = true,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 210101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_EX01",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17193819169913435",
            startPort = "Out",
            endQuest = "17254319481271887680",
            endPort = "In"
          },
          {
            startQuest = "1722059825310451892",
            startPort = "False",
            endQuest = "171932091861618377",
            endPort = "Fail"
          },
          {
            startQuest = "1722059825310451892",
            startPort = "True",
            endQuest = "1719888506532421581",
            endPort = "In"
          },
          {
            startQuest = "1719888506532421581",
            startPort = "Out",
            endQuest = "171932091861618376",
            endPort = "Success"
          },
          {
            startQuest = "1756387793361956598",
            startPort = "Out",
            endQuest = "17193819169913435",
            endPort = "In"
          },
          {
            startQuest = "1756387793361956598",
            startPort = "Out",
            endQuest = "17568808122082466",
            endPort = "In"
          },
          {
            startQuest = "17568808122082466",
            startPort = "Out",
            endQuest = "17563882741861912857",
            endPort = "In"
          },
          {
            startQuest = "17568808122082466",
            startPort = "Out",
            endQuest = "17568808369243012",
            endPort = "In"
          },
          {
            startQuest = "17254319481271887680",
            startPort = "Out",
            endQuest = "1722059825310451892",
            endPort = "Input"
          },
          {
            startQuest = "171932091861618375",
            startPort = "QuestStart",
            endQuest = "17568833381422461",
            endPort = "In"
          },
          {
            startQuest = "17568833381422461",
            startPort = "true",
            endQuest = "17193819169913435",
            endPort = "In"
          },
          {
            startQuest = "17568833381422461",
            startPort = "false",
            endQuest = "1756387793361956598",
            endPort = "In"
          },
          {
            startQuest = "17563882741861912857",
            startPort = "Out",
            endQuest = "17568834479933719",
            endPort = "In"
          }
        },
        nodeData = {
          ["171932091861618375"] = {
            key = "171932091861618375",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -4041.0945315054423, y = 340.01418573212345},
            propsData = {ModeType = 0}
          },
          ["171932091861618376"] = {
            key = "171932091861618376",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -1077.0126756775253, y = 287.11008027075457},
            propsData = {
              ModeType = 1,
              Id = 100104,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["171932091861618377"] = {
            key = "171932091861618377",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -1357.7070390155143, y = 429.8659702539085},
            propsData = {}
          },
          ["17193819169913435"] = {
            key = "17193819169913435",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -3096.5073990019655, y = 165.2349232892713},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210081}
            }
          },
          ["1719888506532421581"] = {
            key = "1719888506532421581",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -1370.397793802941, y = 292.1451550767483},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210081}
            }
          },
          ["1722059825310451892"] = {
            key = "1722059825310451892",
            type = "ShowPopupUINode",
            name = "\230\152\190\231\164\186\229\188\185\231\170\151",
            pos = {x = -1784.4180099371945, y = 259.14186931506924},
            propsData = {PopupId = 100110}
          },
          ["17254319481271887680"] = {
            key = "17254319481271887680",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = -2710.481394362067, y = 191.53239838656052},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_EX01",
              IsUseCount = false
            }
          },
          ["1756387793361956598"] = {
            key = "1756387793361956598",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = -3435.6500399549604, y = 440.0174984562856},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {121001},
              StateId = 1500110,
              QuestId = 0
            }
          },
          ["17563882741861912857"] = {
            key = "17563882741861912857",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = -2717.4883888698705, y = 468.1383530766471},
            propsData = {
              StaticCreatorIdList = {},
              ManualItemIdList = {121001},
              StateId = 1500111,
              QuestId = 0
            }
          },
          ["17568808122082466"] = {
            key = "17568808122082466",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -3155.333333333333, y = 425.2916666666666},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1210124,
              GuideType = "M",
              GuidePointName = "Mechanism_Change_1210124"
            }
          },
          ["17568808369243012"] = {
            key = "17568808369243012",
            type = "CameraLookAtNode",
            name = "CameraLookAt",
            pos = {x = -2721.999999999999, y = 643.0694444444443},
            propsData = {
              TargetType = "Point",
              PointName = "QuestPoint_EX01",
              ActorId = 0,
              Duration = 2,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17568833381422461"] = {
            key = "17568833381422461",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = -3753.2489620118927, y = 341.93211088771454},
            propsData = {
              FunctionName = "Equal",
              VarName = "Entrance110101",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17568834479933719"] = {
            key = "17568834479933719",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = -2443.0540659427716, y = 478.7266907258301},
            propsData = {
              VarName = "Entrance110101",
              VarValue = 1
            }
          }
        },
        commentData = {
          ["1722496921579804536"] = {
            key = "1722496921579804536",
            name = "\232\167\166\229\143\145\230\143\144\231\164\186\229\188\185\231\170\151",
            position = {x = -1924.7491330508556, y = 166.8935873652705},
            size = {width = 782.7279411764716, height = 377.6617647058822}
          }
        }
      }
    },
    ["1723793345699530142"] = {
      isStoryNode = true,
      key = "1723793345699530142",
      type = "StoryNode",
      name = "\229\155\158\231\168\139\229\141\143\229\138\169\232\190\190\232\138\153\230\182\133",
      pos = {x = 1160.829737193104, y = 476.6037888271928},
      propsData = {
        QuestId = 11010107,
        QuestDescriptionComment = "\229\155\158\232\190\190\232\138\153\230\182\133\232\186\171\232\190\185",
        QuestDescription = "Description_110103_2",
        QuestDeatil = "Content_110103_2",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "pDafu11010301"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1723793345716530187",
            startPort = "Out",
            endQuest = "1723793345716530188",
            endPort = "In"
          },
          {
            startQuest = "1723793345715530183",
            startPort = "Out",
            endQuest = "1723793345722530204",
            endPort = "In"
          },
          {
            startQuest = "1723793345722530204",
            startPort = "Out",
            endQuest = "1723793345715530184",
            endPort = "Branch_2"
          },
          {
            startQuest = "1723793345715530183",
            startPort = "Out",
            endQuest = "1723793345722530205",
            endPort = "In"
          },
          {
            startQuest = "1723793345722530205",
            startPort = "Out",
            endQuest = "1723793345715530184",
            endPort = "Branch_1"
          },
          {
            startQuest = "172465591347415340002",
            startPort = "Out",
            endQuest = "172465593732415340422",
            endPort = "In"
          },
          {
            startQuest = "172465593732415340422",
            startPort = "Out",
            endQuest = "172562032298810423270",
            endPort = "In"
          },
          {
            startQuest = "1723793345716530187",
            startPort = "Out",
            endQuest = "1723793345720530198",
            endPort = "In"
          },
          {
            startQuest = "1723793345715530184",
            startPort = "Out",
            endQuest = "1723793345712530177",
            endPort = "Success"
          },
          {
            startQuest = "1723793345722530205",
            startPort = "Out",
            endQuest = "17339095003162109",
            endPort = "In"
          },
          {
            startQuest = "174183546513210923042",
            startPort = "Out",
            endQuest = "172465591347415340002",
            endPort = "In"
          },
          {
            startQuest = "172465593732415340422",
            startPort = "Out",
            endQuest = "174183666270310926880",
            endPort = "In"
          },
          {
            startQuest = "1723793345716530187",
            startPort = "Out",
            endQuest = "174183678893211704266",
            endPort = "In"
          },
          {
            startQuest = "174183678893211704266",
            startPort = "Out",
            endQuest = "174183681207611704810",
            endPort = "In"
          },
          {
            startQuest = "174183646216610925658",
            startPort = "Out",
            endQuest = "174183670688610927703",
            endPort = "In"
          },
          {
            startQuest = "174183666270310926880",
            startPort = "Out",
            endQuest = "174183646216610925658",
            endPort = "In"
          },
          {
            startQuest = "174183681207611704810",
            startPort = "Out",
            endQuest = "1723793345715530184",
            endPort = "Branch_3"
          },
          {
            startQuest = "1723793345712530176",
            startPort = "QuestStart",
            endQuest = "174723430773518043859",
            endPort = "In"
          },
          {
            startQuest = "1723793345712530176",
            startPort = "QuestStart",
            endQuest = "1723793345715530183",
            endPort = "In"
          },
          {
            startQuest = "174723430773518043859",
            startPort = "Out",
            endQuest = "17351954668063478",
            endPort = "In"
          },
          {
            startQuest = "1723793345715530183",
            startPort = "Out",
            endQuest = "17345114115111372323",
            endPort = "In"
          },
          {
            startQuest = "1723793345715530183",
            startPort = "Out",
            endQuest = "174183546513210923042",
            endPort = "In"
          },
          {
            startQuest = "1723793345715530183",
            startPort = "Out",
            endQuest = "1723793345716530187",
            endPort = "In"
          },
          {
            startQuest = "174183646216610925658",
            startPort = "Out",
            endQuest = "1753776767439671953",
            endPort = "In"
          },
          {
            startQuest = "174183670688610927703",
            startPort = "Out",
            endQuest = "17550872893331225807",
            endPort = "In"
          },
          {
            startQuest = "17550872893331225807",
            startPort = "Out",
            endQuest = "1723793345716530187",
            endPort = "In"
          },
          {
            startQuest = "1723793345716530187",
            startPort = "Out",
            endQuest = "17550872997711226157",
            endPort = "In"
          }
        },
        nodeData = {
          ["1723793345712530176"] = {
            key = "1723793345712530176",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2448.0589529183053, y = 107.49018736218204},
            propsData = {ModeType = 0}
          },
          ["1723793345712530177"] = {
            key = "1723793345712530177",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5.830206568854152, y = 55.75610058544835},
            propsData = {ModeType = 0}
          },
          ["1723793345712530178"] = {
            key = "1723793345712530178",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 33.955291816708495, y = 539.9028405044011},
            propsData = {}
          },
          ["1723793345715530183"] = {
            key = "1723793345715530183",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = -1886.22235884175, y = 147.89609218575032},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_110103_2_2",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_110103_2_1",
                  TargetBranchQuestKey = ""
                },
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_110103_2_5",
                  TargetBranchQuestKey = ""
                }
              },
              IsSetCountInfo = false,
              IsDifftation = true,
              AllDiffGuideOptions = {
                {
                  OptionElements = {
                    {
                      TargetIndicatorKey = "1723793345722530205",
                      IsShowOptional = false
                    }
                  }
                },
                {
                  OptionElements = {
                    {
                      TargetIndicatorKey = "1723793345722530204",
                      IsShowOptional = false
                    }
                  }
                },
                {
                  OptionElements = {
                    {
                      TargetIndicatorKey = "174183546513210923042",
                      IsShowOptional = false
                    },
                    {
                      TargetIndicatorKey = "172465591347415340002",
                      IsShowOptional = false
                    },
                    {
                      TargetIndicatorKey = "174183646216610925658",
                      IsShowOptional = false
                    },
                    {
                      TargetIndicatorKey = "1723793345716530187",
                      IsShowOptional = false
                    },
                    {
                      TargetIndicatorKey = "174183681207611704810",
                      IsShowOptional = false
                    }
                  }
                }
              }
            }
          },
          ["1723793345715530184"] = {
            key = "1723793345715530184",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = -506.0210057602584, y = 29.986695160496453},
            propsData = {
              InputBranchQuestNumber = 3,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true},
                {IsNeedFinish = true},
                {IsNeedFinish = true}
              }
            }
          },
          ["1723793345716530187"] = {
            key = "1723793345716530187",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = -2165.6418095818394, y = 1047.457446032368},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10021,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1723793345716530188"] = {
            key = "1723793345716530188",
            type = "TalkNode",
            name = "\232\190\190\232\138\153\230\182\133\229\188\128\232\189\166",
            pos = {x = -862.5757003790175, y = 752.2248262825954},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010621,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["1723793345720530198"] = {
            key = "1723793345720530198",
            type = "SendMessageNode",
            name = "\229\143\145\231\187\153\229\133\179\229\141\161",
            pos = {x = -859.2050221708118, y = 929.3902159244266},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "GetAidKit",
              UnitId = -1
            }
          },
          ["1723793345722530204"] = {
            key = "1723793345722530204",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = -932.0377310098759, y = 106.09265143215184},
            propsData = {
              ImpressionTalkTriggerId = 110121,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_anita_1640236",
              GuideStaticCreatorId = 0
            }
          },
          ["1723793345722530205"] = {
            key = "1723793345722530205",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = -931.7911982179769, y = -45.31833655876825},
            propsData = {
              ImpressionTalkTriggerId = 110120,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_youlian_1640235",
              GuideStaticCreatorId = 0
            }
          },
          ["172465591347415340002"] = {
            key = "172465591347415340002",
            type = "GoToNode",
            name = "\232\167\166\229\143\145AB\229\188\128\229\133\179\230\149\153\229\173\166",
            pos = {x = -1886.4514024748814, y = 474.50949701816944},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1640269,
              GuideType = "M",
              GuidePointName = "Mechanism_AbTeaching_1640269"
            }
          },
          ["172465593732415340422"] = {
            key = "172465593732415340422",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = -1164.2116430045696, y = 486.90556269831734},
            propsData = {GuideId = 42}
          },
          ["172562032298810423270"] = {
            key = "172562032298810423270",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -963.3632925014989, y = 304.25631419101353},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ABFirst",
              UnitId = -1
            }
          },
          ["17339095003162109"] = {
            key = "17339095003162109",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -559.8181818181819, y = -157.45454545454547},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010415,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17345114115111372323"] = {
            key = "17345114115111372323",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\140\187\231\150\151\231\174\177",
            pos = {x = -1578.7712216328393, y = 246.25723187136188},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640036}
            }
          },
          ["17351954668063478"] = {
            key = "17351954668063478",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1477.1207944102682, y = -373.65178096757035},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "StartFindAidKit",
              UnitId = -1
            }
          },
          ["174183546513210923042"] = {
            key = "174183546513210923042",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\228\187\147\229\186\147",
            pos = {x = -2175.146804405374, y = 470.5178275596931},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1640575,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_1640575"
            }
          },
          ["174183646216610925658"] = {
            key = "174183646216610925658",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = -1897.810587901308, y = 690.3477784630995},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1640132,
              StateId = 109012,
              IsGuideEnable = true,
              GuidePointName = "BP_ABfirst"
            }
          },
          ["174183666270310926880"] = {
            key = "174183666270310926880",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -2204.6579948802946, y = 686.3772752820702},
            propsData = {
              NewDescription = "Description_110103_2_4",
              NewDetail = "",
              SubTaskTargetIndex = 3
            }
          },
          ["174183670688610927703"] = {
            key = "174183670688610927703",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -2187.245841366133, y = 866.7673851721801},
            propsData = {
              NewDescription = "Description_110103_2_3",
              NewDetail = "",
              SubTaskTargetIndex = 3
            }
          },
          ["174183678893211704266"] = {
            key = "174183678893211704266",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -1851.7909984629168, y = 1085.461042392153},
            propsData = {
              NewDescription = "Description_110103_2_6",
              NewDetail = "",
              SubTaskTargetIndex = 3
            }
          },
          ["174183681207611704810"] = {
            key = "174183681207611704810",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\228\187\147\229\186\147",
            pos = {x = -1535.7584575754936, y = 1069.6648210696158},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1640575,
              GuideType = "M",
              GuidePointName = "Mechanism_questpoint_1640575"
            }
          },
          ["174723430773518043859"] = {
            key = "174723430773518043859",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144NPC",
            pos = {x = -1819.7778845667845, y = -129.68506493506482},
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
          },
          ["1753776767439671953"] = {
            key = "1753776767439671953",
            type = "TalkNode",
            name = "\232\190\190\232\138\153\230\182\133\229\188\128\232\189\166",
            pos = {x = -1158.1433358238855, y = 631.92127510806},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010618,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["17550872893331225807"] = {
            key = "17550872893331225807",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = -1895.2054511278197, y = 877.1075187969924},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_Drop_aidkit"
            }
          },
          ["17550872997711226157"] = {
            key = "17550872997711226157",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = -2143.018703007519, y = 1255.675939849624},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_Drop_aidkit"
            }
          }
        },
        commentData = {}
      }
    },
    ["1723793345699530143"] = {
      isStoryNode = true,
      key = "1723793345699530143",
      type = "StoryNode",
      name = "\233\152\178\229\190\161\232\190\190\232\138\153\230\182\133\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 481.74010063679555, y = 690.8187937153654},
      propsData = {
        QuestId = 11010108,
        QuestDescriptionComment = "\228\184\137\228\186\186\229\175\185\232\175\157\239\188\140\229\174\137\231\189\174\232\190\190\232\138\153\230\182\133",
        QuestDescription = "Description_110103_3",
        QuestDeatil = "Content_110103_3",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "pDafu11010301"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1723793345767530310",
            startPort = "QuestStart",
            endQuest = "1723793345768530313",
            endPort = "In"
          },
          {
            startQuest = "1723793345768530313",
            startPort = "Out",
            endQuest = "1723793345769530318",
            endPort = "In"
          },
          {
            startQuest = "1723793345769530318",
            startPort = "Out",
            endQuest = "1723793345769530317",
            endPort = "In"
          },
          {
            startQuest = "1723793345768530314",
            startPort = "Fail",
            endQuest = "1723793345768530315",
            endPort = "In"
          },
          {
            startQuest = "1723793345768530314",
            startPort = "Success",
            endQuest = "1723793345767530311",
            endPort = "Success"
          },
          {
            startQuest = "1723793345768530314",
            startPort = "PassiveFail",
            endQuest = "1723793345768530315",
            endPort = "In"
          },
          {
            startQuest = "1723793345768530315",
            startPort = "Out",
            endQuest = "1723793345767530312",
            endPort = "Fail"
          },
          {
            startQuest = "1723793345769530317",
            startPort = "Out",
            endQuest = "1723793345768530314",
            endPort = "In"
          }
        },
        nodeData = {
          ["1723793345767530310"] = {
            key = "1723793345767530310",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2031.2867235105027, y = 226.9522318111646},
            propsData = {ModeType = 0}
          },
          ["1723793345767530311"] = {
            key = "1723793345767530311",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -281.68671393578876, y = 243.56400770567575},
            propsData = {ModeType = 0}
          },
          ["1723793345767530312"] = {
            key = "1723793345767530312",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 144.60412061948372, y = 440.4218811129154},
            propsData = {}
          },
          ["1723793345768530313"] = {
            key = "1723793345768530313",
            type = "TalkNode",
            name = "NPC\229\175\185\232\175\157 - \229\155\158\229\136\176\232\190\190\232\138\153\230\182\133\232\186\171\232\190\185",
            pos = {x = -1780.1035358649037, y = 234.86351658201374},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110005,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_dafu_1640037",
              DelayShowGuideTime = 0,
              FirstDialogueId = 11010701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_05",
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
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723793345768530314"] = {
            key = "1723793345768530314",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -640.8615510990306, y = 260.92567056864357},
            propsData = {SpecialConfigId = 1004, BlackScreenImmediately = true}
          },
          ["1723793345768530315"] = {
            key = "1723793345768530315",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -361.09781045371057, y = 440.44380375125036},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "pDafu11010301",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1723793345769530317"] = {
            key = "1723793345769530317",
            type = "TalkNode",
            name = "NPC\229\175\185\232\175\157 - \229\155\158\229\136\176\232\190\190\232\138\153\230\182\133\232\186\171\232\190\185",
            pos = {x = -1198.4218978025815, y = 235.18983957219228},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010704,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_05",
              BlendInTime = 0,
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
                  TalkActorId = 110005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723793345769530318"] = {
            key = "1723793345769530318",
            type = "TalkNode",
            name = "\233\187\145\229\177\143 - \230\178\187\231\150\151\228\188\164\229\145\152",
            pos = {x = -1457.149614247022, y = 243.215813598166},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017402,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17471229461602004751"] = {
            key = "17471229461602004751",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -817.5, y = -99.57894736842104},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ProtectDafuCloseDoor",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1723793345700530145"] = {
      isStoryNode = true,
      key = "1723793345700530145",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\232\190\190\232\138\153\230\182\133\231\137\185\230\174\138\228\187\187\229\138\161",
      pos = {x = 844.099876272497, y = 476.82663089310546},
      propsData = {
        QuestId = 11010106,
        QuestDescriptionComment = "\229\175\187\230\137\190\232\190\190\232\138\153\230\182\133",
        QuestDescription = "Description_110103_1",
        QuestDeatil = "Content_110103_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_HelpDafuRE"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17242949210774685254",
            startPort = "Fail",
            endQuest = "172500387464931199",
            endPort = "In"
          },
          {
            startQuest = "172500387464931199",
            startPort = "Out",
            endQuest = "1723793345796530398",
            endPort = "Fail"
          },
          {
            startQuest = "1723793345796530396",
            startPort = "QuestStart",
            endQuest = "17242949210774685254",
            endPort = "In"
          },
          {
            startQuest = "17242949210774685254",
            startPort = "PassiveFail",
            endQuest = "172500387464931199",
            endPort = "In"
          },
          {
            startQuest = "17242949210774685254",
            startPort = "Success",
            endQuest = "174723455188218904438",
            endPort = "In"
          },
          {
            startQuest = "174723455188218904438",
            startPort = "Out",
            endQuest = "17472019399162286449",
            endPort = "In"
          },
          {
            startQuest = "17472019399162286449",
            startPort = "Out",
            endQuest = "1723793345796530397",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1723793345796530396"] = {
            key = "1723793345796530396",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2553.4407494514676, y = 196.94138833895408},
            propsData = {ModeType = 0}
          },
          ["1723793345796530397"] = {
            key = "1723793345796530397",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -784.2863455194046, y = 208.9980068389963},
            propsData = {ModeType = 0}
          },
          ["1723793345796530398"] = {
            key = "1723793345796530398",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -1357.9636123654386, y = 503.722045528748},
            propsData = {}
          },
          ["17242949210774685254"] = {
            key = "17242949210774685254",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -1902.2832017412447, y = 209.66033751332472},
            propsData = {SpecialConfigId = 1011, BlackScreenImmediately = true}
          },
          ["172500387464931199"] = {
            key = "172500387464931199",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\230\141\174\231\130\185",
            pos = {x = -1667.412323880493, y = 498.7852621655064},
            propsData = {
              ModeType = 1,
              Id = 210101,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["17472019399162286449"] = {
            key = "17472019399162286449",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = -1128, y = 220.66666666666669},
            propsData = {}
          },
          ["174723455188218904438"] = {
            key = "174723455188218904438",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\156\137\230\178\161\230\156\137\229\143\151\228\188\164",
            pos = {x = -1466.6546536796545, y = 205.66666666666669},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_03",
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
              EndNewTargetPointName = "pNanzhumove",
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
                  TalkActorId = 110005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110005}
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
    },
    ["1723793345700530146"] = {
      isStoryNode = true,
      key = "1723793345700530146",
      type = "StoryNode",
      name = "\229\164\132\229\134\179boss",
      pos = {x = 482.74233007691925, y = 477.21835896595087},
      propsData = {
        QuestId = 11010104,
        QuestDescriptionComment = "\229\164\132\229\134\179boss",
        QuestDescription = "Description_110102_2",
        QuestDeatil = "Content_110102_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
        SubRegionId = 102101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_LizhanBossBattle"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1723793345826530484",
            startPort = "Fail",
            endQuest = "1723793345829530494",
            endPort = "In"
          },
          {
            startQuest = "1723793345829530494",
            startPort = "Out",
            endQuest = "1723793345827530487",
            endPort = "Fail"
          },
          {
            startQuest = "1723793345826530484",
            startPort = "PassiveFail",
            endQuest = "17448806826804871504",
            endPort = "In"
          },
          {
            startQuest = "17448806826804871504",
            startPort = "Out",
            endQuest = "1723793345827530487",
            endPort = "Fail"
          },
          {
            startQuest = "1723793345826530484",
            startPort = "Success",
            endQuest = "17472018395171429710",
            endPort = "In"
          },
          {
            startQuest = "17472018395171429710",
            startPort = "Out",
            endQuest = "1723793345826530486",
            endPort = "Success"
          },
          {
            startQuest = "1723793345826530485",
            startPort = "QuestStart",
            endQuest = "1723793345826530484",
            endPort = "In"
          }
        },
        nodeData = {
          ["1723793345826530484"] = {
            key = "1723793345826530484",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\229\142\134\230\136\152\232\128\133boss\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -1361.79799395763, y = 301.7471819411522},
            propsData = {SpecialConfigId = 1003, BlackScreenImmediately = true}
          },
          ["1723793345826530485"] = {
            key = "1723793345826530485",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1946.7081433703127, y = 293.34132318934263},
            propsData = {ModeType = 0}
          },
          ["1723793345826530486"] = {
            key = "1723793345826530486",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -529.6982418578785, y = 298.67253057676385},
            propsData = {ModeType = 0}
          },
          ["1723793345827530487"] = {
            key = "1723793345827530487",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -733.508603633869, y = 465.5380859820727},
            propsData = {}
          },
          ["1723793345829530494"] = {
            key = "1723793345829530494",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = -996.4505213620168, y = 472.3569699851901},
            propsData = {
              ModeType = 1,
              Id = 210101,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["17448806826804871504"] = {
            key = "17448806826804871504",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -1105.1304347826094, y = 639.7391304347826},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BossStart",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17472018395171429710"] = {
            key = "17472018395171429710",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = -1086.9979750974794, y = 288.00000000000006},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["1723793345701530148"] = {
      isStoryNode = true,
      key = "1723793345701530148",
      type = "StoryNode",
      name = "\229\146\140\233\152\191\231\147\166\229\176\148\232\190\190\232\138\153\230\182\133\228\184\137\228\186\186\229\175\185\232\175\157",
      pos = {x = 837.1706159003038, y = 695.1847931460375},
      propsData = {
        QuestId = 11010109,
        QuestDescriptionComment = "\228\184\137\228\186\186\229\175\185\232\175\157\239\188\140\229\174\137\231\189\174\232\190\190\232\138\153\230\182\133",
        QuestDescription = "Description_110103_4",
        QuestDeatil = "Content_110103_4",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 102101,
        StoryGuideType = "Point",
        StoryGuidePointName = "pDafu11010301"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1728391611239201164",
            startPort = "Out",
            endQuest = "1728391598499200670",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "1728391611239201164",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "1723793345850530559",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "1723793345854530570",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "1723793345855530571",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "1723793345855530572",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "17349400731263658377",
            endPort = "In"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "17349400623893658235",
            endPort = "In"
          },
          {
            startQuest = "1723793345850530559",
            startPort = "Out",
            endQuest = "1723793345851530561",
            endPort = "Success"
          },
          {
            startQuest = "1723793345851530560",
            startPort = "QuestStart",
            endQuest = "1723793345856530575",
            endPort = "In"
          }
        },
        nodeData = {
          ["1723793345850530559"] = {
            key = "1723793345850530559",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\177\135\229\144\136\229\144\142\231\171\153\230\161\169\229\175\185\232\175\157 - \230\136\145\231\156\139\232\191\135\229\164\167\229\174\182\231\154\132\230\131\133\229\134\181\228\186\134\227\128\130",
            pos = {x = -54.309446379683436, y = 146.9239095782088},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110005,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_dafu_1640037",
              DelayShowGuideTime = 0,
              FirstDialogueId = 11011101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_06",
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
              EndNewTargetPointName = "BP_TargetPoint110104",
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
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110010},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723793345851530560"] = {
            key = "1723793345851530560",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -594.777128136303, y = 53.01142084728062},
            propsData = {ModeType = 0}
          },
          ["1723793345851530561"] = {
            key = "1723793345851530561",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 611.0610950663547, y = 165.00995515431217},
            propsData = {ModeType = 0}
          },
          ["1723793345852530562"] = {
            key = "1723793345852530562",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -170.0379715325421, y = 761.601634990751},
            propsData = {}
          },
          ["1723793345854530570"] = {
            key = "1723793345854530570",
            type = "TalkNode",
            name = "Free - \230\177\135\229\144\136\229\144\142\229\176\164\233\135\140\229\174\137",
            pos = {x = 190.32589704010203, y = -348.26514721387844},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110044,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_dafu_1640037",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011016,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723793345855530571"] = {
            key = "1723793345855530571",
            type = "TalkNode",
            name = "Free - \230\177\135\229\144\136\229\144\142\233\152\191\229\166\174\229\161\148",
            pos = {x = 183.53783994083201, y = -206.21488915972506},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110045,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_dafu_1640037",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011018,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723793345855530572"] = {
            key = "1723793345855530572",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1641",
            pos = {x = 182.80492068617374, y = -62.54050953271892},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110027,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_dafu_1640037",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011020,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723793345856530575"] = {
            key = "1723793345856530575",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 265.6104962627312, y = 398.89487494441335},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1211010205}
            }
          },
          ["1728391598499200670"] = {
            key = "1728391598499200670",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\230\136\152\230\150\151\231\187\147\230\157\159",
            pos = {x = -74.80831371386851, y = 330.92685982080286},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1728391611239201164"] = {
            key = "1728391611239201164",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -335.7796467286792, y = 345.17817372429084},
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
          ["17349400623893658235"] = {
            key = "17349400623893658235",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1642",
            pos = {x = 207.2, y = -541.304347826087},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110028,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_hurtjuji_1640032",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011024,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17349400731263658377"] = {
            key = "17349400731263658377",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 230.73684210526315, y = -713.725400457666},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 110056,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_guardJT_1640033",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011022,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "EXPlayer",
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
