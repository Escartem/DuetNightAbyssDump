local T = {}
T.RT_1 = {
  4211,
  4221,
  4231,
  4241,
  4251,
  4261
}
T.RT_2 = {
  0.064562,
  0.108577,
  0.177083,
  1
}
T.RT_3 = {
  0.226286,
  0.398611,
  1,
  1
}
T.RT_4 = {
  BaseColor2 = T.RT_2,
  ColorCurve = 1,
  StarColor = T.RT_3
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattlePassMain", {
  [100001] = {
    BPRewardTemplateID = 100001,
    BPRewardTyppe = "Skin",
    BattlePassEndTime = 1764017999,
    BattlePassId = 100001,
    BattlePassStartTime = 1761523200,
    BattlePassTitle = "UI_BPTitle_100001",
    LevelExp = 500,
    MilestoneInterval = 5,
    PetClaimLevel = 30,
    PetId = T.RT_1,
    PreviewSkinSeries = "BP_01",
    Rank2GoodsId = "com.hero.dna.Pay_BattlePassRank2",
    Rank2RewardView = 100001,
    Rank2to3GoodsId = "com.hero.dna.Pay_BattlePassRank2to3",
    Rank3GoodsId = "com.hero.dna.Pay_BattlePassRank3",
    Rank3Reward = 100002,
    Rank3RewardView = 100003,
    RewardMailId = 100401,
    SkyBoxColor = T.RT_4,
    WeeklyMaxExp = 8000
  },
  [100002] = {
    BPRewardTemplateID = 100001,
    BPRewardTyppe = "Skin",
    BattlePassEndTime = 1766394000,
    BattlePassId = 100002,
    BattlePassStartTime = 1764018000,
    BattlePassTitle = "UI_BPTitle_100002",
    LevelExp = 500,
    MilestoneInterval = 5,
    PetClaimLevel = 30,
    PetId = T.RT_1,
    PreviewSkinSeries = "BP_01",
    Rank2GoodsId = "com.hero.dna.Pay_BattlePassRank2",
    Rank2RewardView = 100001,
    Rank2to3GoodsId = "com.hero.dna.Pay_BattlePassRank2to3",
    Rank3GoodsId = "com.hero.dna.Pay_BattlePassRank3",
    Rank3Reward = 100002,
    Rank3RewardView = 100003,
    RewardMailId = 100401,
    SkyBoxColor = T.RT_4,
    WeeklyMaxExp = 8000
  }
})
