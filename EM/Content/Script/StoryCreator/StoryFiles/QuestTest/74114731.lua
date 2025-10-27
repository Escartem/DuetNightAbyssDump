return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17345961048953333937",
      startPort = "StoryStart",
      endStory = "17345961048953333939",
      endPort = "In"
    },
    {
      startStory = "17345961048953333939",
      startPort = "Success",
      endStory = "17345961048953333938",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17345961048953333937"] = {
      isStoryNode = true,
      key = "17345961048953333937",
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
    ["17345961048953333938"] = {
      isStoryNode = true,
      key = "17345961048953333938",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1620, y = 310},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17345961048953333939"] = {
      isStoryNode = true,
      key = "17345961048953333939",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1172, y = 278},
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
            startQuest = "17345961048953333940",
            startPort = "QuestStart",
            endQuest = "1734595766465682511",
            endPort = "In"
          },
          {
            startQuest = "1734595766465682511",
            startPort = "Out",
            endQuest = "17345961048953333941",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1734595766465682511"] = {
            key = "1734595766465682511",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1220.857142857143, y = 295.4285714285714},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 741148301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Kawaii29",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorId = 74114759,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 74114759},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17345961048953333940"] = {
            key = "17345961048953333940",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17345961048953333941"] = {
            key = "17345961048953333941",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1830, y = 312},
            propsData = {ModeType = 0}
          },
          ["17345961048953333942"] = {
            key = "17345961048953333942",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1848, y = 808},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
