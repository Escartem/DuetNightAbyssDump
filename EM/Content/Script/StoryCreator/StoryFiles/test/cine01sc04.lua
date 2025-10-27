return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716454340844684258",
      startPort = "StoryStart",
      endStory = "1716454362921685055",
      endPort = "In"
    },
    {
      startStory = "1716454362921685055",
      startPort = "Success",
      endStory = "1716454340844684261",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1716454340844684258"] = {
      isStoryNode = true,
      key = "1716454340844684258",
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
    ["1716454340844684261"] = {
      isStoryNode = true,
      key = "1716454340844684261",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1267.6900584795326, y = 316.53508771929825},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716454362921685055"] = {
      isStoryNode = true,
      key = "1716454362921685055",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1028.970337028758, y = 307.5508391605293},
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
            startQuest = "1716454362921685056",
            startPort = "QuestStart",
            endQuest = "172232589374326063",
            endPort = "In"
          },
          {
            startQuest = "172232589374326063",
            startPort = "Out",
            endQuest = "1716454362921685059",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716454362921685056"] = {
            key = "1716454362921685056",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1716454362921685059"] = {
            key = "1716454362921685059",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1304.3920595533502, y = 306.17866004962775},
            propsData = {ModeType = 0}
          },
          ["1716454362921685062"] = {
            key = "1716454362921685062",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["172232589374326063"] = {
            key = "172232589374326063",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 SJZ\229\135\186\229\156\186",
            pos = {x = 1068.4989986793378, y = 301.2506189630799},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC004/SQ_OBT0101_SC004",
              InType = "BlendIn",
              OutType = "BlendOut",
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
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
