local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ResourceMax", {
  [100] = 5000000,
  [102] = 100000,
  [110] = 50000,
  [111] = 50000,
  [201] = 500,
  [202] = 500,
  [204] = 500,
  [211] = 100000
})
