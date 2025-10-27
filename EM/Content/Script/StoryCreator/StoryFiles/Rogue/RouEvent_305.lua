return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536990211640099",
      startPort = "StoryStart",
      endStory = "171851536990211640101",
      endPort = "In"
    },
    {
      startStory = "171851536990211640101",
      startPort = "Success",
      endStory = "171851536990211640100",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536990211640099"] = {
      isStoryNode = true,
      key = "171851536990211640099",
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
    ["171851536990211640100"] = {
      isStoryNode = true,
      key = "171851536990211640100",
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
    ["171851536990211640101"] = {
      isStoryNode = true,
      key = "171851536990211640101",
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
            startQuest = "171851536990211640102",
            startPort = "QuestStart",
            endQuest = "171851536990211640105",
            endPort = "In"
          },
          {
            startQuest = "17546422173602677919",
            startPort = "Option_1",
            endQuest = "17546422173602677920",
            endPort = "In"
          },
          {
            startQuest = "17546422173602677919",
            startPort = "Option_2",
            endQuest = "17546422173602677921",
            endPort = "In"
          },
          {
            startQuest = "17546422173602677919",
            startPort = "Option_3",
            endQuest = "17546422173602677922",
            endPort = "In"
          },
          {
            startQuest = "171851536990211640105",
            startPort = "Out",
            endQuest = "171851536990211640103",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851536990211640102"] = {
            key = "171851536990211640102",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["171851536990211640103"] = {
            key = "171851536990211640103",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["171851536990211640104"] = {
            key = "171851536990211640104",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["171851536990211640105"] = {
            key = "171851536990211640105",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1141.6402064119459, y = 343.2485139454851},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546422173602677919"] = {
            key = "17546422173602677919",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 983.6669902688205, y = 889.3955964900775},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100504",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100506",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100508",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546422173602677920"] = {
            key = "17546422173602677920",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1314.5760811779114, y = 845.7592328537138},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100505,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546422173602677921"] = {
            key = "17546422173602677921",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1312.177962055654, y = 1015.8846247032435},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100507,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546422173602677922"] = {
            key = "17546422173602677922",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1314.1720830021736, y = 1203.2923816898915},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100509,
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
