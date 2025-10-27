return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991230053191875",
      startPort = "StoryStart",
      endStory = "17141991230053191877",
      endPort = "In"
    },
    {
      startStory = "17141991230053191877",
      startPort = "Success",
      endStory = "17141991230053191876",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991230053191875"] = {
      isStoryNode = true,
      key = "17141991230053191875",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1574.7058823529412, y = 292.94117647058823},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991230053191876"] = {
      isStoryNode = true,
      key = "17141991230053191876",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2113.8080495356035, y = 284.8606811145511},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991230053191877"] = {
      isStoryNode = true,
      key = "17141991230053191877",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1835.4896338630256, y = 279.20294465820626},
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
            startQuest = "17141991230053191878",
            startPort = "QuestStart",
            endQuest = "17141991230053191881",
            endPort = "In"
          },
          {
            startQuest = "17141991230053191881",
            startPort = "Out",
            endQuest = "17141991230053191879",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991230053191878"] = {
            key = "17141991230053191878",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1007.1929824561405, y = 524.8070175438596},
            propsData = {ModeType = 0}
          },
          ["17141991230053191879"] = {
            key = "17141991230053191879",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1496.4246646026832, y = 531.3900928792569},
            propsData = {ModeType = 0}
          },
          ["17141991230053191880"] = {
            key = "17141991230053191880",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1509.9102167182662, y = 664.6676986584107},
            propsData = {}
          },
          ["17141991230053191881"] = {
            key = "17141991230053191881",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1247.6261881105822, y = 523.6064777073934},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003401,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
