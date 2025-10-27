return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17255300525185757751",
      startPort = "StoryStart",
      endStory = "17255300579695757969",
      endPort = "In"
    },
    {
      startStory = "17255300579695757969",
      startPort = "Success",
      endStory = "17255300525185757754",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17255300525185757751"] = {
      isStoryNode = true,
      key = "17255300525185757751",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1238.461538461538, y = 355.38461538461536},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17255300525185757754"] = {
      isStoryNode = true,
      key = "17255300525185757754",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1828.4615384615392, y = 355.3846153846153},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17255300579695757969"] = {
      isStoryNode = true,
      key = "17255300579695757969",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1518.1225085226179, y = 317.4616000567391},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110111_12",
        QuestDeatil = "Content_110111_6",
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
            startQuest = "17255300579695757970",
            startPort = "QuestStart",
            endQuest = "17255300807435759012",
            endPort = "In"
          },
          {
            startQuest = "17255300579695757970",
            startPort = "QuestStart",
            endQuest = "1732510695422411019",
            endPort = "In"
          },
          {
            startQuest = "1732510695422411019",
            startPort = "Out",
            endQuest = "1732510655925207476",
            endPort = "In"
          },
          {
            startQuest = "1732510717235412023",
            startPort = "Out",
            endQuest = "1732510728687412539",
            endPort = "In"
          },
          {
            startQuest = "1732510657019207516",
            startPort = "Out",
            endQuest = "17255300647145758372",
            endPort = "In"
          },
          {
            startQuest = "1732510728687412539",
            startPort = "Out",
            endQuest = "1732510756026413726",
            endPort = "In"
          },
          {
            startQuest = "17255300807435759012",
            startPort = "Out",
            endQuest = "17255300579695757976",
            endPort = "Fail"
          },
          {
            startQuest = "174221438509319008254",
            startPort = "Out",
            endQuest = "174221439662419008668",
            endPort = "In"
          },
          {
            startQuest = "174221438538119008269",
            startPort = "Out",
            endQuest = "174221439687019008681",
            endPort = "In"
          },
          {
            startQuest = "1732510655925207476",
            startPort = "Out",
            endQuest = "1732510706524411538",
            endPort = "In"
          },
          {
            startQuest = "1732510706524411538",
            startPort = "Out",
            endQuest = "1732509715704653",
            endPort = "In"
          },
          {
            startQuest = "1732509715704653",
            startPort = "Out",
            endQuest = "17343197941694102668",
            endPort = "In"
          },
          {
            startQuest = "173408100585013588614",
            startPort = "Out",
            endQuest = "1732510717235412023",
            endPort = "In"
          },
          {
            startQuest = "1732510657019207516",
            startPort = "Out",
            endQuest = "173408100585013588614",
            endPort = "In"
          },
          {
            startQuest = "1732510657019207516",
            startPort = "Out",
            endQuest = "174221093074616403660",
            endPort = "In"
          },
          {
            startQuest = "1732510706524411538",
            startPort = "Out",
            endQuest = "174221438509319008254",
            endPort = "In"
          },
          {
            startQuest = "1732510706524411538",
            startPort = "Out",
            endQuest = "174221438538119008269",
            endPort = "In"
          },
          {
            startQuest = "1732510706524411538",
            startPort = "Out",
            endQuest = "1732510657019207516",
            endPort = "In"
          },
          {
            startQuest = "1732510756026413726",
            startPort = "Out",
            endQuest = "17508352345899490307",
            endPort = "In"
          },
          {
            startQuest = "17508352345899490307",
            startPort = "Out",
            endQuest = "17255300723865758717",
            endPort = "In"
          },
          {
            startQuest = "17255300579695757970",
            startPort = "QuestStart",
            endQuest = "1758713431171515",
            endPort = "In"
          }
        },
        nodeData = {
          ["17255300579695757970"] = {
            key = "17255300579695757970",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 119.77802197802214, y = 291.16813186813187},
            propsData = {ModeType = 0}
          },
          ["17255300579695757973"] = {
            key = "17255300579695757973",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2487.6186813186823, y = 677.3428571428572},
            propsData = {ModeType = 0}
          },
          ["17255300579695757976"] = {
            key = "17255300579695757976",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 967.9670329670337, y = 493.0769230769231},
            propsData = {}
          },
          ["17255300647145758372"] = {
            key = "17255300647145758372",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2011.5592591512122, y = 67.27869047808312},
            propsData = {
              ShowEnable = true,
              MessageId = 990034,
              MessageNote = "",
              LastTime = 5,
              Style = "Warning"
            }
          },
          ["17255300723865758717"] = {
            key = "17255300723865758717",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3341.9150245978735, y = 282.95764191477764},
            propsData = {}
          },
          ["17255300807435759012"] = {
            key = "17255300807435759012",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 708.6128267956759, y = 509.67302653016213},
            propsData = {}
          },
          ["1732509715704653"] = {
            key = "1732509715704653",
            type = "TalkNode",
            name = "\230\178\161\230\157\131\233\153\144\229\188\128\233\151\168",
            pos = {x = 1002.1600450920348, y = -305.267947688739},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11014306,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1732510655925207476"] = {
            key = "1732510655925207476",
            type = "BossBattleFinishNode",
            name = "\231\172\172\228\184\128\230\172\161\228\186\164\228\186\146\230\147\141\228\189\156\229\143\176",
            pos = {x = 931.0038301726215, y = 287.78433534832897},
            propsData = {SendMessage = "", FinishCondition = "Maifu1Succ"}
          },
          ["1732510657019207516"] = {
            key = "1732510657019207516",
            type = "BossBattleFinishNode",
            name = "\229\164\186\229\143\150\231\167\152\233\146\165\230\136\144\229\138\159",
            pos = {x = 1369.9957556384597, y = 83.99300276786587},
            propsData = {SendMessage = "", FinishCondition = "Maifu2Succ"}
          },
          ["1732510695422411019"] = {
            key = "1732510695422411019",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 704.2038301726217, y = 292.5843353483289},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_1650401"
            }
          },
          ["1732510706524411538"] = {
            key = "1732510706524411538",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 875.2171591142117, y = 21.19441439971225},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_1650401"
            }
          },
          ["1732510717235412023"] = {
            key = "1732510717235412023",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2016.003830172622, y = 278.1271924911861},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_1650401"
            }
          },
          ["1732510728687412539"] = {
            key = "1732510728687412539",
            type = "BossBattleFinishNode",
            name = "\231\172\172\228\186\140\230\172\161\228\186\164\228\186\146\230\147\141\228\189\156\229\143\176",
            pos = {x = 2278.3292657126917, y = 280.527192491186},
            propsData = {SendMessage = "", FinishCondition = "Maifu3Succ"}
          },
          ["1732510756026413726"] = {
            key = "1732510756026413726",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 2534.6609730297646, y = 290.12719249118595},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_1650401"
            }
          },
          ["173408100585013588614"] = {
            key = "173408100585013588614",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1746.9846041265082, y = 305.7555125798448},
            propsData = {
              NewDescription = "Description_110111_10",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          },
          ["17343197941694102668"] = {
            key = "17343197941694102668",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1319.6611236589497, y = -283.1473994604429},
            propsData = {
              NewDescription = "Description_110111_7",
              NewDetail = "",
              SubTaskTargetIndex = 0
            }
          },
          ["174221093074616403660"] = {
            key = "174221093074616403660",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1517.7478260869561, y = 602.4326086956522},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018912,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174221438509319008254"] = {
            key = "174221438509319008254",
            type = "BossBattleFinishNode",
            name = "\229\164\186\229\143\150\231\167\152\233\146\1651",
            pos = {x = 1802.2499999999998, y = -300.5},
            propsData = {
              SendMessage = "",
              FinishCondition = "Maifu2Zhihui1Dead"
            }
          },
          ["174221438538119008269"] = {
            key = "174221438538119008269",
            type = "BossBattleFinishNode",
            name = "\229\164\186\229\143\150\231\167\152\233\146\1652",
            pos = {x = 1773.4999999999998, y = -104.24999999999997},
            propsData = {
              SendMessage = "",
              FinishCondition = "Maifu2Zhihui2Dead"
            }
          },
          ["174221439662419008668"] = {
            key = "174221439662419008668",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2146, y = -441.7500000000002},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018910,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174221439687019008681"] = {
            key = "174221439687019008681",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2141, y = -163.00000000000023},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11018911,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17508352345899490307"] = {
            key = "17508352345899490307",
            type = "GoToNode",
            name = "GOTO - \228\184\139\230\176\180\233\129\147\229\133\165\229\143\163",
            pos = {x = 2909.190476190476, y = 270.9821428571429},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111011103,
              GuideType = "M",
              GuidePointName = "questpoint1111011103"
            }
          },
          ["1758713431171515"] = {
            key = "1758713431171515",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 592.6125047586677, y = 51.215686274509835},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "MaifuStart",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
