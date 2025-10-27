local T = {}
T.RT_1 = {0.7, 0.2}
T.RT_2 = {
  ExcavationMechId = 49002,
  MonsterSpawnId = 10402,
  Weight = 3
}
T.RT_3 = {
  ExcavationMechId = 49003,
  MonsterSpawnId = 10403,
  Weight = 3
}
T.RT_4 = {0, 0}
T.RT_5 = {
  ExcavationMechId = 49001,
  MonsterSpawnId = 10401,
  Weight = 10
}
T.RT_6 = {
  ExcavationMechId = 49002,
  MonsterSpawnId = 10402,
  Weight = 0
}
T.RT_7 = {
  ExcavationMechId = 49003,
  MonsterSpawnId = 10403,
  Weight = 0
}
T.RT_8 = {
  [1] = T.RT_5,
  [2] = T.RT_6,
  [3] = T.RT_7
}
T.RT_9 = {
  ExcavationMechId = 49001,
  MonsterSpawnId = 10401,
  Weight = 5
}
T.RT_10 = {
  ExcavationMechId = 49002,
  MonsterSpawnId = 10402,
  Weight = 5
}
T.RT_11 = {
  [1] = T.RT_9,
  [2] = T.RT_10,
  [3] = T.RT_7
}
T.RT_12 = {
  ExcavationMechId = 49003,
  MonsterSpawnId = 10403,
  Weight = 2
}
T.RT_13 = {0.6, 0.2}
T.RT_14 = {
  ExcavationMechId = 49001,
  MonsterSpawnId = 10401,
  Weight = 0
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Excavation", {
  [30001] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_1,
    CompleteRewardNum = 2,
    DungeonId = 30001,
    Excavation = {
      [1] = {
        ExcavationMechId = 49001,
        MonsterSpawnId = 10401,
        Weight = 4
      },
      [2] = T.RT_2,
      [3] = T.RT_3
    },
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [60301] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 60301,
    Excavation = T.RT_8,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [60302] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 60302,
    Excavation = T.RT_11,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [62301] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 62301,
    Excavation = T.RT_8,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [62302] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 62302,
    Excavation = T.RT_11,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [64301] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 64301,
    Excavation = T.RT_8,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [64302] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 64302,
    Excavation = T.RT_11,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90201] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 90201,
    Excavation = T.RT_8,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90202] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_4,
    CompleteRewardNum = 2,
    DungeonId = 90202,
    Excavation = T.RT_11,
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90203] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = {0, 0.2},
    CompleteRewardNum = 2,
    DungeonId = 90203,
    Excavation = {
      [1] = {
        ExcavationMechId = 49001,
        MonsterSpawnId = 10401,
        Weight = 2
      },
      [2] = {
        ExcavationMechId = 49002,
        MonsterSpawnId = 10402,
        Weight = 6
      },
      [3] = T.RT_12
    },
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90204] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_13,
    CompleteRewardNum = 2,
    DungeonId = 90204,
    Excavation = {
      [1] = T.RT_14,
      [2] = {
        ExcavationMechId = 49002,
        MonsterSpawnId = 10402,
        Weight = 8
      },
      [3] = T.RT_12
    },
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90205] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_13,
    CompleteRewardNum = 2,
    DungeonId = 90205,
    Excavation = {
      [1] = T.RT_14,
      [2] = {
        ExcavationMechId = 49002,
        MonsterSpawnId = 10402,
        Weight = 7
      },
      [3] = T.RT_3
    },
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90206] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_13,
    CompleteRewardNum = 2,
    DungeonId = 90206,
    Excavation = {
      [1] = T.RT_14,
      [2] = T.RT_2,
      [3] = {
        ExcavationMechId = 49003,
        MonsterSpawnId = 10403,
        Weight = 7
      }
    },
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  },
  [90207] = {
    BatteryFullEventCD = 30,
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnProbability = T.RT_13,
    CompleteRewardNum = 2,
    DungeonId = 90207,
    Excavation = {
      [1] = T.RT_14,
      [2] = T.RT_6,
      [3] = {
        ExcavationMechId = 49003,
        MonsterSpawnId = 10403,
        Weight = 10
      }
    },
    ExcavationItemId = 2009,
    ExcavationRandomId = 10405,
    FirstRandomId = 10401,
    MultiDepleteRate = 3,
    RoundInterval = 5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnProbability = T.RT_1
  }
})
