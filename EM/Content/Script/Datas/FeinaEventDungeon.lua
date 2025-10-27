local T = {}
T.RT_1 = {
  [1] = 3,
  [2] = 6,
  [3] = 8
}
T.RT_2 = {
  [1] = "FeinaEvent_DungeonTask_1",
  [2] = "FeinaEvent_DungeonTask_2",
  [3] = "FeinaEvent_DungeonTask_3"
}
T.RT_3 = {
  [1] = 110101,
  [2] = 110102,
  [3] = 110103
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FeinaEventDungeon", {
  [60001] = {
    DungeonDes = "FeinaEvent_DungeonDes_1",
    DungeonId = 60001,
    DungeonName = "FeinaEvent_DungeonName_1",
    DungeonSDes = "FeinaEvent_SimpleDungeonDes_1",
    Level = T.RT_1,
    LevelDes = T.RT_2,
    LockToast = "FeinaEvent_DungeonLock_1",
    PassReward = 110104,
    Reward = T.RT_3,
    RewardPreview = 1030061,
    SettlementId = 1030101
  },
  [60002] = {
    DungeonDes = "FeinaEvent_DungeonDes_2",
    DungeonId = 60002,
    DungeonName = "FeinaEvent_DungeonName_2",
    DungeonSDes = "FeinaEvent_SimpleDungeonDes_2",
    Level = T.RT_1,
    LevelDes = T.RT_2,
    LockToast = "FeinaEvent_DungeonLock_2",
    PassReward = 110104,
    Reward = T.RT_3,
    RewardPreview = 1030061,
    SettlementId = 1030102
  },
  [60003] = {
    DungeonDes = "FeinaEvent_DungeonDes_3",
    DungeonId = 60003,
    DungeonName = "FeinaEvent_DungeonName_3_1",
    DungeonSDes = "FeinaEvent_SimpleDungeonDes_3_1",
    Level = T.RT_1,
    LevelDes = T.RT_2,
    LockToast = "FeinaEvent_DungeonLock_3",
    PassReward = 110104,
    Reward = T.RT_3,
    RewardPreview = 1030061,
    SettlementId = 1030103
  },
  [60004] = {
    DungeonDes = "FeinaEvent_DungeonDes_3",
    DungeonId = 60004,
    DungeonName = "FeinaEvent_DungeonName_3_2",
    DungeonSDes = "FeinaEvent_SimpleDungeonDes_3_2",
    Level = T.RT_1,
    LevelDes = T.RT_2,
    LockToast = "FeinaEvent_DungeonLock_3_2",
    PassReward = 110104,
    PreDungeon = 60003,
    Reward = T.RT_3,
    RewardPreview = 1030061,
    SettlementId = 1030104
  },
  [60005] = {
    DungeonDes = "FeinaEvent_DungeonDes_4",
    DungeonId = 60005,
    DungeonName = "FeinaEvent_DungeonName_4_1",
    DungeonSDes = "FeinaEvent_SimpleDungeonDes_4_1",
    Level = T.RT_1,
    LevelDes = T.RT_2,
    LockToast = "FeinaEvent_DungeonLock_4",
    PassReward = 110104,
    Reward = T.RT_3,
    RewardPreview = 1030061,
    SettlementId = 1030105
  },
  [60006] = {
    DungeonDes = "FeinaEvent_DungeonDes_4",
    DungeonId = 60006,
    DungeonName = "FeinaEvent_DungeonName_4_2",
    DungeonSDes = "FeinaEvent_SimpleDungeonDes_4_2",
    Level = T.RT_1,
    LevelDes = T.RT_2,
    LockToast = "FeinaEvent_DungeonLock_4_2",
    PassReward = 110104,
    PreDungeon = 60005,
    Reward = T.RT_3,
    RewardPreview = 1030061,
    SettlementId = 1030106
  }
})
