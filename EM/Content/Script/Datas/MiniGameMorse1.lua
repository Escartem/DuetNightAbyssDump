local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MiniGameMorse1", {
  [1] = {
    Id = 1,
    PasswordLen = {4},
    Turn = 1
  }
})
