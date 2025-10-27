return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "1751274967105329931",
      startPort = "StoryStart",
      endStory = "1751274967105329933",
      endPort = "In"
    },
    {
      startStory = "1751274967105329933",
      startPort = "Success",
      endStory = "1751274967105329932",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1751274967105329931"] = {
      isStoryNode = true,
      key = "1751274967105329931",
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
    ["1751274967105329932"] = {
      isStoryNode = true,
      key = "1751274967105329932",
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
    ["1751274967105329933"] = {
      isStoryNode = true,
      key = "1751274967105329933",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 431, y = 100.75},
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
            startQuest = "175014458840756760",
            startPort = "Out",
            endQuest = "1751274967105329935",
            endPort = "Success"
          },
          {
            startQuest = "175014451866156323",
            startPort = "Out",
            endQuest = "17501450536162594098",
            endPort = "In"
          },
          {
            startQuest = "17501450536162594098",
            startPort = "Out",
            endQuest = "175014458840756760",
            endPort = "In"
          },
          {
            startQuest = "1751274967105329934",
            startPort = "QuestStart",
            endQuest = "17509924785294065",
            endPort = "In"
          },
          {
            startQuest = "17509924785294065",
            startPort = "Out",
            endQuest = "175014451866156323",
            endPort = "In"
          }
        },
        nodeData = {
          ["17367594319123235"] = {
            key = "17367594319123235",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 811.5808823529412, y = 126.76857585139305},
            propsData = {
              Text = "tyx\230\137\167\232\161\140\228\186\134"
            }
          },
          ["17444409764595422771"] = {
            key = "17444409764595422771",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 732.9473684210527, y = -497.2631578947368},
            propsData = {
              MessageId = 200001,
              SkillNameList = {"Jump"},
              LastTime = -1,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.Jump",
              UICompName = "Bg",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["175014451866156323"] = {
            key = "175014451866156323",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = -559.8947368421052, y = 332.0263157894737},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["175014458840756760"] = {
            key = "175014458840756760",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 137.5, y = 326.07142857142856},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          },
          ["17501450536162594098"] = {
            key = "17501450536162594098",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -225.30279503105578, y = 340.9813664596273},
            propsData = {WaitTime = 3}
          },
          ["17506798890805272624"] = {
            key = "17506798890805272624",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100101-\233\134\146\230\157\165",
            pos = {x = -58.74945236745225, y = 843.5},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC003/SQ_OBT0100_SC003",
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
              EndNewTargetPointName = "QuestPoint6",
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
          ["17509924785294065"] = {
            key = "17509924785294065",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -911.1053448839489, y = 359.65131578947353},
            propsData = {WaitTime = 1}
          },
          ["1751274967105329934"] = {
            key = "1751274967105329934",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1285.221052631579, y = 365.9421052631579},
            propsData = {ModeType = 0}
          },
          ["1751274967105329935"] = {
            key = "1751274967105329935",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 431.98707572620617, y = 357.9410878976097},
            propsData = {ModeType = 0}
          },
          ["1751274967105329936"] = {
            key = "1751274967105329936",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1237.7777777777778, y = 893.8888888888889},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
