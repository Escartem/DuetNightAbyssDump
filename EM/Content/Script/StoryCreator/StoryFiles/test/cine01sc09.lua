return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851537060611663525",
      startPort = "StoryStart",
      endStory = "171851537060611663527",
      endPort = "In"
    },
    {
      startStory = "171851537060611663527",
      startPort = "Success",
      endStory = "171851537060611663526",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851537060611663525"] = {
      isStoryNode = true,
      key = "171851537060611663525",
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
    ["171851537060611663526"] = {
      isStoryNode = true,
      key = "171851537060611663526",
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
    ["171851537060611663527"] = {
      isStoryNode = true,
      key = "171851537060611663527",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1028.970337028758, y = 307.47929703016365},
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
            startQuest = "171851537060611663528",
            startPort = "QuestStart",
            endQuest = "172232632532828843",
            endPort = "In"
          },
          {
            startQuest = "172232632532828843",
            startPort = "Out",
            endQuest = "171851537060611663529",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851537060611663528"] = {
            key = "171851537060611663528",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171851537060611663529"] = {
            key = "171851537060611663529",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1328.585607940447, y = 305.2109181141439},
            propsData = {ModeType = 0}
          },
          ["171851537060611663530"] = {
            key = "171851537060611663530",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["172232632532828843"] = {
            key = "172232632532828843",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \229\135\187\230\157\128\232\181\155\231\144\170",
            pos = {x = 1071.9576184908983, y = 306.2895800020412},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC009/SQ_OBT0101_SC009",
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
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
