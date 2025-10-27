local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AnimRootMotion", {
  [1] = {
    FilePath = "10001_heitao_KnockDown_Finish.uasset",
    MainID = 1,
    ResourcePath = "/Asset/Char/Player/Char001_Heitao/Animation",
    bEnableRootmotion = true
  },
  [60000] = {
    FilePath = "*attack",
    MainID = 60000,
    ResourcePath = "/",
    bEnableRootmotion = true
  },
  [60001] = {
    FilePath = "attack.uasset",
    MainID = 60001,
    ResourcePath = "/*",
    bEnableRootmotion = true
  },
  [60002] = {
    FilePath = "attack.uasset",
    MainID = 60002,
    ResourcePath = "/Asset/Cinematics",
    bEnableRootmotion = true
  },
  [60003] = {
    FilePath = "attack.uasset",
    MainID = 60003,
    ResourcePath = "/Asset/Cinematics,/Asset/FX",
    bEnableRootmotion = true
  }
})
