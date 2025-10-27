local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FailureGuidance", {
  [1001] = {
    GuidanceIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Mod.T_Tab_Mod",
    GuidanceId = 1001,
    GuidanceText = "FailureGuidance_Text_1001",
    GuidanceTitle = "FailureGuidance_Title_1001",
    JumpId = 47
  },
  [1002] = {
    GuidanceIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Role.T_Tab_Role",
    GuidanceId = 1002,
    GuidanceText = "FailureGuidance_Text_1002",
    GuidanceTitle = "FailureGuidance_Title_1002",
    JumpId = 4
  },
  [1003] = {
    GuidanceIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Weapon.T_Tab_Weapon",
    GuidanceId = 1003,
    GuidanceText = "FailureGuidance_Text_1003",
    GuidanceTitle = "FailureGuidance_Title_1003",
    JumpId = 49
  },
  [1004] = {
    GuidanceIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RangedWeapon.T_Tab_RangedWeapon",
    GuidanceId = 1004,
    GuidanceText = "FailureGuidance_Text_1004",
    GuidanceTitle = "FailureGuidance_Title_1004",
    JumpId = 52
  },
  [1005] = {
    GuidanceIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_WheelDisc.T_Tab_WheelDisc",
    GuidanceId = 1005,
    GuidanceText = "FailureGuidance_Text_1005",
    GuidanceTitle = "FailureGuidance_Title_1005",
    JumpId = 56
  }
})
