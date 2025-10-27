local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModTaskPhase", {
  [1] = {PhaseReward = 7101, QuestPhaseId = 1},
  [2] = {PhaseReward = 7101, QuestPhaseId = 2},
  [3] = {PhaseReward = 7101, QuestPhaseId = 3}
})
