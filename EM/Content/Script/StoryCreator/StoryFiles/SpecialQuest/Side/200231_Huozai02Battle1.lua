return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "174858588210726",
      startPort = "StoryStart",
      endStory = "1748586454518583",
      endPort = "In"
    },
    {
      startStory = "1748586454518583",
      startPort = "Success",
      endStory = "174858588210729",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["174858588210726"] = {
      isStoryNode = true,
      key = "174858588210726",
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
    ["174858588210729"] = {
      isStoryNode = true,
      key = "174858588210729",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1664, y = 332},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1748586454518583"] = {
      isStoryNode = true,
      key = "1748586454518583",
      type = "StoryNode",
      name = "\230\138\164\233\128\129\229\164\154\231\186\179\231\137\185\231\154\132\231\172\172\228\184\128\229\156\186\230\136\152\230\150\151",
      pos = {x = 1192.8665028152852, y = 326.5714285973789},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200231_6",
        QuestDeatil = "Content_200231_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "1748586454518584",
            startPort = "QuestStart",
            endQuest = "17485869558243166",
            endPort = "In"
          },
          {
            startQuest = "1748586454518584",
            startPort = "QuestStart",
            endQuest = "17485869708163575",
            endPort = "In"
          },
          {
            startQuest = "17485869708163575",
            startPort = "Out",
            endQuest = "17485870697294172",
            endPort = "In"
          },
          {
            startQuest = "17485872102845127",
            startPort = "Out",
            endQuest = "17485872381495595",
            endPort = "In"
          },
          {
            startQuest = "17485870697294172",
            startPort = "Out",
            endQuest = "1749007362655599760",
            endPort = "In"
          },
          {
            startQuest = "1749007362655599760",
            startPort = "Out",
            endQuest = "17485872102845127",
            endPort = "In"
          },
          {
            startQuest = "17485869558243166",
            startPort = "Out",
            endQuest = "1748586454519598",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1748586454518584"] = {
            key = "1748586454518584",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1748586454519591"] = {
            key = "1748586454519591",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3071.2121159869084, y = 256.0606069071489},
            propsData = {ModeType = 0}
          },
          ["1748586454519598"] = {
            key = "1748586454519598",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1779.3846207392364, y = 620.1025649218503},
            propsData = {}
          },
          ["17485869558243166"] = {
            key = "17485869558243166",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1331.6923169468992, y = 610.9230579624502},
            propsData = {}
          },
          ["17485869708163575"] = {
            key = "17485869708163575",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 1221.2074684328595, y = 248.43820944841062},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240883,
                1240884,
                1240885,
                1240886,
                1240887
              }
            }
          },
          ["17485870697294172"] = {
            key = "17485870697294172",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1577.6923169468992, y = 216.92305796245023},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240883,
                1240884,
                1240885,
                1240886,
                1240887
              }
            }
          },
          ["17485872102845127"] = {
            key = "17485872102845127",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2180.5408019992215, y = 207.20877217031352},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009643,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage20023104_01",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorId = 700301,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700301}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17485872381495595"] = {
            key = "17485872381495595",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2470.861148501339, y = 191.20877253361803},
            propsData = {}
          },
          ["1749007362655599760"] = {
            key = "1749007362655599760",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1865.1428486571021, y = 222.0000038146971},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
