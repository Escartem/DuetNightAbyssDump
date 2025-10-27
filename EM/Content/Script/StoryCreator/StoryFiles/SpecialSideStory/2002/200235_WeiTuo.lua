return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17521132771961",
      startPort = "StoryStart",
      endStory = "17521181709543131",
      endPort = "In"
    },
    {
      startStory = "17521181709543131",
      startPort = "Success",
      endStory = "17524943673701790",
      endPort = "In"
    },
    {
      startStory = "17524943673701790",
      startPort = "Success",
      endStory = "17521132771975",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17521132771961"] = {
      isStoryNode = true,
      key = "17521132771961",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 650.0952347168908, y = 300.53968320926487},
      propsData = {QuestChainId = 200235},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17521132771975"] = {
      isStoryNode = true,
      key = "17521132771975",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1902, y = 304},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17521176846792117"] = {
      isStoryNode = true,
      key = "17521176846792117",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1543.6190477103544, y = -42},
      propsData = {
        QuestId = 20023503,
        QuestDescriptionComment = "\230\175\143\230\151\165\228\187\187\229\138\161",
        QuestDescription = "Description_200235_2",
        QuestDeatil = "Content_200235_2",
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
            startQuest = "17521176846802122",
            startPort = "QuestStart",
            endQuest = "17521348014304429292",
            endPort = "In"
          },
          {
            startQuest = "17521348014304429292",
            startPort = "Out",
            endQuest = "17521176846802123",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17521176846802122"] = {
            key = "17521176846802122",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17521176846802123"] = {
            key = "17521176846802123",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1876, y = 312},
            propsData = {ModeType = 0}
          },
          ["17521176846802124"] = {
            key = "17521176846802124",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1918, y = 592},
            propsData = {}
          },
          ["17521348014304429292"] = {
            key = "17521348014304429292",
            type = "WaitingCompleteSysGuideNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144\230\140\135\229\188\149",
            pos = {x = 1286, y = 294},
            propsData = {SystemGuideId = 2060}
          }
        },
        commentData = {}
      }
    },
    ["17521181709543131"] = {
      isStoryNode = true,
      key = "17521181709543131",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1138.1904763077332, y = 300.4286823001968},
      propsData = {
        QuestId = 20023501,
        QuestDescriptionComment = "\229\174\140\230\136\144\229\137\175\230\156\172",
        QuestDescription = "Description_200235_1",
        QuestDeatil = "Content_200235_1",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
        InRegionExportName = "",
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 50906,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 39
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17524943673701790"] = {
      isStoryNode = true,
      key = "17524943673701790",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1536, y = 282},
      propsData = {
        QuestId = 20023502,
        QuestDescriptionComment = "\229\164\156\232\136\170\230\137\139\229\134\140",
        QuestDescription = "Description_200235_2",
        QuestDeatil = "Content_200235_2",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 200235,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 20
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
