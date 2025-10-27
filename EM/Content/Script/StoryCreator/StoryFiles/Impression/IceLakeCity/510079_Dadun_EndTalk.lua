return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17268252255851",
      startPort = "StoryStart",
      endStory = "1726825261034288",
      endPort = "In"
    },
    {
      startStory = "1726825261034288",
      startPort = "Success",
      endStory = "17268252255865",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17268252255851"] = {
      isStoryNode = true,
      key = "17268252255851",
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
    ["17268252255865"] = {
      isStoryNode = true,
      key = "17268252255865",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1502, y = 336},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1726825261034288"] = {
      isStoryNode = true,
      key = "1726825261034288",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1168.75996372049, y = 263.7554945054944},
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
            startQuest = "1726825278233762",
            startPort = "Out",
            endQuest = "1726825261034296",
            endPort = "Success"
          },
          {
            startQuest = "1726825261034289",
            startPort = "QuestStart",
            endQuest = "1726825278233762",
            endPort = "In"
          }
        },
        nodeData = {
          ["1726825261034289"] = {
            key = "1726825261034289",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1726825261034296"] = {
            key = "1726825261034296",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1702.5, y = 317.5},
            propsData = {ModeType = 0}
          },
          ["1726825261034303"] = {
            key = "1726825261034303",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1726825278233762"] = {
            key = "1726825278233762",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1369.5291944897208, y = 291.4478021978021},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007415,
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
