local T = {}
T.RT_1 = {
  HaveShield = 0,
  Time = "Now",
  Value2Strength = 1
}
T.RT_2 = {"Battle"}
T.RT_3 = {1006}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("UIScreenEffect", {
  [1001] = {
    LastTime = -1,
    MutexUIEffectId = {1005, 1006},
    PlayMode = "Replace",
    UIEffectId = 1001,
    UIEffectParam = T.RT_1,
    UIEffectPriority = 100,
    UIEffectTag = T.RT_2,
    UIEffectTypeName = "BloodEffect"
  },
  [1002] = {
    LastTime = 0.4,
    MutexUIEffectId = T.RT_3,
    PlayMode = "Modify",
    UIEffectId = 1002,
    UIEffectParam = {
      HaveShield = 0,
      Time = "Now",
      Value2Strength = 0
    },
    UIEffectPriority = 100,
    UIEffectTag = T.RT_2,
    UIEffectTypeName = "BloodEffect"
  },
  [1003] = {
    LastTime = 0.4,
    MutexUIEffectId = T.RT_3,
    PlayMode = "Modify",
    UIEffectId = 1003,
    UIEffectParam = {
      HaveShield = 1,
      Time = "Now",
      Value2Strength = 0
    },
    UIEffectPriority = 100,
    UIEffectTag = T.RT_2,
    UIEffectTypeName = "ShieldAttack"
  },
  [1004] = {
    LastTime = 0.4,
    MutexUIEffectId = T.RT_3,
    PlayMode = "Add",
    UIEffectId = 1004,
    UIEffectPriority = 100,
    UIEffectTag = T.RT_2,
    UIEffectTypeName = "ShieldBroken"
  },
  [1005] = {
    LastTime = -1,
    MutexUIEffectId = {1001},
    PlayMode = "Replace",
    UIEffectId = 1005,
    UIEffectPriority = 90,
    UIEffectTag = T.RT_2,
    UIEffectTypeName = "Warning"
  },
  [1006] = {
    LastTime = -1,
    MutexUIEffectId = {
      1001,
      1002,
      1003
    },
    PlayMode = "Replace",
    UIEffectId = 1006,
    UIEffectParam = T.RT_1,
    UIEffectPriority = 100,
    UIEffectTag = T.RT_2,
    UIEffectTypeName = "VitaminEffect"
  }
})
