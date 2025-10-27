return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17466067605521",
      startPort = "StoryStart",
      endStory = "1746606769013208",
      endPort = "In"
    },
    {
      startStory = "1746606769013208",
      startPort = "Success",
      endStory = "17466067605535",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17466067605521"] = {
      isStoryNode = true,
      key = "17466067605521",
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
    ["17466067605535"] = {
      isStoryNode = true,
      key = "17466067605535",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1368.5714285714287, y = 301.14285714285717},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1746606769013208"] = {
      isStoryNode = true,
      key = "1746606769013208",
      type = "StoryNode",
      name = "\233\173\148\231\129\181\230\148\175\231\186\191End",
      pos = {x = 1077.4285714285713, y = 287.14285714285717},
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
            startQuest = "1746606769013209",
            startPort = "QuestStart",
            endQuest = "1746606793900796",
            endPort = "In"
          },
          {
            startQuest = "1746606793900796",
            startPort = "Out",
            endQuest = "1746606769013216",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1746606769013209"] = {
            key = "1746606769013209",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1746606769013216"] = {
            key = "1746606769013216",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1438, y = 298},
            propsData = {ModeType = 0}
          },
          ["1746606769013223"] = {
            key = "1746606769013223",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1436, y = 446},
            propsData = {}
          },
          ["1746606793900796"] = {
            key = "1746606793900796",
            type = "TalkNode",
            name = "\228\189\160\228\187\172\232\181\176\229\144\167",
            pos = {x = 1098, y = 290},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20005501,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
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
