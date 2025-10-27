local T = {}
T.RT_1 = {1, 0}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameFreq1", {
  [1] = {
    BindingRealtion = T.RT_1,
    Comb = {
      3,
      5,
      7,
      10,
      7,
      5,
      3
    },
    Destination = {
      7,
      6,
      4,
      1,
      4,
      6,
      7
    },
    Id = 1,
    MoveRange = 1,
    Num = 7
  },
  [2] = {
    BindingRealtion = T.RT_1,
    Comb = {
      2,
      6,
      8,
      9,
      8,
      6,
      2
    },
    Destination = {
      6,
      7,
      6,
      5,
      6,
      7,
      6
    },
    Id = 2,
    MoveRange = 1,
    Num = 7
  },
  [3] = {
    BindingRealtion = T.RT_1,
    Comb = {
      8,
      8,
      4,
      8,
      8
    },
    Destination = {
      4,
      4,
      8,
      4,
      4
    },
    Id = 3,
    MoveRange = 1,
    Num = 5
  },
  [4] = {
    BindingRealtion = T.RT_1,
    Comb = {
      11,
      10,
      9,
      10,
      11
    },
    Destination = {
      5,
      6,
      7,
      6,
      5
    },
    Id = 4,
    MoveRange = 1,
    Num = 5
  }
})
