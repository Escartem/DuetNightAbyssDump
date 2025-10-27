return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1711459788111104",
      startPort = "StoryStart",
      endStory = "1711459796232647",
      endPort = "In"
    },
    {
      startStory = "1711459796232647",
      startPort = "Success",
      endStory = "1711459788111107",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1711459788111104"] = {
      isStoryNode = true,
      key = "1711459788111104",
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
    ["1711459788111107"] = {
      isStoryNode = true,
      key = "1711459788111107",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1304.5276292335113, y = 304.468211527035},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1711459796232647"] = {
      isStoryNode = true,
      key = "1711459796232647",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1054.5040688212046, y = 303.9065333643339},
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
            startQuest = "1711459796232648",
            startPort = "QuestStart",
            endQuest = "17472118917288309",
            endPort = "In"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_1",
            endQuest = "17472121713869828",
            endPort = "In"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_2",
            endQuest = "174721219018210457",
            endPort = "In"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_3",
            endQuest = "174721219085810509",
            endPort = "In"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_4",
            endQuest = "174721219204010615",
            endPort = "In"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_5",
            endQuest = "174721219272010689",
            endPort = "In"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_6",
            endQuest = "174721219347410752",
            endPort = "In"
          },
          {
            startQuest = "17472121713869828",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "174721219018210457",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "174721219085810509",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "174721219204010615",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "174721219272010689",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "174721219347410752",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_7",
            endQuest = "1748344146534936",
            endPort = "In"
          },
          {
            startQuest = "1748344146534936",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_8",
            endQuest = "17483441765522107",
            endPort = "In"
          },
          {
            startQuest = "17483441765522107",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_9",
            endQuest = "17483441783762224",
            endPort = "In"
          },
          {
            startQuest = "17483441783762224",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_10",
            endQuest = "17483441811332352",
            endPort = "In"
          },
          {
            startQuest = "17483441811332352",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          },
          {
            startQuest = "17472118917288309",
            startPort = "Branch_11",
            endQuest = "17539483682991230",
            endPort = "In"
          },
          {
            startQuest = "17539483682991230",
            startPort = "Out",
            endQuest = "1711459796232650",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1711459796232648"] = {
            key = "1711459796232648",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 743.366368286445, y = 478.3056265984654},
            propsData = {ModeType = 0}
          },
          ["1711459796232650"] = {
            key = "1711459796232650",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2031.8478260869567, y = 483.69565217391306},
            propsData = {ModeType = 0}
          },
          ["1711459796232652"] = {
            key = "1711459796232652",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17472118917288309"] = {
            key = "17472118917288309",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1083.0588235294117, y = 416.47058823529414},
            propsData = {
              Branches = {
                300100,
                300101,
                300102,
                300103,
                300104,
                300105,
                300109,
                300110,
                300111,
                300112,
                300113
              }
            }
          },
          ["17472121713869828"] = {
            key = "17472121713869828",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1448.8556149732617, y = -210.46810542398762},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030504,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["174721219018210457"] = {
            key = "174721219018210457",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1450.032085561497, y = -56.938693659281824},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030505,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["174721219085810509"] = {
            key = "174721219085810509",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1451.2085561497327, y = 93.64954163483571},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030506,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["174721219204010615"] = {
            key = "174721219204010615",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1453.5614973262032, y = 252.47307104660047},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030507,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["174721219272010689"] = {
            key = "174721219272010689",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1457.0909090909092, y = 407.76718869365936},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030508,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["174721219347410752"] = {
            key = "174721219347410752",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1462.6112710818595, y = 567.3147000058767},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10030509,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["1748344146534936"] = {
            key = "1748344146534936",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1463.020979020979, y = 737.7762237762237},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036301,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["17483441765522107"] = {
            key = "17483441765522107",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1467.4577922077922, y = 910.4685314685315},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036302,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["17483441783762224"] = {
            key = "17483441783762224",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1466.2077922077922, y = 1067.9685314685316},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036303,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["17483441811332352"] = {
            key = "17483441811332352",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1467.4577922077922, y = 1230.4685314685316},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036304,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          },
          ["17539483682991230"] = {
            key = "17539483682991230",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1470.6666666666667, y = 1404.6666666666667},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10032114,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "DelayLoop",
              BubbleDelayLoopSeconds = 10,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
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
