return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102650404243",
      startPort = "StoryStart",
      endStory = "17211004733728410",
      endPort = "In"
    },
    {
      startStory = "17211004733728410",
      startPort = "Success",
      endStory = "1721630102650404244",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17211004733728410"] = {
      isStoryNode = true,
      key = "17211004733728410",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1123.1804552946198, y = 281.5639696444951},
      propsData = {
        QuestId = 20021801,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200218_1",
        QuestDeatil = "Content_200218_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = true,
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_200218510060Nifu_1240252"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17211004733728411",
            startPort = "QuestStart",
            endQuest = "1721369054352566724",
            endPort = "In"
          },
          {
            startQuest = "1721369054352566724",
            startPort = "Out",
            endQuest = "17211004733728414",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17211004733728411"] = {
            key = "17211004733728411",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1514, y = 307.5},
            propsData = {ModeType = 0}
          },
          ["17211004733728414"] = {
            key = "17211004733728414",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2314, y = 309},
            propsData = {ModeType = 0}
          },
          ["17211004733728417"] = {
            key = "17211004733728417",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1721369054352566724"] = {
            key = "1721369054352566724",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1878.142857142857, y = 293.49999999999983},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700133,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_200218510060Nifu_1240252",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51006801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200218510060",
              BlendInTime = 1,
              BlendOutTime = 1.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700133,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700133}
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
    },
    ["1721630102650404243"] = {
      isStoryNode = true,
      key = "1721630102650404243",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 806.9230769230769, y = 287.5275919732441},
      propsData = {QuestChainId = 200218},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102650404244"] = {
      isStoryNode = true,
      key = "1721630102650404244",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1518.4230769230771, y = 278},
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
