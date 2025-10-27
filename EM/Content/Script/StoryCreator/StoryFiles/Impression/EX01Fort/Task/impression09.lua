return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17225665616024848",
      startPort = "StoryStart",
      endStory = "17225665844265156",
      endPort = "In"
    },
    {
      startStory = "17225665844265156",
      startPort = "Success",
      endStory = "17225665616024851",
      endPort = "StoryEnd"
    },
    {
      startStory = "17225665844265156",
      startPort = "Fail",
      endStory = "17225665616024851",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17225665616024848"] = {
      isStoryNode = true,
      key = "17225665616024848",
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
    ["17225665616024851"] = {
      isStoryNode = true,
      key = "17225665616024851",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1347.777777777778, y = 262.0202020202021},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17225665844265156"] = {
      isStoryNode = true,
      key = "17225665844265156",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1061.1101136241823, y = 268.15891211111574},
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
            startQuest = "17225665844265157",
            startPort = "QuestStart",
            endQuest = "172256678029511031",
            endPort = "In"
          },
          {
            startQuest = "172256678029511031",
            startPort = "Out",
            endQuest = "17225665844265159",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17225665844265157"] = {
            key = "17225665844265157",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17225665844265159"] = {
            key = "17225665844265159",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2066.0741396761146, y = 96.44104251012176},
            propsData = {ModeType = 0}
          },
          ["17225665844265161"] = {
            key = "17225665844265161",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2007.060981781378, y = 470.9805161943324},
            propsData = {}
          },
          ["172256678029511031"] = {
            key = "172256678029511031",
            type = "TalkNode",
            name = "\232\183\159\228\188\164\229\145\152A\229\175\185\232\175\157",
            pos = {x = 1273.1677132633768, y = 215.4392929437496},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11010401,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "EXPlayer",
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
