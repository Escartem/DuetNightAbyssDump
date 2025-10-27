local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GenderToPhantomId", {
  [111] = {
    Gender = 1,
    GroupId = 1,
    PhantomId = 111,
    RelatePhantomId = 112,
    SwitchPlayer = "Player"
  },
  [112] = {
    Gender = 0,
    GroupId = 1,
    PhantomId = 112,
    RelatePhantomId = 111,
    SwitchPlayer = "Player"
  },
  [205] = {
    Gender = 1,
    GroupId = 2,
    PhantomId = 205,
    RelatePhantomId = 206,
    SwitchPlayer = "Player"
  },
  [206] = {
    Gender = 0,
    GroupId = 2,
    PhantomId = 206,
    RelatePhantomId = 205,
    SwitchPlayer = "Player"
  }
})
