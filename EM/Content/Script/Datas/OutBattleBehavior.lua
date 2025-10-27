local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("OutBattleBehavior", {
  [1] = {
    BehaviorId = 1,
    OutBattleBehaviorType = "Stroll",
    StrollRange = 600
  },
  [2] = {
    BehaviorId = 2,
    LoopMontageId = 1,
    OutBattleBehaviorType = "LoopMontage"
  }
})
