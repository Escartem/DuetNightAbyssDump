return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17569706136521",
      startPort = "StoryStart",
      endStory = "1756970626911131",
      endPort = "In"
    },
    {
      startStory = "1756970626911131",
      startPort = "Success",
      endStory = "1759027391059311649",
      endPort = "In"
    },
    {
      startStory = "1759027391059311649",
      startPort = "\230\156\170\229\144\136\230\136\144",
      endStory = "1756970728690606",
      endPort = "In"
    },
    {
      startStory = "1759027391059311649",
      startPort = "\229\183\178\229\144\136\230\136\144",
      endStory = "1759027518896313758",
      endPort = "In"
    },
    {
      startStory = "1759027518896313758",
      startPort = "Success",
      endStory = "17569706136535",
      endPort = "StoryEnd"
    },
    {
      startStory = "1756970728690606",
      startPort = "Success",
      endStory = "17569706136535",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17569706136521"] = {
      isStoryNode = true,
      key = "17569706136521",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 200236},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17569706136535"] = {
      isStoryNode = true,
      key = "17569706136535",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2412.85714988968, y = 319.99999963669546},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1756970626911131"] = {
      isStoryNode = true,
      key = "1756970626911131",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1134, y = 294.5714285973789},
      propsData = {
        QuestId = 20023601,
        QuestDescriptionComment = "\229\174\140\230\136\144\229\167\148\230\137\152\229\175\134\229\135\189",
        QuestDescription = "Description_200236_1",
        QuestDeatil = "Content_200236_1",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
        InRegionExportName = "",
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 20023601,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 66
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1756970728690606"] = {
      isStoryNode = true,
      key = "1756970728690606",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1873.7142872453546, y = 503.7142823407439},
      propsData = {
        QuestId = 20023602,
        QuestDescriptionComment = "\229\144\136\230\136\144\230\157\190\233\156\178",
        QuestDescription = "Description_200236_2",
        QuestDeatil = "Content_200236_2",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 20023603,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 4
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1759027391059311649"] = {
      isStoryNode = true,
      key = "1759027391059311649",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1478.5714327753808, y = 298.2857232904757},
      propsData = {
        QuestId = 20023603,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200236_1",
        QuestDeatil = "Content_200236_1",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
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
            startQuest = "1759027391059311650",
            startPort = "QuestStart",
            endQuest = "1759027437493312730",
            endPort = "In"
          },
          {
            startQuest = "1759027437493312730",
            startPort = "Success",
            endQuest = "1759027487200312995",
            endPort = "In"
          },
          {
            startQuest = "1759027437493312730",
            startPort = "Fail",
            endQuest = "1759027498720313257",
            endPort = "In"
          }
        },
        nodeData = {
          ["1759027391059311650"] = {
            key = "1759027391059311650",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1759027391059311653"] = {
            key = "1759027391059311653",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1759027391059311656"] = {
            key = "1759027391059311656",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1759027437493312730"] = {
            key = "1759027437493312730",
            type = "ConditionNode",
            name = "\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1264, y = 294},
            propsData = {ConditionId = 20023600}
          },
          ["1759027487200312995"] = {
            key = "1759027487200312995",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 1842, y = 182},
            propsData = {PortName = "\229\183\178\229\144\136\230\136\144"}
          },
          ["1759027498720313257"] = {
            key = "1759027498720313257",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 1806, y = 536},
            propsData = {PortName = "\230\156\170\229\144\136\230\136\144"}
          }
        },
        commentData = {}
      }
    },
    ["1759027518896313758"] = {
      isStoryNode = true,
      key = "1759027518896313758",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1894.285710938123, y = 205.42858212010367},
      propsData = {
        QuestId = 20023604,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200236_2",
        QuestDeatil = "Content_200236_2",
        TaskRegionReName = "UI_REGION_NAME_2101",
        TaskSubRegionReName = "UI_SUBREGION_NAME_210101",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "1759027518896313759",
            startPort = "QuestStart",
            endQuest = "1759027518896313762",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1759027518896313759"] = {
            key = "1759027518896313759",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1759027518896313762"] = {
            key = "1759027518896313762",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1244, y = 298},
            propsData = {ModeType = 0}
          },
          ["1759027518896313765"] = {
            key = "1759027518896313765",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
