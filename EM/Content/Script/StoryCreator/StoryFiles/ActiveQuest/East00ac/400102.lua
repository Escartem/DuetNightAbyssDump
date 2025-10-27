return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17426411468721349799",
      startPort = "StoryStart",
      endStory = "17426411468721349801",
      endPort = "In"
    },
    {
      startStory = "17426411468721349801",
      startPort = "Success",
      endStory = "17426411468721349800",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17426411468721349799"] = {
      isStoryNode = true,
      key = "17426411468721349799",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 301.0344827586207},
      propsData = {QuestChainId = 400102},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17426411468721349800"] = {
      isStoryNode = true,
      key = "17426411468721349800",
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
    ["17426411468721349801"] = {
      isStoryNode = true,
      key = "17426411468721349801",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1209.4010695187167, y = 319.22459893048125},
      propsData = {
        QuestId = 4001021,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_400102",
        QuestDeatil = "QuestDesc_400102",
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
        StoryGuidePointName = "Mechanism_EastAc2_1240717",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17426411468721349806",
            startPort = "Out",
            endQuest = "17426411468721349803",
            endPort = "Success"
          },
          {
            startQuest = "17426411468721349802",
            startPort = "QuestStart",
            endQuest = "17426411468721349807",
            endPort = "In"
          },
          {
            startQuest = "17426411468721349807",
            startPort = "Out",
            endQuest = "17426411468721349808",
            endPort = "In"
          },
          {
            startQuest = "17426411468721349808",
            startPort = "Out",
            endQuest = "17426411468721349806",
            endPort = "In"
          }
        },
        nodeData = {
          ["17426411468721349802"] = {
            key = "17426411468721349802",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17426411468721349803"] = {
            key = "17426411468721349803",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1666.888888888889, y = 311.77777777777777},
            propsData = {ModeType = 0}
          },
          ["17426411468721349804"] = {
            key = "17426411468721349804",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17426411468721349806"] = {
            key = "17426411468721349806",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1274.6926567422015, y = 426.179787912346},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240718,
                1240719,
                1240720,
                1240721,
                1240722,
                1240730
              }
            }
          },
          ["17426411468721349807"] = {
            key = "17426411468721349807",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1130.451855171814, y = 186.41868280093897},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240717,
              GuideType = "M",
              GuidePointName = "Mechanism_EastAc2_1240717"
            }
          },
          ["17426411468721349808"] = {
            key = "17426411468721349808",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 873.0099947066979, y = 444.07195975654156},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240718,
                1240719,
                1240720,
                1240721,
                1240722,
                1240730
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
