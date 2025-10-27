return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536988611639911",
      startPort = "StoryStart",
      endStory = "171851536988611639913",
      endPort = "In"
    },
    {
      startStory = "171851536988611639913",
      startPort = "Success",
      endStory = "171851536988611639912",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536988611639911"] = {
      isStoryNode = true,
      key = "171851536988611639911",
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
    ["171851536988611639912"] = {
      isStoryNode = true,
      key = "171851536988611639912",
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
    ["171851536988611639913"] = {
      isStoryNode = true,
      key = "171851536988611639913",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1167.8500000000001, y = 294.894671169903},
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
            startQuest = "171851536988611639914",
            startPort = "QuestStart",
            endQuest = "171851536988611639917",
            endPort = "In"
          },
          {
            startQuest = "17546419695221488164",
            startPort = "Option_1",
            endQuest = "17546419695221488165",
            endPort = "In"
          },
          {
            startQuest = "17546419695221488164",
            startPort = "Option_2",
            endQuest = "17546419695221488166",
            endPort = "In"
          },
          {
            startQuest = "171851536988611639917",
            startPort = "Out",
            endQuest = "171851536988611639915",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851536988611639914"] = {
            key = "171851536988611639914",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["171851536988611639915"] = {
            key = "171851536988611639915",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["171851536988611639916"] = {
            key = "171851536988611639916",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["171851536988611639917"] = {
            key = "171851536988611639917",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1155.6679841897237, y = 332.2762917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100301,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546419695221488164"] = {
            key = "17546419695221488164",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 900.5388755980862, y = 693.7184045537042},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100301,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100304",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100306",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546419695221488165"] = {
            key = "17546419695221488165",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1231.4479665071772, y = 650.0820409173405},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100305,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546419695221488166"] = {
            key = "17546419695221488166",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1229.0498473849198, y = 820.2074327668702},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100307,
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
