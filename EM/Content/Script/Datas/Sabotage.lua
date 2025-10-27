local T = {}
T.RT_1 = {SabotageStaticId = 1000000001}
T.RT_2 = {SabotageStaticId = 1000000002}
T.RT_3 = {SabotageStaticId = 1000000003}
T.RT_4 = {
  [1] = T.RT_1,
  [2] = T.RT_2,
  [3] = T.RT_3
}
T.RT_5 = {
  [3] = T.RT_3
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Sabotage", {
  [30005] = {
    DungeonId = 30005,
    SabotageCountDownTime = 180,
    SabotageMon = T.RT_4,
    SabotageRewardRemainTimes = {
      0,
      40,
      80,
      120
    },
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [60601] = {
    DungeonId = 60601,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [60602] = {
    DungeonId = 60602,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [62601] = {
    DungeonId = 62601,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [62602] = {
    DungeonId = 62602,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [64601] = {
    DungeonId = 64601,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [64602] = {
    DungeonId = 64602,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90501] = {
    DungeonId = 90501,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90502] = {
    DungeonId = 90502,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90503] = {
    DungeonId = 90503,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90504] = {
    DungeonId = 90504,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90505] = {
    DungeonId = 90505,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90506] = {
    DungeonId = 90506,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90507] = {
    DungeonId = 90507,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90508] = {
    DungeonId = 90508,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90509] = {
    DungeonId = 90509,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90510] = {
    DungeonId = 90510,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90511] = {
    DungeonId = 90511,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90512] = {
    DungeonId = 90512,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90513] = {
    DungeonId = 90513,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90514] = {
    DungeonId = 90514,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90515] = {
    DungeonId = 90515,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90516] = {
    DungeonId = 90516,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90517] = {
    DungeonId = 90517,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90518] = {
    DungeonId = 90518,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_4,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90521] = {
    DungeonId = 90521,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90522] = {
    DungeonId = 90522,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  },
  [90523] = {
    DungeonId = 90523,
    SabotageCountDownTime = -1,
    SabotageMon = T.RT_5,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnDelayMax = 100,
    TreasureMonsterSpawnDelayMin = 50
  }
})
