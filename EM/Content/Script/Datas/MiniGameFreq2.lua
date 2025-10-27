local T = {}
T.RT_1 = {2, 0}
T.RT_2 = {1, 0}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameFreq2", {
  [1] = {
    BindingRealtion = T.RT_1,
    Comb = {
      8,
      10,
      11,
      5,
      5,
      5,
      2
    },
    Destination = {
      6,
      7,
      8,
      6,
      7,
      8,
      6
    },
    Id = 1,
    MoveRange = 1,
    Num = 7
  },
  [2] = {
    BindingRealtion = T.RT_1,
    Comb = {
      8,
      4,
      4,
      10,
      4,
      4,
      8
    },
    Destination = {
      6,
      6,
      6,
      6,
      6,
      6,
      6
    },
    Id = 2,
    MoveRange = 2,
    Num = 7
  },
  [3] = {
    BindingRealtion = T.RT_2,
    Comb = {
      9,
      11,
      9,
      5,
      1,
      5,
      9
    },
    Destination = {
      3,
      1,
      3,
      7,
      11,
      7,
      3
    },
    Id = 3,
    MoveRange = 2,
    Num = 7
  },
  [4] = {
    BindingRealtion = T.RT_2,
    Comb = {
      4,
      7,
      6,
      9,
      10
    },
    Destination = {
      2,
      3,
      4,
      5,
      6
    },
    Id = 4,
    MoveRange = 2,
    Num = 5
  }
})
