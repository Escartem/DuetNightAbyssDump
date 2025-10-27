return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175977078149181",
      startPort = "StoryStart",
      endStory = "1704175977079149183",
      endPort = "In"
    },
    {
      startStory = "1704175977079149183",
      startPort = "Success",
      endStory = "1704175977078149182",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175977078149181"] = {
      isStoryNode = true,
      key = "1704175977078149181",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175977078149182"] = {
      isStoryNode = true,
      key = "1704175977078149182",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 857, y = 111},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175977079149183"] = {
      isStoryNode = true,
      key = "1704175977079149183",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 431, y = 104},
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
        bIsNotifyGameMode = false,
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
            startQuest = "169451073079116742",
            startPort = "Out",
            endQuest = "1704175977079149185",
            endPort = "Success"
          },
          {
            startQuest = "1704175977079149184",
            startPort = "QuestStart",
            endQuest = "169451073079116742",
            endPort = "In"
          }
        },
        nodeData = {
          ["169451073079116742"] = {
            key = "169451073079116742",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100120-\232\165\191\230\175\148\233\188\147\230\142\140-SC11",
            pos = {x = 610.3155064954675, y = 115.90754890061629},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Test/SequenceTest.SequenceTest",
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
                  TalkActorVisible = true
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
          },
          ["1704175977079149184"] = {
            key = "1704175977079149184",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175977079149185"] = {
            key = "1704175977079149185",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175977079149186"] = {
            key = "1704175977079149186",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
