local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PresetHatred", {
  AIActor = {
    PresetTargetType = "AIActor",
    ReasonAlert = 41,
    ReasonDamage = 40,
    ReasonEnemyVision = 20,
    ReasonPreTarget = 41,
    ReasonWaitRecover = 1
  },
  DefenceCore = {
    PresetTargetType = "DefenceCore",
    ReasonAlert = 11,
    ReasonEnemyVision = 40,
    ReasonPreTarget = 41,
    ReasonWaitRecover = 1
  },
  Excavation = {
    PresetTargetType = "Excavation",
    ReasonAlert = 11,
    ReasonEnemyVision = 40,
    ReasonPreTarget = 41,
    ReasonWaitRecover = 1
  },
  Hijack = {
    PresetTargetType = "Hijack",
    ReasonAlert = 11,
    ReasonEnemyVision = 40,
    ReasonPreTarget = 41,
    ReasonWaitRecover = 1
  },
  Player = {
    PresetTargetType = "Player",
    ReasonAlert = 41,
    ReasonDamage = 40,
    ReasonEnemyVision = 20,
    ReasonPreTarget = 41,
    ReasonWaitRecover = 1
  }
})
