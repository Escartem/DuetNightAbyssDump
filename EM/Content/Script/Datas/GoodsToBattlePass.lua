local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GoodsToBattlePass", {
  ["com.hero.dna.Pay_BattlePassRank2"] = {
    [100001] = "RANK2",
    [100002] = "RANK2"
  },
  ["com.hero.dna.Pay_BattlePassRank2to3"] = {
    [100001] = "RANK2_UPGRADE_RANK3",
    [100002] = "RANK2_UPGRADE_RANK3"
  },
  ["com.hero.dna.Pay_BattlePassRank3"] = {
    [100001] = "RANK3",
    [100002] = "RANK3"
  }
})
