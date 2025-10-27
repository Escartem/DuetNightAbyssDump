local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PlayerLvEvent", {
  [106001] = {
    [5] = {
      EventId = 106001,
      PlayerLvReward = 10600101,
      RequiredPlayerLv = 5
    },
    [15] = {
      EventId = 106001,
      PlayerLvReward = 10600102,
      RequiredPlayerLv = 15
    },
    [25] = {
      EventId = 106001,
      PlayerLvReward = 10600103,
      RequiredPlayerLv = 25
    },
    [35] = {
      EventId = 106001,
      PlayerLvReward = 10600104,
      RequiredPlayerLv = 35
    },
    [45] = {
      EventId = 106001,
      PlayerLvReward = 10600105,
      RequiredPlayerLv = 45
    }
  }
})
