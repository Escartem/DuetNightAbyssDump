return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17455729469881304097",
      startPort = "StoryStart",
      endStory = "17455729469881304099",
      endPort = "In"
    },
    {
      startStory = "17455729469881304099",
      startPort = "Success",
      endStory = "17455729469881304098",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17455729469881304097"] = {
      isStoryNode = true,
      key = "17455729469881304097",
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
    ["17455729469881304098"] = {
      isStoryNode = true,
      key = "17455729469881304098",
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
    ["17455729469881304099"] = {
      isStoryNode = true,
      key = "17455729469881304099",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1170.2136363636364, y = 289.53103480626663},
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
            startQuest = "17455729469881304100",
            startPort = "QuestStart",
            endQuest = "17455729469881304103",
            endPort = "In"
          },
          {
            startQuest = "17545537031693022555",
            startPort = "Option_1",
            endQuest = "17545537031693022556",
            endPort = "In"
          },
          {
            startQuest = "17455729469881304103",
            startPort = "Out",
            endQuest = "17455729469881304101",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17455729469881304100"] = {
            key = "17455729469881304100",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.2213438735179, y = 356.39877031181385},
            propsData = {ModeType = 0}
          },
          ["17455729469881304101"] = {
            key = "17455729469881304101",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1741.979020979021, y = 384.3887289181407},
            propsData = {ModeType = 0}
          },
          ["17455729469881304102"] = {
            key = "17455729469881304102",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1662.070707070707, y = 647.7886002886003},
            propsData = {}
          },
          ["17455729469881304103"] = {
            key = "17455729469881304103",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1059.0572338289735, y = 350.744269823594},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200701,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545537031693022555"] = {
            key = "17545537031693022555",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 955.9818386927086, y = 691.94905798872},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200701,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200707",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17545537031693022556"] = {
            key = "17545537031693022556",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1268.0181613072916, y = 732.0509420112799},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200708,
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
