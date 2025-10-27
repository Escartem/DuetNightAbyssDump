local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PetRecommendAttr", {
  [4211] = {PetId = 4211, RecommendAttribute = "Dark"},
  [4221] = {PetId = 4221, RecommendAttribute = "Water"},
  [4231] = {PetId = 4231, RecommendAttribute = "Fire"},
  [4241] = {PetId = 4241, RecommendAttribute = "Thunder"},
  [4251] = {PetId = 4251, RecommendAttribute = "Wind"},
  [4261] = {PetId = 4261, RecommendAttribute = "Light"}
})
