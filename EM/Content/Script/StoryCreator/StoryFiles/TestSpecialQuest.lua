return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1711682524989385",
      startPort = "StoryStart",
      endStory = "17117012165941001",
      endPort = "In"
    },
    {
      startStory = "17117012165941001",
      startPort = "Success",
      endStory = "1711682524989388",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1711682524989385"] = {
      isStoryNode = true,
      key = "1711682524989385",
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
    ["1711682524989388"] = {
      isStoryNode = true,
      key = "1711682524989388",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1467.0833333333333, y = 309.09722222222223},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17117012165941001"] = {
      isStoryNode = true,
      key = "17117012165941001",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1109.3350364936207, y = 278.22984571402924},
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
            startQuest = "17117012165951002",
            startPort = "QuestStart",
            endQuest = "17117012613153065",
            endPort = "In"
          },
          {
            startQuest = "17117012613153065",
            startPort = "Out",
            endQuest = "171196653806190558",
            endPort = "Input"
          },
          {
            startQuest = "17117012165951002",
            startPort = "QuestStart",
            endQuest = "1712716460949513",
            endPort = "In"
          },
          {
            startQuest = "1712716460949513",
            startPort = "Out",
            endQuest = "17117012262431578",
            endPort = "Input"
          },
          {
            startQuest = "171196653806190558",
            startPort = "Out",
            endQuest = "17117012165951006",
            endPort = "Fail"
          },
          {
            startQuest = "17117012262431578",
            startPort = "Out",
            endQuest = "17117012441382391",
            endPort = "In"
          },
          {
            startQuest = "17117012360921863",
            startPort = "Out",
            endQuest = "17117012794184315",
            endPort = "In"
          }
        },
        nodeData = {
          ["17117012165951002"] = {
            key = "17117012165951002",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 288.8888888888889, y = 294.05555555555554},
            propsData = {ModeType = 0}
          },
          ["17117012165951004"] = {
            key = "17117012165951004",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2371.4285714285716, y = 292.85714285714283},
            propsData = {ModeType = 0}
          },
          ["17117012165951006"] = {
            key = "17117012165951006",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2397.518796992481, y = 635.2631578947369},
            propsData = {}
          },
          ["17117012262431578"] = {
            key = "17117012262431578",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 953.7794809380654, y = 297.67429015847375},
            propsData = {
              Text = "\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\228\186\134"
            }
          },
          ["17117012360921863"] = {
            key = "17117012360921863",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1791.0096396682238, y = 270.5314330156165},
            propsData = {
              Text = "\231\137\185\230\174\138\228\187\187\229\138\161\229\174\140\230\136\144\228\186\134"
            }
          },
          ["17117012441382391"] = {
            key = "17117012441382391",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1401.1604333190178, y = 284.99419247837596},
            propsData = {WaitTime = 6}
          },
          ["17117012613153065"] = {
            key = "17117012613153065",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1123.7794809380653, y = 639.3117170590585},
            propsData = {}
          },
          ["17117012794184315"] = {
            key = "17117012794184315",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2037.8477349063196, y = 291.9520679362514},
            propsData = {}
          },
          ["171196653806190558"] = {
            key = "171196653806190558",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1642.3333333333333, y = 639.6666666666666},
            propsData = {
              Text = "\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165"
            }
          },
          ["1712647959696922"] = {
            key = "1712647959696922",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1187.8319787797343, y = 119.70126949074314},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {101}
            }
          },
          ["1712716460949513"] = {
            key = "1712716460949513",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 627.7549019607843, y = 263.7720588235294},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
