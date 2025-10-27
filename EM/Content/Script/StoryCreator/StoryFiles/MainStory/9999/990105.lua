return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979419216995",
      startPort = "StoryStart",
      endStory = "1704175979419216997",
      endPort = "In"
    },
    {
      startStory = "1704175979419216997",
      startPort = "Success",
      endStory = "1704175979419216998",
      endPort = "In"
    },
    {
      startStory = "1704175979419216998",
      startPort = "Success",
      endStory = "1704175979419216996",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175979419216995"] = {
      isStoryNode = true,
      key = "1704175979419216995",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -72.63815140569092, y = 227.27272727272728},
      propsData = {QuestChainId = 990105},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979419216996"] = {
      isStoryNode = true,
      key = "1704175979419216996",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 847.3942042163912, y = 323.4469054577786},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979419216997"] = {
      isStoryNode = true,
      key = "1704175979419216997",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\228\187\187\229\138\161\229\144\175\229\138\168",
      pos = {x = 255.6737967914437, y = 297.1737967914442},
      propsData = {
        QuestId = 99010501,
        QuestDescriptionComment = "\232\153\154\231\169\186\226\128\166\226\128\166",
        QuestDescription = "Description_100101_0",
        QuestDeatil = "Description_100101_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
            startQuest = "1704175979419216999",
            startPort = "QuestStart",
            endQuest = "1704175979419217003",
            endPort = "In"
          },
          {
            startQuest = "1704175979419217003",
            startPort = "Out",
            endQuest = "1704175979419217002",
            endPort = "In"
          },
          {
            startQuest = "1704175979419217003",
            startPort = "Out",
            endQuest = "1704175979419217004",
            endPort = "In"
          },
          {
            startQuest = "1704175979419217004",
            startPort = "Out",
            endQuest = "1704175979419217000",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979419216999"] = {
            key = "1704175979419216999",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 192.72727272727275, y = 149.54545454545453},
            propsData = {ModeType = 0}
          },
          ["1704175979419217000"] = {
            key = "1704175979419217000",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1242.235825901359, y = 167.57985974925455},
            propsData = {ModeType = 0}
          },
          ["1704175979419217001"] = {
            key = "1704175979419217001",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175979419217002"] = {
            key = "1704175979419217002",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 789.7368421052632, y = -46.746411483253645},
            propsData = {
              ShowEnable = true,
              MessageId = 990003,
              MessageNote = "",
              LastTime = 5,
              Style = "Normal"
            }
          },
          ["1704175979419217003"] = {
            key = "1704175979419217003",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 530.1606205411229, y = 147.7114012653126},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1000010,
              GuideType = "N",
              GuidePointName = "TestQuest_10"
            }
          },
          ["1704175979419217004"] = {
            key = "1704175979419217004",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 872.7921994884913, y = 157.18508547583895},
            propsData = {WaitTime = 0.5}
          }
        },
        commentData = {}
      }
    },
    ["1704175979419216998"] = {
      isStoryNode = true,
      key = "1704175979419216998",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\228\187\187\229\138\161\229\144\175\229\138\168",
      pos = {x = 546.0948533563623, y = 291.6803156461263},
      propsData = {
        QuestId = 99010502,
        QuestDescriptionComment = "\232\153\154\231\169\186\226\128\166\226\128\166",
        QuestDescription = "Description_100101_0",
        QuestDeatil = "Description_100101_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = false,
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
            startQuest = "1704175979419217005",
            startPort = "QuestStart",
            endQuest = "1704175979419217009",
            endPort = "In"
          },
          {
            startQuest = "1704175979419217009",
            startPort = "Out",
            endQuest = "1704175979419217008",
            endPort = "In"
          },
          {
            startQuest = "1704175979419217009",
            startPort = "Out",
            endQuest = "1704175979419217010",
            endPort = "In"
          },
          {
            startQuest = "1704175979419217010",
            startPort = "Out",
            endQuest = "1704175979419217006",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979419217005"] = {
            key = "1704175979419217005",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 192.72727272727275, y = 149.54545454545453},
            propsData = {ModeType = 0}
          },
          ["1704175979419217006"] = {
            key = "1704175979419217006",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1242.235825901359, y = 167.57985974925455},
            propsData = {ModeType = 0}
          },
          ["1704175979419217007"] = {
            key = "1704175979419217007",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175979419217008"] = {
            key = "1704175979419217008",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 789.7368421052632, y = -46.746411483253645},
            propsData = {
              ShowEnable = true,
              MessageId = 990003,
              MessageNote = "",
              LastTime = 5,
              Style = "Normal"
            }
          },
          ["1704175979419217009"] = {
            key = "1704175979419217009",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 530.1606205411229, y = 147.7114012653126},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1000011,
              GuideType = "N",
              GuidePointName = "TestQuest_11"
            }
          },
          ["1704175979419217010"] = {
            key = "1704175979419217010",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 872.7921994884913, y = 157.18508547583895},
            propsData = {WaitTime = 0.5}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
