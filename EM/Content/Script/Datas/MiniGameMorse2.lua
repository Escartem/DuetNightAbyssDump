local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameMorse2", {
  [1] = {
    Id = 1,
    PasswordLen = {2, 3},
    Turn = 2
  },
  [2] = {
    Id = 2,
    PasswordLen = {4, 4},
    Turn = 2
  }
})
