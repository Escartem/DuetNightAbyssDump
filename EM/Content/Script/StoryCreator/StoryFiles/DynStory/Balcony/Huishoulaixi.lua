return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17212732955231",
      startPort = "StoryStart",
      endStory = "1721273301274190",
      endPort = "In"
    },
    {
      startStory = "1721273301274190",
      startPort = "Success",
      endStory = "17212732955245",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17212732955231"] = {
      isStoryNode = true,
      key = "17212732955231",
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
    ["17212732955245"] = {
      isStoryNode = true,
      key = "17212732955245",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1528.4615384615383, y = 273.4615384615385},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721273301274190"] = {
      isStoryNode = true,
      key = "1721273301274190",
      type = "StoryNode",
      name = "\231\167\189\229\133\189\230\157\165\232\162\173",
      pos = {x = 1157.2083333333333, y = 286.14946018893386},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_BalconyHuishoulaixi_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1721273301274191",
            startPort = "QuestStart",
            endQuest = "17212733843722189",
            endPort = "In"
          },
          {
            startQuest = "17212733843722189",
            startPort = "Out",
            endQuest = "17212734119462847",
            endPort = "In"
          },
          {
            startQuest = "17212733843722189",
            startPort = "Out",
            endQuest = "17212734388343539",
            endPort = "In"
          },
          {
            startQuest = "17212734119462847",
            startPort = "Out",
            endQuest = "17212734580154287",
            endPort = "In"
          },
          {
            startQuest = "17212734580154287",
            startPort = "Out",
            endQuest = "17212735265265007",
            endPort = "In"
          },
          {
            startQuest = "17212735265265007",
            startPort = "Out",
            endQuest = "17212735347345364",
            endPort = "In"
          },
          {
            startQuest = "17212741003887804",
            startPort = "Out",
            endQuest = "1721273301274197",
            endPort = "Success"
          },
          {
            startQuest = "172127428157110151",
            startPort = "Out",
            endQuest = "17212741003887804",
            endPort = "In"
          },
          {
            startQuest = "17212733843722189",
            startPort = "Out",
            endQuest = "172127428157110151",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721273301274191"] = {
            key = "1721273301274191",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721273301274197"] = {
            key = "1721273301274197",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2097.3856788372923, y = 528.2860687699398},
            propsData = {ModeType = 0}
          },
          ["1721273301274203"] = {
            key = "1721273301274203",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3318.4863523573204, y = 501.46401985111663},
            propsData = {}
          },
          ["17212733843722189"] = {
            key = "17212733843722189",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1122.473585322724, y = 305.2493452871508},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570085}
            }
          },
          ["17212734119462847"] = {
            key = "17212734119462847",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1514.4090691936913, y = 314.9267646419895},
            propsData = {WaitTime = 2}
          },
          ["17212734388343539"] = {
            key = "17212734388343539",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1500.0790443797955, y = 94.09549913330466},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001101,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17212734580154287"] = {
            key = "17212734580154287",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1856.0219724194974, y = 314.92676464198956},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1570086, 1570087}
            }
          },
          ["17212735265265007"] = {
            key = "17212735265265007",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2175.376811129174, y = 312.9912807710219},
            propsData = {WaitTime = 2.5}
          },
          ["17212735347345364"] = {
            key = "17212735347345364",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2515.054230484013, y = 312.80517655265953},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1570088,
                1570089,
                1570090
              }
            }
          },
          ["17212741003887804"] = {
            key = "17212741003887804",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 1798.2215470384288, y = 520.0614686476614},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["172127428157110151"] = {
            key = "172127428157110151",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1458.4422134687716, y = 540.2161616249355},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1570085,
                1570086,
                1570087,
                1570088,
                1570089,
                1570090
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
