return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1715581588593996742",
      startPort = "StoryStart",
      endStory = "1715581588593996744",
      endPort = "In"
    },
    {
      startStory = "1715581588593996744",
      startPort = "Success",
      endStory = "1715581588593996743",
      endPort = "StoryEnd"
    },
    {
      startStory = "1715581588593996744",
      startPort = "Fail",
      endStory = "1715581588593996743",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1715581588593996742"] = {
      isStoryNode = true,
      key = "1715581588593996742",
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
    ["1715581588593996743"] = {
      isStoryNode = true,
      key = "1715581588593996743",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2161.176470588235, y = 291.1764705882353},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1715581588593996744"] = {
      isStoryNode = true,
      key = "1715581588593996744",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1871.380447854526, y = 288.67662886873256},
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
            startQuest = "1715581588593996745",
            startPort = "QuestStart",
            endQuest = "17168652926013292",
            endPort = "In"
          },
          {
            startQuest = "17168652926013292",
            startPort = "Out",
            endQuest = "1715581588593996746",
            endPort = "Success"
          },
          {
            startQuest = "17168652926013292",
            startPort = "Fail",
            endQuest = "1715581588593996747",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1715581588593996745"] = {
            key = "1715581588593996745",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 716.4453349083036, y = 375.7186209925339},
            propsData = {ModeType = 0}
          },
          ["1715581588593996746"] = {
            key = "1715581588593996746",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1481.025783899494, y = 292.18123255662715},
            propsData = {ModeType = 0}
          },
          ["1715581588593996747"] = {
            key = "1715581588593996747",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1463.7317884729646, y = 492.4979797979797},
            propsData = {}
          },
          ["17168652926013292"] = {
            key = "17168652926013292",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1017.3512333077545, y = 338.71776894603},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004107,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17181761883074468"] = {
            key = "17181761883074468",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 803, y = 156.7222222222222},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004101,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0,
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
