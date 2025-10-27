return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1747102874652810929",
      startPort = "StoryStart",
      endStory = "1747102874652810931",
      endPort = "In"
    },
    {
      startStory = "1747102874652810931",
      startPort = "Success",
      endStory = "1747102874652810930",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1747102874652810929"] = {
      isStoryNode = true,
      key = "1747102874652810929",
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
    ["1747102874652810930"] = {
      isStoryNode = true,
      key = "1747102874652810930",
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
    ["1747102874652810931"] = {
      isStoryNode = true,
      key = "1747102874652810931",
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
            startQuest = "1747102874652810932",
            startPort = "QuestStart",
            endQuest = "1747102874652810935",
            endPort = "In"
          },
          {
            startQuest = "1747102874652810935",
            startPort = "Out",
            endQuest = "1747102874652810933",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1747102874652810932"] = {
            key = "1747102874652810932",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1747102874652810933"] = {
            key = "1747102874652810933",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1438, y = 298},
            propsData = {ModeType = 0}
          },
          ["1747102874652810934"] = {
            key = "1747102874652810934",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1436, y = 446},
            propsData = {}
          },
          ["1747102874652810935"] = {
            key = "1747102874652810935",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1098, y = 290},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20007101,
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
              SwitchToMaster = "None",
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
