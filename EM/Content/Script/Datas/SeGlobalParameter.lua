local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SeGlobalParameter", {
  VoHitHeavyDmg = {
    SeGlobalParam = "VoHitHeavyDmg",
    SeGlobalValue = 0.3
  },
  VoHitHeavySeId = {
    SeGlobalParam = "VoHitHeavySeId",
    SeGlobalValue = 202
  },
  VoHitLightSeId = {
    SeGlobalParam = "VoHitLightSeId",
    SeGlobalValue = 201
  }
})
