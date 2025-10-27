local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PartyDebuff", {
  [5000202] = {BuffID = 5000202},
  [5000205] = {BuffID = 5000205}
})
