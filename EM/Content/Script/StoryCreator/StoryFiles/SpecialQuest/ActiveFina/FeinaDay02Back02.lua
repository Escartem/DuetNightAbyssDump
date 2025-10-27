return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17544643654542634514",
      startPort = "StoryStart",
      endStory = "17544643713552634593",
      endPort = "In"
    },
    {
      startStory = "17544643713552634593",
      startPort = "Success",
      endStory = "17544643654542634517",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17544643654542634514"] = {
      isStoryNode = true,
      key = "17544643654542634514",
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
    ["17544643654542634517"] = {
      isStoryNode = true,
      key = "17544643654542634517",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1616, y = 274},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17544643713552634593"] = {
      isStoryNode = true,
      key = "17544643713552634593",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1216, y = 286},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17544643713552634594",
            startPort = "QuestStart",
            endQuest = "17544706276394620134",
            endPort = "In"
          },
          {
            startQuest = "17575801554875587773",
            startPort = "Out",
            endQuest = "17575801554875587774",
            endPort = "In"
          },
          {
            startQuest = "17575801554875587771",
            startPort = "Out",
            endQuest = "17575801554875587775",
            endPort = "In"
          },
          {
            startQuest = "17575801654225588100",
            startPort = "Out",
            endQuest = "17575801654225588101",
            endPort = "In"
          },
          {
            startQuest = "17575801654225588102",
            startPort = "Out",
            endQuest = "17575801654225588103",
            endPort = "In"
          },
          {
            startQuest = "17575801654225588101",
            startPort = "Out",
            endQuest = "17575801654225588104",
            endPort = "In"
          },
          {
            startQuest = "17575801654225588104",
            startPort = "Out",
            endQuest = "17575801654225588102",
            endPort = "In"
          },
          {
            startQuest = "17544706276394620134",
            startPort = "Out",
            endQuest = "17575801654225588100",
            endPort = "In"
          },
          {
            startQuest = "17575801654225588103",
            startPort = "Out",
            endQuest = "17544643713562634600",
            endPort = "Fail"
          },
          {
            startQuest = "17544643713552634594",
            startPort = "QuestStart",
            endQuest = "17575801554875587773",
            endPort = "In"
          },
          {
            startQuest = "17544643713552634594",
            startPort = "QuestStart",
            endQuest = "17575801554875587771",
            endPort = "In"
          },
          {
            startQuest = "17544643713552634594",
            startPort = "QuestStart",
            endQuest = "17575801554875587772",
            endPort = "In"
          },
          {
            startQuest = "17575801993075589264",
            startPort = "Out",
            endQuest = "17575801993075589265",
            endPort = "In"
          },
          {
            startQuest = "17575801993075589266",
            startPort = "Out",
            endQuest = "17575801993075589262",
            endPort = "Input_2"
          },
          {
            startQuest = "17575801993075589263",
            startPort = "Out",
            endQuest = "17575801993075589262",
            endPort = "Input_3"
          },
          {
            startQuest = "17575801993075589265",
            startPort = "Out",
            endQuest = "17575801993075589262",
            endPort = "Input_1"
          },
          {
            startQuest = "17575801993075589262",
            startPort = "Out",
            endQuest = "17544706006814619692",
            endPort = "In"
          },
          {
            startQuest = "17544643713552634594",
            startPort = "QuestStart",
            endQuest = "17575802470555590477",
            endPort = "In"
          },
          {
            startQuest = "17575802470555590477",
            startPort = "Out",
            endQuest = "17575801993075589264",
            endPort = "In"
          },
          {
            startQuest = "17575802470555590477",
            startPort = "Out",
            endQuest = "17575801993075589266",
            endPort = "In"
          },
          {
            startQuest = "17575802470555590477",
            startPort = "Out",
            endQuest = "17575801993075589263",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544643713552634594"] = {
            key = "17544643713552634594",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 783.6363636363636, y = 310.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17544643713562634597"] = {
            key = "17544643713562634597",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2777.5, y = 897.5},
            propsData = {ModeType = 0}
          },
          ["17544643713562634600"] = {
            key = "17544643713562634600",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2183.8823529411766, y = 1242.1176470588234},
            propsData = {}
          },
          ["17544706006814619692"] = {
            key = "17544706006814619692",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3028.1666666666665, y = 314.33333333333337},
            propsData = {}
          },
          ["17544706276394620134"] = {
            key = "17544706276394620134",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1292, y = 722},
            propsData = {}
          },
          ["17575801554875587771"] = {
            key = "17575801554875587771",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1337.055679894319, y = -229.88730990339107},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["17575801554875587772"] = {
            key = "17575801554875587772",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1343.2358235069441, y = -65.78142652995184},
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
          ["17575801554875587773"] = {
            key = "17575801554875587773",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1332.251588646155, y = -396.68916170534226},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575801554875587774"] = {
            key = "17575801554875587774",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1608.3840032235441, y = -392.56684946793644},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575801554875587775"] = {
            key = "17575801554875587775",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1631.748411353845, y = -238.7675283291895},
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
          ["17575801654225588100"] = {
            key = "17575801654225588100",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1577.8630806666977, y = 846.8353445485619},
            propsData = {}
          },
          ["17575801654225588101"] = {
            key = "17575801654225588101",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1870.3359037672303, y = 887.4679504617409},
            propsData = {Duration = 3}
          },
          ["17575801654225588102"] = {
            key = "17575801654225588102",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1594.6204966071991, y = 1152.654133384646},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575801654225588103"] = {
            key = "17575801654225588103",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1841.6957428627138, y = 1225.1940672161438},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575801654225588104"] = {
            key = "17575801654225588104",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1719.5294117647059, y = 1005.7647058823529},
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
          ["17575801993075589262"] = {
            key = "17575801993075589262",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2644.763467648697, y = 297.52489319337906},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17575801993075589263"] = {
            key = "17575801993075589263",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 2252.5861787703534, y = 486.42798106501834},
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
          ["17575801993075589264"] = {
            key = "17575801993075589264",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2021.8214732102388, y = 194.31296208198094},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575801993075589265"] = {
            key = "17575801993075589265",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2287.3326193501825, y = 193.16119833143577},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575801993075589266"] = {
            key = "17575801993075589266",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2247.0541826993403, y = 328.0781245225562},
            propsData = {Duration = 3}
          },
          ["17575802470555590477"] = {
            key = "17575802470555590477",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1466.3277575108075, y = 320.6083470193374},
            propsData = {WaitTime = 3}
          }
        },
        commentData = {
          ["17575801726175588422"] = {
            key = "17575801726175588422",
            name = "Input Commment...",
            position = {x = 1553.6318369453045, y = 733.3391382868934},
            size = {width = 552.3529411764706, height = 677.6470588235294}
          },
          ["17575801799035588691"] = {
            key = "17575801799035588691",
            name = "Input Commment...",
            position = {x = 1262.4553663570691, y = -489.6020381836949},
            size = {width = 649.4117647058823, height = 578.8235294117648}
          },
          ["17575802033045589424"] = {
            key = "17575802033045589424",
            name = "Input Commment...",
            position = {x = 1927.2924704294678, y = 101.04458969822706},
            size = {width = 975, height = 520}
          }
        }
      }
    }
  },
  commentData = {}
}
