return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17411637979593656554",
      startPort = "StoryStart",
      endStory = "17411637979603656556",
      endPort = "In"
    },
    {
      startStory = "17411637979603656556",
      startPort = "Success",
      endStory = "17411637979603656555",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17411637979593656554"] = {
      isStoryNode = true,
      key = "17411637979593656554",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 817.5862068965517, y = 307.2413793103448},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17411637979603656555"] = {
      isStoryNode = true,
      key = "17411637979603656555",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1325.8620689655206, y = 309.4694960212201},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17411637979603656556"] = {
      isStoryNode = true,
      key = "17411637979603656556",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1070.8338523414197, y = 300.66032161185603},
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
        bIsShowOnComplete = false,
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
            startQuest = "17411637979603656562",
            startPort = "Out",
            endQuest = "17411637979603656564",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656564",
            startPort = "Out",
            endQuest = "17411637979603656563",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656568",
            startPort = "Out",
            endQuest = "17411637979603656559",
            endPort = "Fail"
          },
          {
            startQuest = "17411637979603656557",
            startPort = "QuestStart",
            endQuest = "17411637979603656568",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656557",
            startPort = "QuestStart",
            endQuest = "17411637979603656566",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656565",
            startPort = "Out",
            endQuest = "17411637979603656562",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656569",
            startPort = "Out",
            endQuest = "17411637979603656565",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656566",
            startPort = "Out",
            endQuest = "17411637979603656576",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656576",
            startPort = "Out",
            endQuest = "17411637979603656569",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656570",
            startPort = "Out",
            endQuest = "17411637979603656577",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656577",
            startPort = "Out",
            endQuest = "17411637979603656567",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656562",
            startPort = "Out",
            endQuest = "17411637979603656560",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656572",
            startPort = "Out",
            endQuest = "17411637979603656575",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656578",
            startPort = "Out",
            endQuest = "17411637979603656572",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656560",
            startPort = "Out",
            endQuest = "17411606729092123774",
            endPort = "In"
          },
          {
            startQuest = "17411606729092123774",
            startPort = "Out",
            endQuest = "17411637979603656578",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656563",
            startPort = "Out",
            endQuest = "17411625774402125113",
            endPort = "In"
          },
          {
            startQuest = "17411625774402125113",
            startPort = "Out",
            endQuest = "17411637979603656561",
            endPort = "In"
          },
          {
            startQuest = "17411637979603656575",
            startPort = "Out",
            endQuest = "1749044524452583600",
            endPort = "In"
          },
          {
            startQuest = "1749044524452583600",
            startPort = "Out",
            endQuest = "17411637979603656570",
            endPort = "In"
          }
        },
        nodeData = {
          ["17411606729092123774"] = {
            key = "17411606729092123774",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -4.23437870615669, y = 810.9393026323663},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12004206,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17411625774402125113"] = {
            key = "17411625774402125113",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1020.6034117450417, y = 285.1715929534061},
            propsData = {WaitTime = 6}
          },
          ["17411631681473183180"] = {
            key = "17411631681473183180",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 531.3675183281152, y = 833.580683862496},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = -1,
              UnitId = -1
            }
          },
          ["17411637979603656557"] = {
            key = "17411637979603656557",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -681.3488441865029, y = 866.1755459374382},
            propsData = {ModeType = 0}
          },
          ["17411637979603656558"] = {
            key = "17411637979603656558",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1897.3682167374982, y = 625.0301024299878},
            propsData = {ModeType = 0}
          },
          ["17411637979603656559"] = {
            key = "17411637979603656559",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1917.5160455486562, y = 1112.0155279503106},
            propsData = {}
          },
          ["17411637979603656560"] = {
            key = "17411637979603656560",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\156\128\231\187\136\228\189\141\231\189\174",
            pos = {x = -117.93047363523294, y = 602.0156183765662},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191198,
              GuideType = "M",
              GuidePointName = "Mechanism_12000208walkend_1191198"
            }
          },
          ["17411637979603656561"] = {
            key = "17411637979603656561",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\232\129\138\229\164\169",
            pos = {x = 1316.5355034908341, y = 352.16891939338444},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12004201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17411637979603656562"] = {
            key = "17411637979603656562",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \230\173\162\230\181\129AI",
            pos = {x = 452.4531597661987, y = 395.8885548531071},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191061}
            }
          },
          ["17411637979603656563"] = {
            key = "17411637979603656563",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1012.9269370591755, y = 414.45462993569106},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Follow",
              UnitId = 220028
            }
          },
          ["17411637979603656564"] = {
            key = "17411637979603656564",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 736.9126892631389, y = 406.42404989236456},
            propsData = {WaitTime = 1}
          },
          ["17411637979603656565"] = {
            key = "17411637979603656565",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\179\233\151\173 \230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = 147.1097181651821, y = 410.15358825014516},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir"
              }
            }
          },
          ["17411637979603656566"] = {
            key = "17411637979603656566",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = -364.0696699006617, y = 396.48946936143926},
            propsData = {QuestRoleId = 1010101, IsPlayFX = false}
          },
          ["17411637979603656567"] = {
            key = "17411637979603656567",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1640.0288711377298, y = 622.6889667235196},
            propsData = {}
          },
          ["17411637979603656568"] = {
            key = "17411637979603656568",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -399.124614297506, y = 1111.9840694564075},
            propsData = {}
          },
          ["17411637979603656569"] = {
            key = "17411637979603656569",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\231\166\129\231\148\168/\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = -109.29795314652318, y = 401.1924563811324},
            propsData = {
              WeaponTags = {"Melee"},
              bForbid = true,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17411637979603656570"] = {
            key = "17411637979603656570",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\231\166\129\231\148\168/\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = 1334.2643335377925, y = 610.1077539886563},
            propsData = {
              WeaponTags = {"Melee"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17411637979603656572"] = {
            key = "17411637979603656572",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 412.34663018851137, y = 618.9083862511309},
            propsData = {}
          },
          ["17411637979603656573"] = {
            key = "17411637979603656573",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\228\189\141\231\189\1741",
            pos = {x = -556.226355635734, y = -111.03311201033318},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240247,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240247"
            }
          },
          ["17411637979603656574"] = {
            key = "17411637979603656574",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\228\189\141\231\189\1742",
            pos = {x = -262.082527301858, y = -109.59052827827566},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240248,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240248"
            }
          },
          ["17411637979603656575"] = {
            key = "17411637979603656575",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \232\181\155\231\144\170AI2\229\143\183",
            pos = {x = 692.8764288064892, y = 632.2648175968332},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191061}
            }
          },
          ["17411637979603656576"] = {
            key = "17411637979603656576",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = -96.09281362809325, y = 219.88187470573774},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17411637979603656577"] = {
            key = "17411637979603656577",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1624.2481989888474, y = 463.4042080068744},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17411637979603656578"] = {
            key = "17411637979603656578",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 168.3202522274746, y = 639.3190485157264},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Stop",
              UnitId = 220028
            }
          },
          ["1749044524452583600"] = {
            key = "1749044524452583600",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\179\233\151\173 \230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = 1010.7104700854701, y = 651.9319490895579},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir"
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
