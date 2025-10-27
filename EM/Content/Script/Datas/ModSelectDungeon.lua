local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModSelectDungeon", {
  UI_DungeonMod_Tab_20 = {
    MonRewardIdList = {
      1001,
      1002,
      1003,
      1004,
      2001,
      2002
    },
    Name = "UI_DungeonMod_Tab_20",
    Sequence = 20
  },
  UI_DungeonMod_Tab_30 = {
    Condition = {112},
    MonRewardIdList = {
      3001,
      3002,
      3003,
      3004
    },
    Name = "UI_DungeonMod_Tab_30",
    Sequence = 30
  },
  UI_DungeonMod_Tab_40 = {
    Condition = {125},
    MonRewardIdList = {
      4001,
      4002,
      4003,
      4004,
      4005
    },
    Name = "UI_DungeonMod_Tab_40",
    Sequence = 40
  },
  UI_DungeonMod_Tab_50 = {
    Condition = {130},
    MonRewardIdList = {
      5001,
      5002,
      5003,
      5004
    },
    Name = "UI_DungeonMod_Tab_50",
    Sequence = 50
  },
  UI_DungeonMod_Tab_55 = {
    Condition = {135},
    MonRewardIdList = {
      5501,
      5502,
      5503,
      5504,
      5505,
      5506
    },
    Name = "UI_DungeonMod_Tab_55",
    Sequence = 60
  },
  UI_DungeonMod_Tab_60 = {
    Condition = {140},
    MonRewardIdList = {
      6001,
      6002,
      6003,
      6004,
      6005,
      6006
    },
    Name = "UI_DungeonMod_Tab_60",
    Sequence = 70
  },
  UI_DungeonMod_Tab_65 = {
    Condition = {145},
    MonRewardIdList = {
      6501,
      6502,
      6503,
      6504,
      6505,
      6506,
      6507,
      6508,
      6509
    },
    Name = "UI_DungeonMod_Tab_65",
    Sequence = 80
  },
  UI_DungeonMod_Tab_70 = {
    Condition = {155},
    MonRewardIdList = {
      7001,
      7002,
      7003,
      7004,
      7005,
      7006
    },
    Name = "UI_DungeonMod_Tab_70",
    Sequence = 90
  },
  UI_DungeonMod_Tab_80 = {
    Condition = {160},
    MonRewardIdList = {8001},
    Name = "UI_DungeonMod_Tab_80",
    Sequence = 100
  }
})
