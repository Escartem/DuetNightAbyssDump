local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GenderToMonsterId", {
  [8506001] = {
    Gender = 1,
    GroupId = 1,
    MonsterId = 8506001,
    RelateMonsterId = 8507001,
    SwitchPlayer = "EXPlayer"
  },
  [8507001] = {
    Gender = 0,
    GroupId = 1,
    MonsterId = 8507001,
    RelateMonsterId = 8506001,
    SwitchPlayer = "EXPlayer"
  }
})
