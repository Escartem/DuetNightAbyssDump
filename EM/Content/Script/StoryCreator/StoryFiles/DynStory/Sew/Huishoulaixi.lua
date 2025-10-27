return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210501461233",
      startPort = "StoryStart",
      endStory = "1732783210501461235",
      endPort = "In"
    },
    {
      startStory = "1732783210501461235",
      startPort = "Success",
      endStory = "1732783210501461234",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210501461233"] = {
      isStoryNode = true,
      key = "1732783210501461233",
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
    ["1732783210501461234"] = {
      isStoryNode = true,
      key = "1732783210501461234",
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
    ["1732783210501461235"] = {
      isStoryNode = true,
      key = "1732783210501461235",
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
            startQuest = "1732783210501461236",
            startPort = "QuestStart",
            endQuest = "1732783210501461239",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461239",
            startPort = "Out",
            endQuest = "1732783210501461240",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461239",
            startPort = "Out",
            endQuest = "1732783210501461241",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461240",
            startPort = "Out",
            endQuest = "1732783210501461242",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461242",
            startPort = "Out",
            endQuest = "1732783210501461243",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461243",
            startPort = "Out",
            endQuest = "1732783210501461244",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461245",
            startPort = "Out",
            endQuest = "1732783210501461237",
            endPort = "Success"
          },
          {
            startQuest = "1732783210501461246",
            startPort = "Out",
            endQuest = "1732783210501461245",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461239",
            startPort = "Out",
            endQuest = "1732783210501461246",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461247",
            startPort = "Out",
            endQuest = "1732783210501461248",
            endPort = "In"
          },
          {
            startQuest = "1732783210501461244",
            startPort = "Out",
            endQuest = "1732783210501461247",
            endPort = "In"
          }
        },
        nodeData = {
          ["1732783210501461236"] = {
            key = "1732783210501461236",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210501461237"] = {
            key = "1732783210501461237",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2097.3856788372923, y = 528.2860687699398},
            propsData = {ModeType = 0}
          },
          ["1732783210501461238"] = {
            key = "1732783210501461238",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3318.4863523573204, y = 501.46401985111663},
            propsData = {}
          },
          ["1732783210501461239"] = {
            key = "1732783210501461239",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1120.0735853227238, y = 305.2493452871508},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720171}
            }
          },
          ["1732783210501461240"] = {
            key = "1732783210501461240",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1514.4090691936913, y = 314.9267646419895},
            propsData = {WaitTime = 2}
          },
          ["1732783210501461241"] = {
            key = "1732783210501461241",
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
          ["1732783210501461242"] = {
            key = "1732783210501461242",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1856.0219724194974, y = 314.92676464198956},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720172, 1720173}
            }
          },
          ["1732783210501461243"] = {
            key = "1732783210501461243",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2172.9768111291737, y = 314.19128077102187},
            propsData = {WaitTime = 2.5}
          },
          ["1732783210501461244"] = {
            key = "1732783210501461244",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2515.054230484013, y = 312.80517655265953},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1720174, 1720175}
            }
          },
          ["1732783210501461245"] = {
            key = "1732783210501461245",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 1798.2215470384288, y = 520.0614686476614},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1732783210501461246"] = {
            key = "1732783210501461246",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1458.4422134687716, y = 540.2161616249355},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 8,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1720171,
                1720172,
                1720173,
                1720174,
                1720175,
                1720176,
                1720177,
                1720178
              }
            }
          },
          ["1732783210501461247"] = {
            key = "1732783210501461247",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2825.663107859882, y = 312.14522574199987},
            propsData = {WaitTime = 2.5}
          },
          ["1732783210501461248"] = {
            key = "1732783210501461248",
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
                1720176,
                1720177,
                1720178
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
