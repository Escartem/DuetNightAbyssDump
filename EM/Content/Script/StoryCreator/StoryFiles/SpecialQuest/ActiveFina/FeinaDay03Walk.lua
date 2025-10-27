return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17546436188041",
      startPort = "StoryStart",
      endStory = "1754643660402158",
      endPort = "In"
    },
    {
      startStory = "1754643660402158",
      startPort = "Success",
      endStory = "17546436188055",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17546436188041"] = {
      isStoryNode = true,
      key = "17546436188041",
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
    ["17546436188055"] = {
      isStoryNode = true,
      key = "17546436188055",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1522, y = 286},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754643660402158"] = {
      isStoryNode = true,
      key = "1754643660402158",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1144, y = 286},
      propsData = {
        QuestId = 0,
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
            startQuest = "1754643660402159",
            startPort = "QuestStart",
            endQuest = "1754645634572598848",
            endPort = "In"
          },
          {
            startQuest = "1754645345582597508",
            startPort = "Out",
            endQuest = "1754645345582597510",
            endPort = "In"
          },
          {
            startQuest = "1754643660402159",
            startPort = "QuestStart",
            endQuest = "1754645345582597507",
            endPort = "In"
          },
          {
            startQuest = "1754643660402159",
            startPort = "QuestStart",
            endQuest = "1754645345582597508",
            endPort = "In"
          },
          {
            startQuest = "17575808279489312312",
            startPort = "Out",
            endQuest = "17575808279489312313",
            endPort = "In"
          },
          {
            startQuest = "17575808279489312310",
            startPort = "Out",
            endQuest = "17575808279489312314",
            endPort = "In"
          },
          {
            startQuest = "1754643660402159",
            startPort = "QuestStart",
            endQuest = "17575808279489312312",
            endPort = "In"
          },
          {
            startQuest = "1754643660402159",
            startPort = "QuestStart",
            endQuest = "17575808279489312311",
            endPort = "In"
          },
          {
            startQuest = "1754643660402159",
            startPort = "QuestStart",
            endQuest = "17575808279489312310",
            endPort = "In"
          },
          {
            startQuest = "17575808445809312928",
            startPort = "Out",
            endQuest = "17575808445809312929",
            endPort = "In"
          },
          {
            startQuest = "17575808445809312930",
            startPort = "Out",
            endQuest = "17575808445819312931",
            endPort = "In"
          },
          {
            startQuest = "17575808445809312929",
            startPort = "Out",
            endQuest = "17575808445819312932",
            endPort = "In"
          },
          {
            startQuest = "17575808445819312932",
            startPort = "Out",
            endQuest = "17575808445809312930",
            endPort = "In"
          },
          {
            startQuest = "1754645634572598848",
            startPort = "Out",
            endQuest = "17575808445809312928",
            endPort = "In"
          },
          {
            startQuest = "17575808445819312931",
            startPort = "Out",
            endQuest = "1754643660402173",
            endPort = "Fail"
          },
          {
            startQuest = "17575808634189313608",
            startPort = "Out",
            endQuest = "17575808634189313609",
            endPort = "In"
          },
          {
            startQuest = "17575808634189313610",
            startPort = "Out",
            endQuest = "17575808634189313606",
            endPort = "Input_2"
          },
          {
            startQuest = "17575808634189313607",
            startPort = "Out",
            endQuest = "17575808634189313606",
            endPort = "Input_3"
          },
          {
            startQuest = "17575808634189313609",
            startPort = "Out",
            endQuest = "17575808634189313606",
            endPort = "Input_1"
          },
          {
            startQuest = "1754645345582597510",
            startPort = "Out",
            endQuest = "17575808634189313608",
            endPort = "In"
          },
          {
            startQuest = "1754645345582597510",
            startPort = "Out",
            endQuest = "17575808634189313610",
            endPort = "In"
          },
          {
            startQuest = "1754645345582597510",
            startPort = "Out",
            endQuest = "17575808634189313607",
            endPort = "In"
          },
          {
            startQuest = "17575808634189313606",
            startPort = "Out",
            endQuest = "1754645618821598517",
            endPort = "In"
          }
        },
        nodeData = {
          ["1754643660402159"] = {
            key = "1754643660402159",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754643660402166"] = {
            key = "1754643660402166",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4286.666739428489, y = 406.66669619525055},
            propsData = {ModeType = 0}
          },
          ["1754643660402173"] = {
            key = "1754643660402173",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2295.7302763273, y = 1202.3790734367685},
            propsData = {}
          },
          ["1754645345582597507"] = {
            key = "1754645345582597507",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1440.619612366182, y = 52.36523326643167},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12032001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1754645345582597508"] = {
            key = "1754645345582597508",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\141\161\231\143\138\229\190\183\230\139\137",
            pos = {x = 1432.3559046975427, y = 284.58558714626827},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191600}
            }
          },
          ["1754645345582597510"] = {
            key = "1754645345582597510",
            type = "GoToNode",
            name = "\232\162\171\229\176\143\229\165\179\229\173\169\229\143\171\228\189\143",
            pos = {x = 1777.9087026292705, y = 286.2750212753576},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191606,
              GuideType = "M",
              GuidePointName = "Mechanism_TriggerBox_Feina03_1191606"
            }
          },
          ["1754645618821598517"] = {
            key = "1754645618821598517",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3067.812692976267, y = 295.25765132357685},
            propsData = {}
          },
          ["1754645634572598848"] = {
            key = "1754645634572598848",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1264.3412217955226, y = 497.28531125153137},
            propsData = {}
          },
          ["17575808279489312310"] = {
            key = "17575808279489312310",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1211.4964523571505, y = -353.4370028574957},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["17575808279489312311"] = {
            key = "17575808279489312311",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1209.93149793056, y = -192.76249203307614},
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
          ["17575808279489312312"] = {
            key = "17575808279489312312",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1206.6923611089865, y = -520.2388546594469},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575808279489312313"] = {
            key = "17575808279489312313",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1482.8247756863757, y = -516.1165424220411},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575808279489312314"] = {
            key = "17575808279489312314",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1506.1891838166766, y = -362.3172212832942},
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
          ["17575808445809312928"] = {
            key = "17575808445809312928",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1609.069824902854, y = 705.570638666209},
            propsData = {}
          },
          ["17575808445809312929"] = {
            key = "17575808445809312929",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1850.7093146700531, y = 761.203244579388},
            propsData = {Duration = 3}
          },
          ["17575808445809312930"] = {
            key = "17575808445809312930",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1617.4939075100222, y = 1013.8894275022932},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575808445819312931"] = {
            key = "17575808445819312931",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1862.0691537655368, y = 1086.429361333791},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575808445819312932"] = {
            key = "17575808445819312932",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1747.4028226675289, y = 882},
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
          ["17575808634189313606"] = {
            key = "17575808634189313606",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2735.6045891175277, y = 255.9418419566904},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17575808634189313607"] = {
            key = "17575808634189313607",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 2273.427300239184, y = 439.8449298283297},
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
          ["17575808634189313608"] = {
            key = "17575808634189313608",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2165.6625946790696, y = 126.72991084529228},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575808634189313609"] = {
            key = "17575808634189313609",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2445.6737408190133, y = 124.07814709474711},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575808634189313610"] = {
            key = "17575808634189313610",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2277.895304168171, y = 306.4950732858676},
            propsData = {Duration = 3}
          }
        },
        commentData = {
          ["17575808381089312756"] = {
            key = "17575808381089312756",
            name = "Input Commment...",
            position = {x = 1143.9669252316316, y = -616.3717948717951},
            size = {width = 623.3333333333331, height = 578.3333333333334}
          },
          ["17575808513239313202"] = {
            key = "17575808513239313202",
            name = "Input Commment...",
            position = {x = 1549.7361560008621, y = 626.8333333333334},
            size = {width = 601.6666666666667, height = 601.6666666666666}
          },
          ["17575808902859314556"] = {
            key = "17575808902859314556",
            name = "Input Commment...",
            position = {x = 2085.3149105796174, y = 25.380952380952408},
            size = {width = 920.7692307692307, height = 602.3076923076923}
          }
        }
      }
    }
  },
  commentData = {}
}
