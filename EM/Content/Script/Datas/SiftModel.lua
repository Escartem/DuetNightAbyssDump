local T = {}
T.RT_1 = {
  1,
  5,
  2,
  3,
  4
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SiftModel", {
  [666] = {
    SiftModelId = 666,
    SiftModelName = "ModSift",
    SubId = T.RT_1
  },
  [1001] = {
    SiftModelId = 1001,
    SiftModelName = "BackpackResoureSift",
    SubId = {100101}
  },
  [1002] = {
    SiftModelId = 1002,
    SiftModelName = "BackpackModSift",
    SubId = T.RT_1
  },
  [1003] = {
    SiftModelId = 1003,
    SiftModelName = "BackpackMeeleSift",
    SubId = {100302}
  },
  [1004] = {
    SiftModelId = 1004,
    SiftModelName = "BackpackRangedSift",
    SubId = {100402}
  },
  [1005] = {
    SiftModelId = 1005,
    SiftModelName = "ForgeModSift",
    SubId = {
      2,
      3,
      4
    }
  },
  [1006] = {
    SiftModelId = 1006,
    SubId = {
      100601,
      100602,
      100603,
      100604
    }
  }
})
