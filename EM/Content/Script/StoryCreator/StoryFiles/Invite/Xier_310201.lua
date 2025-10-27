return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101571342140",
      startPort = "StoryStart",
      endStory = "1721630101571342142",
      endPort = "In"
    },
    {
      startStory = "1721630101571342142",
      startPort = "Success",
      endStory = "1721630101571342141",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101571342140"] = {
      isStoryNode = true,
      key = "1721630101571342140",
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
    ["1721630101571342141"] = {
      isStoryNode = true,
      key = "1721630101571342141",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630101571342142"] = {
      isStoryNode = true,
      key = "1721630101571342142",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1102.888888888889, y = 288.44444444444446},
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
            startQuest = "1721630101571342143",
            startPort = "QuestStart",
            endQuest = "1721630101571342146",
            endPort = "In"
          },
          {
            startQuest = "1721630101571342146",
            startPort = "Out",
            endQuest = "1721630101571342144",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630101571342143"] = {
            key = "1721630101571342143",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721630101571342144"] = {
            key = "1721630101571342144",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1390.7500000000002, y = 297},
            propsData = {ModeType = 0}
          },
          ["1721630101571342145"] = {
            key = "1721630101571342145",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1572.0000000000002, y = 434.5},
            propsData = {}
          },
          ["1721630101571342146"] = {
            key = "1721630101571342146",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1079.3599878382488, y = 287.07230330056404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80020201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Invite",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 93102,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93102},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
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
