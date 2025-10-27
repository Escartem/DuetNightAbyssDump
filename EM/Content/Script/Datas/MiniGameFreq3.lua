local T = {}
T.RT_1 = {2, 1}
T.RT_2 = {2, 0}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameFreq3", {
  [1] = {
    BindingRealtion = T.RT_1,
    Comb = {
      10,
      9,
      10,
      6,
      1,
      10,
      3
    },
    Destination = {
      2,
      7,
      7,
      5,
      9,
      11,
      6
    },
    Id = 1,
    MoveRange = 1,
    Num = 7
  },
  [2] = {
    BindingRealtion = T.RT_1,
    Comb = {
      6,
      6,
      6,
      6,
      6,
      6,
      6
    },
    Destination = {
      3,
      4,
      5,
      4,
      5,
      6,
      3
    },
    Id = 2,
    MoveRange = 1,
    Num = 7
  },
  [3] = {
    BindingRealtion = T.RT_2,
    Comb = {
      7,
      6,
      5,
      4,
      6,
      4,
      1
    },
    Destination = {
      6,
      7,
      9,
      11,
      9,
      7,
      6
    },
    Id = 3,
    MoveRange = 1,
    Num = 7
  },
  [4] = {
    BindingRealtion = T.RT_2,
    Comb = {
      5,
      2,
      3,
      9,
      7,
      7,
      9
    },
    Destination = {
      8,
      9,
      10,
      11,
      10,
      8,
      6
    },
    Id = 4,
    MoveRange = 1,
    Num = 7
  }
})
