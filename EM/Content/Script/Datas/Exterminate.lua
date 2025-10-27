local T = {}
T.RT_1 = {33, 35}
T.RT_2 = {18}
T.RT_3 = {18, 22}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Exterminate", {
  [30008] = {
    DungeonId = 30008,
    EliteRange = {24, 26},
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = {12, 16},
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 80
  },
  [60901] = {
    DungeonId = 60901,
    EliteRange = T.RT_1,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 110801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 110802,
    TargetNum = 40
  },
  [60902] = {
    DungeonId = 60902,
    EliteRange = T.RT_2,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  },
  [62901] = {
    DungeonId = 62901,
    EliteRange = T.RT_1,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 110801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 110802,
    TargetNum = 40
  },
  [62902] = {
    DungeonId = 62902,
    EliteRange = T.RT_2,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  },
  [64901] = {
    DungeonId = 64901,
    EliteRange = T.RT_1,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 110801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 110802,
    TargetNum = 40
  },
  [64902] = {
    DungeonId = 64902,
    EliteRange = T.RT_2,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  },
  [90801] = {
    DungeonId = 90801,
    EliteRange = {9998, 9999},
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 110801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 110802,
    TargetNum = 40
  },
  [90802] = {
    DungeonId = 90802,
    EliteRange = T.RT_1,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 110801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 110802,
    TargetNum = 40
  },
  [90803] = {
    DungeonId = 90803,
    EliteRange = T.RT_2,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  },
  [90804] = {
    DungeonId = 90804,
    EliteRange = T.RT_2,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  },
  [90805] = {
    DungeonId = 90805,
    EliteRange = T.RT_3,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 110801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 110802,
    TargetNum = 40
  },
  [90806] = {
    DungeonId = 90806,
    EliteRange = T.RT_3,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  },
  [90807] = {
    DungeonId = 90807,
    EliteRange = T.RT_2,
    EliteSpawnOnlyRelation = true,
    EliteSpawnRule = 10801,
    NormalRange = T.RT_1,
    NormalSpawnOnlyRelation = false,
    NormalSpawnRule = 10802,
    TargetNum = 40
  }
})
