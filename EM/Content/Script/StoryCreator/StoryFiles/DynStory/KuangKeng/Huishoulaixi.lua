return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210485457700",
      startPort = "StoryStart",
      endStory = "1732783210485457702",
      endPort = "In"
    },
    {
      startStory = "1732783210485457702",
      startPort = "Success",
      endStory = "1732783210485457701",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210485457700"] = {
      isStoryNode = true,
      key = "1732783210485457700",
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
    ["1732783210485457701"] = {
      isStoryNode = true,
      key = "1732783210485457701",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1528.4615384615383, y = 273.4615384615385},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210485457702"] = {
      isStoryNode = true,
      key = "1732783210485457702",
      type = "StoryNode",
      name = "\231\167\189\229\133\189\230\157\165\232\162\173",
      pos = {x = 1157.2083333333333, y = 286.14946018893386},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_BalconyHuishoulaixi_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1732783210485457703",
            startPort = "QuestStart",
            endQuest = "1732783210485457706",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457706",
            startPort = "Out",
            endQuest = "1732783210485457707",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457706",
            startPort = "Out",
            endQuest = "1732783210485457708",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457707",
            startPort = "Out",
            endQuest = "1732783210485457709",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457709",
            startPort = "Out",
            endQuest = "1732783210485457710",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457710",
            startPort = "Out",
            endQuest = "1732783210485457711",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457712",
            startPort = "Out",
            endQuest = "1732783210485457704",
            endPort = "Success"
          },
          {
            startQuest = "1732783210485457713",
            startPort = "Out",
            endQuest = "1732783210485457712",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457706",
            startPort = "Out",
            endQuest = "1732783210485457713",
            endPort = "In"
          },
          {
            startQuest = "17259520394885252",
            startPort = "Out",
            endQuest = "17259520394885253",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457711",
            startPort = "Out",
            endQuest = "17259520394885252",
            endPort = "In"
          }
        },
        nodeData = {
          ["17259520394885252"] = {
            key = "17259520394885252",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2825.663107859882, y = 312.14522574199987},
            propsData = {WaitTime = 2.5}
          },
          ["17259520394885253"] = {
            key = "17259520394885253",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3167.740527214721, y = 310.75912152363753},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1310083,
                1310084,
                1310085
              }
            }
          },
          ["1732783210485457703"] = {
            key = "1732783210485457703",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210485457704"] = {
            key = "1732783210485457704",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2097.3856788372923, y = 528.2860687699398},
            propsData = {ModeType = 0}
          },
          ["1732783210485457705"] = {
            key = "1732783210485457705",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3318.4863523573204, y = 501.46401985111663},
            propsData = {}
          },
          ["1732783210485457706"] = {
            key = "1732783210485457706",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1120.0735853227238, y = 305.2493452871508},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310078}
            }
          },
          ["1732783210485457707"] = {
            key = "1732783210485457707",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1514.4090691936913, y = 314.9267646419895},
            propsData = {WaitTime = 2}
          },
          ["1732783210485457708"] = {
            key = "1732783210485457708",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1500.0790443797955, y = 94.09549913330466},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001101,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1732783210485457709"] = {
            key = "1732783210485457709",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1856.0219724194974, y = 314.92676464198956},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310079, 1310080}
            }
          },
          ["1732783210485457710"] = {
            key = "1732783210485457710",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2170.4768111291737, y = 314.19128077102187},
            propsData = {WaitTime = 2.5}
          },
          ["1732783210485457711"] = {
            key = "1732783210485457711",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2515.054230484013, y = 312.80517655265953},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1310081, 1310082}
            }
          },
          ["1732783210485457712"] = {
            key = "1732783210485457712",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 1798.2215470384288, y = 520.0614686476614},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1732783210485457713"] = {
            key = "1732783210485457713",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1454.6922134687716, y = 540.2161616249355},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 8,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1310078,
                1310079,
                1310080,
                1310081,
                1310082,
                1310083,
                1310084,
                1310085
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
