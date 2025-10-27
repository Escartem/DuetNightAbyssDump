local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PhantomGetDrop", {
  [1001] = {IsCanDrop = true, UnitId = 1001},
  [1002] = {IsCanDrop = true, UnitId = 1002},
  [1003] = {IsCanDrop = true, UnitId = 1003}
})
