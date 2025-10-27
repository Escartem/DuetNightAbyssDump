local T = {}
T.RT_1 = {3}
T.RT_2 = {13}
T.RT_3 = {6}
T.RT_4 = {100}
T.RT_5 = {4}
T.RT_6 = {150}
T.RT_7 = {11}
T.RT_8 = {5}
T.RT_9 = {12}
T.RT_10 = {300}
T.RT_11 = {2}
T.RT_12 = {14}
T.RT_13 = {10}
T.RT_14 = {250}
T.RT_15 = {200}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeEventSelect", {
  [1011] = {
    IconType = 1,
    Id = 1011,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event301_Select_1",
    TreasureAward = T.RT_1
  },
  [1012] = {
    IconType = 1,
    Id = 1012,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event301_Select_2",
    TreasureAward = T.RT_2
  },
  [1016] = {
    BlessingAward = {16},
    IconType = 1,
    Id = 1016,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event302_Select_1"
  },
  [1017] = {
    BlessingAward = {17},
    IconType = 1,
    Id = 1017,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event302_Select_2"
  },
  [1021] = {
    IconType = 1,
    Id = 1021,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event303_Select_1",
    TreasureAward = T.RT_3
  },
  [1022] = {
    IconType = 1,
    Id = 1022,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event303_Select_2",
    TokenAward = T.RT_4
  },
  [1026] = {
    BlessingAward = T.RT_2,
    IconType = 1,
    Id = 1026,
    Name = "DialogueAward",
    Price = 50,
    SelectResultDesc = "RL_Event304_Select_1"
  },
  [1027] = {
    IconType = 1,
    Id = 1027,
    Name = "DialogueAward",
    Price = 50,
    SelectResultDesc = "RL_Event304_Select_2",
    TreasureAward = T.RT_5
  },
  [1028] = {
    IconType = 1,
    Id = 1028,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event304_Select_3",
    TokenAward = T.RT_6
  },
  [1031] = {
    IconType = 1,
    Id = 1031,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event305_Select_1",
    TokenAward = T.RT_6
  },
  [1032] = {
    BlessingAward = T.RT_2,
    IconType = 1,
    Id = 1032,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event305_Select_2"
  },
  [1033] = {
    IconType = 1,
    Id = 1033,
    Name = "DialogueAward",
    Price = 100,
    SelectResultDesc = "RL_Event305_Select_3",
    TreasureAward = T.RT_7
  },
  [1036] = {
    BlessingAward = T.RT_1,
    IconType = 1,
    Id = 1036,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event306_Select_1"
  },
  [1037] = {
    IconType = 0,
    Id = 1037,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event306_Select_2"
  },
  [1041] = {
    BlessingAward = T.RT_3,
    IconType = 1,
    Id = 1041,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event307_Select_1"
  },
  [1042] = {
    IconType = 1,
    Id = 1042,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event307_Select_2",
    TokenAward = T.RT_4
  },
  [1046] = {
    GameModeEvent = "BattleEvent_1046",
    IconType = 1,
    Id = 1046,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event308_Select_1",
    TreasureAward = T.RT_8
  },
  [1047] = {
    BlessingAward = T.RT_9,
    GameModeEvent = "BattleEvent_1047",
    IconType = 2,
    Id = 1047,
    Name = "Battle",
    SelectResultDesc = "RL_Event308_Select_2"
  },
  [1051] = {
    IconType = 1,
    Id = 1051,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event309_Select_1",
    TokenAward = T.RT_10
  },
  [1052] = {
    IconType = 1,
    Id = 1052,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event309_Select_2",
    TreasureAward = T.RT_1
  },
  [1056] = {
    BlessingAward = T.RT_2,
    IconType = 1,
    Id = 1056,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event310_Select_1"
  },
  [1057] = {
    BlessingAward = T.RT_11,
    IconType = 1,
    Id = 1057,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event310_Select_2"
  },
  [1061] = {
    IconType = 1,
    Id = 1061,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event311_Select_1",
    TreasureAward = {25}
  },
  [1062] = {
    BlessingAward = {15},
    IconType = 1,
    Id = 1062,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event311_Select_2"
  },
  [1066] = {
    BlessingAward = T.RT_8,
    IconType = 1,
    Id = 1066,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event312_Select_1"
  },
  [1067] = {
    IconType = 1,
    Id = 1067,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event312_Select_2",
    TreasureAward = T.RT_8
  },
  [1071] = {
    IconType = 1,
    Id = 1071,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event313_Select_1",
    TokenAward = {180}
  },
  [1072] = {
    IconType = 1,
    Id = 1072,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event313_Select_2",
    TreasureAward = {26}
  },
  [1076] = {
    BlessingAward = T.RT_12,
    IconType = 1,
    Id = 1076,
    Name = "DialogueAward",
    Price = 150,
    SelectResultDesc = "RL_Event314_Select_1"
  },
  [1077] = {
    IconType = 0,
    Id = 1077,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event314_Select_2"
  },
  [1081] = {
    BlessingAward = T.RT_13,
    IconType = 1,
    Id = 1081,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event315_Select_1"
  },
  [1082] = {
    BlessingAward = T.RT_7,
    IconType = 1,
    Id = 1082,
    Name = "DialogueAward",
    Price = 100,
    SelectResultDesc = "RL_Event315_Select_2"
  },
  [1083] = {
    BlessingAward = T.RT_9,
    IconType = 1,
    Id = 1083,
    Name = "DialogueAward",
    Price = 200,
    SelectResultDesc = "RL_Event315_Select_3"
  },
  [1086] = {
    IconType = 1,
    Id = 1086,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event316_Select_1",
    TreasureAward = T.RT_13
  },
  [1087] = {
    IconType = 1,
    Id = 1087,
    Name = "DialogueAward",
    Price = 150,
    SelectResultDesc = "RL_Event316_Select_2",
    TreasureAward = T.RT_12
  },
  [1088] = {
    IconType = 0,
    Id = 1088,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event316_Select_3"
  },
  [1091] = {
    IconType = 1,
    Id = 1091,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event317_Select_1",
    TokenAward = T.RT_10
  },
  [1092] = {
    IconType = 1,
    Id = 1092,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event317_Select_2",
    TreasureAward = T.RT_8
  },
  [1093] = {
    BlessingAward = T.RT_8,
    IconType = 1,
    Id = 1093,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event317_Select_3"
  },
  [1096] = {
    BlessingAward = {18},
    IconType = 1,
    Id = 1096,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event318_Select_1"
  },
  [1097] = {
    BlessingAward = {29},
    IconType = 1,
    Id = 1097,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event318_Select_2"
  },
  [1098] = {
    BlessingAward = {28},
    IconType = 1,
    Id = 1098,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event318_Select_3"
  },
  [1101] = {
    BlessingAward = {19},
    IconType = 1,
    Id = 1101,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event319_Select_1"
  },
  [1102] = {
    BlessingAward = {20},
    IconType = 1,
    Id = 1102,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event319_Select_2"
  },
  [1106] = {
    IconType = 1,
    Id = 1106,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event320_Select_1",
    TokenAward = T.RT_14
  },
  [1107] = {
    BlessingAward = T.RT_5,
    IconType = 1,
    Id = 1107,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event320_Select_2"
  },
  [1111] = {
    GameModeEvent = "BattleEvent_1111",
    IconType = 2,
    Id = 1111,
    Name = "Battle",
    SelectResultDesc = "RL_Event321_Select_1",
    TokenAward = {450}
  },
  [1112] = {
    BlessingAward = T.RT_5,
    GameModeEvent = "BattleEvent_1112",
    IconType = 1,
    Id = 1112,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event321_Select_2"
  },
  [1116] = {
    BlessingAward = T.RT_11,
    GameModeEvent = "BattleEvent_1116",
    IconType = 2,
    Id = 1116,
    Name = "Battle",
    SelectResultDesc = "RL_Event322_Select_1"
  },
  [1117] = {
    GameModeEvent = "BattleEvent_1117",
    IconType = 1,
    Id = 1117,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event322_Select_2",
    TokenAward = T.RT_15
  },
  [1121] = {
    IconType = 1,
    Id = 1121,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event323_Select_1",
    TokenAward = T.RT_10
  },
  [1122] = {
    IconType = 1,
    Id = 1122,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event323_Select_2",
    TreasureAward = T.RT_2
  },
  [1126] = {
    IconType = 1,
    Id = 1126,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event324_Select_1",
    TreasureAward = T.RT_5
  },
  [1127] = {
    IconType = 1,
    Id = 1127,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event324_Select_2",
    TokenAward = T.RT_14
  },
  [1131] = {
    IconType = 1,
    Id = 1131,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event325_Select_1",
    TokenAward = T.RT_15
  },
  [1132] = {
    BlessingAward = T.RT_2,
    IconType = 1,
    Id = 1132,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event325_Select_2"
  },
  [1136] = {
    GameModeEvent = "BattleEvent_1136",
    IconType = 1,
    Id = 1136,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event326_Select_1",
    TokenAward = {500}
  },
  [1137] = {
    BlessingAward = T.RT_8,
    GameModeEvent = "BattleEvent_1137",
    IconType = 2,
    Id = 1137,
    Name = "Battle",
    SelectResultDesc = "RL_Event326_Select_2"
  },
  [1141] = {
    GameModeEvent = "BattleEvent_1141",
    IconType = 1,
    Id = 1141,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event327_Select_1",
    TokenAward = {750}
  },
  [1142] = {
    BlessingAward = T.RT_1,
    GameModeEvent = "BattleEvent_1142",
    IconType = 2,
    Id = 1142,
    Name = "Battle",
    SelectResultDesc = "RL_Event327_Select_2"
  },
  [1146] = {
    IconType = 1,
    Id = 1146,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event328_Select_1",
    TreasureAward = {27}
  },
  [1147] = {
    IconType = 1,
    Id = 1147,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event328_Select_2",
    TokenAward = {1000}
  },
  [2001] = {
    BlessingAward = {
      -1,
      3,
      3
    },
    GameModeEvent = "GameEvent_2001",
    IconType = 3,
    Id = 2001,
    MiniGameScoreId = 1,
    Name = "Game",
    SelectResultDesc = "RL_Event381_Select_1",
    TokenAward = {
      150,
      200,
      250
    },
    TreasureAward = {
      -1,
      -1,
      4
    }
  },
  [2003] = {
    BlessingAward = {-1, 3},
    GameModeEvent = "GameEvent_2003",
    IconType = 3,
    Id = 2003,
    MiniGameScoreId = 2,
    Name = "Game",
    SelectResultDesc = "RL_Event382_Select_1",
    TokenAward = {150, 250}
  },
  [2004] = {
    GameModeEvent = "GameEvent_2004",
    IconType = 1,
    Id = 2004,
    Name = "DialogueAward",
    SelectResultDesc = "RL_Event382_Select_2",
    TokenAward = T.RT_6
  }
})
