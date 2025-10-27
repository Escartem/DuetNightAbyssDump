return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1715581588572995722",
      startPort = "StoryStart",
      endStory = "1715581588572995724",
      endPort = "In"
    },
    {
      startStory = "1715581588572995724",
      startPort = "Success",
      endStory = "1715581588572995723",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1715581588572995722"] = {
      isStoryNode = true,
      key = "1715581588572995722",
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
    ["1715581588572995723"] = {
      isStoryNode = true,
      key = "1715581588572995723",
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
    ["1715581588572995724"] = {
      isStoryNode = true,
      key = "1715581588572995724",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1871.380447854526, y = 287.4766288687326},
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
            startQuest = "1715581588572995725",
            startPort = "QuestStart",
            endQuest = "17149829349441846317",
            endPort = "In"
          },
          {
            startQuest = "17149829349441846317",
            startPort = "Out",
            endQuest = "1715581588572995726",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17149829349441846317"] = {
            key = "17149829349441846317",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 810.6459042228157, y = 79.77967589059955},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003701,
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
          ["17149829349441846318"] = {
            key = "17149829349441846318",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1084.5373998239886, y = 221.9645378584426},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003704,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1715581588572995725"] = {
            key = "1715581588572995725",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 551.6899550224888, y = 91.56521739130442},
            propsData = {ModeType = 0}
          },
          ["1715581588572995726"] = {
            key = "1715581588572995726",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1083.7621747949556, y = 92.39523767528003},
            propsData = {ModeType = 0}
          },
          ["1715581588572995727"] = {
            key = "1715581588572995727",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1343.6948849104863, y = 243.94168797953955},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
