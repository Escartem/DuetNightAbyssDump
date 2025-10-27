return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175448218660815299447",
      startPort = "StoryStart",
      endStory = "175448218660815299449",
      endPort = "In"
    },
    {
      startStory = "175448218660815299449",
      startPort = "Success",
      endStory = "175448218660815299448",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175448218660815299447"] = {
      isStoryNode = true,
      key = "175448218660815299447",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 952, y = 324},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175448218660815299448"] = {
      isStoryNode = true,
      key = "175448218660815299448",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1712, y = 332},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175448218660815299449"] = {
      isStoryNode = true,
      key = "175448218660815299449",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1320, y = 320},
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
            startQuest = "175448218660815299450",
            startPort = "QuestStart",
            endQuest = "175448218660815299460",
            endPort = "In"
          },
          {
            startQuest = "175758391424643975290",
            startPort = "Out",
            endQuest = "175758391424643975291",
            endPort = "In"
          },
          {
            startQuest = "175758391424643975289",
            startPort = "Out",
            endQuest = "175758391424643975292",
            endPort = "In"
          },
          {
            startQuest = "175758391667343975345",
            startPort = "Out",
            endQuest = "175758391667343975346",
            endPort = "In"
          },
          {
            startQuest = "175758391667343975347",
            startPort = "Out",
            endQuest = "175758391667343975344",
            endPort = "Input_2"
          },
          {
            startQuest = "175758391667343975346",
            startPort = "Out",
            endQuest = "175758391667343975344",
            endPort = "Input_1"
          },
          {
            startQuest = "175758392800343975399",
            startPort = "Out",
            endQuest = "175758392800343975400",
            endPort = "In"
          },
          {
            startQuest = "175758392800343975401",
            startPort = "Out",
            endQuest = "175758392800343975402",
            endPort = "In"
          },
          {
            startQuest = "175758392800343975400",
            startPort = "Out",
            endQuest = "175758392800343975401",
            endPort = "In"
          },
          {
            startQuest = "175448218660815299460",
            startPort = "Out",
            endQuest = "175758392800343975399",
            endPort = "In"
          },
          {
            startQuest = "175758392800343975402",
            startPort = "Out",
            endQuest = "175448218660815299452",
            endPort = "Fail"
          },
          {
            startQuest = "175758391667343975344",
            startPort = "Out",
            endQuest = "175448218660815299464",
            endPort = "In"
          },
          {
            startQuest = "175448218660815299450",
            startPort = "QuestStart",
            endQuest = "175758391424643975290",
            endPort = "In"
          },
          {
            startQuest = "175448218660815299450",
            startPort = "QuestStart",
            endQuest = "175758391424643975289",
            endPort = "In"
          },
          {
            startQuest = "1757664321940618959",
            startPort = "Out",
            endQuest = "1757664321940618958",
            endPort = "In"
          },
          {
            startQuest = "1757664321940618958",
            startPort = "Out",
            endQuest = "1757664321940618960",
            endPort = "In"
          },
          {
            startQuest = "175448218660815299450",
            startPort = "QuestStart",
            endQuest = "1757664321940618959",
            endPort = "In"
          },
          {
            startQuest = "1757664321940618960",
            startPort = "Out",
            endQuest = "175758391667343975345",
            endPort = "In"
          },
          {
            startQuest = "1757664321940618960",
            startPort = "Out",
            endQuest = "175758391667343975347",
            endPort = "In"
          },
          {
            startQuest = "175448218660815299450",
            startPort = "QuestStart",
            endQuest = "17576659078161238787",
            endPort = "In"
          }
        },
        nodeData = {
          ["175448218660815299450"] = {
            key = "175448218660815299450",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 709.5, y = 210.25},
            propsData = {ModeType = 0}
          },
          ["175448218660815299451"] = {
            key = "175448218660815299451",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3974.854655148773, y = 853.7466748937338},
            propsData = {ModeType = 0}
          },
          ["175448218660815299452"] = {
            key = "175448218660815299452",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1966.6403743315507, y = 1110.262605042017},
            propsData = {}
          },
          ["175448218660815299460"] = {
            key = "175448218660815299460",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1288.6942448031841, y = 558.6859617955984},
            propsData = {}
          },
          ["175448218660815299464"] = {
            key = "175448218660815299464",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3149.1220823809836, y = 383.33592078715895},
            propsData = {}
          },
          ["175758391424643975289"] = {
            key = "175758391424643975289",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1234.5840378056232, y = -89.4294609869581},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["175758391424643975290"] = {
            key = "175758391424643975290",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1229.7799465574592, y = -256.23131278890935},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["175758391424643975291"] = {
            key = "175758391424643975291",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1538.2200534425408, y = -270.57053901304187},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["175758391424643975292"] = {
            key = "175758391424643975292",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1539.2767692651494, y = -108.3096794127566},
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
          ["175758391667343975344"] = {
            key = "175758391667343975344",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2891.33675890852, y = 337.2027430786003},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["175758391667343975345"] = {
            key = "175758391667343975345",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2289.6412630695017, y = 205.94879516047948},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758391667343975346"] = {
            key = "175758391667343975346",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2576.3666949237313, y = 212.86845998136283},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758391667343975347"] = {
            key = "175758391667343975347",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2412.588258272889, y = 374.2853861724833},
            propsData = {Duration = 3}
          },
          ["175758392800343975399"] = {
            key = "175758392800343975399",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1352.7099886606643, y = 831.4786326330266},
            propsData = {}
          },
          ["175758392800343975400"] = {
            key = "175758392800343975400",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1644.4294180960387, y = 863.5682521208663},
            propsData = {Duration = 3}
          },
          ["175758392800343975401"] = {
            key = "175758392800343975401",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1352.4447801667768, y = 980.8698196591562},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758392800343975402"] = {
            key = "175758392800343975402",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1641.937070162865, y = 1034.9919556022676},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["1757664321940618958"] = {
            key = "1757664321940618958",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1548.9314802844215, y = 242.2346477052357},
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
          ["1757664321940618959"] = {
            key = "1757664321940618959",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1251.049127343245, y = 249.49935358758864},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["1757664321940618960"] = {
            key = "1757664321940618960",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1835.1667744020685, y = 246.73464770523566},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17576659078161238787"] = {
            key = "17576659078161238787",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1242, y = 100},
            propsData = {
              NewDescription = "Episode_Feina",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {
          ["175758395262543975728"] = {
            key = "175758395262543975728",
            name = "Input Commment...",
            position = {x = 1270.6764705882351, y = 725.7647058823529},
            size = {width = 647.7934712346478, height = 479.6373626373625}
          },
          ["175758398859843976150"] = {
            key = "175758398859843976150",
            name = "Input Commment...",
            position = {x = 1204, y = -358},
            size = {width = 600, height = 400}
          },
          ["175758399952643976535"] = {
            key = "175758399952643976535",
            name = "Input Commment...",
            position = {x = 2235.846153846154, y = 89.07692307692308},
            size = {width = 924, height = 454}
          }
        }
      }
    }
  },
  commentData = {}
}
