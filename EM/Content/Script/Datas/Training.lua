local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Training", {
  [900001] = {DungeonId = 900001, MaxEnemyNum = 20}
})
