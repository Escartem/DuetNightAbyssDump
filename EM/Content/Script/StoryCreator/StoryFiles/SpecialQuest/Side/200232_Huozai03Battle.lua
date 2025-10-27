return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17509208618711",
      startPort = "StoryStart",
      endStory = "1750921730819632",
      endPort = "In"
    },
    {
      startStory = "1750921730819632",
      startPort = "Success",
      endStory = "17509208618725",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17509208618711"] = {
      isStoryNode = true,
      key = "17509208618711",
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
    ["17509208618725"] = {
      isStoryNode = true,
      key = "17509208618725",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1540, y = 296},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750921730819632"] = {
      isStoryNode = true,
      key = "1750921730819632",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1156, y = 288},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200232_6",
        QuestDeatil = "Content_200232_6",
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
            startQuest = "1750921730819633",
            startPort = "QuestStart",
            endQuest = "1750924825824658231",
            endPort = "In"
          },
          {
            startQuest = "1750924825824658231",
            startPort = "Out",
            endQuest = "1750925065479658384",
            endPort = "In"
          },
          {
            startQuest = "1750925065479658384",
            startPort = "Out",
            endQuest = "1750925099035658992",
            endPort = "In"
          },
          {
            startQuest = "1750921730819633",
            startPort = "QuestStart",
            endQuest = "1750925112875659312",
            endPort = "In"
          },
          {
            startQuest = "1750925112875659312",
            startPort = "Out",
            endQuest = "1750921730820647",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1750921730819633"] = {
            key = "1750921730819633",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750921730820640"] = {
            key = "1750921730820640",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2550, y = 270},
            propsData = {ModeType = 0}
          },
          ["1750921730820647"] = {
            key = "1750921730820647",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2152, y = 620},
            propsData = {}
          },
          ["1750924825824658231"] = {
            key = "1750924825824658231",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\152\187\230\140\160\231\154\132\230\128\170\231\137\169",
            pos = {x = 1328, y = 304},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240906,
                1240907,
                1240908,
                1240909,
                1240910,
                1240911,
                1240912,
                1240913,
                1240914,
                1240915
              }
            }
          },
          ["1750925065479658384"] = {
            key = "1750925065479658384",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1850, y = 284},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 10,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240906,
                1240907,
                1240908,
                1240909,
                1240910,
                1240911,
                1240912,
                1240913,
                1240914,
                1240915
              }
            }
          },
          ["1750925099035658992"] = {
            key = "1750925099035658992",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2252, y = 276},
            propsData = {}
          },
          ["1750925112875659312"] = {
            key = "1750925112875659312",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1666, y = 626},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
