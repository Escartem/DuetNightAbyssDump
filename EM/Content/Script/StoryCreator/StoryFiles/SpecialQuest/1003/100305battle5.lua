return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210914572664",
      startPort = "StoryStart",
      endStory = "1732783210914572666",
      endPort = "In"
    },
    {
      startStory = "1732783210914572666",
      startPort = "Success",
      endStory = "1732783210914572665",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210914572664"] = {
      isStoryNode = true,
      key = "1732783210914572664",
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
    ["1732783210914572665"] = {
      isStoryNode = true,
      key = "1732783210914572665",
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
    ["1732783210914572666"] = {
      isStoryNode = true,
      key = "1732783210914572666",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\230\136\152\229\156\186",
      pos = {x = 1270.8648351648349, y = 284.43723335488},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030507",
        QuestDeatil = "QuestDesc_10030507",
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
            startQuest = "17337264986602599643",
            startPort = "Out",
            endQuest = "17337264986602599644",
            endPort = "In"
          },
          {
            startQuest = "17295006326691557891",
            startPort = "Out",
            endQuest = "17337264986602599643",
            endPort = "In"
          },
          {
            startQuest = "17295006326691557891",
            startPort = "Out",
            endQuest = "17337264986602599647",
            endPort = "In"
          },
          {
            startQuest = "17337264986602599643",
            startPort = "Out",
            endQuest = "17345207193136175516",
            endPort = "In"
          },
          {
            startQuest = "1732783210914572667",
            startPort = "QuestStart",
            endQuest = "17346858882394092871",
            endPort = "In"
          },
          {
            startQuest = "17346858882394092871",
            startPort = "Out",
            endQuest = "17399504405085182036",
            endPort = "In"
          },
          {
            startQuest = "1732783210914572667",
            startPort = "QuestStart",
            endQuest = "1732783210914572671",
            endPort = "In"
          },
          {
            startQuest = "17346858882394092871",
            startPort = "Out",
            endQuest = "17471538771433432863",
            endPort = "In"
          },
          {
            startQuest = "1732783210914572671",
            startPort = "Out",
            endQuest = "17472308159882291022",
            endPort = "In"
          },
          {
            startQuest = "17472308159882291022",
            startPort = "Out",
            endQuest = "1732783210914572669",
            endPort = "Fail"
          },
          {
            startQuest = "17399504405085182036",
            startPort = "Out",
            endQuest = "17484876548261159301",
            endPort = "In"
          },
          {
            startQuest = "17484876548261159301",
            startPort = "Out",
            endQuest = "17472947972995168371",
            endPort = "In"
          },
          {
            startQuest = "17485042056709855911",
            startPort = "Out",
            endQuest = "1732783210914572670",
            endPort = "In"
          },
          {
            startQuest = "17346858882394092871",
            startPort = "Out",
            endQuest = "17485042185429856710",
            endPort = "In"
          },
          {
            startQuest = "17399504707765183284",
            startPort = "Out",
            endQuest = "17485042056709855911",
            endPort = "In"
          },
          {
            startQuest = "17471538771433432863",
            startPort = "Out",
            endQuest = "17295006326691557891",
            endPort = "In"
          },
          {
            startQuest = "17337264986602599644",
            startPort = "Out",
            endQuest = "17399504707765183284",
            endPort = "In"
          },
          {
            startQuest = "17471538771433432863",
            startPort = "Out",
            endQuest = "17504111844052586643",
            endPort = "In"
          }
        },
        nodeData = {
          ["17295006326691557891"] = {
            key = "17295006326691557891",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = -2336.9157877339353, y = -5.617842374341784},
            propsData = {
              SendMessage = "sp5bossspawn01",
              FinishCondition = "sp5bossspawn11"
            }
          },
          ["1732783210914572667"] = {
            key = "1732783210914572667",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -3818.6194305213307, y = 476.8740982875863},
            propsData = {ModeType = 0}
          },
          ["1732783210914572668"] = {
            key = "1732783210914572668",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -288.7442432249326, y = 272.00458799303175},
            propsData = {
              ModeType = 1,
              Id = 101703,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1732783210914572669"] = {
            key = "1732783210914572669",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -844.318762345504, y = 637.7808922771897},
            propsData = {}
          },
          ["1732783210914572670"] = {
            key = "1732783210914572670",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -667.2767480197806, y = 131.25963303981843},
            propsData = {}
          },
          ["1732783210914572671"] = {
            key = "1732783210914572671",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -2364.369024164688, y = 773.1129025772987},
            propsData = {}
          },
          ["17337264986602599643"] = {
            key = "17337264986602599643",
            type = "GoToNode",
            name = "\233\128\131\231\166\187",
            pos = {x = -1986.132186492557, y = -0.34198618718761153},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 100305,
              GuideType = "M",
              GuidePointName = "BP_StaticCreateActor28"
            }
          },
          ["17337264986602599644"] = {
            key = "17337264986602599644",
            type = "GoToNode",
            name = "\233\128\131\231\166\187",
            pos = {x = -1629.0085856352098, y = 61.31364610621543},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 100306,
              GuideType = "M",
              GuidePointName = "BP_StaticCreateActor29"
            }
          },
          ["17337264986602599647"] = {
            key = "17337264986602599647",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = -2342.259716856929, y = 223.60943081686136},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036122,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17345207193136175516"] = {
            key = "17345207193136175516",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = -1994.5913968900036, y = 229.69230769230768},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036124,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17346858882394092871"] = {
            key = "17346858882394092871",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = -3481.336256569866, y = -13.194895378100796},
            propsData = {QuestRoleId = 11030101, IsPlayFX = false}
          },
          ["17399504405085182036"] = {
            key = "17399504405085182036",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = -3466.6153846153843, y = 272.7692307692308},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1920121}
            }
          },
          ["17399504707765183284"] = {
            key = "17399504707765183284",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = -898, y = 412},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1920121}
            }
          },
          ["17471538771433432863"] = {
            key = "17471538771433432863",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -3110, y = -2.461538461538469},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "bulu_chusheng02",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17472308159882291022"] = {
            key = "17472308159882291022",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1513.7142857142858, y = 760},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "sp5fail",
              UnitId = -1
            }
          },
          ["17472947972995168371"] = {
            key = "17472947972995168371",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = -2742.2632090132097, y = 267.5961538461538},
            propsData = {
              PhantomRoleId = 204,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                },
                {
                  Id = 110399,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17484876548261159301"] = {
            key = "17484876548261159301",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -3106.0561894246075, y = 278.2573917310761},
            propsData = {WaitTime = 2}
          },
          ["17485042056709855911"] = {
            key = "17485042056709855911",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = -971.6039716069131, y = -34},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {"Skill2", "Skill3"}
            }
          },
          ["17485042185429856710"] = {
            key = "17485042185429856710",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = -3099.6039716069135, y = -238},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {"Skill2", "Skill3"}
            }
          },
          ["17504111844052586643"] = {
            key = "17504111844052586643",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = -2352.8491508491534, y = -204.3596403596402},
            propsData = {
              HPPercent = -1,
              ESPercent = -1,
              SPPercent = -1,
              BuffList = {
                {
                  Id = 110399,
                  LastTime = -1,
                  Value = -1
                }
              },
              RecoverPlayer = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
