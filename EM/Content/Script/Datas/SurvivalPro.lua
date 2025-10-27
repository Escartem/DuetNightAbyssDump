local T = {}
T.RT_1 = {100506}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SurvivalPro", {
  [91401] = {
    BuffDescribe = {
      [5000016] = "100%"
    },
    ButcherMonsterId = 8501002,
    ButcherMonsterSpawnMinWave = 2,
    ButcherMonsterSpawnProbability = {0, 0},
    DungeonId = 91401,
    LoopRule = {3, 4},
    MonsterFirstSpawnId = T.RT_1,
    MonsterSpawnDelay = 20,
    MonsterSpawnId = {
      [1] = {100502},
      [2] = {100503},
      [3] = {100504},
      [4] = {100505},
      [5] = T.RT_1
    },
    RoundTime = 180,
    SpLoopRule = {1},
    SpMonster = {
      [1] = {
        SpMonsterSpawnId = {512},
        SpMonsterSpawnTime = 80
      }
    }
  }
})
