return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1733902483911652015",
      startPort = "StoryStart",
      endStory = "1733902486715652138",
      endPort = "In"
    },
    {
      startStory = "1733902486715652138",
      startPort = "Success",
      endStory = "1733902483912652018",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1733902483911652015"] = {
      isStoryNode = true,
      key = "1733902483911652015",
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
    ["1733902483912652018"] = {
      isStoryNode = true,
      key = "1733902483912652018",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1520.0210084033613, y = 284.8109243697479},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1733902486715652138"] = {
      isStoryNode = true,
      key = "1733902486715652138",
      type = "StoryNode",
      name = "\233\163\158\232\136\185\230\139\190\229\174\157",
      pos = {x = 1168, y = 282},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_CloudFeichuan_Des",
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
            startQuest = "1733902486715652139",
            startPort = "QuestStart",
            endQuest = "1733902560601652875",
            endPort = "In"
          },
          {
            startQuest = "1733902486715652139",
            startPort = "QuestStart",
            endQuest = "1733902595665653160",
            endPort = "In"
          },
          {
            startQuest = "1733902560601652875",
            startPort = "Out",
            endQuest = "1733902630476653385",
            endPort = "In"
          },
          {
            startQuest = "1733902630476653385",
            startPort = "Out",
            endQuest = "1733902647216653670",
            endPort = "In"
          },
          {
            startQuest = "1733902647216653670",
            startPort = "Out",
            endQuest = "1733902806029654657",
            endPort = "In"
          },
          {
            startQuest = "1733902806029654657",
            startPort = "Out",
            endQuest = "1733902832608655249",
            endPort = "In"
          },
          {
            startQuest = "1733902832608655249",
            startPort = "Out",
            endQuest = "1733907085011224341",
            endPort = "In"
          },
          {
            startQuest = "1733907085011224341",
            startPort = "Out",
            endQuest = "1733902486715652142",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1733902486715652139"] = {
            key = "1733902486715652139",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1733902486715652142"] = {
            key = "1733902486715652142",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3079.2413793103447, y = 314.48275862068965},
            propsData = {ModeType = 0}
          },
          ["1733902486715652145"] = {
            key = "1733902486715652145",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1733902560601652875"] = {
            key = "1733902560601652875",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1159.448275862069, y = 308.6896551724138},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1580099,
                1580100,
                1580101
              },
              QuestPickupId = -1,
              UnitId = 80022,
              UnitCount = 3,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1733902595665653160"] = {
            key = "1733902595665653160",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\188\128\232\189\166",
            pos = {x = 1162.4750957854408, y = 100.75862068965517},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004101,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733902630476653385"] = {
            key = "1733902630476653385",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\163\171\229\133\181",
            pos = {x = 1453.2413793103449, y = 318.00000000000006},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1580103,
                1580104,
                1580105,
                1580106,
                1580107
              }
            }
          },
          ["1733902647216653670"] = {
            key = "1733902647216653670",
            type = "TalkNode",
            name = "\229\163\171\229\133\181\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 1732.5517241379316, y = 301.44827586206895},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004102,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733902806029654657"] = {
            key = "1733902806029654657",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\163\171\229\133\181",
            pos = {x = 2044.9655172413798, y = 303.5172413793104},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1580103,
                1580104,
                1580105,
                1580106,
                1580107
              }
            }
          },
          ["1733902832608655249"] = {
            key = "1733902832608655249",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\229\174\140\230\136\144\229\188\128\232\189\166",
            pos = {x = 2357.3793103448284, y = 300.4137931034483},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71004103,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1733907085011224341"] = {
            key = "1733907085011224341",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2707.5, y = 321},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
