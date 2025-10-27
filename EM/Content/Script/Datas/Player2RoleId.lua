local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Player2RoleId", {
  EXPlayer = {
    [0] = 114,
    [1] = 113
  },
  Player = {
    [0] = 112,
    [1] = 111
  }
})
