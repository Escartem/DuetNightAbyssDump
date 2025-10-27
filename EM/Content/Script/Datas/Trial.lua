local T = {}
T.RT_1 = {
  1,
  2,
  3
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Trial", {
  [1103] = {
    CharTrialId = 1103,
    Tasks = T.RT_1
  },
  [1502] = {
    CharTrialId = 1502,
    Tasks = T.RT_1
  },
  [2101] = {
    CharTrialId = 2101,
    Tasks = T.RT_1
  },
  [3101] = {
    CharTrialId = 3101,
    Tasks = T.RT_1
  },
  [4301] = {
    CharTrialId = 4301,
    Tasks = T.RT_1
  },
  [5101] = {
    CharTrialId = 5101,
    Tasks = T.RT_1
  },
  [101011] = {
    CharTrialId = 101011,
    Tasks = T.RT_1
  },
  [101012] = {
    CharTrialId = 101012,
    Tasks = T.RT_1
  },
  [101013] = {
    CharTrialId = 101013,
    Tasks = T.RT_1
  },
  [101014] = {
    CharTrialId = 101014,
    Tasks = T.RT_1
  },
  [101015] = {
    CharTrialId = 101015,
    Tasks = T.RT_1
  },
  [101016] = {
    CharTrialId = 101016,
    Tasks = T.RT_1
  },
  [101017] = {
    CharTrialId = 101017,
    Tasks = T.RT_1
  }
})
