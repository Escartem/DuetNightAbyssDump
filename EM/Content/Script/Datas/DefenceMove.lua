local T = {}
T.RT_1 = {0, 0}
T.RT_2 = {311}
T.RT_3 = {312}
T.RT_4 = {313}
T.RT_5 = {314}
T.RT_6 = {90171, 901710}
T.RT_7 = {90172, 901720}
T.RT_8 = {90173, 901730}
T.RT_9 = {90174, 901740}
T.RT_10 = {90175, 901750}
T.RT_11 = {90176, 901760}
T.RT_12 = {90177, 901770}
T.RT_13 = {90178, 901780}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DefenceMove", {
  [90161] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90161,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90161, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90162] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90162,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90162, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90163] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90163,
    MonsterSpawnId = {
      [1] = T.RT_4,
      [2] = {90163, 314},
      [3] = T.RT_4,
      [4] = T.RT_5,
      [5] = T.RT_4,
      [6] = T.RT_5
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90164] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90164,
    MonsterSpawnId = {
      [1] = T.RT_4,
      [2] = {90164, 314},
      [3] = T.RT_4,
      [4] = T.RT_5,
      [5] = T.RT_4,
      [6] = T.RT_5
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90165] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90165,
    MonsterSpawnId = {
      [1] = T.RT_4,
      [2] = {90165, 314},
      [3] = T.RT_4,
      [4] = T.RT_5,
      [5] = T.RT_4,
      [6] = T.RT_5
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90166] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90166,
    MonsterSpawnId = {
      [1] = T.RT_4,
      [2] = {90166, 314},
      [3] = T.RT_4,
      [4] = T.RT_5,
      [5] = T.RT_4,
      [6] = T.RT_5
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90167] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90167,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90167, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90168] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90168,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90168, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90171] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90171,
    MonsterSpawnId = {
      [1] = T.RT_6,
      [2] = T.RT_6,
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90172] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90172,
    MonsterSpawnId = {
      [1] = T.RT_7,
      [2] = T.RT_7,
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90173] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90173,
    MonsterSpawnId = {
      [1] = T.RT_8,
      [2] = T.RT_8,
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90174] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90174,
    MonsterSpawnId = {
      [1] = T.RT_9,
      [2] = T.RT_9,
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90175] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90175,
    MonsterSpawnId = {
      [1] = T.RT_10,
      [2] = T.RT_10,
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90176] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90176,
    MonsterSpawnId = {
      [1] = T.RT_11,
      [2] = T.RT_11,
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90177] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90177,
    MonsterSpawnId = {
      [1] = T.RT_12,
      [2] = T.RT_12,
      [3] = T.RT_4,
      [4] = T.RT_5,
      [5] = T.RT_4,
      [6] = T.RT_5
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90178] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90178,
    MonsterSpawnId = {
      [1] = T.RT_13,
      [2] = T.RT_13,
      [3] = T.RT_4,
      [4] = T.RT_5,
      [5] = T.RT_4,
      [6] = T.RT_5
    },
    MonsterTotalBaseNum = 7,
    WavesPerStage = 2
  },
  [90180] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90180,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90180, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90181] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90181,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90181, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90182] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90182,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90182, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90183] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90183,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90183, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90184] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90184,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90184, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90185] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90185,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90185, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90186] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90186,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90186, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90187] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90187,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90187, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  },
  [90188] = {
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 10,
    ButcherMonsterSpawnProbability = T.RT_1,
    DungeonId = 90188,
    MonsterSpawnId = {
      [1] = T.RT_2,
      [2] = {90188, 312},
      [3] = T.RT_2,
      [4] = T.RT_3,
      [5] = T.RT_2,
      [6] = T.RT_3
    },
    MonsterTotalBaseNum = 50,
    WavesPerStage = 2
  }
})
