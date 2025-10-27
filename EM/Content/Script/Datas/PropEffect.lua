local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PropEffect", {
  [1] = {
    BPPath = "Blueprint'/Game/BluePrints/Combat/PropEffect/PropEffectObject.PropEffectObject_C'",
    Id = 1
  },
  [42001] = {
    BPPath = "Blueprint'/Game/BluePrints/Combat/PropEffect/PropEffectObject_42001.PropEffectObject_42001'",
    Id = 42001
  },
  [42002] = {
    BPPath = "Blueprint'/Game/BluePrints/Combat/PropEffect/PropEffectObject_42002.PropEffectObject_42002'",
    Id = 42002
  }
})
