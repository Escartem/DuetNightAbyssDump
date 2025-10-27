return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900308689482",
      startPort = "StoryStart",
      endStory = "1739608900308689484",
      endPort = "In"
    },
    {
      startStory = "1739608900308689484",
      startPort = "Success",
      endStory = "1739608900308689483",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900308689482"] = {
      isStoryNode = true,
      key = "1739608900308689482",
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
    ["1739608900308689483"] = {
      isStoryNode = true,
      key = "1739608900308689483",
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
    ["1739608900308689484"] = {
      isStoryNode = true,
      key = "1739608900308689484",
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
            startQuest = "1739608900308689486",
            startPort = "QuestStart",
            endQuest = "1739608900308689489",
            endPort = "In"
          },
          {
            startQuest = "17546439916489815738",
            startPort = "Option_1",
            endQuest = "17546439916489815739",
            endPort = "In"
          },
          {
            startQuest = "17546439916489815738",
            startPort = "Option_2",
            endQuest = "17546439916489815740",
            endPort = "In"
          },
          {
            startQuest = "17546439916489815738",
            startPort = "Option_3",
            endQuest = "17546439916489815737",
            endPort = "In"
          },
          {
            startQuest = "1739608900308689489",
            startPort = "Out",
            endQuest = "1739608900308689487",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900308689486"] = {
            key = "1739608900308689486",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900308689487"] = {
            key = "1739608900308689487",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900308689488"] = {
            key = "1739608900308689488",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900308689489"] = {
            key = "1739608900308689489",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1148.599802371542, y = 353.29901899599014},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546439916489815737"] = {
            key = "17546439916489815737",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1236.1753172456831, y = 1183.6793858629371},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101613,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546439916489815738"] = {
            key = "17546439916489815738",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 906.3759101310588, y = 889.314373238374},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101602",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101606",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101612",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546439916489815739"] = {
            key = "17546439916489815739",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1241.2850010401498, y = 844.6780096020102},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101603,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546439916489815740"] = {
            key = "17546439916489815740",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1238.8868819178924, y = 1015.8034014515399},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101607,
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
