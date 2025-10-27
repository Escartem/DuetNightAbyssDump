return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851537059911663448",
      startPort = "StoryStart",
      endStory = "171851537059911663450",
      endPort = "In"
    },
    {
      startStory = "171851537059911663450",
      startPort = "Success",
      endStory = "171851537059911663449",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851537059911663448"] = {
      isStoryNode = true,
      key = "171851537059911663448",
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
    ["171851537059911663449"] = {
      isStoryNode = true,
      key = "171851537059911663449",
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
    ["171851537059911663450"] = {
      isStoryNode = true,
      key = "171851537059911663450",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1028.970337028758, y = 308.3616499713401},
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
            startQuest = "171851537059911663451",
            startPort = "QuestStart",
            endQuest = "172232630503228421",
            endPort = "In"
          },
          {
            startQuest = "172232630503228421",
            startPort = "Out",
            endQuest = "171851537059911663452",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851537059911663451"] = {
            key = "171851537059911663451",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171851537059911663452"] = {
            key = "171851537059911663452",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1328.585607940447, y = 305.2109181141439},
            propsData = {ModeType = 0}
          },
          ["171851537059911663453"] = {
            key = "171851537059911663453",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["172232630503228421"] = {
            key = "172232630503228421",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \232\181\155\231\144\170\232\139\143\233\134\146",
            pos = {x = 1066.2433327766128, y = 313.43243714489836},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC008/SQ_OBT0101_SC008",
              BlendInTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
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
