return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "172153849231928",
      startPort = "StoryStart",
      endStory = "1721538534998197",
      endPort = "In"
    },
    {
      startStory = "1721538534998197",
      startPort = "Success",
      endStory = "172153849231931",
      endPort = "StoryEnd"
    },
    {
      startStory = "1721538534998197",
      startPort = "Fail",
      endStory = "172153849231931",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["172153849231928"] = {
      isStoryNode = true,
      key = "172153849231928",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1570, y = 344},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172153849231931"] = {
      isStoryNode = true,
      key = "172153849231931",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2192, y = 354},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721538534998197"] = {
      isStoryNode = true,
      key = "1721538534998197",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1866, y = 331.99999999999994},
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
            startQuest = "1721538534999202",
            startPort = "QuestStart",
            endQuest = "17215385938721176",
            endPort = "In"
          },
          {
            startQuest = "17215385938721176",
            startPort = "Out",
            endQuest = "1721538534999203",
            endPort = "Success"
          },
          {
            startQuest = "17215385938721176",
            startPort = "Fail",
            endQuest = "1721538534999204",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1721538534999202"] = {
            key = "1721538534999202",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1828.6461027077557, y = 1067.6948815740577},
            propsData = {ModeType = 0}
          },
          ["1721538534999203"] = {
            key = "1721538534999203",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3132.626373923334, y = 966.6478783716092},
            propsData = {ModeType = 0}
          },
          ["1721538534999204"] = {
            key = "1721538534999204",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3133.5479266579273, y = 1172.9895822189808},
            propsData = {}
          },
          ["17215385938721176"] = {
            key = "17215385938721176",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2087.7647058823527, y = 1029.3176470588235},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51007001,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
