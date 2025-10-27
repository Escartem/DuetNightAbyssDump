local T = {}
T.RT_1 = {101101, 101103}
T.RT_2 = {97}
T.RT_3 = {102101}
T.RT_4 = {102104}
T.RT_5 = {101401}
T.RT_6 = {103201}
T.RT_7 = {101402}
T.RT_8 = {101901}
T.RT_9 = {101101}
T.RT_10 = {101105}
T.RT_11 = {101103}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SpecialQuestConfig", {
  [101] = {
    FailCustomEvent = "Hunt3Fail",
    QuestChainId = 100205,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 101,
    StoryPath = "SpecialQuest\\1002\\IcelakeHunting.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1180295,
    UniversalConfigId = 101
  },
  [102] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 102,
    StoryPath = "SpecialQuest\\1002\\SaiqiDream1.story",
    SubRegionIds = T.RT_5,
    UniversalConfigId = 102
  },
  [103] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 103,
    StoryPath = "SpecialQuest\\1002\\SaiqiDream2.story",
    SubRegionIds = T.RT_5,
    UniversalConfigId = 103
  },
  [104] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 104,
    StoryPath = "SpecialQuest\\1002\\SaiqiDreamBoss1.story",
    SubRegionIds = T.RT_7,
    UniversalConfigId = 104
  },
  [105] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 105,
    StoryPath = "SpecialQuest\\1002\\SaiqiDreamBoss2.story",
    SubRegionIds = T.RT_7,
    UniversalConfigId = 105
  },
  [106] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100206,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 106,
    StoryPath = "SpecialQuest\\1002\\SaiqiWalk.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240108,
    UniversalConfigId = 106
  },
  [107] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100206,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 107,
    StoryPath = "SpecialQuest\\1002\\SaiqiWalk2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240260,
    UniversalConfigId = 107
  },
  [109] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100203,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 109,
    StoryPath = "SpecialQuest\\1002\\KKPart02.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1380018,
    UniversalConfigId = 109
  },
  [110] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100203,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 110,
    StoryPath = "SpecialQuest\\1002\\SJZBOSS.story",
    TriggerBoxStaticCreatorId = 1440071,
    UniversalConfigId = 110
  },
  [111] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 111,
    StoryPath = "SpecialQuest\\1002\\IcelakeBoss.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240109,
    UniversalConfigId = 111
  },
  [114] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100202,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 114,
    StoryPath = "SpecialQuest\\1002\\SewThief3.story",
    TriggerBoxStaticCreatorId = 1730063,
    UniversalConfigId = 112
  },
  [115] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 115,
    StoryPath = "SpecialQuest\\1002\\FindSaiqi1.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1180431,
    UniversalConfigId = 113
  },
  [116] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 116,
    StoryPath = "SpecialQuest\\1002\\FindSaiqi2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240290,
    UniversalConfigId = 114
  },
  [117] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 117,
    StoryPath = "SpecialQuest\\1002\\IcelakeBoss2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240690,
    UniversalConfigId = 117
  },
  [118] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100201,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 118,
    StoryPath = "SpecialQuest\\1002\\TrafficwayFight.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1241024,
    UniversalConfigId = 118
  },
  [120] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100206,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 120,
    StoryPath = "SpecialQuest\\1002\\TraceEnlike.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 120
  },
  [1001] = {
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1001,
    TalkTriggerId = 1001,
    UniversalConfigId = 1001
  },
  [1002] = {
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1002,
    TalkTriggerId = 1001
  },
  [1003] = {
    BuffId = T.RT_2,
    QuestChainId = 110101,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1003,
    StoryPath = "SpecialQuest\\1101\\110102boss.story",
    SubRegionIds = T.RT_3,
    TalkTriggerId = 1001,
    UniversalConfigId = 1003
  },
  [1004] = {
    BuffId = T.RT_2,
    QuestChainId = 110101,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1004,
    StoryPath = "SpecialQuest\\1101\\ProtectDafu.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1640042,
    UniversalConfigId = 1004
  },
  [1005] = {
    QuestChainId = 110103,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1005,
    StoryPath = "SpecialQuest\\1101\\DestroyPower.story",
    SubRegionIds = T.RT_3,
    TalkTriggerId = 1001,
    UniversalConfigId = 1005
  },
  [1006] = {
    QuestChainId = 110107,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1006,
    StoryPath = "SpecialQuest\\1101\\110110boss.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650074,
    UniversalConfigId = 1006
  },
  [1008] = {
    FailCustomEvent = "TuicheFail",
    QuestChainId = 110105,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1008,
    StoryPath = "SpecialQuest\\1101\\Tuiche.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650073,
    UniversalConfigId = 1008
  },
  [1009] = {
    FailCustomEvent = "PaotaiSPQuestFail",
    QuestChainId = 110105,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1009,
    StoryPath = "SpecialQuest\\1101\\Paoji.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650072,
    UniversalConfigId = 1009
  },
  [1010] = {
    QuestChainId = 110101,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1010,
    StoryPath = "SpecialQuest\\1101\\void.story",
    SubRegionIds = {100104},
    TalkTriggerId = 1001,
    UniversalConfigId = 1010
  },
  [1011] = {
    BuffId = T.RT_2,
    QuestChainId = 110101,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1011,
    StoryPath = "SpecialQuest\\1101\\HelpDafu.story",
    SubRegionIds = T.RT_3,
    TalkTriggerId = 1001,
    UniversalConfigId = 1011
  },
  [1012] = {
    FailCustomEvent = "EXChapter01_SewWarm_Baohujiguan_Fail",
    QuestChainId = 110108,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1012,
    StoryPath = "SpecialQuest\\1101\\Sew.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1670017,
    UniversalConfigId = 1012
  },
  [1013] = {
    QuestChainId = 110108,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1013,
    StoryPath = "SpecialQuest\\1101\\SewBegin.story",
    SubRegionIds = {102103},
    TalkTriggerId = 1001,
    UniversalConfigId = 1013
  },
  [1014] = {
    BuffId = T.RT_2,
    QuestChainId = 110109,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1014,
    StoryPath = "SpecialQuest\\1101\\Shenpan01.story",
    SubRegionIds = T.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1014
  },
  [1015] = {
    QuestChainId = 110109,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1015,
    StoryPath = "SpecialQuest\\1101\\HaierBoss3.story",
    SubRegionIds = T.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1015
  },
  [1017] = {
    BuffId = T.RT_2,
    QuestChainId = 110107,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1017,
    StoryPath = "SpecialQuest\\1101\\Wake.story",
    SubRegionIds = {102102},
    TalkTriggerId = 1001,
    UniversalConfigId = 1017
  },
  [1018] = {
    QuestChainId = 110108,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1018,
    StoryPath = "SpecialQuest\\1101\\Maifu.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650281,
    UniversalConfigId = 1018
  },
  [1019] = {
    BuffId = T.RT_2,
    QuestChainId = 110107,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1019,
    StoryPath = "SpecialQuest\\1101\\ZhongKongJIGUAN.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650329,
    UniversalConfigId = 1019
  },
  [1021] = {
    QuestChainId = 110103,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1021,
    StoryPath = "SpecialQuest\\1101\\SmallRoomBattle.story",
    SubRegionIds = T.RT_3,
    TalkTriggerId = 1001,
    UniversalConfigId = 1021
  },
  [1023] = {
    QuestChainId = 110103,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1023,
    StoryPath = "SpecialQuest\\1101\\StopPower.story",
    SubRegionIds = T.RT_3,
    TalkTriggerId = 1001,
    UniversalConfigId = 1023
  },
  [1024] = {
    BuffId = T.RT_2,
    QuestChainId = 110109,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1024,
    StoryPath = "SpecialQuest\\1101\\Shenpan02.story",
    SubRegionIds = T.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1024
  },
  [1025] = {
    BuffId = {97, 304},
    QuestChainId = 110109,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1025,
    StoryPath = "SpecialQuest\\1101\\Shenpan03.story",
    SubRegionIds = T.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1025
  },
  [1026] = {
    QuestChainId = 110105,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1026,
    StoryPath = "SpecialQuest\\1101\\GuidaoMaiFu.story",
    SubRegionIds = T.RT_3,
    TalkTriggerId = 1001,
    UniversalConfigId = 1026
  },
  [1028] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1028,
    StoryPath = "SpecialQuest\\1003\\100305battle1pre.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1030
  },
  [1029] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1029,
    StoryPath = "SpecialQuest\\1003\\100305escape.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1030
  },
  [1030] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1030,
    StoryPath = "SpecialQuest\\1003\\100305battle.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1030
  },
  [1031] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1031,
    StoryPath = "SpecialQuest\\1003\\100305battle2.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1030
  },
  [1032] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1032,
    StoryPath = "SpecialQuest\\1003\\100305battle3.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1030
  },
  [1033] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1033,
    StoryPath = "SpecialQuest\\1003\\100305battle4.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1035
  },
  [1034] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1034,
    StoryPath = "SpecialQuest\\1003\\100305battle5.story",
    SubRegionIds = T.RT_6,
    TalkTriggerId = 1001,
    UniversalConfigId = 1035
  },
  [1035] = {
    FailCustomEvent = "100302defencecorebreak",
    QuestChainId = 100302,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1035,
    StoryPath = "SpecialQuest\\1003\\100302sewsp1.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1730090,
    UniversalConfigId = 1032
  },
  [1036] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100302,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1036,
    StoryPath = "SpecialQuest\\1003\\100302sewsp2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1720202,
    UniversalConfigId = 1033
  },
  [1037] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100302,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1037,
    StoryPath = "SpecialQuest\\1003\\100302sewsp3.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1720209,
    UniversalConfigId = 1035
  },
  [1040] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100103,
    QuestFailTalkTriggerId = 100125,
    SpecialConfigId = 1040,
    StoryPath = "SpecialQuest\\1001\\XibiBoss.story",
    SubRegionIds = {100103},
    TalkTriggerId = 1001,
    UniversalConfigId = 1040
  },
  [1041] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1041,
    StoryPath = "SpecialQuest\\1003\\100306thea.story",
    SubRegionIds = T.RT_8,
    TalkTriggerId = 1001,
    UniversalConfigId = 1034
  },
  [1042] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100306,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1042,
    StoryPath = "SpecialQuest\\1003\\100306thea2.story",
    SubRegionIds = T.RT_8,
    TalkTriggerId = 1001,
    UniversalConfigId = 1034
  },
  [1043] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100304,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1043,
    StoryPath = "SpecialQuest\\1003\\100303ilc.story",
    SubRegionIds = T.RT_1,
    TalkTriggerId = 1001,
    UniversalConfigId = 1037
  },
  [1044] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100304,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1044,
    StoryPath = "SpecialQuest\\1003\\100303sew3spmain.story",
    SubRegionIds = {
      101701,
      101702,
      101703
    },
    TalkTriggerId = 1001,
    UniversalConfigId = 1036
  },
  [1045] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100304,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1045,
    StoryPath = "SpecialQuest\\1003\\100304secroutsideboss.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1180564,
    UniversalConfigId = 1035
  },
  [1046] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1046,
    StoryPath = "SpecialQuest\\1003\\100306theaout.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1191418,
    UniversalConfigId = 1034
  },
  [1047] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200212,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1047,
    StoryPath = "SpecialQuest\\Side\\200212_LaLiBattleSide.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1191274,
    UniversalConfigId = 1047
  },
  [1048] = {
    BuffId = T.RT_2,
    QuestChainId = 110108,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1048,
    StoryPath = "SpecialQuest\\1101\\ShenpanPre.story",
    SubRegionIds = T.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1048
  },
  [1049] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200230,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1049,
    StoryPath = "SpecialQuest\\Side\\200230_Huozai01BattleSide.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1191515,
    UniversalConfigId = 1049
  },
  [1050] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200231,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1050,
    StoryPath = "SpecialQuest\\Side\\200231_Huozai02Battle1.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240888,
    UniversalConfigId = 1050
  },
  [1051] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200231,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1051,
    StoryPath = "SpecialQuest\\Side\\200231_Huozai02Battle2.story",
    SubRegionIds = {101301},
    TalkTriggerId = 1001,
    UniversalConfigId = 1051
  },
  [1052] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200233,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1052,
    StoryPath = "SpecialQuest\\Side\\200233_Huozai04Battle.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240954,
    UniversalConfigId = 1052
  },
  [1053] = {
    BuffId = T.RT_2,
    FailCustomEvent = "Fail",
    QuestChainId = 100305,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1053,
    StoryPath = "SpecialQuest\\1003\\100306thea1.story",
    SubRegionIds = T.RT_8,
    TalkTriggerId = 1001,
    UniversalConfigId = 1034
  },
  [1054] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200103,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1054,
    StoryPath = "SpecialQuest\\Side\\200103_Pet01Battle01.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240985,
    UniversalConfigId = 1054
  },
  [1055] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200232,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1055,
    StoryPath = "SpecialQuest\\Side\\200232_Huozai03Battle.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240987,
    UniversalConfigId = 1055
  },
  [1056] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200104,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1056,
    StoryPath = "SpecialQuest\\Side\\200104_Pet01Battle02.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1730261,
    UniversalConfigId = 1056
  },
  [1057] = {
    FailCustomEvent = "Fail",
    QuestChainId = 110109,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1057,
    StoryPath = "SpecialQuest\\1101\\ShenpanWaitDafu.story",
    SubRegionIds = T.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1057
  },
  [2051] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2051,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Home.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2051
  },
  [2052] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2052,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Walk.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2052
  },
  [2053] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2053,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Catch01.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2053
  },
  [2054] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2054,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Catch02.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2054
  },
  [2055] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2055,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Catch03.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2055
  },
  [2056] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2056,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Back.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2056
  },
  [2057] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120111,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2057,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Sleep.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2057
  },
  [2058] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120112,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2058,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Home.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2058
  },
  [2059] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120112,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2059,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Walk.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2059
  },
  [2060] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120112,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2060,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Survey01.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2060
  },
  [2061] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120112,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2061,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Survey02.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2061
  },
  [2062] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120112,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2062,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Back01.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2062
  },
  [2063] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120112,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2063,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Back02.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2063
  },
  [2064] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120113,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2064,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03Home.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2064
  },
  [2065] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120113,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2065,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03Walk.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2065
  },
  [2066] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120113,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2066,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03Catch.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2066
  },
  [2067] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120113,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2067,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03HomeBook.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2067
  },
  [2070] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2070,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Home.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2070
  },
  [2071] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2071,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Walk01.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2071
  },
  [2072] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2072,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Walk02.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2072
  },
  [2073] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2073,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04HomeCry.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2073
  },
  [2074] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2074,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Find01.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2074
  },
  [2075] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2075,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Find02.story",
    SubRegionIds = T.RT_11,
    TalkTriggerId = 1001,
    UniversalConfigId = 2075
  },
  [2076] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2076,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Thief.story",
    SubRegionIds = T.RT_11,
    TalkTriggerId = 1001,
    UniversalConfigId = 2076
  },
  [2077] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2077,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Fight.story",
    SubRegionIds = T.RT_11,
    TalkTriggerId = 1001,
    UniversalConfigId = 2077
  },
  [2078] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2078,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04BackCity01.story",
    SubRegionIds = T.RT_11,
    TalkTriggerId = 1001,
    UniversalConfigId = 2078
  },
  [2079] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2079,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04BackCity02.story",
    SubRegionIds = T.RT_9,
    TalkTriggerId = 1001,
    UniversalConfigId = 2079
  },
  [2080] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2080,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Back.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2080
  },
  [2081] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2081,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04HomeParty.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2081
  },
  [2082] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120114,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 2082,
    StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04StoryEnd.story",
    SubRegionIds = T.RT_10,
    TalkTriggerId = 1001,
    UniversalConfigId = 2082
  },
  [10000] = {
    BuffId = {304},
    FailCustomEvent = "Fail",
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 10000,
    StoryPath = "TestSpecialQuest.story",
    SubRegionIds = T.RT_1,
    TalkTriggerId = 1001,
    UniversalConfigId = 1001
  },
  [12000208] = {
    FailCustomEvent = "Fail",
    QuestChainId = 120002,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 12000208,
    StoryPath = "SpecialQuest\\1200\\ZhiliuWalk.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1191197,
    UniversalConfigId = 12000208
  },
  [20020901] = {
    FailCustomEvent = "Fail",
    QuestChainId = 200209,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 20020901,
    StoryPath = "SpecialQuest\\Side\\200209_LunaBattle.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1191807,
    UniversalConfigId = 20020901
  }
})
