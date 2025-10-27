return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754303988207560053",
      startPort = "StoryStart",
      endStory = "1754303988207560055",
      endPort = "In"
    },
    {
      startStory = "1754303988207560055",
      startPort = "Success",
      endStory = "1754303988207560054",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754303988207560053"] = {
      isStoryNode = true,
      key = "1754303988207560053",
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
    ["1754303988207560054"] = {
      isStoryNode = true,
      key = "1754303988207560054",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1624.5454545454545, y = 313.6363636363636},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754303988207560055"] = {
      isStoryNode = true,
      key = "1754303988207560055",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1168.8500000000001, y = 292.894671169903},
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
            startQuest = "1754303988207560056",
            startPort = "QuestStart",
            endQuest = "1754303988207560059",
            endPort = "In"
          },
          {
            startQuest = "175464433652312791156",
            startPort = "Option_1",
            endQuest = "175464433652312791157",
            endPort = "In"
          },
          {
            startQuest = "175464433652312791156",
            startPort = "Option_2",
            endQuest = "175464433652312791158",
            endPort = "In"
          },
          {
            startQuest = "1754303988207560059",
            startPort = "Out",
            endQuest = "1754303988207560057",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754303988207560056"] = {
            key = "1754303988207560056",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1754303988207560057"] = {
            key = "1754303988207560057",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1754303988207560058"] = {
            key = "1754303988207560058",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1754303988207560059"] = {
            key = "1754303988207560059",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1057.9179841897237, y = 351.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102301,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464433652312791156"] = {
            key = "175464433652312791156",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 911.1272214627479, y = 711.6629534258843},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102301,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102305",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102308",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464433652312791157"] = {
            key = "175464433652312791157",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1247.4648838004102, y = 665.5980183609493},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102306,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464433652312791158"] = {
            key = "175464433652312791158",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1243.6381932495815, y = 838.1519816390504},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102309,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
