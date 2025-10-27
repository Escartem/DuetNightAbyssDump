return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17426394762491",
      startPort = "StoryStart",
      endStory = "1742639620973174",
      endPort = "In"
    },
    {
      startStory = "1742639620973174",
      startPort = "Success",
      endStory = "17426394762495",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17426394762491"] = {
      isStoryNode = true,
      key = "17426394762491",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 400101},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17426394762495"] = {
      isStoryNode = true,
      key = "17426394762495",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1544.0000000000005, y = 318},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742639620973174"] = {
      isStoryNode = true,
      key = "1742639620973174",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1209.4010695187167, y = 317.94117647058823},
      propsData = {
        QuestId = 4001011,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_400101",
        QuestDeatil = "QuestDesc_400101",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_EastAc1_1240711",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17426402310601628",
            startPort = "Out",
            endQuest = "17426402581831660",
            endPort = "In"
          },
          {
            startQuest = "17426402581831660",
            startPort = "Out",
            endQuest = "1742639620974182",
            endPort = "Success"
          },
          {
            startQuest = "1742639620973175",
            startPort = "QuestStart",
            endQuest = "17426403316832221",
            endPort = "In"
          },
          {
            startQuest = "17426403316832221",
            startPort = "Out",
            endQuest = "17426402310601628",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742639620973175"] = {
            key = "1742639620973175",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1742639620974182"] = {
            key = "1742639620974182",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1666.888888888889, y = 311.77777777777777},
            propsData = {ModeType = 0}
          },
          ["1742639620974189"] = {
            key = "1742639620974189",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17426402310601628"] = {
            key = "17426402310601628",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 1012.5302431324196, y = 454.583995224142},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240712,
                1240713,
                1240714,
                1240715,
                1240716,
                1240731
              }
            }
          },
          ["17426402581831660"] = {
            key = "17426402581831660",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1306.8138688634137, y = 438.0737273062854},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240712,
                1240713,
                1240714,
                1240715,
                1240716,
                1240731
              }
            }
          },
          ["17426403316832221"] = {
            key = "17426403316832221",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1130.451855171814, y = 186.41868280093897},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240711,
              GuideType = "M",
              GuidePointName = "Mechanism_EastAc1_1240711"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
