return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783211067619161",
      startPort = "StoryStart",
      endStory = "1732783211067619163",
      endPort = "In"
    },
    {
      startStory = "1732783211067619163",
      startPort = "Success",
      endStory = "1732783211067619162",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783211067619161"] = {
      isStoryNode = true,
      key = "1732783211067619161",
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
    ["1732783211067619162"] = {
      isStoryNode = true,
      key = "1732783211067619162",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1583.3333333333333, y = 301.6666666666667},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783211067619163"] = {
      isStoryNode = true,
      key = "1732783211067619163",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1218.0478192493704, y = 289.0876656393516},
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
            startQuest = "1732783211067619164",
            startPort = "QuestStart",
            endQuest = "1734678041247910339",
            endPort = "In"
          },
          {
            startQuest = "1734678041247910339",
            startPort = "Out",
            endQuest = "1732783211067619165",
            endPort = "Success"
          },
          {
            startQuest = "1732783211067619164",
            startPort = "QuestStart",
            endQuest = "1734678052120910635",
            endPort = "In"
          }
        },
        nodeData = {
          ["1732783211067619164"] = {
            key = "1732783211067619164",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783211067619165"] = {
            key = "1732783211067619165",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2261.2428129146397, y = 299.1596638655462},
            propsData = {ModeType = 0}
          },
          ["1732783211067619166"] = {
            key = "1732783211067619166",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2233.949579831933, y = 494.4537815126051},
            propsData = {}
          },
          ["1734678041247910339"] = {
            key = "1734678041247910339",
            type = "TalkNode",
            name = "\229\188\128\232\189\166-\232\190\190\232\138\153\230\182\133\230\177\130\229\138\169",
            pos = {x = 1433.2631578947367, y = 427.2631578947368},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["1734678052120910635"] = {
            key = "1734678052120910635",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1421.8947368421052, y = 220.21052631578942},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 2,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/snapshot/story/ex01_vo_behind_door.ex01_vo_behind_door'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
