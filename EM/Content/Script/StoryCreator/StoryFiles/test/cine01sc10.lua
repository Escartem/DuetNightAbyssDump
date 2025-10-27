return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851537061511663602",
      startPort = "StoryStart",
      endStory = "171851537061511663604",
      endPort = "In"
    },
    {
      startStory = "171851537061511663604",
      startPort = "Success",
      endStory = "171851537061511663603",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851537061511663602"] = {
      isStoryNode = true,
      key = "171851537061511663602",
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
    ["171851537061511663603"] = {
      isStoryNode = true,
      key = "171851537061511663603",
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
    ["171851537061511663604"] = {
      isStoryNode = true,
      key = "171851537061511663604",
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
            startQuest = "171851537061511663605",
            startPort = "QuestStart",
            endQuest = "17223535957439979",
            endPort = "In"
          },
          {
            startQuest = "17223535957439979",
            startPort = "Out",
            endQuest = "172235361994110391",
            endPort = "In"
          },
          {
            startQuest = "172235361994110391",
            startPort = "Out",
            endQuest = "172232635498429297",
            endPort = "In"
          },
          {
            startQuest = "172232635498429297",
            startPort = "Out",
            endQuest = "17337365955391304344",
            endPort = "In"
          },
          {
            startQuest = "17337365955391304344",
            startPort = "Out",
            endQuest = "171851537061511663606",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851537061511663605"] = {
            key = "171851537061511663605",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 407.9310344827586, y = 310.34482758620686},
            propsData = {ModeType = 0}
          },
          ["171851537061511663606"] = {
            key = "171851537061511663606",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1588.5472937642019, y = 301.4944430183584},
            propsData = {ModeType = 0}
          },
          ["171851537061511663607"] = {
            key = "171851537061511663607",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1373.8461538461543, y = 499.2307692307693},
            propsData = {}
          },
          ["172232635498429297"] = {
            key = "172232635498429297",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \229\184\131\233\178\129\230\150\175\232\162\173\229\135\187\228\184\187\232\167\146",
            pos = {x = 1126.3418549441005, y = 301.46199379514456},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC010/SQ_OBT0101_SC010",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
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
          },
          ["17223535957439979"] = {
            key = "17223535957439979",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 643.4976979727961, y = 309.4353970108176},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["172235361994110391"] = {
            key = "172235361994110391",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 880.0494221107273, y = 308.40091425219686},
            propsData = {WaitTime = 3}
          },
          ["17337365955391304344"] = {
            key = "17337365955391304344",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\231\153\189\229\164\169",
            pos = {x = 1359.7543859649122, y = 305.33333333333337},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityMorning",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
