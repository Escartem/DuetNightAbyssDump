return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17394489135146390340",
      startPort = "StoryStart",
      endStory = "17394489150486390414",
      endPort = "In"
    },
    {
      startStory = "17394489150486390414",
      startPort = "Success",
      endStory = "17394489135316390343",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17394489135146390340"] = {
      isStoryNode = true,
      key = "17394489135146390340",
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
    ["17394489135316390343"] = {
      isStoryNode = true,
      key = "17394489135316390343",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1706, y = 306},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17394489150486390414"] = {
      isStoryNode = true,
      key = "17394489150486390414",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1238, y = 314},
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
            startQuest = "17394489150486390415",
            startPort = "QuestStart",
            endQuest = "17394489232836390719",
            endPort = "In"
          },
          {
            startQuest = "17394489232836390719",
            startPort = "Out",
            endQuest = "17394489150486390418",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17394489150486390415"] = {
            key = "17394489150486390415",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17394489150486390418"] = {
            key = "17394489150486390418",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1890, y = 414},
            propsData = {ModeType = 0}
          },
          ["17394489150486390421"] = {
            key = "17394489150486390421",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17394489232836390719"] = {
            key = "17394489232836390719",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1354, y = 390},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007930,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
