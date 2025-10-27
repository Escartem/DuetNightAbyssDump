local T = {}
T.RT_1 = {601}
T.RT_2 = {612}
T.RT_3 = {100601}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SurvivalMiniPro", {
  [60701] = {
    DungeonId = 60701,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [60702] = {
    DungeonId = 60702,
    MonsterSpawnId = T.RT_3,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [62701] = {
    DungeonId = 62701,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [62702] = {
    DungeonId = 62702,
    MonsterSpawnId = T.RT_3,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [64701] = {
    DungeonId = 64701,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [64702] = {
    DungeonId = 64702,
    MonsterSpawnId = T.RT_3,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [90601] = {
    DungeonId = 90601,
    MonsterSpawnId = {100606},
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 999999999
  },
  [90602] = {
    DungeonId = 90602,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [90603] = {
    DungeonId = 90603,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [90604] = {
    DungeonId = 90604,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [90605] = {
    DungeonId = 90605,
    MonsterSpawnId = T.RT_3,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [90606] = {
    DungeonId = 90606,
    MonsterSpawnId = T.RT_1,
    SpMonsterSpawnId = T.RT_2,
    SpMonsterSpawnTime = 40
  },
  [90607] = {
    DungeonId = 90607,
    MonsterSpawnId = T.RT_3,
    SpMonsterSpawnId = {613},
    SpMonsterSpawnTime = 40
  }
})
