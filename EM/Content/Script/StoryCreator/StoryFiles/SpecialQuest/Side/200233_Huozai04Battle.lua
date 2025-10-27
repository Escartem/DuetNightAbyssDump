return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17502317068061",
      startPort = "StoryStart",
      endStory = "1750231766816300",
      endPort = "In"
    },
    {
      startStory = "1750231766816300",
      startPort = "Success",
      endStory = "17502317068065",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17502317068061"] = {
      isStoryNode = true,
      key = "17502317068061",
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
    ["17502317068065"] = {
      isStoryNode = true,
      key = "17502317068065",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1726, y = 302},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750231766816300"] = {
      isStoryNode = true,
      key = "1750231766816300",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1222, y = 306},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200233_3",
        QuestDeatil = "Content_200233_3",
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
            startQuest = "1750231766816301",
            startPort = "QuestStart",
            endQuest = "17502318484581262",
            endPort = "In"
          },
          {
            startQuest = "17502318484581262",
            startPort = "Out",
            endQuest = "17502318614891426",
            endPort = "In"
          },
          {
            startQuest = "17502318614891426",
            startPort = "Out",
            endQuest = "17502318746811593",
            endPort = "In"
          },
          {
            startQuest = "1750231766816301",
            startPort = "QuestStart",
            endQuest = "17502319040662417",
            endPort = "In"
          },
          {
            startQuest = "17502319040662417",
            startPort = "Out",
            endQuest = "1750231766817315",
            endPort = "Fail"
          },
          {
            startQuest = "17502318746811593",
            startPort = "Out",
            endQuest = "17502319363612871",
            endPort = "In"
          },
          {
            startQuest = "17502319363612871",
            startPort = "Out",
            endQuest = "17502318885062030",
            endPort = "In"
          }
        },
        nodeData = {
          ["1750231766816301"] = {
            key = "1750231766816301",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750231766817308"] = {
            key = "1750231766817308",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3016, y = 306},
            propsData = {ModeType = 0}
          },
          ["1750231766817315"] = {
            key = "1750231766817315",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1824, y = 684},
            propsData = {}
          },
          ["17502318484581262"] = {
            key = "17502318484581262",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1154, y = 306},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240955}
            }
          },
          ["17502318614891426"] = {
            key = "17502318614891426",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1517.612903205959, y = 282},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1240955}
            }
          },
          ["17502318746811593"] = {
            key = "17502318746811593",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1799.7419364960956, y = 299.8064512953426},
            propsData = {WaitTime = 0.5}
          },
          ["17502318885062030"] = {
            key = "17502318885062030",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2424.2580653497257, y = 273.6774192357535},
            propsData = {}
          },
          ["17502319040662417"] = {
            key = "17502319040662417",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1404, y = 644},
            propsData = {}
          },
          ["17502319363612871"] = {
            key = "17502319363612871",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2138.3870974093147, y = 301.9354833549317},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009897,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20023303",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorId = 700302,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700300,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700302},
                {TalkActorType = "Npc", TalkActorId = 700300}
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
    }
  },
  commentData = {}
}
