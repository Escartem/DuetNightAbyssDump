local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattePassRefund", {
  ["com.hero.dna.Pay_BattlePassRank2"] = {
    BattlePassGoodsId = "com.hero.dna.Pay_BattlePassRank2",
    RefundMail = 100402,
    RefundResourceId = 99,
    RefundResourceNum = 750
  },
  ["com.hero.dna.Pay_BattlePassRank2to3"] = {
    BattlePassGoodsId = "com.hero.dna.Pay_BattlePassRank2to3",
    RefundMail = 100402,
    RefundResourceId = 99,
    RefundResourceNum = 860
  },
  ["com.hero.dna.Pay_BattlePassRank3"] = {
    BattlePassGoodsId = "com.hero.dna.Pay_BattlePassRank3",
    RefundMail = 100402,
    RefundResourceId = 99,
    RefundResourceNum = 1410
  }
})
