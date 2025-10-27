return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17483330984131",
      startPort = "StoryStart",
      endStory = "1748333140814447",
      endPort = "In"
    },
    {
      startStory = "1748333140814447",
      startPort = "Success",
      endStory = "17483330984145",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17483330984131"] = {
      isStoryNode = true,
      key = "17483330984131",
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
    ["17483330984145"] = {
      isStoryNode = true,
      key = "17483330984145",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1748333140814447"] = {
      isStoryNode = true,
      key = "1748333140814447",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1718.6666666666667, y = 289.99999999999994},
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
            startQuest = "17483331547401308",
            startPort = "Out",
            endQuest = "1748333140815455",
            endPort = "Success"
          },
          {
            startQuest = "1748333140814448",
            startPort = "QuestStart",
            endQuest = "17483397421053491",
            endPort = "In"
          },
          {
            startQuest = "17483397421053491",
            startPort = "Branch_1",
            endQuest = "17483331547401308",
            endPort = "In"
          }
        },
        nodeData = {
          ["1748333140814448"] = {
            key = "1748333140814448",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748333140815455"] = {
            key = "1748333140815455",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748333140815462"] = {
            key = "1748333140815462",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17483331547401308"] = {
            key = "17483331547401308",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1934.4444444444443, y = 275.55555555555554},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 10037997,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17483397421053491"] = {
            key = "17483397421053491",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1319.5555555555557, y = 302.8888888888889},
            propsData = {
              Branches = {300106}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
