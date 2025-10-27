return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17485894029052512",
      startPort = "StoryStart",
      endStory = "17485894065452597",
      endPort = "In"
    },
    {
      startStory = "17485894065452597",
      startPort = "Success",
      endStory = "17485894029052515",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17485894029052512"] = {
      isStoryNode = true,
      key = "17485894029052512",
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
    ["17485894029052515"] = {
      isStoryNode = true,
      key = "17485894029052515",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1553.6363636363635, y = 286.3636363636364},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17485894065452597"] = {
      isStoryNode = true,
      key = "17485894065452597",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1172.7272727272725, y = 283.72727272727275},
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
            startQuest = "17485894065452598",
            startPort = "QuestStart",
            endQuest = "17485902359684161077",
            endPort = "In"
          },
          {
            startQuest = "17485894065452598",
            startPort = "QuestStart",
            endQuest = "17600803094346221292",
            endPort = "In"
          },
          {
            startQuest = "17485902359684161077",
            startPort = "Out",
            endQuest = "17600803312996221628",
            endPort = "In"
          },
          {
            startQuest = "17600803312996221628",
            startPort = "Out",
            endQuest = "17485894065452601",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17485894065452598"] = {
            key = "17485894065452598",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17485894065452601"] = {
            key = "17485894065452601",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1768.6666666666665, y = 299},
            propsData = {ModeType = 0}
          },
          ["17485894065452604"] = {
            key = "17485894065452604",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17485902359684161077"] = {
            key = "17485902359684161077",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1204.7375503977337, y = 288.2891604010025},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80150101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_410101",
              BlendInTime = 0,
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
                  TalkActorId = 790044,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790044},
                {TalkActorType = "Npc", TalkActorId = 790008},
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
          ["17600803094346221292"] = {
            key = "17600803094346221292",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1208, y = 490},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0016_judian",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["17600803312996221628"] = {
            key = "17600803312996221628",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1482, y = 300},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
