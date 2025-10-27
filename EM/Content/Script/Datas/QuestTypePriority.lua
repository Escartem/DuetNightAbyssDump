local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestTypePriority", {
  [1] = {QuestChainType = 1, TypePriority = 6},
  [2] = {QuestChainType = 2, TypePriority = 1},
  [3] = {QuestChainType = 3, TypePriority = 2},
  [4] = {QuestChainType = 4, TypePriority = 3},
  [5] = {QuestChainType = 5, TypePriority = 4},
  [6] = {QuestChainType = 6, TypePriority = 5}
})
