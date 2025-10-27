local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("VFX_CommonSet", {
  [1] = {
    EffectId = {
      [1] = 900002
    },
    EffectParam = {
      [1] = {IsAttached = false}
    },
    VFXId = 1
  },
  [2] = {
    EffectId = {
      [1] = 900004
    },
    VFXId = 2
  },
  [3] = {
    EffectId = {
      [1] = 900007,
      [2] = 900008
    },
    VFXId = 3
  }
})
