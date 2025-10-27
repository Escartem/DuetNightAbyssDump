local T = {}
T.RT_1 = {0.8, 0.2}
T.RT_2 = {201}
T.RT_3 = {202}
T.RT_4 = {203}
T.RT_5 = {204}
T.RT_6 = {205}
T.RT_7 = {206}
T.RT_8 = {
  [1] = T.RT_2,
  [2] = T.RT_3,
  [3] = T.RT_4,
  [4] = T.RT_5,
  [5] = T.RT_6,
  [6] = T.RT_7
}
T.RT_9 = {1, 0.2}
T.RT_10 = {100201}
T.RT_11 = {100202}
T.RT_12 = {100203}
T.RT_13 = {100204}
T.RT_14 = {100205}
T.RT_15 = {100206}
T.RT_16 = {
  [1] = T.RT_10,
  [2] = T.RT_11,
  [3] = T.RT_12,
  [4] = T.RT_13,
  [5] = T.RT_14,
  [6] = T.RT_15
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SurvivalMini", {
  [60501] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 60501,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [60502] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 60502,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [62501] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 62501,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [62502] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 62502,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [64501] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 64501,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [64502] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 64502,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90401] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90401,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90402] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90402,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90403] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90403,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90404] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90404,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90405] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90405,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90406] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90406,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90407] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90407,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90408] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90408,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90409] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90409,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90410] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90410,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90411] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90411,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90412] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90412,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90413] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90413,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90414] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90414,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90415] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90415,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90416] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90416,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90417] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90417,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90418] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90418,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90419] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90419,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90420] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90420,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90421] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90421,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90422] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90422,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90423] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90423,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90424] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90424,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90425] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90425,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90426] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90426,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90427] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90427,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90428] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90428,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90429] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90429,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90430] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90430,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90431] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90431,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90432] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90432,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90433] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90433,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90434] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90434,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90435] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90435,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90436] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90436,
    MonsterSpawnId = T.RT_8,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90437] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90437,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90438] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90438,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90439] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90439,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90440] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90440,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90441] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90441,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  },
  [90442] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90442,
    MonsterSpawnId = T.RT_16,
    TreasureMonsterId = 9500001,
    TreasureMonsterSpawnMinWave = 2,
    TreasureMonsterSpawnProbability = T.RT_9
  }
})
