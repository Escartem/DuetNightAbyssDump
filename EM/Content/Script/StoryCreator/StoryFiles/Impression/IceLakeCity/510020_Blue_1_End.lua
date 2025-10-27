return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978917179214",
      startPort = "StoryStart",
      endStory = "171418280909026254",
      endPort = "In"
    },
    {
      startStory = "171418280909026254",
      startPort = "Success",
      endStory = "1704175978917179215",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170184682242432686"] = {
      isStoryNode = true,
      key = "170184682242432686",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1154.8373858375285, y = 505.4166968297402},
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
            startQuest = "1704175978917179216",
            startPort = "QuestStart",
            endQuest = "170184682916733348",
            endPort = "In"
          },
          {
            startQuest = "170184682916733348",
            startPort = "Out",
            endQuest = "1704175978917179217",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170184682916733348"] = {
            key = "170184682916733348",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1186.6402704529132, y = 316.4743891374324},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002031,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175978917179216"] = {
            key = "1704175978917179216",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978917179217"] = {
            key = "1704175978917179217",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1654.7058823529414, y = 317.6470588235294},
            propsData = {ModeType = 0}
          },
          ["1704175978917179218"] = {
            key = "1704175978917179218",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2314.705882352941, y = 756.4705882352941},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["1704175978917179214"] = {
      isStoryNode = true,
      key = "1704175978917179214",
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
    ["1704175978917179215"] = {
      isStoryNode = true,
      key = "1704175978917179215",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1398.9583333333335, y = 299.6875},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171418280909026254"] = {
      isStoryNode = true,
      key = "171418280909026254",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1099.935909233207, y = 288.7847203497242},
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
            startQuest = "171418280909026255",
            startPort = "QuestStart",
            endQuest = "171418282413326767",
            endPort = "In"
          },
          {
            startQuest = "171418282413326767",
            startPort = "Out",
            endQuest = "171418280909026257",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171418280909026255"] = {
            key = "171418280909026255",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171418280909026257"] = {
            key = "171418280909026257",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1397.6201372997723, y = 301.37299771167045},
            propsData = {ModeType = 0}
          },
          ["171418280909026259"] = {
            key = "171418280909026259",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171418282413326767"] = {
            key = "171418282413326767",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1085.248409233207, y = 287.8472203497241},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002031,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
