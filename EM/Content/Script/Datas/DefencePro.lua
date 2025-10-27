local T = {}
T.RT_1 = {311, 312}
T.RT_2 = {313, 314}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DefencePro", {
  [90101] = {
    DungeonId = 90101,
    WaveSpawnRule = T.RT_1
  },
  [90103] = {
    DungeonId = 90103,
    WaveSpawnRule = T.RT_1
  },
  [90105] = {
    DungeonId = 90105,
    WaveSpawnRule = T.RT_1
  },
  [90107] = {
    DungeonId = 90107,
    WaveSpawnRule = T.RT_2
  },
  [90109] = {
    DungeonId = 90109,
    WaveSpawnRule = T.RT_1
  },
  [90111] = {
    DungeonId = 90111,
    WaveSpawnRule = T.RT_1
  },
  [90113] = {
    DungeonId = 90113,
    WaveSpawnRule = T.RT_2
  },
  [90115] = {
    DungeonId = 90115,
    WaveSpawnRule = T.RT_2
  }
})
