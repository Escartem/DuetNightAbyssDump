local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("InteractiveType", {
  [0] = {Id = 0, Priority = 100},
  [1] = {Id = 1, Priority = 200},
  [3] = {Id = 3, Priority = 300},
  [4] = {Id = 4, Priority = 0}
})
