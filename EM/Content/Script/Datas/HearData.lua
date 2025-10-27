local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("HearData", {
  [1] = {
    HearBaseRadius = 500,
    HearCD = 1,
    HearId = 1,
    HearReduceAlertValue = -20,
    HearSetAlertValue = 120
  },
  [2] = {
    HearBaseRadius = 500,
    HearCD = 1,
    HearId = 2,
    HearReduceAlertValue = -12,
    HearSetAlertValue = 120
  },
  [3] = {
    HearBaseRadius = 500,
    HearCD = 1,
    HearId = 3,
    HearReduceAlertValue = -12,
    HearSetAlertValue = 120
  },
  [4] = {
    HearBaseRadius = 20000,
    HearCD = 1,
    HearId = 4,
    HearReduceAlertValue = 0,
    HearSetAlertValue = 120
  },
  [10] = {
    HearBaseRadius = 500,
    HearCD = 1,
    HearId = 10,
    HearReduceAlertValue = 0,
    HearSetAlertValue = 240
  },
  [103] = {
    HearBaseRadius = 200,
    HearCD = 1,
    HearId = 103,
    HearReduceAlertValue = -30,
    HearSetAlertValue = 60
  },
  [6001001] = {
    HearBaseRadius = 500,
    HearCD = 1,
    HearId = 6001001,
    HearReduceAlertValue = -30,
    HearSetAlertValue = 60
  },
  [9802001] = {
    HearBaseRadius = 0,
    HearCD = 1,
    HearId = 9802001,
    HearReduceAlertValue = 0,
    HearSetAlertValue = 0
  }
})
