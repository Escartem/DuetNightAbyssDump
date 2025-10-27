local T = {}
T.RT_1 = {2, 3}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WalnutSelectDungeon", {
  [1] = {
    DungeonId = {
      60102,
      60202,
      60302,
      60402,
      60502,
      60602,
      60702,
      60802,
      60902,
      61002,
      61102
    },
    DungeonRandomNum = T.RT_1,
    Sequence = 1,
    WalnutType = 1
  },
  [2] = {
    DungeonId = {
      62102,
      62202,
      62302,
      62402,
      62502,
      62602,
      62702,
      62802,
      62902,
      63002,
      63102
    },
    DungeonRandomNum = T.RT_1,
    Sequence = 2,
    WalnutType = 2
  },
  [3] = {
    DungeonId = {
      64102,
      64202,
      64302,
      64402,
      64502,
      64602,
      64702,
      64802,
      64902,
      65002,
      65102
    },
    DungeonRandomNum = T.RT_1,
    Sequence = 3,
    WalnutType = 3
  }
})
