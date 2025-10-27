local T = {}
T.RT_1 = {10705}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SabotagePro", {
  [60201] = {
    DungeonId = 60201,
    MonsterSpawnIds = T.RT_1
  },
  [60202] = {
    DungeonId = 60202,
    MonsterSpawnIds = T.RT_1
  },
  [62201] = {
    DungeonId = 62201,
    MonsterSpawnIds = T.RT_1
  },
  [62202] = {
    DungeonId = 62202,
    MonsterSpawnIds = T.RT_1
  },
  [64201] = {
    DungeonId = 64201,
    MonsterSpawnIds = T.RT_1
  },
  [64202] = {
    DungeonId = 64202,
    MonsterSpawnIds = T.RT_1
  },
  [91251] = {
    DungeonId = 91251,
    MonsterSpawnIds = {91251, 912510}
  },
  [91252] = {
    DungeonId = 91252,
    MonsterSpawnIds = {91252, 912520}
  },
  [91253] = {
    DungeonId = 91253,
    MonsterSpawnIds = {91253, 912530}
  },
  [91254] = {
    DungeonId = 91254,
    MonsterSpawnIds = {91254, 912540}
  },
  [91255] = {
    DungeonId = 91255,
    MonsterSpawnIds = {91255, 912550}
  },
  [91256] = {
    DungeonId = 91256,
    MonsterSpawnIds = {91256, 912560}
  },
  [91257] = {
    DungeonId = 91257,
    MonsterSpawnIds = {91257, 912570}
  },
  [91258] = {
    DungeonId = 91258,
    MonsterSpawnIds = {91258, 912580}
  },
  [91259] = {
    DungeonId = 91259,
    MonsterSpawnIds = {91259, 912590}
  }
})
