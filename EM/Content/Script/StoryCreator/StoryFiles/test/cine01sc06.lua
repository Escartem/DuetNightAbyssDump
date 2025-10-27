return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851537058311663294",
      startPort = "StoryStart",
      endStory = "171851537058311663296",
      endPort = "In"
    },
    {
      startStory = "171851537058311663296",
      startPort = "Success",
      endStory = "171851537058311663295",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851537058311663294"] = {
      isStoryNode = true,
      key = "171851537058311663294",
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
    ["171851537058311663295"] = {
      isStoryNode = true,
      key = "171851537058311663295",
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
    ["171851537058311663296"] = {
      isStoryNode = true,
      key = "171851537058311663296",
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
            startQuest = "171851537058311663297",
            startPort = "QuestStart",
            endQuest = "172232611645627371",
            endPort = "In"
          },
          {
            startQuest = "172232611645627371",
            startPort = "Out",
            endQuest = "171851537058311663298",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851537058311663297"] = {
            key = "171851537058311663297",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171851537058311663298"] = {
            key = "171851537058311663298",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1328.585607940447, y = 305.2109181141439},
            propsData = {ModeType = 0}
          },
          ["171851537058311663299"] = {
            key = "171851537058311663299",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["172232611645627371"] = {
            key = "172232611645627371",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \230\136\152\229\144\142\233\128\146\232\138\177",
            pos = {x = 1043.953544133883, y = 417.15970987217094},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC006/SQ_OBT0101_SC006",
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
