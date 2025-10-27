local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleConst_NormalFX", {
  Test = {FXId = 1, FXKey = "Test"}
})
