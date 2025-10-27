return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1733734212424597760",
      startPort = "StoryStart",
      endStory = "1733734212424597762",
      endPort = "In"
    },
    {
      startStory = "1733734212424597762",
      startPort = "Success",
      endStory = "1733734212424597761",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1733734212424597760"] = {
      isStoryNode = true,
      key = "1733734212424597760",
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
    ["1733734212424597761"] = {
      isStoryNode = true,
      key = "1733734212424597761",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1766.4999999999998, y = 303},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1733734212424597762"] = {
      isStoryNode = true,
      key = "1733734212424597762",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\231\130\188\233\135\145\233\153\162",
      pos = {x = 1275.5315018315016, y = 288.67252747252707},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030501",
        QuestDeatil = "QuestDesc_10030501",
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
            startQuest = "1733734212424597767",
            startPort = "Out",
            endQuest = "1733734212424597766",
            endPort = "Fail"
          },
          {
            startQuest = "1733734212424597777",
            startPort = "Out",
            endQuest = "1733734212424597778",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597777",
            startPort = "Out",
            endQuest = "1733734212424597779",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597772",
            startPort = "Out",
            endQuest = "1733734212424597777",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597775",
            startPort = "Out",
            endQuest = "1733734212424597781",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597777",
            startPort = "Out",
            endQuest = "1733734212424597780",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597764",
            startPort = "QuestStart",
            endQuest = "1733734212424597767",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597764",
            startPort = "QuestStart",
            endQuest = "1733734212424597773",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597773",
            startPort = "Out",
            endQuest = "1733734212424597772",
            endPort = "In"
          },
          {
            startQuest = "17468680800322071",
            startPort = "Out",
            endQuest = "1733734212424597775",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597772",
            startPort = "Out",
            endQuest = "17485037550064639492",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597781",
            startPort = "Out",
            endQuest = "17485038231025218562",
            endPort = "In"
          },
          {
            startQuest = "17485038231025218562",
            startPort = "Out",
            endQuest = "17337341869531752",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597778",
            startPort = "Out",
            endQuest = "17485230910054354038",
            endPort = "In"
          },
          {
            startQuest = "17485230910054354038",
            startPort = "Out",
            endQuest = "1733734212424597771",
            endPort = "In"
          },
          {
            startQuest = "1733734212424597771",
            startPort = "Out",
            endQuest = "17485746346556744",
            endPort = "In"
          },
          {
            startQuest = "17485746346556744",
            startPort = "Out",
            endQuest = "17468680800322071",
            endPort = "In"
          }
        },
        nodeData = {
          ["17337341869531752"] = {
            key = "17337341869531752",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -1418.4285714285718, y = 764.7899159663866},
            propsData = {}
          },
          ["1733734212424597764"] = {
            key = "1733734212424597764",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -4226.465584367485, y = 984.2587136722018},
            propsData = {ModeType = 0}
          },
          ["1733734212424597765"] = {
            key = "1733734212424597765",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -1143.2148314602266, y = 779.5592098417712},
            propsData = {ModeType = 0}
          },
          ["1733734212424597766"] = {
            key = "1733734212424597766",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -1436.318762345504, y = 1565.7808922771897},
            propsData = {}
          },
          ["1733734212424597767"] = {
            key = "1733734212424597767",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -2446.8452146408786, y = 1353.0176644820606},
            propsData = {}
          },
          ["1733734212424597768"] = {
            key = "1733734212424597768",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = -1463.3176470588246, y = -343.3627450980389},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1733734212424597769"] = {
            key = "1733734212424597769",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = -1135.1607843137263, y = -335.44117647058795},
            propsData = {
              StaticCreatorIdList = {0},
              ManualItemIdList = {0},
              StateId = 0,
              QuestId = 0
            }
          },
          ["1733734212424597771"] = {
            key = "1733734212424597771",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\229\137\167\230\131\133+\232\191\135\229\156\186",
            pos = {x = -2808.939294853034, y = 758.3056329119788},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035501,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = false,
              ShowSkipButton = true,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1733734212424597772"] = {
            key = "1733734212424597772",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = -3271.1522897013233, y = 435.26405539764596},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "BulletJump",
                "Attack",
                "Avoid",
                "Slide",
                "Skill1",
                "Jump",
                "Fire"
              }
            }
          },
          ["1733734212424597773"] = {
            key = "1733734212424597773",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = -3688.1824104160196, y = 471.7640553976446},
            propsData = {QuestRoleId = 11030101, IsPlayFX = false}
          },
          ["1733734212424597775"] = {
            key = "1733734212424597775",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\229\137\167\230\131\133+\232\191\135\229\156\186",
            pos = {x = -2196.713959530549, y = 759.5270700003999},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035518,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = false,
              ShowSkipButton = true,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1733734212424597777"] = {
            key = "1733734212424597777",
            type = "PlayerSwitchWalkRunNode",
            name = "\231\142\169\229\174\182\232\181\176\232\183\145\229\136\135\230\141\162-\232\181\176",
            pos = {x = -3578.4831336988063, y = 636.3341518621351},
            propsData = {Rate = 1, Mode = "ToRun"}
          },
          ["1733734212424597778"] = {
            key = "1733734212424597778",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = -3262.2912331469147, y = 636.4090701177222},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["1733734212424597779"] = {
            key = "1733734212424597779",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = -3264.6934810318835, y = 778.0516088267809},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["1733734212424597780"] = {
            key = "1733734212424597780",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = -3270.8322509165782, y = 930.7215214609946},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "Map",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["1733734212424597781"] = {
            key = "1733734212424597781",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = -1941.4922645871156, y = 758.6118118723388},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035522,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimpleplus01",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100336,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100337,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100336},
                {TalkActorType = "Npc", TalkActorId = 100337}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17468680800322071"] = {
            key = "17468680800322071",
            type = "TalkNode",
            name = "\230\148\185\233\128\160\229\138\168\231\148\187",
            pos = {x = -2438.880952380953, y = 765.6595071595073},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC009/SQ_OBT0103_SC009",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17485037550064639492"] = {
            key = "17485037550064639492",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = -2937.3508003566835, y = 434.0924369747899},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {"Skill2", "Skill3"}
            }
          },
          ["17485038231025218562"] = {
            key = "17485038231025218562",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = -1680.2468287497704, y = 764},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {"Skill2", "Skill3"}
            }
          },
          ["17485230910054354038"] = {
            key = "17485230910054354038",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -2991.2221637836988, y = 982.2966708496347},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {103201},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17485746346556744"] = {
            key = "17485746346556744",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -2615.6110818918496, y = 567.3333333333334},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0081_scene_alchemyacademy",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {103201},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
