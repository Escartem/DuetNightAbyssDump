return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17337270647911807134",
      startPort = "StoryStart",
      endStory = "17337270647901807133",
      endPort = "In"
    },
    {
      startStory = "17337270647901807133",
      startPort = "Success",
      endStory = "17337270647911807135",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17337270647901807133"] = {
      isStoryNode = true,
      key = "17337270647901807133",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1125.448275862069, y = 288.0689655172414},
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
            startQuest = "17337270647911807136",
            startPort = "QuestStart",
            endQuest = "17337270647911807139",
            endPort = "In"
          },
          {
            startQuest = "17337270647911807136",
            startPort = "QuestStart",
            endQuest = "176008162166121147628",
            endPort = "In"
          },
          {
            startQuest = "17337270647911807139",
            startPort = "Out",
            endQuest = "176008164169921148124",
            endPort = "In"
          },
          {
            startQuest = "176008164169921148124",
            startPort = "Out",
            endQuest = "17337270647911807137",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17337270647911807136"] = {
            key = "17337270647911807136",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["17337270647911807137"] = {
            key = "17337270647911807137",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1245.5624106149694, y = 291.09034729946853},
            propsData = {ModeType = 0}
          },
          ["17337270647911807138"] = {
            key = "17337270647911807138",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["17337270647911807139"] = {
            key = "17337270647911807139",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 682.75, y = 275.125},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80130301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Invite",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorId = 93103,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93103},
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
          ["176008162166121147628"] = {
            key = "176008162166121147628",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 682.6533613445379, y = 443.1880252100841},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0024_story_pub",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008164169921148124"] = {
            key = "176008164169921148124",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 958.6785714285713, y = 291.150210084034},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17337270647911807134"] = {
      isStoryNode = true,
      key = "17337270647911807134",
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
    ["17337270647911807135"] = {
      isStoryNode = true,
      key = "17337270647911807135",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
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
