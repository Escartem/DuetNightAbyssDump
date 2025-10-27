return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17544760402849253345",
      startPort = "StoryStart",
      endStory = "17544760402849253347",
      endPort = "In"
    },
    {
      startStory = "17544760402849253347",
      startPort = "Success",
      endStory = "17544760402849253346",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17544760402849253345"] = {
      isStoryNode = true,
      key = "17544760402849253345",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 952, y = 324},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17544760402849253346"] = {
      isStoryNode = true,
      key = "17544760402849253346",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1724, y = 328},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17544760402849253347"] = {
      isStoryNode = true,
      key = "17544760402849253347",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1310, y = 322},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_10_1",
        QuestDeatil = "Content_120114_10_1",
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
            startQuest = "17544760402849253348",
            startPort = "QuestStart",
            endQuest = "17544760402849253358",
            endPort = "In"
          },
          {
            startQuest = "175447820583711992822",
            startPort = "Out",
            endQuest = "175447820583811992823",
            endPort = "In"
          },
          {
            startQuest = "175447820583811992823",
            startPort = "Out",
            endQuest = "175447820583811992824",
            endPort = "In"
          },
          {
            startQuest = "17544760402849253348",
            startPort = "QuestStart",
            endQuest = "175447820583711992822",
            endPort = "In"
          },
          {
            startQuest = "175758292893042733758",
            startPort = "Out",
            endQuest = "175758292893042733759",
            endPort = "In"
          },
          {
            startQuest = "175758292893042733756",
            startPort = "Out",
            endQuest = "175758292893042733760",
            endPort = "In"
          },
          {
            startQuest = "17544760402849253348",
            startPort = "QuestStart",
            endQuest = "175758292893042733758",
            endPort = "In"
          },
          {
            startQuest = "17544760402849253348",
            startPort = "QuestStart",
            endQuest = "175758292893042733756",
            endPort = "In"
          },
          {
            startQuest = "175758296427942734893",
            startPort = "Out",
            endQuest = "175758296427942734894",
            endPort = "In"
          },
          {
            startQuest = "175758296427942734895",
            startPort = "Out",
            endQuest = "175758296427942734896",
            endPort = "In"
          },
          {
            startQuest = "175758296427942734896",
            startPort = "Out",
            endQuest = "17544760402849253350",
            endPort = "Fail"
          },
          {
            startQuest = "17544760402849253358",
            startPort = "Out",
            endQuest = "175758296427942734893",
            endPort = "In"
          },
          {
            startQuest = "175758296427942734894",
            startPort = "Out",
            endQuest = "175758296427942734895",
            endPort = "In"
          },
          {
            startQuest = "175758332354942735678",
            startPort = "Out",
            endQuest = "175758332354942735679",
            endPort = "In"
          },
          {
            startQuest = "175758332354942735680",
            startPort = "Out",
            endQuest = "175758332354942735676",
            endPort = "Input_2"
          },
          {
            startQuest = "175758332354942735679",
            startPort = "Out",
            endQuest = "175758332354942735676",
            endPort = "Input_1"
          },
          {
            startQuest = "175447820583811992824",
            startPort = "Out",
            endQuest = "175758332354942735678",
            endPort = "In"
          },
          {
            startQuest = "175447820583811992824",
            startPort = "Out",
            endQuest = "175758332354942735680",
            endPort = "In"
          },
          {
            startQuest = "175758332354942735676",
            startPort = "Out",
            endQuest = "17544761384009311571",
            endPort = "In"
          }
        },
        nodeData = {
          ["17544760402849253348"] = {
            key = "17544760402849253348",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 873.5, y = 286.25},
            propsData = {ModeType = 0}
          },
          ["17544760402849253349"] = {
            key = "17544760402849253349",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3974.854655148773, y = 853.7466748937338},
            propsData = {ModeType = 0}
          },
          ["17544760402849253350"] = {
            key = "17544760402849253350",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2333.643939393939, y = 1257.5638528138527},
            propsData = {}
          },
          ["17544760402849253358"] = {
            key = "17544760402849253358",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1344.952711826357, y = 686.046033096846},
            propsData = {}
          },
          ["17544761384009311571"] = {
            key = "17544761384009311571",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3364.0049446167864, y = 360.74856696451116},
            propsData = {}
          },
          ["175447820583711992822"] = {
            key = "175447820583711992822",
            type = "TalkNode",
            name = "\227\128\14436-37\227\128\145\229\146\140\229\188\159\229\188\159\229\175\185\232\175\157",
            pos = {x = 1406.9082619740384, y = 312.69277925040814},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12033901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple36_37",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175447820583811992823"] = {
            key = "175447820583811992823",
            type = "TalkNode",
            name = "\227\128\14438\227\128\145\229\141\161\231\143\138\229\190\183\230\139\137\229\184\166\231\157\128\229\163\171\229\133\181\232\191\135\230\157\165",
            pos = {x = 1698.1967235124996, y = 308.310664029738},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple38",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211034,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211035,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211036,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 211012},
                {TalkActorType = "Npc", TalkActorId = 211034},
                {TalkActorType = "Npc", TalkActorId = 211035},
                {TalkActorType = "Npc", TalkActorId = 211036}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175447820583811992824"] = {
            key = "175447820583811992824",
            type = "TalkNode",
            name = "\227\128\14439\227\128\145\229\146\140\229\141\161\231\143\138\229\190\183\230\139\137\229\175\185\232\175\157",
            pos = {x = 2016.7198758503573, y = 313.3114558849416},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12034201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple39",
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211015},
                {TalkActorType = "Npc", TalkActorId = 211012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175758292893042733756"] = {
            key = "175758292893042733756",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1384.5840378056232, y = -10.49478657460645},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["175758292893042733758"] = {
            key = "175758292893042733758",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1379.7799465574592, y = -177.29663837655772},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["175758292893042733759"] = {
            key = "175758292893042733759",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1688.2200534425408, y = -191.63586460069024},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["175758292893042733760"] = {
            key = "175758292893042733760",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1679.2767692651494, y = -19.37500500040494},
            propsData = {
              Duration = 4,
              CameraName = "StoryEast01Nai01",
              LockRotate = false,
              FocalLength = 0,
              LensAperture = 0,
              FOV = 80,
              PPMaterialPath = ""
            }
          },
          ["175758296427942734893"] = {
            key = "175758296427942734893",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1650.796159971294, y = 911.8702734998998},
            propsData = {}
          },
          ["175758296427942734894"] = {
            key = "175758296427942734894",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1897.6920599949037, y = 970.1951871053866},
            propsData = {Duration = 3}
          },
          ["175758296427942734895"] = {
            key = "175758296427942734895",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1683.7074220656418, y = 1127.4967546436765},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758296427942734896"] = {
            key = "175758296427942734896",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1940.846770885259, y = 1200.6777141161995},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758332354942735676"] = {
            key = "175758332354942735676",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 3019.573975252548, y = 345.6534569670673},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["175758332354942735678"] = {
            key = "175758332354942735678",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2436.5927651278153, y = 214.97093762037503},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758332354942735679"] = {
            key = "175758332354942735679",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2716.603911267759, y = 212.3191738698298},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758332354942735680"] = {
            key = "175758332354942735680",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2548.825474616917, y = 394.7361000609503},
            propsData = {Duration = 3}
          }
        },
        commentData = {
          ["175758293531642734022"] = {
            key = "175758293531642734022",
            name = "Input Commment...",
            position = {x = 1306, y = -289.89473684210526},
            size = {width = 659.4736842105261, height = 479.68421052631584}
          },
          ["175758297078342735157"] = {
            key = "175758297078342735157",
            name = "Input Commment...",
            position = {x = 1604.1547987616098, y = 828.7739938080497},
            size = {width = 611.1084797555386, height = 501.7226890756301}
          },
          ["17575842960078672105"] = {
            key = "17575842960078672105",
            name = "Input Commment...",
            position = {x = 2340, y = 106},
            size = {width = 956, height = 460}
          }
        }
      }
    }
  },
  commentData = {}
}
