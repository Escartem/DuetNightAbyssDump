local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MorseMiniGame", {
  [1] = {
    Difficulty = 1,
    FailScore = 0,
    MiniGameId = 1,
    SuccScore = 100,
    TotalTime = 30
  },
  [1001] = {
    Difficulty = 10,
    FailScore = 0,
    MiniGameId = 1001,
    SuccScore = 100,
    TotalTime = 100
  }
})
