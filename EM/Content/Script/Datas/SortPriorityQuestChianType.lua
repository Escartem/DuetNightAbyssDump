local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SortPriorityQuestChianType", {
  [1] = {QuestChainType = 1, TypePriority = 6},
  [2] = {QuestChainType = 6, TypePriority = 5},
  [3] = {QuestChainType = 5, TypePriority = 4},
  [4] = {QuestChainType = 4, TypePriority = 3},
  [5] = {QuestChainType = 3, TypePriority = 2},
  [6] = {QuestChainType = 2, TypePriority = 1}
})
