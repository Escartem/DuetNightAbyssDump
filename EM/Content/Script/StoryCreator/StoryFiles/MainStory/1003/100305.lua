return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1727596186079376478",
      startPort = "Success",
      endStory = "17283770498742940",
      endPort = "In"
    },
    {
      startStory = "17283770498742940",
      startPort = "Success",
      endStory = "17283770697083447",
      endPort = "In"
    },
    {
      startStory = "17283770697083447",
      startPort = "Success",
      endStory = "17337300448841300458",
      endPort = "In"
    },
    {
      startStory = "17337300448841300458",
      startPort = "Success",
      endStory = "1728542887772572532",
      endPort = "In"
    },
    {
      startStory = "1732783210770535829",
      startPort = "Success",
      endStory = "17337343852571738",
      endPort = "In"
    },
    {
      startStory = "17337343852571738",
      startPort = "Success",
      endStory = "1727596186079376478",
      endPort = "In"
    },
    {
      startStory = "1728542887772572532",
      startPort = "Success",
      endStory = "1734595893955915270",
      endPort = "In"
    },
    {
      startStory = "17503164627015761903",
      startPort = "Success",
      endStory = "17503164627015761905",
      endPort = "In"
    },
    {
      startStory = "17503164627015761905",
      startPort = "Success",
      endStory = "17503164627015761904",
      endPort = "In"
    },
    {
      startStory = "1734595893955915270",
      startPort = "Success",
      endStory = "17503164627015761903",
      endPort = "In"
    },
    {
      startStory = "17503164627015761904",
      startPort = "Success",
      endStory = "17503172659102882847",
      endPort = "In"
    },
    {
      startStory = "17503172659102882847",
      startPort = "Success",
      endStory = "1732783210770535828",
      endPort = "StoryEnd"
    },
    {
      startStory = "1732783210770535827",
      startPort = "StoryStart",
      endStory = "1732783210770535829",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1727596186079376478"] = {
      isStoryNode = true,
      key = "1727596186079376478",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\230\136\152\230\150\151\226\133\161",
      pos = {x = 1200.4235294117627, y = 236.61055806937998},
      propsData = {
        QuestId = 10030503,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030503",
        QuestDeatil = "QuestDesc_10030503",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1727596186079376479",
            startPort = "QuestStart",
            endQuest = "172837326001813645",
            endPort = "In"
          },
          {
            startQuest = "172837326001813645",
            startPort = "Fail",
            endQuest = "17450529455685172",
            endPort = "In"
          },
          {
            startQuest = "172837326001813645",
            startPort = "PassiveFail",
            endQuest = "17450529455685171",
            endPort = "In"
          },
          {
            startQuest = "17450529455685172",
            startPort = "Out",
            endQuest = "1727596186079376485",
            endPort = "Fail"
          },
          {
            startQuest = "17450529455685171",
            startPort = "Out",
            endQuest = "1727596186079376485",
            endPort = "Fail"
          },
          {
            startQuest = "172837326001813645",
            startPort = "Success",
            endQuest = "1727596186079376482",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1727596186079376479"] = {
            key = "1727596186079376479",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1727596186079376482"] = {
            key = "1727596186079376482",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1727596186079376485"] = {
            key = "1727596186079376485",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17283717552985444"] = {
            key = "17283717552985444",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1393.5737556561064, y = 74.61835419482503},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "PlayerSpawnPoint2",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["172837326001813645"] = {
            key = "172837326001813645",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1492.8880413703919, y = 301.5326399091113},
            propsData = {SpecialConfigId = 1031, BlackScreenImmediately = true}
          },
          ["17450529455685171"] = {
            key = "17450529455685171",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2136, y = 597.7142857142856},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "alchSpawnPoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17450529455685172"] = {
            key = "17450529455685172",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2136, y = 426.2857142857142},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17283770498742940"] = {
      isStoryNode = true,
      key = "17283770498742940",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\230\136\152\230\150\151\226\133\162",
      pos = {x = 649.921978021978, y = 446.8321913380737},
      propsData = {
        QuestId = 10030504,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030504",
        QuestDeatil = "QuestDesc_10030504",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17283770498742944",
            startPort = "QuestStart",
            endQuest = "17283770498752949",
            endPort = "In"
          },
          {
            startQuest = "17283770498752949",
            startPort = "Fail",
            endQuest = "17450529481495349",
            endPort = "In"
          },
          {
            startQuest = "17283770498752949",
            startPort = "PassiveFail",
            endQuest = "17450529481495348",
            endPort = "In"
          },
          {
            startQuest = "17450529481495349",
            startPort = "Out",
            endQuest = "17283770498752946",
            endPort = "Fail"
          },
          {
            startQuest = "17450529481495348",
            startPort = "Out",
            endQuest = "17283770498752946",
            endPort = "Fail"
          },
          {
            startQuest = "17283770498752949",
            startPort = "Success",
            endQuest = "17283770498752945",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17283770498742944"] = {
            key = "17283770498742944",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17283770498752945"] = {
            key = "17283770498752945",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17283770498752946"] = {
            key = "17283770498752946",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17283770498752948"] = {
            key = "17283770498752948",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1393.5737556561064, y = 74.61835419482503},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "PlayerSpawnPoint2",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17283770498752949"] = {
            key = "17283770498752949",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1488.8880413703919, y = 296.22829208302437},
            propsData = {SpecialConfigId = 1032, BlackScreenImmediately = true}
          },
          ["17450529481495348"] = {
            key = "17450529481495348",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2156, y = 649.7142857142856},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "alchSpawnPoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17450529481495349"] = {
            key = "17450529481495349",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2156, y = 478.2857142857142},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17283770697083447"] = {
      isStoryNode = true,
      key = "17283770697083447",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\230\136\152\230\150\151\226\133\163",
      pos = {x = 920.4522810522808, y = 445.3737806053597},
      propsData = {
        QuestId = 10030505,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030505",
        QuestDeatil = "QuestDesc_10030505",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17283770697083451",
            startPort = "QuestStart",
            endQuest = "17283770697093456",
            endPort = "In"
          },
          {
            startQuest = "17283770697093456",
            startPort = "Fail",
            endQuest = "17450529508075546",
            endPort = "In"
          },
          {
            startQuest = "17283770697093456",
            startPort = "PassiveFail",
            endQuest = "17450529508075545",
            endPort = "In"
          },
          {
            startQuest = "17450529508075546",
            startPort = "Out",
            endQuest = "17283770697083453",
            endPort = "Fail"
          },
          {
            startQuest = "17450529508075545",
            startPort = "Out",
            endQuest = "17283770697083453",
            endPort = "Fail"
          },
          {
            startQuest = "17283770697093456",
            startPort = "Success",
            endQuest = "17283770697083452",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17283770697083451"] = {
            key = "17283770697083451",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17283770697083452"] = {
            key = "17283770697083452",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17283770697083453"] = {
            key = "17283770697083453",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17283770697093455"] = {
            key = "17283770697093455",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1393.5737556561064, y = 74.61835419482503},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "PlayerSpawnPoint2",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17283770697093456"] = {
            key = "17283770697093456",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1488.8880413703919, y = 316.79579780384813},
            propsData = {SpecialConfigId = 1033, BlackScreenImmediately = true}
          },
          ["17450529508075545"] = {
            key = "17450529508075545",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2180, y = 625.7142857142856},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "alchSpawnPoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17450529508075546"] = {
            key = "17450529508075546",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2180, y = 454.2857142857142},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1728542887772572532"] = {
      isStoryNode = true,
      key = "1728542887772572532",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\233\128\131\231\166\187\226\133\164",
      pos = {x = 1577.3619144529368, y = 214.35983567515962},
      propsData = {
        QuestId = 10030507,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030507",
        QuestDeatil = "QuestDesc_10030507",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1728542887772572536",
            startPort = "QuestStart",
            endQuest = "1728548762262584281",
            endPort = "In"
          },
          {
            startQuest = "1728548762262584281",
            startPort = "Fail",
            endQuest = "174505308291712401",
            endPort = "In"
          },
          {
            startQuest = "1728548762262584281",
            startPort = "PassiveFail",
            endQuest = "174505308902212625",
            endPort = "In"
          },
          {
            startQuest = "174505308291712401",
            startPort = "Out",
            endQuest = "1728542887772572538",
            endPort = "Fail"
          },
          {
            startQuest = "174505308902212625",
            startPort = "Out",
            endQuest = "1728542887772572538",
            endPort = "Fail"
          },
          {
            startQuest = "17486063761388155206",
            startPort = "Out",
            endQuest = "1728542887772572537",
            endPort = "Success"
          },
          {
            startQuest = "1728548762262584281",
            startPort = "Success",
            endQuest = "17486063761388155206",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728542887772572536"] = {
            key = "1728542887772572536",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728542887772572537"] = {
            key = "1728542887772572537",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2939.28173374613, y = 312.14860681114556},
            propsData = {
              ModeType = 1,
              Id = 101703,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1728542887772572538"] = {
            key = "1728542887772572538",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3176.0495356037154, y = 758.9969040247678},
            propsData = {}
          },
          ["1728542887772572539"] = {
            key = "1728542887772572539",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1383.9737556561065, y = -16.581645805175015},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "PlayerSpawnPoint2",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1728548762262584281"] = {
            key = "1728548762262584281",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1661.270686382762, y = 357.3792887195352},
            propsData = {SpecialConfigId = 1034, BlackScreenImmediately = true}
          },
          ["174505308291712401"] = {
            key = "174505308291712401",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2218, y = 500},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["174505308902212625"] = {
            key = "174505308902212625",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2220, y = 740},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "bulu_chusheng02",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17486063761388155206"] = {
            key = "17486063761388155206",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2582.8057040998224, y = 299.65775401069527},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101703},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          }
        },
        commentData = {}
      }
    },
    ["1732783210770535827"] = {
      isStoryNode = true,
      key = "1732783210770535827",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 329.59999999999997, y = 287.2666666666667},
      propsData = {QuestChainId = 100305},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210770535828"] = {
      isStoryNode = true,
      key = "1732783210770535828",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2804.979608111187, y = 216.17110959216234},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210770535829"] = {
      isStoryNode = true,
      key = "1732783210770535829",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\231\130\188\233\135\145\233\153\162",
      pos = {x = 653.8670417817482, y = 240.92953908836301},
      propsData = {
        QuestId = 10030501,
        QuestDescriptionComment = "\231\130\188\233\135\145\233\153\162\229\155\158\229\191\1341",
        QuestDescription = "QuestName_10030501",
        QuestDeatil = "QuestDesc_10030501",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = "",
        QuestUIId = 100305
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1732783210770535831",
            startPort = "QuestStart",
            endQuest = "1727337799881579237",
            endPort = "In"
          },
          {
            startQuest = "1727337799881579237",
            startPort = "PassiveFail",
            endQuest = "17450528303952957",
            endPort = "In"
          },
          {
            startQuest = "1727337799881579237",
            startPort = "Fail",
            endQuest = "17450528460003186",
            endPort = "In"
          },
          {
            startQuest = "17450528460003186",
            startPort = "Out",
            endQuest = "1732783210770535833",
            endPort = "Fail"
          },
          {
            startQuest = "17450528303952957",
            startPort = "Out",
            endQuest = "1732783210770535833",
            endPort = "Fail"
          },
          {
            startQuest = "1727337799881579237",
            startPort = "Success",
            endQuest = "1732783210770535832",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1727337799881579237"] = {
            key = "1727337799881579237",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 967.3798497683928, y = 1079.1025444112126},
            propsData = {SpecialConfigId = 1028, BlackScreenImmediately = true}
          },
          ["1732783210770535831"] = {
            key = "1732783210770535831",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 532.1621729154571, y = 1085.1213279593294},
            propsData = {ModeType = 0}
          },
          ["1732783210770535832"] = {
            key = "1732783210770535832",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1853.3269655378128, y = 1074.1364808309788},
            propsData = {ModeType = 0}
          },
          ["1732783210770535833"] = {
            key = "1732783210770535833",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1873.370271908856, y = 1454.8794156320598},
            propsData = {}
          },
          ["17450528303952957"] = {
            key = "17450528303952957",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1409.1428571428573, y = 1377.142857142857},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "alchSpawnPoint",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17450528460003186"] = {
            key = "17450528460003186",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1409.142857142857, y = 1205.7142857142858},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17337300448841300458"] = {
      isStoryNode = true,
      key = "17337300448841300458",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\233\128\131\231\166\187",
      pos = {x = 1181.0812324929973, y = 442.8571428571429},
      propsData = {
        QuestId = 10030506,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030506",
        QuestDeatil = "QuestDesc_10030506",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17337300448841300459",
            startPort = "QuestStart",
            endQuest = "17337300732421302243",
            endPort = "In"
          },
          {
            startQuest = "17337300732421302243",
            startPort = "Fail",
            endQuest = "174505305658710737",
            endPort = "In"
          },
          {
            startQuest = "17337300732421302243",
            startPort = "PassiveFail",
            endQuest = "174505305108510468",
            endPort = "In"
          },
          {
            startQuest = "174505305658710737",
            startPort = "Out",
            endQuest = "17337300448841300465",
            endPort = "Fail"
          },
          {
            startQuest = "174505305108510468",
            startPort = "Out",
            endQuest = "17337300448841300465",
            endPort = "Fail"
          },
          {
            startQuest = "17337300732421302243",
            startPort = "Success",
            endQuest = "17337300448841300462",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17337300448841300459"] = {
            key = "17337300448841300459",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17337300448841300462"] = {
            key = "17337300448841300462",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17337300448841300465"] = {
            key = "17337300448841300465",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17337300732421302243"] = {
            key = "17337300732421302243",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1800, y = 312},
            propsData = {SpecialConfigId = 1029, BlackScreenImmediately = true}
          },
          ["174505305108510468"] = {
            key = "174505305108510468",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2290, y = 592},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BuluEscapePoint1",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["174505305658710737"] = {
            key = "174505305658710737",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2276, y = 436.6666666666667},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17337343852571738"] = {
      isStoryNode = true,
      key = "17337343852571738",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\230\136\152\230\150\151\226\133\160",
      pos = {x = 923.4740896358544, y = 238.28011204481794},
      propsData = {
        QuestId = 10030502,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030502",
        QuestDeatil = "QuestDesc_10030502",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = true,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17337343852571739",
            startPort = "QuestStart",
            endQuest = "17337344486014874",
            endPort = "In"
          },
          {
            startQuest = "17337344486014874",
            startPort = "Fail",
            endQuest = "17450529420584941",
            endPort = "In"
          },
          {
            startQuest = "17450529420584941",
            startPort = "Out",
            endQuest = "17337343852571745",
            endPort = "Fail"
          },
          {
            startQuest = "17337344486014874",
            startPort = "PassiveFail",
            endQuest = "17471535750512249",
            endPort = "In"
          },
          {
            startQuest = "17471535750512249",
            startPort = "Out",
            endQuest = "17337343852571745",
            endPort = "Fail"
          },
          {
            startQuest = "17337344486014874",
            startPort = "Success",
            endQuest = "17337343852571742",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17337343852571739"] = {
            key = "17337343852571739",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17337343852571742"] = {
            key = "17337343852571742",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17337343852571745"] = {
            key = "17337343852571745",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17337344486014874"] = {
            key = "17337344486014874",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1756.3529411764705, y = 290},
            propsData = {SpecialConfigId = 1030, BlackScreenImmediately = true}
          },
          ["17450529420584941"] = {
            key = "17450529420584941",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2274.823529411765, y = 409.1092436974789},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17471535750512249"] = {
            key = "17471535750512249",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2260, y = 618},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "alchSpawnPoint",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1734595893955915270"] = {
      isStoryNode = true,
      key = "1734595893955915270",
      type = "StoryNode",
      name = "\231\130\188\233\135\145\233\153\162\233\128\131\231\166\187\226\133\165",
      pos = {x = 1849.9444444444443, y = 206.8337510442774},
      propsData = {
        QuestId = 10030508,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030508",
        QuestDeatil = "QuestDesc_10030508",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101703,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_AlchEscapeSpawn"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1734595893955915271",
            startPort = "QuestStart",
            endQuest = "1734595895140915403",
            endPort = "In"
          },
          {
            startQuest = "1734595895140915400",
            startPort = "Out",
            endQuest = "17485225859321884",
            endPort = "In"
          },
          {
            startQuest = "17485225859321884",
            startPort = "Out",
            endQuest = "1734595893955915274",
            endPort = "Success"
          },
          {
            startQuest = "1734595895140915403",
            startPort = "Out",
            endQuest = "1734595895140915400",
            endPort = "In"
          }
        },
        nodeData = {
          ["1734595893955915271"] = {
            key = "1734595893955915271",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 592, y = 284},
            propsData = {ModeType = 0}
          },
          ["1734595893955915274"] = {
            key = "1734595893955915274",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2388.1293103448274, y = 406.1551724137931},
            propsData = {
              ModeType = 1,
              Id = 101103,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1734595893955915277"] = {
            key = "1734595893955915277",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1734595895140915400"] = {
            key = "1734595895140915400",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1718.4378121878137, y = 389.0749384774147},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036126,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2alchescapestage",
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
          ["1734595895140915403"] = {
            key = "1734595895140915403",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1034.756126587551, y = 398.36515440184166},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_AlchEscapeSpawn",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17485225859321884"] = {
            key = "17485225859321884",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2038.7647058823532, y = 397.27941176470586},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17448900607627314572"] = {
      isStoryNode = true,
      key = "17448900607627314572",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 648.6677489177487, y = 21.333333333333456},
      propsData = {
        QuestId = 10030599,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030501",
        QuestDeatil = "QuestDesc_10030501",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = true,
        SubRegionId = 103201,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17448900607627314573",
            startPort = "QuestStart",
            endQuest = "17544614933875273241",
            endPort = "In"
          },
          {
            startQuest = "17544614933875273241",
            startPort = "Out",
            endQuest = "17448900607627314576",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17448900607627314573"] = {
            key = "17448900607627314573",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17448900607627314576"] = {
            key = "17448900607627314576",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17448900607627314579"] = {
            key = "17448900607627314579",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17448900757387315263"] = {
            key = "17448900757387315263",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1776.375, y = -175.25},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/cp2UIopen05",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = true,
              HideNpcs = false,
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
          ["17544614933875273241"] = {
            key = "17544614933875273241",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1800, y = 314},
            propsData = {WaitTime = 0.1}
          }
        },
        commentData = {}
      }
    },
    ["17503164627015761903"] = {
      isStoryNode = true,
      key = "17503164627015761903",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\137\167\233\153\162\229\137\141",
      pos = {x = 1572.982623585565, y = 433.2784899677282},
      propsData = {
        QuestId = 10030509,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030601",
        QuestDeatil = "QuestDesc_10030601",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPointBossTuosi03"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503164627045761925",
            startPort = "Out",
            endQuest = "17503164627045761926",
            endPort = "In"
          },
          {
            startQuest = "17503164627045761923",
            startPort = "Out",
            endQuest = "17503164627045761928",
            endPort = "In"
          },
          {
            startQuest = "17503164627045761928",
            startPort = "Out",
            endQuest = "17503164627055761930",
            endPort = "In"
          },
          {
            startQuest = "17503164627045761927",
            startPort = "Out",
            endQuest = "17503164627055761931",
            endPort = "In"
          },
          {
            startQuest = "17503164627045761926",
            startPort = "Out",
            endQuest = "17503164627055761932",
            endPort = "In"
          },
          {
            startQuest = "17503164627055761932",
            startPort = "Out",
            endQuest = "17503164627045761927",
            endPort = "In"
          },
          {
            startQuest = "17503164627055761933",
            startPort = "Out",
            endQuest = "17503164627045761925",
            endPort = "In"
          },
          {
            startQuest = "17503164627045761924",
            startPort = "Out",
            endQuest = "17503164627055761933",
            endPort = "In"
          },
          {
            startQuest = "17503164627055761931",
            startPort = "Out",
            endQuest = "17503164627055761934",
            endPort = "In"
          },
          {
            startQuest = "17503164627055761934",
            startPort = "Out",
            endQuest = "17503164627045761921",
            endPort = "Success"
          },
          {
            startQuest = "17503164627055761930",
            startPort = "Out",
            endQuest = "17503164627045761924",
            endPort = "In"
          },
          {
            startQuest = "17503164627045761920",
            startPort = "QuestStart",
            endQuest = "17503164627045761923",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503164627045761920"] = {
            key = "17503164627045761920",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503164627045761921"] = {
            key = "17503164627045761921",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3920.321637426901, y = 500.8421052631579},
            propsData = {ModeType = 0}
          },
          ["17503164627045761922"] = {
            key = "17503164627045761922",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2918.6666666666665, y = 948},
            propsData = {}
          },
          ["17503164627045761923"] = {
            key = "17503164627045761923",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1129.5527251972965, y = 326.78407443949266},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_AfterAlchSpawn",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17503164627045761924"] = {
            key = "17503164627045761924",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1632.3056521393983, y = 94.95951303598412},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple52_56-57",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100327,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100327}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503164627045761925"] = {
            key = "17503164627045761925",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2080.885188882101, y = 81.8873947311721},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036215,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
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
          ["17503164627045761926"] = {
            key = "17503164627045761926",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2429.867645022451, y = 260.308447362751},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036217,
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
          ["17503164627045761927"] = {
            key = "17503164627045761927",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2917.757369333229, y = 428.180627813879},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10036239,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple52_56-57",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100327,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100327}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17503164627045761928"] = {
            key = "17503164627045761928",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1170, y = 546},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17503164627055761930"] = {
            key = "17503164627055761930",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1404.8666666666666, y = 316.1666666666667},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0071_lise_secret",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17503164627055761931"] = {
            key = "17503164627055761931",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 3157.2, y = 568.5},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17503164627055761932"] = {
            key = "17503164627055761932",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2629.5333333333333, y = 585.5},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17503164627055761933"] = {
            key = "17503164627055761933",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1888.386363636364, y = 288.18181818181824},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17503164627055761934"] = {
            key = "17503164627055761934",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3544, y = 521.5},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2finalthea",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17530841940845206"] = {
            key = "17530841940845206",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1663.5465367965364, y = 443.87987012987014},
            propsData = {WaitTime = 0.1}
          }
        },
        commentData = {}
      }
    },
    ["17503164627015761904"] = {
      isStoryNode = true,
      key = "17503164627015761904",
      type = "StoryNode",
      name = "\229\137\167\233\153\162\229\134\133",
      pos = {x = 2123.783277180336, y = 430.1886452579145},
      propsData = {
        QuestId = 10030511,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus21",
        QuestDeatil = "QuestDesc_1003plus21",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101901,
        StoryGuideType = "Point",
        StoryGuidePointName = "NewTargetPoint12000204"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503164627115761992",
            startPort = "Out",
            endQuest = "17503164627115761993",
            endPort = "In"
          },
          {
            startQuest = "17503164627115761988",
            startPort = "QuestStart",
            endQuest = "17503164627115761991",
            endPort = "In"
          },
          {
            startQuest = "17503164627115761991",
            startPort = "Fail",
            endQuest = "17503164627125761995",
            endPort = "In"
          },
          {
            startQuest = "17503164627115761991",
            startPort = "PassiveFail",
            endQuest = "17503164627125761994",
            endPort = "In"
          },
          {
            startQuest = "17503164627125761995",
            startPort = "Out",
            endQuest = "17503164627115761990",
            endPort = "Fail"
          },
          {
            startQuest = "17503164627125761994",
            startPort = "Out",
            endQuest = "17503164627115761990",
            endPort = "Fail"
          },
          {
            startQuest = "17503164627115761988",
            startPort = "QuestStart",
            endQuest = "17503164627125761996",
            endPort = "In"
          },
          {
            startQuest = "17503164627125761996",
            startPort = "Out",
            endQuest = "17503164627125761997",
            endPort = "In"
          },
          {
            startQuest = "17503164627115761991",
            startPort = "Success",
            endQuest = "17503164627115761989",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17503164627115761988"] = {
            key = "17503164627115761988",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503164627115761989"] = {
            key = "17503164627115761989",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503164627115761990"] = {
            key = "17503164627115761990",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503164627115761991"] = {
            key = "17503164627115761991",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1893.4636489804634, y = 278.3684210526317},
            propsData = {SpecialConfigId = 1041, BlackScreenImmediately = true}
          },
          ["17503164627115761992"] = {
            key = "17503164627115761992",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1120, y = 912},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2finalthea",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17503164627115761993"] = {
            key = "17503164627115761993",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1490.9508021390375, y = 926},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17503164627125761994"] = {
            key = "17503164627125761994",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2280, y = 694},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPointbaobiao",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17503164627125761995"] = {
            key = "17503164627125761995",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2280, y = 490},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17503164627125761996"] = {
            key = "17503164627125761996",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1338, y = 610},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17503164627125761997"] = {
            key = "17503164627125761997",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1696, y = 610},
            propsData = {
              ActionType = 0,
              Condition = "party",
              SaveToServer = true
            }
          }
        },
        commentData = {}
      }
    },
    ["17503164627015761905"] = {
      isStoryNode = true,
      key = "17503164627015761905",
      type = "StoryNode",
      name = "\229\137\167\233\153\162\229\164\150",
      pos = {x = 1844.1024468995058, y = 433.85797478870575},
      propsData = {
        QuestId = 10030510,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus21",
        QuestDeatil = "QuestDesc_1003plus21",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_1191566"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503164627155762031",
            startPort = "Fail",
            endQuest = "17503164627155762032",
            endPort = "In"
          },
          {
            startQuest = "17503164627155762032",
            startPort = "Out",
            endQuest = "17503164627155762030",
            endPort = "Fail"
          },
          {
            startQuest = "17503164627155762028",
            startPort = "QuestStart",
            endQuest = "17503164627165762034",
            endPort = "In"
          },
          {
            startQuest = "17503164627165762034",
            startPort = "Out",
            endQuest = "17503164627165762035",
            endPort = "In"
          },
          {
            startQuest = "17503164627155762031",
            startPort = "Success",
            endQuest = "17503164627155762029",
            endPort = "Success"
          },
          {
            startQuest = "17503164627155762028",
            startPort = "QuestStart",
            endQuest = "17579209294978354733",
            endPort = "In"
          },
          {
            startQuest = "17579209294978354733",
            startPort = "true",
            endQuest = "17574253565742717",
            endPort = "In"
          },
          {
            startQuest = "17579209294978354733",
            startPort = "false",
            endQuest = "17503164627165762036",
            endPort = "In"
          },
          {
            startQuest = "17503164627165762036",
            startPort = "Out",
            endQuest = "17503164627155762031",
            endPort = "In"
          },
          {
            startQuest = "17574253565742717",
            startPort = "Out",
            endQuest = "17503164627155762031",
            endPort = "In"
          },
          {
            startQuest = "17579209294978354733",
            startPort = "true",
            endQuest = "17579209854738355872",
            endPort = "In"
          },
          {
            startQuest = "17503164627155762031",
            startPort = "PassiveFail",
            endQuest = "17503164627155762032",
            endPort = "In"
          }
        },
        nodeData = {
          ["17503164627155762028"] = {
            key = "17503164627155762028",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503164627155762029"] = {
            key = "17503164627155762029",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {
              ModeType = 1,
              Id = 101901,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17503164627155762030"] = {
            key = "17503164627155762030",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503164627155762031"] = {
            key = "17503164627155762031",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1763.111111111111, y = 270.5232974910394},
            propsData = {SpecialConfigId = 1046, BlackScreenImmediately = true}
          },
          ["17503164627155762032"] = {
            key = "17503164627155762032",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2400, y = 432},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17503164627165762033"] = {
            key = "17503164627165762033",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2406, y = 642},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2finalthea",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17503164627165762034"] = {
            key = "17503164627165762034",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1287.3333333333333, y = 570.6666666666666},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17503164627165762035"] = {
            key = "17503164627165762035",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1630.4444444444443, y = 589.1111111111111},
            propsData = {
              ActionType = 0,
              Condition = "task_cp2_firework",
              SaveToServer = true
            }
          },
          ["17503164627165762036"] = {
            key = "17503164627165762036",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1370.5090155744392, y = 355.6006196775111},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191566,
              GuideType = "M",
              GuidePointName = "Mechanism_1191566"
            }
          },
          ["17574253565742717"] = {
            key = "17574253565742717",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1352.9565217391303, y = 142.70938215102964},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_1191566"
            }
          },
          ["17579209294978354733"] = {
            key = "17579209294978354733",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1008.2445054945053, y = 195.28571428571433},
            propsData = {
              FunctionName = "Equal",
              VarName = "Main10030510",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17579209854738355872"] = {
            key = "17579209854738355872",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1251.1016483516482, y = -6.142857142857029},
            propsData = {
              VarName = "Main10030510",
              VarValue = 1
            }
          }
        },
        commentData = {}
      }
    },
    ["17503172659102882847"] = {
      isStoryNode = true,
      key = "17503172659102882847",
      type = "StoryNode",
      name = "\229\137\167\233\153\162\229\134\133",
      pos = {x = 2382.5, y = 218.25000000000009},
      propsData = {
        QuestId = 10030512,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus21",
        QuestDeatil = "QuestDesc_1003plus21",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101901,
        StoryGuideType = "Point",
        StoryGuidePointName = "NewTargetPoint12000204"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17503172659102882856",
            startPort = "Out",
            endQuest = "17503172659102882857",
            endPort = "In"
          },
          {
            startQuest = "17503172659102882852",
            startPort = "QuestStart",
            endQuest = "17503172659102882855",
            endPort = "In"
          },
          {
            startQuest = "17503172659102882855",
            startPort = "Fail",
            endQuest = "17503172659102882859",
            endPort = "In"
          },
          {
            startQuest = "17503172659102882855",
            startPort = "PassiveFail",
            endQuest = "17503172659102882858",
            endPort = "In"
          },
          {
            startQuest = "17503172659102882859",
            startPort = "Out",
            endQuest = "17503172659102882854",
            endPort = "Fail"
          },
          {
            startQuest = "17503172659102882858",
            startPort = "Out",
            endQuest = "17503172659102882854",
            endPort = "Fail"
          },
          {
            startQuest = "17503172659102882852",
            startPort = "QuestStart",
            endQuest = "17503172659102882860",
            endPort = "In"
          },
          {
            startQuest = "17503172659102882860",
            startPort = "Out",
            endQuest = "17503172659102882861",
            endPort = "In"
          },
          {
            startQuest = "17503172659102882855",
            startPort = "Success",
            endQuest = "17503172659102882853",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17503172659102882852"] = {
            key = "17503172659102882852",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503172659102882853"] = {
            key = "17503172659102882853",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17503172659102882854"] = {
            key = "17503172659102882854",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17503172659102882855"] = {
            key = "17503172659102882855",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1893.4636489804634, y = 278.3684210526317},
            propsData = {SpecialConfigId = 1053, BlackScreenImmediately = true}
          },
          ["17503172659102882856"] = {
            key = "17503172659102882856",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1120, y = 912},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2finalthea",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17503172659102882857"] = {
            key = "17503172659102882857",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1490.9508021390375, y = 926},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17503172659102882858"] = {
            key = "17503172659102882858",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2280, y = 694},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPointbaobiao",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17503172659102882859"] = {
            key = "17503172659102882859",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2280, y = 490},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17503172659102882860"] = {
            key = "17503172659102882860",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1338, y = 608},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17503172659102882861"] = {
            key = "17503172659102882861",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1696, y = 610},
            propsData = {
              ActionType = 0,
              Condition = "party",
              SaveToServer = true
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
