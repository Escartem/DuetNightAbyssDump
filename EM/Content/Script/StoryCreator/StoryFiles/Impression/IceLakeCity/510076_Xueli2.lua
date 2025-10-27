return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210595490374",
      startPort = "StoryStart",
      endStory = "1732783210595490373",
      endPort = "In"
    },
    {
      startStory = "1732783210595490373",
      startPort = "Success",
      endStory = "1732783210595490375",
      endPort = "StoryEnd"
    },
    {
      startStory = "1732783210595490373",
      startPort = "Fail",
      endStory = "1732783210595490375",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210595490373"] = {
      isStoryNode = true,
      key = "1732783210595490373",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1842.0619634272555, y = 280.9883202927507},
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
            startQuest = "1732783210595490376",
            startPort = "QuestStart",
            endQuest = "17261265595121679",
            endPort = "In"
          },
          {
            startQuest = "17261265595121679",
            startPort = "Fail",
            endQuest = "1732783210595490378",
            endPort = "Fail"
          },
          {
            startQuest = "17261265595121679",
            startPort = "Out",
            endQuest = "1732783210595490377",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17261265595121679"] = {
            key = "17261265595121679",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1715.4697932218041, y = 989.1569153476551},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007325,
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
          },
          ["1732783210595490376"] = {
            key = "1732783210595490376",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1328.3384104000634, y = 1007.156420035596},
            propsData = {ModeType = 0}
          },
          ["1732783210595490377"] = {
            key = "1732783210595490377",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2058.423106848954, y = 965.8931284327164},
            propsData = {ModeType = 0}
          },
          ["1732783210595490378"] = {
            key = "1732783210595490378",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2049.4040941813446, y = 1164.7476349079798},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["1732783210595490374"] = {
      isStoryNode = true,
      key = "1732783210595490374",
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
    ["1732783210595490375"] = {
      isStoryNode = true,
      key = "1732783210595490375",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2161.176470588235, y = 291.1764705882353},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
