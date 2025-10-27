return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17258665096631",
      startPort = "StoryStart",
      endStory = "1725866517265106",
      endPort = "In"
    },
    {
      startStory = "1725866517265106",
      startPort = "Success",
      endStory = "17258665096645",
      endPort = "StoryEnd"
    },
    {
      startStory = "1725866517265106",
      startPort = "Fail",
      endStory = "17258665096645",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17258665096631"] = {
      isStoryNode = true,
      key = "17258665096631",
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
    ["17258665096645"] = {
      isStoryNode = true,
      key = "17258665096645",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1510.3801169590647, y = 479.8746867167919},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1725866517265106"] = {
      isStoryNode = true,
      key = "1725866517265106",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1071.8765984654729, y = 406.4021739130435},
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
            startQuest = "1725866517265107",
            startPort = "QuestStart",
            endQuest = "17258665755811422",
            endPort = "In"
          },
          {
            startQuest = "17258665755811422",
            startPort = "Out",
            endQuest = "1725866517265109",
            endPort = "Success"
          },
          {
            startQuest = "17258665755811422",
            startPort = "Fail",
            endQuest = "1725866517265111",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1725866517265107"] = {
            key = "1725866517265107",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1725866517265109"] = {
            key = "1725866517265109",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1633.19085262564, y = 316.75578769056966},
            propsData = {ModeType = 0}
          },
          ["1725866517265111"] = {
            key = "1725866517265111",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1375.353896103901, y = 408.24025974025886},
            propsData = {}
          },
          ["17258665755811422"] = {
            key = "17258665755811422",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1076.9551257586538, y = 208.71190809868577},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007301,
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
