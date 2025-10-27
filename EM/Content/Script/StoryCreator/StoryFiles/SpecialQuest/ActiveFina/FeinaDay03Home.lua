return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17546410167741",
      startPort = "StoryStart",
      endStory = "1754641096267155",
      endPort = "In"
    },
    {
      startStory = "1754641096267155",
      startPort = "Success",
      endStory = "17546410167755",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17546410167741"] = {
      isStoryNode = true,
      key = "17546410167741",
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
    ["17546410167755"] = {
      isStoryNode = true,
      key = "17546410167755",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1594, y = 312},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754641096267155"] = {
      isStoryNode = true,
      key = "1754641096267155",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1150, y = 294},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120113_1",
        QuestDeatil = "Content_120113_1",
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
            startQuest = "1754641096267156",
            startPort = "QuestStart",
            endQuest = "1754641987877597892",
            endPort = "In"
          },
          {
            startQuest = "175559340074814406119",
            startPort = "Out",
            endQuest = "175559340074814406120",
            endPort = "In"
          },
          {
            startQuest = "1754641096267156",
            startPort = "QuestStart",
            endQuest = "175559340074814406119",
            endPort = "In"
          },
          {
            startQuest = "175559340074814406119",
            startPort = "Out",
            endQuest = "1754641678000595676",
            endPort = "In"
          },
          {
            startQuest = "17575803277796828624",
            startPort = "Out",
            endQuest = "17575803277796828625",
            endPort = "In"
          },
          {
            startQuest = "17575803277796828626",
            startPort = "Out",
            endQuest = "17575803277796828622",
            endPort = "Input_2"
          },
          {
            startQuest = "17575803277796828623",
            startPort = "Out",
            endQuest = "17575803277796828622",
            endPort = "Input_3"
          },
          {
            startQuest = "17575803277796828625",
            startPort = "Out",
            endQuest = "17575803277796828622",
            endPort = "Input_1"
          },
          {
            startQuest = "175559340074814406120",
            startPort = "Out",
            endQuest = "17575803277796828624",
            endPort = "In"
          },
          {
            startQuest = "175559340074814406120",
            startPort = "Out",
            endQuest = "17575803277796828626",
            endPort = "In"
          },
          {
            startQuest = "175559340074814406120",
            startPort = "Out",
            endQuest = "17575803277796828623",
            endPort = "In"
          },
          {
            startQuest = "17575803277796828622",
            startPort = "Out",
            endQuest = "1754641741311596502",
            endPort = "In"
          },
          {
            startQuest = "17575803518336829512",
            startPort = "Out",
            endQuest = "17575803518336829513",
            endPort = "In"
          },
          {
            startQuest = "17575803518336829514",
            startPort = "Out",
            endQuest = "17575803518336829515",
            endPort = "In"
          },
          {
            startQuest = "17575803518336829513",
            startPort = "Out",
            endQuest = "17575803518336829516",
            endPort = "In"
          },
          {
            startQuest = "17575803518336829516",
            startPort = "Out",
            endQuest = "17575803518336829514",
            endPort = "In"
          },
          {
            startQuest = "1754641987877597892",
            startPort = "Out",
            endQuest = "17575803518336829512",
            endPort = "In"
          },
          {
            startQuest = "17575803518336829515",
            startPort = "Out",
            endQuest = "1754641096267170",
            endPort = "Fail"
          },
          {
            startQuest = "17575803648466829993",
            startPort = "Out",
            endQuest = "17575803648466829994",
            endPort = "In"
          },
          {
            startQuest = "17575803648466829991",
            startPort = "Out",
            endQuest = "17575803648466829995",
            endPort = "In"
          },
          {
            startQuest = "1754641096267156",
            startPort = "QuestStart",
            endQuest = "17575803648466829992",
            endPort = "In"
          },
          {
            startQuest = "1754641096267156",
            startPort = "QuestStart",
            endQuest = "17575803648466829991",
            endPort = "In"
          },
          {
            startQuest = "1754641096267156",
            startPort = "QuestStart",
            endQuest = "17575803648466829993",
            endPort = "In"
          }
        },
        nodeData = {
          ["1754641096267156"] = {
            key = "1754641096267156",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 751.5384615384615, y = 784.6153846153845},
            propsData = {ModeType = 0}
          },
          ["1754641096267163"] = {
            key = "1754641096267163",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754641096267170"] = {
            key = "1754641096267170",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2343.4624994759765, y = 1717.3544925228962},
            propsData = {}
          },
          ["1754641678000595676"] = {
            key = "1754641678000595676",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1753.8443961270318, y = 598.0101946100995},
            propsData = {
              NewDescription = "Description_120113_1",
              NewDetail = "Content_120113_1",
              SubTaskTargetIndex = 0
            }
          },
          ["1754641741311596502"] = {
            key = "1754641741311596502",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3149.4894056660323, y = 820.3432120389299},
            propsData = {}
          },
          ["1754641987877597892"] = {
            key = "1754641987877597892",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1271.8677819622749, y = 1161.694362490194},
            propsData = {}
          },
          ["175559340074814406119"] = {
            key = "175559340074814406119",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1392.733423117131, y = 787.7852810888803},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230068}
            }
          },
          ["175559340074814406120"] = {
            key = "175559340074814406120",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1749.3389750729143, y = 769.2011442504863},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11033,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Feina01BackHome",
              IsUseCount = false
            }
          },
          ["17575803277796828622"] = {
            key = "17575803277796828622",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2830.403689526921, y = 781.8649188797674},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17575803277796828623"] = {
            key = "17575803277796828623",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 2348.2264006485775, y = 960.7680067514068},
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
          ["17575803277796828624"] = {
            key = "17575803277796828624",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2236.711695088463, y = 662.6529877683694},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575803277796828625"] = {
            key = "17575803277796828625",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2520.4728412284067, y = 660.0012240178241},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575803277796828626"] = {
            key = "17575803277796828626",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2352.6944045775645, y = 827.4181502089446},
            propsData = {Duration = 3}
          },
          ["17575803518336829512"] = {
            key = "17575803518336829512",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1624.582537680272, y = 1273.8628170760346},
            propsData = {}
          },
          ["17575803518336829513"] = {
            key = "17575803518336829513",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1864.5553607808047, y = 1334.4954229892135},
            propsData = {Duration = 3}
          },
          ["17575803518336829514"] = {
            key = "17575803518336829514",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1631.3399536207735, y = 1587.1816059121186},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575803518336829515"] = {
            key = "17575803518336829515",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1886.5034351704057, y = 1666.7803632730281},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575803518336829516"] = {
            key = "17575803518336829516",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1761.2488687782802, y = 1455.2921784098255},
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
          ["17575803648466829991"] = {
            key = "17575803648466829991",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1215.6658932104142, y = 255.11495254004797},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["17575803648466829992"] = {
            key = "17575803648466829992",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1232.434272117157, y = 417.45613003113425},
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
          ["17575803648466829993"] = {
            key = "17575803648466829993",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1210.8618019622502, y = 88.31310073809675},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575803648466829994"] = {
            key = "17575803648466829994",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1486.9942165396394, y = 92.43541297550257},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575803648466829995"] = {
            key = "17575803648466829995",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1510.3586246699404, y = 246.23473411424953},
            propsData = {
              Duration = 4,
              CameraName = "StoryEast01Nai01",
              LockRotate = false,
              FocalLength = 0,
              LensAperture = 0,
              FOV = 80,
              PPMaterialPath = ""
            }
          }
        },
        commentData = {
          ["17575803392646829115"] = {
            key = "17575803392646829115",
            name = "Input Commment...",
            position = {x = 2140.4326923076924, y = 557.2596153846155},
            size = {width = 944.9999999999998, height = 560.625}
          },
          ["17575803576016829781"] = {
            key = "17575803576016829781",
            name = "Input Commment...",
            position = {x = 1571.7866839043309, y = 1185.8257918552038},
            size = {width = 557.6470588235293, height = 628.2352941176471}
          },
          ["17575803700806830209"] = {
            key = "17575803700806830209",
            name = "Input Commment...",
            position = {x = 1135.3173884938587, y = -8.610374919198478},
            size = {width = 594.705882352941, height = 573.5294117647059}
          }
        }
      }
    }
  },
  commentData = {}
}
