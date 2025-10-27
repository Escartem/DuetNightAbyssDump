local T = {}
T.RT_1 = {-1, 23}
T.RT_2 = {1, -1}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Hijack", {
  [30006] = {
    CheckpointEilteMonsterNum = {-1, -1},
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 30006,
    ESAbsorbValue = 2
  },
  [60801] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 60801,
    ESAbsorbValue = 5
  },
  [60802] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 60802,
    ESAbsorbValue = 5
  },
  [62801] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 62801,
    ESAbsorbValue = 5
  },
  [62802] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 62802,
    ESAbsorbValue = 5
  },
  [64801] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 64801,
    ESAbsorbValue = 5
  },
  [64802] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 64802,
    ESAbsorbValue = 5
  },
  [90701] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90701,
    ESAbsorbValue = 5
  },
  [90702] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90702,
    ESAbsorbValue = 5
  },
  [90703] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90703,
    ESAbsorbValue = 5
  },
  [90704] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90704,
    ESAbsorbValue = 5
  },
  [90705] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90705,
    ESAbsorbValue = 5
  },
  [90706] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90706,
    ESAbsorbValue = 5
  },
  [90707] = {
    CheckpointEilteMonsterNum = T.RT_2,
    CheckpointMonsterNum = T.RT_1,
    DungeonID = 90707,
    ESAbsorbValue = 5
  }
})
