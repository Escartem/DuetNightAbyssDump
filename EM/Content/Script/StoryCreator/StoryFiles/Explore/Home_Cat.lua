return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17506667862071",
      startPort = "StoryStart",
      endStory = "1750666795878120",
      endPort = "In"
    },
    {
      startStory = "1750666795878120",
      startPort = "Success",
      endStory = "17506667862085",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17506667862071"] = {
      isStoryNode = true,
      key = "17506667862071",
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
    ["17506667862085"] = {
      isStoryNode = true,
      key = "17506667862085",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1784, y = 304},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750666795878120"] = {
      isStoryNode = true,
      key = "1750666795878120",
      type = "StoryNode",
      name = "\230\141\174\231\130\185\231\140\171\231\140\171\228\186\164\228\186\146",
      pos = {x = 1376, y = 302},
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
            startQuest = "1750666795879121",
            startPort = "QuestStart",
            endQuest = "1750666824702965",
            endPort = "In"
          },
          {
            startQuest = "1750666824702965",
            startPort = "Branch_1",
            endQuest = "1750666815878715",
            endPort = "In"
          },
          {
            startQuest = "1750666815878715",
            startPort = "Out",
            endQuest = "1750666795879128",
            endPort = "Success"
          },
          {
            startQuest = "1750666815878715",
            startPort = "Fail",
            endQuest = "1750666795879135",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1750666795879121"] = {
            key = "1750666795879121",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750666795879128"] = {
            key = "1750666795879128",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750666795879135"] = {
            key = "1750666795879135",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1750666815878715"] = {
            key = "1750666815878715",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1524, y = 300},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 88888801,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.3,
              BlendOutTime = 0.3,
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
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 888888,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 888888}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750666824702965"] = {
            key = "1750666824702965",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1184, y = 300},
            propsData = {
              Branches = {88888801}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
