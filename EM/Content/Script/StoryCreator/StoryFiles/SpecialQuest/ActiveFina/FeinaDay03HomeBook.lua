return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17547359512551",
      startPort = "StoryStart",
      endStory = "1754735961976120",
      endPort = "In"
    },
    {
      startStory = "1754735961976120",
      startPort = "Success",
      endStory = "17547359512565",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17547359512551"] = {
      isStoryNode = true,
      key = "17547359512551",
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
    ["17547359512565"] = {
      isStoryNode = true,
      key = "17547359512565",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1668, y = 316},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754735961976120"] = {
      isStoryNode = true,
      key = "1754735961976120",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1148, y = 274},
      propsData = {
        QuestId = 0,
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1754735961976121",
            startPort = "QuestStart",
            endQuest = "1754736118449597587",
            endPort = "In"
          },
          {
            startQuest = "17555917243721741",
            startPort = "Out",
            endQuest = "17555917283311830",
            endPort = "In"
          },
          {
            startQuest = "17555917243721741",
            startPort = "Out",
            endQuest = "17555969845471837887",
            endPort = "In"
          },
          {
            startQuest = "17575805611078071663",
            startPort = "Out",
            endQuest = "17575805611078071664",
            endPort = "In"
          },
          {
            startQuest = "17575805611078071661",
            startPort = "Out",
            endQuest = "17575805611078071665",
            endPort = "In"
          },
          {
            startQuest = "1754735961976121",
            startPort = "QuestStart",
            endQuest = "17555917243721741",
            endPort = "In"
          },
          {
            startQuest = "1754735961976121",
            startPort = "QuestStart",
            endQuest = "17575805611078071663",
            endPort = "In"
          },
          {
            startQuest = "1754735961976121",
            startPort = "QuestStart",
            endQuest = "17575805611078071661",
            endPort = "In"
          },
          {
            startQuest = "1754735961976121",
            startPort = "QuestStart",
            endQuest = "17575805611078071662",
            endPort = "In"
          },
          {
            startQuest = "17575806076298073246",
            startPort = "Out",
            endQuest = "17575806076298073247",
            endPort = "In"
          },
          {
            startQuest = "17575806076298073248",
            startPort = "Out",
            endQuest = "17575806076298073249",
            endPort = "In"
          },
          {
            startQuest = "17575806076298073247",
            startPort = "Out",
            endQuest = "17575806076298073250",
            endPort = "In"
          },
          {
            startQuest = "17575806076298073250",
            startPort = "Out",
            endQuest = "17575806076298073248",
            endPort = "In"
          },
          {
            startQuest = "1754736118449597587",
            startPort = "Out",
            endQuest = "17575806076298073246",
            endPort = "In"
          },
          {
            startQuest = "17575806076298073249",
            startPort = "Out",
            endQuest = "1754735961977135",
            endPort = "Fail"
          },
          {
            startQuest = "17575806429728692059",
            startPort = "Out",
            endQuest = "17575806429728692060",
            endPort = "In"
          },
          {
            startQuest = "17575806429728692061",
            startPort = "Out",
            endQuest = "17575806429728692057",
            endPort = "Input_2"
          },
          {
            startQuest = "17575806429728692058",
            startPort = "Out",
            endQuest = "17575806429728692057",
            endPort = "Input_3"
          },
          {
            startQuest = "17575806429728692060",
            startPort = "Out",
            endQuest = "17575806429728692057",
            endPort = "Input_1"
          },
          {
            startQuest = "17555917283311830",
            startPort = "Out",
            endQuest = "17575806429728692059",
            endPort = "In"
          },
          {
            startQuest = "17555917283311830",
            startPort = "Out",
            endQuest = "17575806429728692061",
            endPort = "In"
          },
          {
            startQuest = "17555917283311830",
            startPort = "Out",
            endQuest = "17575806429728692058",
            endPort = "In"
          },
          {
            startQuest = "17575806429728692057",
            startPort = "Out",
            endQuest = "17548939926536019281",
            endPort = "In"
          }
        },
        nodeData = {
          ["1754735961976121"] = {
            key = "1754735961976121",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 690, y = 340},
            propsData = {ModeType = 0}
          },
          ["1754735961977128"] = {
            key = "1754735961977128",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3181.4285714285716, y = 287.14285714285717},
            propsData = {ModeType = 0}
          },
          ["1754735961977135"] = {
            key = "1754735961977135",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2094, y = 1284},
            propsData = {}
          },
          ["1754736118449597587"] = {
            key = "1754736118449597587",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1129.2135343371797, y = 534.0536088544216},
            propsData = {}
          },
          ["17548939926536019281"] = {
            key = "17548939926536019281",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2843.4605053894584, y = 322.81146567249203},
            propsData = {}
          },
          ["17555917243721741"] = {
            key = "17555917243721741",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1142.0275689223058, y = 335.4761904761905},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230069}
            }
          },
          ["17555917283311830"] = {
            key = "17555917283311830",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1487.107769423559, y = 326.2515664160401},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11044,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Feina_Book",
              IsUseCount = false
            }
          },
          ["17555969845471837887"] = {
            key = "17555969845471837887",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1496.3859649122808, y = 166.31578947368416},
            propsData = {
              NewDescription = "Description_120113_4",
              NewDetail = "Content_120113_4",
              SubTaskTargetIndex = 0
            }
          },
          ["17575805611078071661"] = {
            key = "17575805611078071661",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1080.5906938999212, y = -225.3186824524107},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["17575805611078071662"] = {
            key = "17575805611078071662",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1081.359072806664, y = -62.97750496132444},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "Skill1",
                "Fire",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["17575805611078071663"] = {
            key = "17575805611078071663",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1064.0723169374712, y = -368.5491056829334},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575805611078071664"] = {
            key = "17575805611078071664",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1340.2047315148604, y = -368.71250773124183},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575805611078071665"] = {
            key = "17575805611078071665",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1359.2834253594472, y = -234.1989008782091},
            propsData = {
              Duration = 4,
              CameraName = "StoryEast01Nai01",
              LockRotate = false,
              FocalLength = 0,
              LensAperture = 0,
              FOV = 80,
              PPMaterialPath = ""
            }
          },
          ["17575806076298073246"] = {
            key = "17575806076298073246",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1438.789882966565, y = 704.6263662203886},
            propsData = {}
          },
          ["17575806076298073247"] = {
            key = "17575806076298073247",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1708.7627060670977, y = 758.9431826598834},
            propsData = {Duration = 3}
          },
          ["17575806076298073248"] = {
            key = "17575806076298073248",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1434.4946673281192, y = 1032.1556813722623},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575806076298073249"] = {
            key = "17575806076298073249",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1702.7541241099498, y = 1123.6429836248126},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575806076298073250"] = {
            key = "17575806076298073250",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1549.4562140645735, y = 884.0557275541796},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Skill1",
                "Fire",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["17575806429728692057"] = {
            key = "17575806429728692057",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2509.9215721860583, y = 296.83208368091067},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17575806429728692058"] = {
            key = "17575806429728692058",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 2027.7442833077143, y = 475.73517155254996},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Skill1",
                "Fire",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["17575806429728692059"] = {
            key = "17575806429728692059",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1919.9795777475997, y = 162.6201525695125},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575806429728692060"] = {
            key = "17575806429728692060",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2199.990723887544, y = 159.96838881896733},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575806429728692061"] = {
            key = "17575806429728692061",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2032.2122872367013, y = 342.3853150100878},
            propsData = {Duration = 3}
          }
        },
        commentData = {
          ["17575805813468072401"] = {
            key = "17575805813468072401",
            name = "Input Commment...",
            position = {x = 1027.3921568627452, y = -451.12044817927165},
            size = {width = 567.8571428571429, height = 552.8571428571429}
          },
          ["17575806129158073461"] = {
            key = "17575806129158073461",
            name = "Input Commment...",
            position = {x = 1400.4562140645733, y = 615.5557275541797},
            size = {width = 586, height = 694}
          },
          ["17575806556838692590"] = {
            key = "17575806556838692590",
            name = "Input Commment...",
            position = {x = 1826.0152403066493, y = 53.0344611528825},
            size = {width = 953.6842105263161, height = 563.6842105263158}
          }
        }
      }
    }
  },
  commentData = {}
}
