local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WalnutFirstGet", {
  [1020] = {
    RewardLv = {
      1,
      5,
      6
    },
    WalnutId = 1020
  }
})
