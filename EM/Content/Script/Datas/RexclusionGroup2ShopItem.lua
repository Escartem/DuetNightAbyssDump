local T = {}
T.RT_1 = {
  [1] = 160111,
  [2] = 160316
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RexclusionGroup2ShopItem", {
  [160111] = T.RT_1,
  [160316] = T.RT_1
})
