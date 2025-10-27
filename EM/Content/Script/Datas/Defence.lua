local T = {}
T.RT_1 = {301}
T.RT_2 = {302, 307}
T.RT_3 = {303}
T.RT_4 = {304, 307}
T.RT_5 = {305}
T.RT_6 = {306, 308}
T.RT_7 = {
  [1] = T.RT_1,
  [2] = T.RT_2,
  [3] = T.RT_3,
  [4] = T.RT_4,
  [5] = T.RT_5,
  [6] = T.RT_6
}
T.RT_8 = {0.6, 0.2}
T.RT_9 = {0.9, 0.1}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Defence", {
  [20002] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = {0.5, 0.1},
    DungeonId = 20002,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [60101] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 4,
    ButcherMonsterSpawnProbability = T.RT_8,
    DungeonId = 60101,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [60102] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 60102,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [62101] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 4,
    ButcherMonsterSpawnProbability = T.RT_8,
    DungeonId = 62101,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [62102] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 62102,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [64101] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 4,
    ButcherMonsterSpawnProbability = T.RT_8,
    DungeonId = 64101,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [64102] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 64102,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90102] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = {0, 0},
    DungeonId = 90102,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90104] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 4,
    ButcherMonsterSpawnProbability = T.RT_8,
    DungeonId = 90104,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90106] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 90106,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90108] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 90108,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90110] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 90110,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90112] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 90112,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  },
  [90114] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_9,
    DungeonId = 90114,
    MonsterSpawnId = T.RT_7,
    MonsterTotalBaseNum = 15
  }
})
