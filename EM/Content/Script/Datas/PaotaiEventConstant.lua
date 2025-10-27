local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PaotaiEventConstant", {
  PaotaiGameEventId = {
    ConstantName = "PaotaiGameEventId"
  },
  PreDungeonRequiredStar = {
    ConstantName = "PreDungeonRequiredStar"
  },
  PropNumMax = {ConstantName = "PropNumMax"},
  WeaponNumMax = {
    ConstantName = "WeaponNumMax"
  }
})
