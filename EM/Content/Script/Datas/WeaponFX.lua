local T = {}
T.RT_1 = {
  0,
  0,
  0
}
T.RT_2 = {
  1,
  1,
  1
}
T.RT_3 = {
  0,
  80,
  0
}
T.RT_4 = {
  50,
  50,
  20
}
T.RT_5 = {
  30,
  20,
  10
}
T.RT_6 = {
  -70,
  100,
  0
}
T.RT_7 = {
  0,
  0,
  90
}
T.RT_8 = {
  0,
  0,
  75
}
T.RT_9 = {
  150,
  100,
  40
}
T.RT_10 = {
  -90,
  20,
  -70
}
T.RT_11 = {
  1.3,
  1.3,
  1.3
}
T.RT_12 = {
  0,
  230,
  0
}
T.RT_13 = {
  -12,
  50,
  0
}
T.RT_14 = {
  -12.58,
  300,
  99
}
T.RT_15 = {
  43.18,
  0,
  0
}
T.RT_16 = {
  90,
  0,
  0
}
T.RT_17 = {
  60,
  0,
  0
}
T.RT_18 = {
  2,
  2,
  2
}
T.RT_19 = {
  1.8,
  1.8,
  1.8
}
T.RT_20 = {
  0,
  150,
  0
}
T.RT_21 = {
  0,
  0,
  60
}
T.RT_22 = {
  0,
  10,
  0
}
T.RT_23 = {
  0,
  -15,
  -90
}
T.RT_24 = {
  0,
  0,
  100
}
T.RT_25 = {
  0,
  0,
  80
}
T.RT_26 = {
  0,
  0,
  -30
}
T.RT_27 = {
  0,
  100,
  0
}
T.RT_28 = {
  1.5,
  1.5,
  1.5
}
T.RT_29 = {
  190,
  -120,
  154
}
T.RT_30 = {
  -150,
  -180,
  150
}
T.RT_31 = {
  0.72,
  0.96,
  0.96
}
T.RT_32 = {
  1.4,
  1.4,
  1.4
}
T.RT_33 = {
  1.44,
  1.44,
  1.44
}
T.RT_34 = {
  0,
  0,
  120
}
T.RT_35 = {
  150,
  0,
  0
}
T.RT_36 = {
  0,
  70,
  100
}
T.RT_37 = {
  1.2,
  1.2,
  1.2
}
T.RT_38 = {
  0,
  40,
  100
}
T.RT_39 = {
  0,
  100,
  200
}
T.RT_40 = {
  0,
  0,
  10
}
T.RT_41 = {
  0,
  100,
  100
}
T.RT_42 = {
  0,
  120,
  -10
}
T.RT_43 = {
  0,
  0,
  30
}
T.RT_44 = {
  130,
  0,
  0
}
T.RT_45 = {
  -90,
  0,
  0
}
T.RT_46 = {
  0,
  0,
  -90
}
T.RT_47 = {
  50,
  0,
  0
}
T.RT_48 = {
  -19.2,
  0,
  100
}
T.RT_49 = {
  0,
  200,
  0
}
T.RT_50 = {
  0,
  -90,
  0
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeaponFX", {
  [1] = {
    Condemn_Absorb = {
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Heitao/NS_Heitao_Condemned_Absorb_2.NS_Heitao_Condemned_Absorb_2",
      FXPriorityType = 60,
      GroupName = "Condemn_Absorb",
      LocalOffset = {
        -4,
        -100,
        101
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 1,
      WeaponFXId = 1010001,
      bTickEventWhenPaused = true
    },
    Condemn_Stab = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Heitao/NS_Heitao_Condemned_Stab.NS_Heitao_Condemned_Stab",
      FXPriorityType = 60,
      GroupName = "Condemn_Stab",
      LocalOffset = {
        -5,
        80,
        103
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 1,
      WeaponFXId = 1010002,
      bTickEventWhenPaused = true
    },
    Condemn_Wind = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Heitao/NS_Heitao_Condemned_Wind.NS_Heitao_Condemned_Wind",
      FXPriorityType = 60,
      GroupName = "Condemn_Wind",
      LocalOffset = T.RT_3,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 1,
      WeaponFXId = 1010003,
      bTickEventWhenPaused = true
    }
  },
  [99] = {
    Kezhou_Skill02_Change_Claymore_04 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_01.NS_Kezhou_Claymore_01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Change_Claymore_04",
      LocalOffset = {
        0,
        100,
        106
      },
      LocalRotation = {
        0.155,
        14.96,
        -179.1
      },
      PlayByChar = true,
      Scale = T.RT_18,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030524,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Change_Dualblade_04 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01.NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Change_Dualblade_04",
      LocalOffset = {
        41.6,
        0,
        115
      },
      LocalRotation = {
        186,
        -27.8,
        196.1
      },
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030534,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Change_Dualblade_05 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01.NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Change_Dualblade_05",
      LocalOffset = {
        -18,
        0,
        115
      },
      LocalRotation = {
        -4,
        -12.88,
        6.87
      },
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030535,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Change_Polearm_04 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Polearm_KnifeLight_Mod01.NS_Kezhou_Polearm_KnifeLight_Mod01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Change_Polearm_04",
      LocalOffset = {
        0,
        0,
        66
      },
      LocalRotation = {
        180,
        11.6,
        159
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030514,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Change_Sword_04 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Sword_RunAttack02.NS_Kezhou_Sword_RunAttack02",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Change_Sword_04",
      LocalOffset = {
        0,
        160,
        134.8
      },
      LocalRotation = {
        2.35,
        -11.1,
        -38
      },
      PlayByChar = true,
      Scale = T.RT_18,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030504,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Claymore_Attack_02 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150381,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_01.NS_Kezhou_Claymore_01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Claymore_Attack_02",
      LocalOffset = {
        8,
        0,
        107
      },
      LocalRotation = {
        161,
        -38,
        -353
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030302,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Claymore_Attack_03 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150382,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_01.NS_Kezhou_Claymore_01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Claymore_Attack_03",
      LocalOffset = {
        -19,
        20,
        137
      },
      LocalRotation = {
        3,
        -13,
        -193
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030303,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Claymore_Attack_05 = {
      DetachWhenSkillEnds = true,
      EffectId = 150383,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_02.NS_Kezhou_Claymore_02",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Claymore_Attack_05",
      LocalOffset = {
        22,
        67.7,
        150
      },
      LocalRotation = {
        36,
        -23.7,
        -237
      },
      PlayByChar = true,
      Scale = {
        -1,
        1,
        1
      },
      WeaponBlueprintId = 99,
      WeaponFXId = 15030305,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Claymore_Attack_06 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150383,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_02.NS_Kezhou_Claymore_02",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Claymore_Attack_06",
      LocalOffset = {
        -4.8,
        9.2,
        116
      },
      LocalRotation = {
        17.9,
        36.9,
        -171
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030306,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Claymore_Attack_11 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150384,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_04Double.NS_Kezhou_Claymore_04Double",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Claymore_Attack_11",
      LocalOffset = {
        -1.7,
        25.9,
        115
      },
      LocalRotation = {
        -180.2,
        7.29,
        -206
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030311,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Claymore_Attack_12 = {
      DetachWhenSkillEnds = true,
      EffectId = 150384,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Claymore_04.NS_Kezhou_Claymore_04",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Claymore_Attack_12",
      LocalOffset = {
        11.3,
        -2.9,
        120
      },
      LocalRotation = {
        29.6,
        41.8,
        -163
      },
      PlayByChar = true,
      Scale = {
        -1.2,
        1.2,
        1.2
      },
      WeaponBlueprintId = 99,
      WeaponFXId = 15030312,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_01 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150391,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife.NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_01",
      LocalOffset = {
        -0.63,
        -12.37,
        86.8
      },
      LocalRotation = {
        292.7,
        -34,
        -289.4
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030401,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_02 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150391,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife.NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_02",
      LocalOffset = {
        -45,
        10,
        85
      },
      LocalRotation = {
        -5.47,
        -4.2,
        6.54
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030402,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_03 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150392,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife.NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_03",
      LocalOffset = {
        50,
        -0.9,
        104.6
      },
      LocalRotation = {
        188.9,
        -19.4,
        193.1
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030403,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_04 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150392,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife.NS_Kezhou_Dualblade_Mod01_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_04",
      LocalOffset = {
        50,
        25,
        65
      },
      LocalRotation = {
        -174,
        8.85,
        -181
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030404,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_05 = {
      DetachWhenSkillEnds = true,
      EffectId = 150393,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack03_Knife01.NS_Kezhou_Dualblade_Mod01_RunAttack03_Knife01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_05",
      LocalOffset = T.RT_43,
      LocalRotation = {
        -15,
        0,
        0
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030405,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_07 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150394,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01.NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_07",
      LocalOffset = {
        85.8,
        -15.68,
        100
      },
      LocalRotation = {
        203.7,
        -30.3,
        168.1
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030407,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Dualblade_Attack_08 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150394,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01.NS_Kezhou_Dualblade_Mod01_RunAttack04_Knife01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Dualblade_Attack_08",
      LocalOffset = {
        -46,
        -25,
        108.4
      },
      LocalRotation = {
        -11.1,
        -14.4,
        33.34
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030408,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Polearm_Attack_02 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150361,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Polearm_KnifeLight_Mod01.NS_Kezhou_Polearm_KnifeLight_Mod01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Polearm_Attack_02",
      LocalOffset = T.RT_24,
      LocalRotation = {
        180,
        -25,
        -180
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030202,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Polearm_Attack_03 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150364,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Polearm_KnifeLight_Mod03.NS_Kezhou_Polearm_KnifeLight_Mod03",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Polearm_Attack_03",
      LocalOffset = {
        0,
        420,
        105
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030203,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Polearm_Attack_06 = {
      DetachWhenSkillEnds = true,
      EffectId = 150365,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Polearm_KnifeLight_Mod04.NS_Kezhou_Polearm_KnifeLight_Mod04",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Polearm_Attack_06",
      LocalOffset = {
        0,
        120,
        -60
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030206,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Sword_Attack_01 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150351,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Sword_RunAttack01.NS_Kezhou_Sword_RunAttack01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Sword_Attack_01",
      LocalOffset = {
        74,
        -20,
        210
      },
      LocalRotation = {
        -149,
        7.7,
        -106
      },
      PlayByChar = true,
      Scale = {
        1.02,
        0.99,
        0.9
      },
      WeaponBlueprintId = 99,
      WeaponFXId = 15030101,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Sword_Attack_03 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150352,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Sword_RunAttack01.NS_Kezhou_Sword_RunAttack01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Sword_Attack_03",
      LocalOffset = {
        50,
        0,
        40
      },
      LocalRotation = {
        -33,
        1,
        -70
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 99,
      WeaponFXId = 15030103,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Sword_Attack_04 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      EffectId = 150353,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Sword_RunAttack02.NS_Kezhou_Sword_RunAttack02",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Sword_Attack_04",
      LocalOffset = {
        -20,
        11,
        160
      },
      LocalRotation = {
        14,
        -6,
        -114
      },
      PlayByChar = true,
      Scale = {
        1.1,
        1.05,
        0.57
      },
      WeaponBlueprintId = 99,
      WeaponFXId = 15030104,
      bTickEventWhenPaused = true
    },
    Kezhou_Skill02_Sword_Attack_05 = {
      Attach = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Player/Kezhou/NS_Kezhou_Sword_RunAttack01.NS_Kezhou_Sword_RunAttack01",
      FXPriorityType = 90,
      GroupName = "Kezhou_Skill02_Sword_Attack_05",
      LocalOffset = {
        -10,
        -100,
        40
      },
      LocalRotation = {
        -14,
        -8,
        -75
      },
      PlayByChar = true,
      Scale = {
        1.4,
        1.3,
        1.2
      },
      WeaponBlueprintId = 99,
      WeaponFXId = 15030105,
      bTickEventWhenPaused = true
    }
  },
  [101] = {
    Attack_01 = {
      ChangeColorByChar = true,
      EffectId = 1010111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro",
      FXPriorityType = 90,
      GroupName = "Attack_01",
      LocalOffset = T.RT_4,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010109,
      bTickEventWhenPaused = true
    },
    Attack_02 = {
      ChangeColorByChar = true,
      EffectId = 1010112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro2.NS_Huipo_RunAttack01_dg_Pro2",
      FXPriorityType = 90,
      GroupName = "Attack_02",
      LocalOffset = T.RT_5,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010110,
      bTickEventWhenPaused = true
    },
    Attack_02_Ground = {
      ChangeColorByChar = true,
      EffectId = 1010112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack02_Ground.NS_Huipo_RunAttack02_Ground",
      FXPriorityType = 90,
      GroupName = "Attack_02_Ground",
      LocalOffset = T.RT_6,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010111,
      bTickEventWhenPaused = true
    },
    Attack_03 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1010113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack03_dg_2Pro.NS_Huipo_RunAttack03_dg_2Pro",
      FXPriorityType = 90,
      GroupName = "Attack_03",
      LocalOffset = T.RT_8,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010112,
      bTickEventWhenPaused = true
    },
    Attack_04 = {
      ChangeColorByChar = true,
      EffectId = 1010114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro",
      FXPriorityType = 90,
      GroupName = "Attack_04",
      LocalOffset = T.RT_9,
      LocalRotation = T.RT_10,
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010113,
      bTickEventWhenPaused = true
    },
    Attack_04_Ground = {
      ChangeColorByChar = true,
      EffectId = 1010114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack04_Ground.NS_Huipo_RunAttack04_Ground",
      FXPriorityType = 90,
      GroupName = "Attack_04_Ground",
      LocalOffset = T.RT_12,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010114,
      bTickEventWhenPaused = true
    },
    Attack_04_xuli = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack04_xuli.NS_Huipo_RunAttack04_xuli",
      FXPriorityType = 90,
      GroupName = "Attack_04_xuli",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010115,
      bTickEventWhenPaused = true
    },
    FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1010132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "FallAttack",
      LocalOffset = T.RT_13,
      LocalRotation = T.RT_1,
      NotBlocking = true,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010120,
      bTickEventWhenPaused = true
    },
    HeavyAttack_End_01 = {
      ChangeColorByChar = true,
      EffectId = 1010222,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_End_1.NS_Zhuiyi_HeavyAttack_End_1",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_End_01",
      LocalOffset = T.RT_14,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010118,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Loop = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_Loop.NS_Zhuiyi_HeavyAttack_Loop",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Loop",
      LocalOffset = T.RT_15,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010119,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Start = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_Start.NS_Zhuiyi_HeavyAttack_Start",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Start",
      LocalOffset = T.RT_15,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010116,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Start_Wind = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_Start_Wind.NS_Zhuiyi_HeavyAttack_Start_Wind",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Start_Wind",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010117,
      bTickEventWhenPaused = true
    },
    Hit = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_dir.NDC_knifehit_char_dir",
      FXPriorityType = 45,
      GroupName = "Hit",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010106,
      bTickEventWhenPaused = true
    },
    Hit1 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_normal.NDC_knifehit_char_normal",
      FXPriorityType = 45,
      GroupName = "Hit1",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010107,
      bTickEventWhenPaused = true
    },
    Hit2 = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Monster/NS_knifehit_zhujue_dir.NS_knifehit_zhujue_dir",
      FXPriorityType = 45,
      GroupName = "Hit2",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010108,
      bTickEventWhenPaused = true
    },
    HitScene_Default = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_02.NS_Gun_HitGround_02",
      FXPriorityType = 45,
      GroupName = "HitScene_Default",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010101,
      bTickEventWhenPaused = true
    },
    HitScene_Mud = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Mud.NS_Gun_HitGround_Mud",
      FXPriorityType = 45,
      GroupName = "HitScene_Mud",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010102,
      bTickEventWhenPaused = true
    },
    HitScene_Sand = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Sand.NS_Gun_HitGround_Sand",
      FXPriorityType = 45,
      GroupName = "HitScene_Sand",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010104,
      bTickEventWhenPaused = true
    },
    HitScene_Snow = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Snow.NS_Gun_HitGround_Snow",
      FXPriorityType = 45,
      GroupName = "HitScene_Snow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010105,
      bTickEventWhenPaused = true
    },
    HitScene_Water = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Water.NS_Gun_HitGround_Water",
      FXPriorityType = 45,
      GroupName = "HitScene_Water",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010103,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_01 = {
      ChangeColorByChar = true,
      EffectId = 1010211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_RunAttack01_Slash.NS_Huipo_Mod01_RunAttack01_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_01",
      LocalOffset = {
        0,
        40,
        80
      },
      LocalRotation = {
        -157.9,
        5.5,
        -141.8
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010122,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02 = {
      ChangeColorByChar = true,
      EffectId = 1010212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_RunAttack02_Slash.NS_Huipo_Mod01_RunAttack02_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02",
      LocalOffset = {
        0,
        110,
        50
      },
      LocalRotation = {
        7.13,
        -6.75,
        -148.87
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010123,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Slash = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      DetachWhenSkillEnds = true,
      EffectId = 1010213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_RunAttack03_Slash.NS_Huipo_Mod01_RunAttack03_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Slash",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_16,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 101,
      WeaponFXId = 1010124,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Smoke = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      DetachWhenSkillEnds = true,
      EffectId = 1010213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_RunAttack03_Smoke.NS_Huipo_Mod01_RunAttack03_Smoke",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Smoke",
      LocalOffset = {
        -100,
        300,
        0
      },
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010125,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04_Absorb = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1010214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_RunAttack04_Absorb.NS_Huipo_Mod01_RunAttack04_Absorb",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04_Absorb",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "hook_arm_r",
      WeaponBlueprintId = 101,
      WeaponFXId = 1010126,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04_Slash = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1010214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_RunAttack04_Slash.NS_Huipo_Mod01_RunAttack04_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04_Slash",
      LocalOffset = {
        -30,
        40,
        75
      },
      LocalRotation = {
        -6,
        13,
        16.68
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010127,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Absorb = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_HeavyAttack_Absorb.NS_Huipo_Mod01_HeavyAttack_Absorb",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Absorb",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "hook_arm_r",
      WeaponBlueprintId = 101,
      WeaponFXId = 1010128,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Glow = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1010221,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_HeavyAttack_Glow.NS_Huipo_Mod01_HeavyAttack_Glow",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Glow",
      LocalOffset = T.RT_17,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "hook_arm_r",
      WeaponBlueprintId = 101,
      WeaponFXId = 1010132,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Slash = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1010221,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_HeavyAttack_Slash.NS_Huipo_Mod01_HeavyAttack_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Slash",
      LocalOffset = {
        -20,
        150,
        160
      },
      LocalRotation = {
        3,
        -12,
        -70
      },
      PlayByChar = true,
      Scale = T.RT_18,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010131,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Slash02 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1010221,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_HeavyAttack_Slash02.NS_Huipo_Mod01_HeavyAttack_Slash02",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Slash02",
      LocalOffset = {
        -20,
        150,
        0
      },
      LocalRotation = {
        0,
        0,
        -36
      },
      PlayByChar = true,
      Scale = T.RT_19,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010133,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Wave = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_HeavyAttack_Wave.NS_Huipo_Mod01_HeavyAttack_Wave",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Wave",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010129,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Wave02 = {
      ChangeColorByChar = true,
      EffectId = 1010221,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_Mod01_HeavyAttack_Wave02.NS_Huipo_Mod01_HeavyAttack_Wave02",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Wave02",
      LocalOffset = T.RT_20,
      LocalRotation = T.RT_21,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010130,
      bTickEventWhenPaused = true
    },
    SlideAttack = {
      ChangeColorByChar = true,
      EffectId = 1010141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro",
      FXPriorityType = 90,
      GroupName = "SlideAttack",
      LocalOffset = T.RT_22,
      LocalRotation = T.RT_23,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 101,
      WeaponFXId = 1010121,
      bTickEventWhenPaused = true
    }
  },
  [102] = {
    Attack_01 = {
      ChangeColorByChar = true,
      EffectId = 1020111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_01.NS_Polearm_KnifeLight_01",
      FXPriorityType = 90,
      GroupName = "Attack_01",
      LocalOffset = {
        0,
        0,
        127
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020108,
      bTickEventWhenPaused = true
    },
    Attack_02_Crack = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Crack.NS_Polearm_Crack",
      FXPriorityType = 90,
      GroupName = "Attack_02_Crack",
      LocalOffset = {
        49.67,
        -21.45,
        0
      },
      LocalRotation = T.RT_24,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020110,
      bTickEventWhenPaused = true
    },
    Attack_02_KnifeLight1 = {
      ChangeColorByChar = true,
      EffectId = 1020112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_03.NS_Polearm_KnifeLight_03",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_02_KnifeLight1",
      LocalOffset = {
        35.2,
        0,
        115
      },
      LocalRotation = {
        -177.24,
        75,
        -180
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020112,
      bTickEventWhenPaused = true
    },
    Attack_02_KnifeLight2 = {
      ChangeColorByChar = true,
      EffectId = 1020112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_03.NS_Polearm_KnifeLight_03",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_02_KnifeLight2",
      LocalOffset = {
        19.77,
        13,
        90
      },
      LocalRotation = {
        -190,
        50,
        -195
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020113,
      bTickEventWhenPaused = true
    },
    Attack_02_Smoke = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1020112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Knife_Smoke.NS_Polearm_Knife_Smoke",
      FXPriorityType = 90,
      GroupName = "Attack_02_Smoke",
      LocalOffset = T.RT_24,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020109,
      bTickEventWhenPaused = true
    },
    Attack_02_Wind = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Knife_Wind.NS_Polearm_Knife_Wind",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_02_Wind",
      LocalOffset = {
        25.4,
        0,
        129
      },
      LocalRotation = {
        -180,
        62,
        -180
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020111,
      bTickEventWhenPaused = true
    },
    Attack_03_Crack = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Crack.NS_Polearm_Crack",
      FXPriorityType = 90,
      GroupName = "Attack_03_Crack",
      LocalOffset = {
        56.82,
        -22.39,
        0
      },
      LocalRotation = T.RT_25,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020115,
      bTickEventWhenPaused = true
    },
    Attack_03_KnifeLight = {
      ChangeColorByChar = true,
      EffectId = 1020113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_03.NS_Polearm_KnifeLight_03",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_03_KnifeLight",
      LocalOffset = {
        -30.7,
        8.7,
        143
      },
      LocalRotation = {
        -27.6,
        43.65,
        -37
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020117,
      bTickEventWhenPaused = true
    },
    Attack_03_Smoke = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1020113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Knife_Smoke.NS_Polearm_Knife_Smoke",
      FXPriorityType = 90,
      GroupName = "Attack_03_Smoke",
      LocalOffset = T.RT_24,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020114,
      bTickEventWhenPaused = true
    },
    Attack_03_Wind = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Knife_Wind.NS_Polearm_Knife_Wind",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_03_Wind",
      LocalOffset = {
        -42,
        -17.7,
        145.45
      },
      LocalRotation = {
        0,
        63.9,
        17.25
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020116,
      bTickEventWhenPaused = true
    },
    Attack_04_Crack = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Crack.NS_Polearm_Crack",
      FXPriorityType = 90,
      GroupName = "Attack_04_Crack",
      LocalOffset = {
        -107.94,
        -49.24,
        -9.25
      },
      LocalRotation = {
        0,
        0,
        107
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020119,
      bTickEventWhenPaused = true
    },
    Attack_04_Jump = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_JumpSmoke.NS_Polearm_JumpSmoke",
      FXPriorityType = 90,
      GroupName = "Attack_04_Jump",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020120,
      bTickEventWhenPaused = true
    },
    Attack_04_KnifeLight = {
      ChangeColorByChar = true,
      EffectId = 1020114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_03.NS_Polearm_KnifeLight_03",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_04_KnifeLight",
      LocalOffset = {
        -10.4,
        4.45,
        158.3
      },
      LocalRotation = {
        3.8,
        73.77,
        0.4
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020121,
      bTickEventWhenPaused = true
    },
    Attack_04_Smoke = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1020114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Knife_Smoke.NS_Polearm_Knife_Smoke",
      FXPriorityType = 90,
      GroupName = "Attack_04_Smoke",
      LocalOffset = T.RT_24,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020118,
      bTickEventWhenPaused = true
    },
    Attack_05 = {
      ChangeColorByChar = true,
      EffectId = 1020115,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_02.NS_Polearm_KnifeLight_02",
      FXPriorityType = 90,
      GroupName = "Attack_05",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_26,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020122,
      bTickEventWhenPaused = true
    },
    Attack_05_Smoke = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_Smoke.NS_Polearm_KnifeLight_Smoke",
      FXPriorityType = 90,
      GroupName = "Attack_05_Smoke",
      LocalOffset = T.RT_27,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020124,
      bTickEventWhenPaused = true
    },
    Attack_05_Wind = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Knife_Wind.NS_Polearm_Knife_Wind",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "Attack_05_Wind",
      LocalOffset = T.RT_8,
      LocalRotation = {
        -8.6,
        0.45,
        433.8
      },
      PlayByChar = true,
      Scale = T.RT_18,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020123,
      bTickEventWhenPaused = true
    },
    Attack_Trail = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_TopTrail.NS_Polearm_TopTrail",
      FXPriorityType = 90,
      GroupName = "Attack_Trail",
      LocalOffset = {
        80,
        0,
        0
      },
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "FX_Top",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020125,
      bTickEventWhenPaused = true
    },
    Attack_Trail_01 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_BottomTrail.NS_Polearm_BottomTrail",
      FXPriorityType = 90,
      GroupName = "Attack_Trail_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "FX_Bottom_Base",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020126,
      bTickEventWhenPaused = true
    },
    FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1020132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "FallAttack",
      LocalOffset = {
        30,
        155,
        1
      },
      LocalRotation = T.RT_1,
      NotBlocking = true,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020127,
      bTickEventWhenPaused = true
    },
    HeavyAttack_EndSmoke = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_EndSmoke.NS_Polearm_HeavyAttack_EndSmoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_EndSmoke",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020135,
      bTickEventWhenPaused = true
    },
    HeavyAttack_End_Trail = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_EndTrail.NS_Polearm_HeavyAttack_EndTrail",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_End_Trail",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "FX_Bottom",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020134,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Spawn = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_Spawn.NS_Polearm_HeavyAttack_Spawn",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Spawn",
      LocalOffset = {
        0,
        70,
        120
      },
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020133,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Start = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_Start.NS_Polearm_HeavyAttack_Start",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Start",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020131,
      bTickEventWhenPaused = true
    },
    Hit = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_dir.NDC_knifehit_char_dir",
      FXPriorityType = 90,
      GroupName = "Hit",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020106,
      bTickEventWhenPaused = true
    },
    Hit1 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_normal.NDC_knifehit_char_normal",
      FXPriorityType = 90,
      GroupName = "Hit1",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020107,
      bTickEventWhenPaused = true
    },
    HitScene_Default = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_02.NS_Gun_HitGround_02",
      FXPriorityType = 90,
      GroupName = "HitScene_Default",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020101,
      bTickEventWhenPaused = true
    },
    HitScene_Mud = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Mud.NS_Gun_HitGround_Mud",
      FXPriorityType = 90,
      GroupName = "HitScene_Mud",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020102,
      bTickEventWhenPaused = true
    },
    HitScene_Sand = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Sand.NS_Gun_HitGround_Sand",
      FXPriorityType = 90,
      GroupName = "HitScene_Sand",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020104,
      bTickEventWhenPaused = true
    },
    HitScene_Snow = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Snow.NS_Gun_HitGround_Snow",
      FXPriorityType = 90,
      GroupName = "HitScene_Snow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020105,
      bTickEventWhenPaused = true
    },
    HitScene_Water = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Water.NS_Gun_HitGround_Water",
      FXPriorityType = 90,
      GroupName = "HitScene_Water",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020103,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_01_01 = {
      ChangeColorByChar = true,
      EffectId = 1020211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01.NS_Polearm_Mod01_Attack01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_01_01",
      LocalOffset = {
        110,
        -300,
        150
      },
      LocalRotation = {
        -210,
        -3,
        95
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020137,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_01_Fazhen = {
      ChangeColorByChar = true,
      EffectId = 1020211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01_Fazhen.NS_Polearm_Mod01_Attack01_Fazhen",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_01_Fazhen",
      LocalOffset = {
        139,
        -500,
        140
      },
      LocalRotation = {
        -271,
        2,
        95
      },
      PlayByChar = true,
      Scale = {
        0.78,
        1.04,
        1.04
      },
      WeaponBlueprintId = 102,
      WeaponFXId = 1020136,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_01_Smoke = {
      ChangeColorByChar = true,
      EffectId = 1020211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01_Smoke.NS_Polearm_Mod01_Attack01_Smoke",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_01_Smoke",
      LocalOffset = T.RT_16,
      LocalRotation = {
        -226.9,
        2,
        92
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020138,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_01 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01.NS_Polearm_Mod01_Attack01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_01",
      LocalOffset = T.RT_29,
      LocalRotation = {
        -210,
        -3,
        99
      },
      PlayByChar = true,
      Scale = T.RT_19,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020139,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_02 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01.NS_Polearm_Mod01_Attack01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_02",
      LocalOffset = T.RT_30,
      LocalRotation = {
        50,
        -3,
        80
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020140,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Fangkuai_01 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack02_Fangkuai01.NS_Polearm_Mod01_Attack02_Fangkuai01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Fangkuai_01",
      LocalOffset = T.RT_29,
      LocalRotation = {
        0,
        -3,
        99
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020146,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Fangkuai_02 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack02_Fangkuai01.NS_Polearm_Mod01_Attack02_Fangkuai01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Fangkuai_02",
      LocalOffset = T.RT_30,
      LocalRotation = {
        0,
        -3,
        80
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020147,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Fazhen_01 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01_Fazhen.NS_Polearm_Mod01_Attack01_Fazhen",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Fazhen_01",
      LocalOffset = {
        230,
        -350,
        150
      },
      LocalRotation = {
        -181,
        0,
        95
      },
      PlayByChar = true,
      Scale = T.RT_31,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020144,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Fazhen_02 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01_Fazhen.NS_Polearm_Mod01_Attack01_Fazhen",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Fazhen_02",
      LocalOffset = {
        -300,
        -365,
        150
      },
      LocalRotation = {
        85,
        0,
        80
      },
      PlayByChar = true,
      Scale = T.RT_31,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020145,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Smoke_01 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01_Smoke.NS_Polearm_Mod01_Attack01_Smoke",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Smoke_01",
      LocalOffset = {
        140,
        0,
        0
      },
      LocalRotation = {
        -226.9,
        2.75,
        100
      },
      PlayByChar = true,
      Scale = T.RT_32,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020141,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Smoke_02 = {
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack01_Smoke.NS_Polearm_Mod01_Attack01_Smoke",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Smoke_02",
      LocalOffset = {
        -160,
        0,
        0
      },
      LocalRotation = {
        30,
        -1.3,
        80
      },
      PlayByChar = true,
      Scale = T.RT_32,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020142,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Smoke_03 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1020212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack02_Smoke.NS_Polearm_Mod01_Attack02_Smoke",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Smoke_03",
      LocalOffset = T.RT_1,
      LocalRotation = {
        0,
        -5,
        0
      },
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020143,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_03 = {
      ChangeColorByChar = true,
      EffectId = 1020213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack03_03.NS_Polearm_Mod01_Attack03_03",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_03",
      LocalOffset = {
        0,
        700,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = {
        0.9,
        0.9,
        0.9
      },
      SoundID = 1020103,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020148,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_04 = {
      ChangeColorByChar = true,
      EffectId = 1020213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack03_02.NS_Polearm_Mod01_Attack03_02",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_04",
      LocalOffset = {
        100,
        0,
        150
      },
      LocalRotation = {
        0,
        0,
        -60
      },
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020152,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_05 = {
      ChangeColorByChar = true,
      EffectId = 1020213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack03_02.NS_Polearm_Mod01_Attack03_02",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_05",
      LocalOffset = {
        -380,
        150,
        100
      },
      LocalRotation = {
        0,
        0,
        231.6
      },
      PlayByChar = true,
      Scale = {
        1.69,
        1.69,
        1.69
      },
      WeaponBlueprintId = 102,
      WeaponFXId = 1020153,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Fazhen_01 = {
      ChangeColorByChar = true,
      EffectId = 1020213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack03_01.NS_Polearm_Mod01_Attack03_01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Fazhen_01",
      LocalOffset = {
        500,
        100,
        210
      },
      LocalRotation = {
        0,
        0,
        180
      },
      PlayByChar = true,
      Scale = T.RT_33,
      SoundID = 1020102,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020150,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Fazhen_02 = {
      ChangeColorByChar = true,
      EffectId = 1020213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack03_01.NS_Polearm_Mod01_Attack03_01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Fazhen_02",
      LocalOffset = {
        -480,
        300,
        180
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_33,
      SoundID = 1020102,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020151,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Star = {
      ChangeColorByChar = true,
      EffectId = 1020213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack03_Star_2.NS_Polearm_Mod01_Attack03_Star_2",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Star",
      LocalOffset = {
        24,
        -48,
        210
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = {
        1,
        1,
        0.1
      },
      WeaponBlueprintId = 102,
      WeaponFXId = 1020149,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04 = {
      ChangeColorByChar = true,
      EffectId = 1020214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack04.NS_Polearm_Mod01_Attack04",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04",
      LocalOffset = T.RT_1,
      LocalRotation = {
        0,
        0,
        225
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020158,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04_Smoke = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1020214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack04_Smoke.NS_Polearm_Mod01_Attack04_Smoke",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04_Smoke",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020156,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04_Star = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1020214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod01_Attack04_Star.NS_Polearm_Mod01_Attack04_Star",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04_Star",
      LocalOffset = T.RT_34,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020157,
      bTickEventWhenPaused = true
    },
    Mod01_FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1020232,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "Mod01_FallAttack",
      LocalOffset = {
        -8,
        45,
        1
      },
      LocalRotation = T.RT_1,
      NotBlocking = true,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020133,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Loop = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_Loop_New.NS_Polearm_HeavyAttack_Loop_New",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Loop",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "FX_Top",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020131,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Spawn = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_Spawn_New.NS_Polearm_HeavyAttack_Spawn_New",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Spawn",
      LocalOffset = {
        0,
        70,
        130
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020135,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_Start = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_HeavyAttack_Start01_New.NS_Polearm_HeavyAttack_Start01_New",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_Start",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_18,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020134,
      bTickEventWhenPaused = true
    },
    Mod02_HeavyAttack_01 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod02_HeavyAttack01.NS_Polearm_Mod02_HeavyAttack01",
      FXPriorityType = 90,
      GroupName = "Mod02_HeavyAttack_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020134,
      bTickEventWhenPaused = true
    },
    Mod02_HeavyAttack_02 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod02_HeavyAttack02.NS_Polearm_Mod02_HeavyAttack02",
      FXPriorityType = 90,
      GroupName = "Mod02_HeavyAttack_02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "hook_arm_r",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020133,
      bTickEventWhenPaused = true
    },
    Mod02_HeavyAttack_03 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod02_HeavyAttack03.NS_Polearm_Mod02_HeavyAttack03",
      FXPriorityType = 90,
      GroupName = "Mod02_HeavyAttack_03",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020135,
      bTickEventWhenPaused = true
    },
    Mod02_HeavyAttack_04 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod02_HeavyAttack04.NS_Polearm_Mod02_HeavyAttack04",
      FXPriorityType = 90,
      GroupName = "Mod02_HeavyAttack_04",
      LocalOffset = T.RT_21,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_28,
      SocketName = "root",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020131,
      bTickEventWhenPaused = true
    },
    Mod02_HeavyAttack_05 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Mod02_HeavyAttack05.NS_Polearm_Mod02_HeavyAttack05",
      FXPriorityType = 90,
      GroupName = "Mod02_HeavyAttack_05",
      LocalOffset = T.RT_17,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "hook_arm_r",
      WeaponBlueprintId = 102,
      WeaponFXId = 1020133,
      bTickEventWhenPaused = true
    },
    SlideAttack = {
      ChangeColorByChar = true,
      EffectId = 1020141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_02.NS_Polearm_KnifeLight_02",
      FXPriorityType = 90,
      GroupName = "SlideAttack",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_26,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020128,
      bTickEventWhenPaused = true
    },
    SlideAttack_Smoke = {
      ChangeColorByChar = true,
      EffectId = 1020141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_KnifeLight_Smoke.NS_Polearm_KnifeLight_Smoke",
      FXPriorityType = 90,
      GroupName = "SlideAttack_Smoke",
      LocalOffset = T.RT_27,
      LocalRotation = T.RT_25,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020130,
      bTickEventWhenPaused = true
    },
    SlideAttack_Wind = {
      ChangeColorByChar = true,
      EffectId = 1020141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Polearm/NS_Polearm_Wind.NS_Polearm_Wind",
      FXPriorityType = 90,
      FollowRootMotion = true,
      GroupName = "SlideAttack_Wind",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 102,
      WeaponFXId = 1020129,
      bTickEventWhenPaused = true
    }
  },
  [103] = {
    Attack_01_Ground = {
      ChangeColorByChar = true,
      EffectId = 1030111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Ground1.NS_Claymore_Ground1",
      FXPriorityType = 90,
      GroupName = "Attack_01_Ground",
      LocalOffset = {
        -161.4,
        -160,
        -0.36
      },
      LocalRotation = {
        0,
        0,
        108
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030109,
      bTickEventWhenPaused = true
    },
    Attack_01_GroundWind = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1030111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_GroundWind02.NS_Claymore_GroundWind02",
      FXPriorityType = 90,
      GroupName = "Attack_01_GroundWind",
      LocalOffset = {
        28,
        32.7,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030110,
      bTickEventWhenPaused = true
    },
    Attack_01_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_01.NS_Claymore_Knife_01",
      FXPriorityType = 90,
      GroupName = "Attack_01_Knife",
      LocalOffset = {
        -23.78,
        22.15,
        85.12
      },
      LocalRotation = {
        1.3,
        -14.57,
        206.2
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030108,
      bTickEventWhenPaused = true
    },
    Attack_02_Ground = {
      ChangeColorByChar = true,
      EffectId = 1030112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Ground1.NS_Claymore_Ground1",
      FXPriorityType = 90,
      GroupName = "Attack_02_Ground",
      LocalOffset = {
        -100,
        -10,
        10
      },
      LocalRotation = {
        0,
        0,
        -80
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030112,
      bTickEventWhenPaused = true
    },
    Attack_02_GroundWind = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1030112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_GroundWind02.NS_Claymore_GroundWind02",
      FXPriorityType = 90,
      GroupName = "Attack_02_GroundWind",
      LocalOffset = {
        -13,
        38,
        1.3
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030113,
      bTickEventWhenPaused = true
    },
    Attack_02_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_02.NS_Claymore_Knife_02",
      FXPriorityType = 90,
      GroupName = "Attack_02_Knife",
      LocalOffset = {
        -17.5,
        5.7,
        149.9
      },
      LocalRotation = {
        -175,
        53,
        16
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030111,
      bTickEventWhenPaused = true
    },
    Attack_03_Ground = {
      ChangeColorByChar = true,
      EffectId = 1030113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Ground1.NS_Claymore_Ground1",
      FXPriorityType = 90,
      GroupName = "Attack_03_Ground",
      LocalOffset = {
        216.4,
        -36.78,
        -6
      },
      LocalRotation = {
        0,
        0,
        73.7
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030115,
      bTickEventWhenPaused = true
    },
    Attack_03_GroundWind = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1030113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_GroundWind02.NS_Claymore_GroundWind02",
      FXPriorityType = 90,
      GroupName = "Attack_03_GroundWind",
      LocalOffset = {
        -12.34,
        39.5,
        1.3
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030116,
      bTickEventWhenPaused = true
    },
    Attack_03_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_03.NS_Claymore_Knife_03",
      FXPriorityType = 90,
      GroupName = "Attack_03_Knife",
      LocalOffset = {
        23.5,
        77.5,
        106
      },
      LocalRotation = {
        169,
        -22,
        3
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030114,
      bTickEventWhenPaused = true
    },
    Attack_04_Ground = {
      ChangeColorByChar = true,
      EffectId = 1030114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Decal.NS_Claymore_Decal",
      FXPriorityType = 90,
      GroupName = "Attack_04_Ground",
      LocalOffset = {
        -4.77,
        156.2,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030118,
      bTickEventWhenPaused = true
    },
    Attack_04_GroundWind = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1030114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_GroundWind01.NS_Claymore_GroundWind01",
      FXPriorityType = 90,
      GroupName = "Attack_04_GroundWind",
      LocalOffset = {
        16.9,
        38.3,
        -1
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030119,
      bTickEventWhenPaused = true
    },
    Attack_04_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_04.NS_Claymore_Knife_04",
      FXPriorityType = 90,
      GroupName = "Attack_04_Knife",
      LocalOffset = {
        16.6,
        16.3,
        103.7
      },
      LocalRotation = {
        85.2,
        -33.3,
        102
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030117,
      bTickEventWhenPaused = true
    },
    FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1030132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "FallAttack",
      LocalOffset = {
        30,
        120,
        0
      },
      LocalRotation = T.RT_1,
      NotBlocking = true,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030120,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Cast = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Cast.NS_Claymore_Cast",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Cast",
      LocalOffset = {
        17.6,
        0,
        0
      },
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030124,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030122,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_05.NS_Claymore_Knife_05",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Knife",
      LocalOffset = {
        7.6,
        15,
        115.7
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030123,
      bTickEventWhenPaused = true
    },
    HeavyAttack_KnifeWind = {
      ChangeColorByChar = true,
      EffectId = 1030122,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_GroundWind01.NS_Claymore_GroundWind01",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_KnifeWind",
      LocalOffset = {
        4.7,
        0,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030122,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Loop = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1030121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_Loop.NS_Claymore_Knife_Loop",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Loop",
      LocalOffset = {
        -20.9,
        -5.87,
        131.5
      },
      LocalRotation = {
        0,
        0,
        23.2
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030125,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Wind = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1030121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_GroundWind.NS_Claymore_GroundWind",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Wind",
      LocalOffset = {
        0.7,
        2.63,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030126,
      bTickEventWhenPaused = true
    },
    Hit = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_dir.NDC_knifehit_char_dir",
      FXPriorityType = 90,
      GroupName = "Hit",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030106,
      bTickEventWhenPaused = true
    },
    Hit1 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_normal.NDC_knifehit_char_normal",
      FXPriorityType = 90,
      GroupName = "Hit1",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030107,
      bTickEventWhenPaused = true
    },
    HitScene_Default = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_02.NS_Gun_HitGround_02",
      FXPriorityType = 90,
      GroupName = "HitScene_Default",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030101,
      bTickEventWhenPaused = true
    },
    HitScene_Mud = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Mud.NS_Gun_HitGround_Mud",
      FXPriorityType = 90,
      GroupName = "HitScene_Mud",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030102,
      bTickEventWhenPaused = true
    },
    HitScene_Sand = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Sand.NS_Gun_HitGround_Sand",
      FXPriorityType = 90,
      GroupName = "HitScene_Sand",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030104,
      bTickEventWhenPaused = true
    },
    HitScene_Snow = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Snow.NS_Gun_HitGround_Snow",
      FXPriorityType = 90,
      GroupName = "HitScene_Snow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030105,
      bTickEventWhenPaused = true
    },
    HitScene_Water = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Water.NS_Gun_HitGround_Water",
      FXPriorityType = 90,
      GroupName = "HitScene_Water",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030103,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_01_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_ModKnife_01.NS_Claymore_ModKnife_01",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_01_Knife",
      LocalOffset = {
        0,
        100,
        110
      },
      LocalRotation = T.RT_35,
      PlayByChar = true,
      Scale = {
        1.1,
        1.1,
        1.1
      },
      WeaponBlueprintId = 103,
      WeaponFXId = 1030127,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_01_Wind = {
      ChangeColorByChar = true,
      EffectId = 1030211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_GroundWind.NS_Claymore_Mod_GroundWind",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_01_Wind",
      LocalOffset = {
        25,
        180,
        2
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030128,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_ModKnife_02.NS_Claymore_ModKnife_02",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Knife",
      LocalOffset = T.RT_36,
      LocalRotation = T.RT_35,
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030129,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_02_Wind = {
      ChangeColorByChar = true,
      EffectId = 1030212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_GroundWind.NS_Claymore_Mod_GroundWind",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_02_Wind",
      LocalOffset = {
        0,
        180,
        2
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030130,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_ModKnife_03.NS_Claymore_ModKnife_03",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Knife",
      LocalOffset = T.RT_36,
      LocalRotation = T.RT_35,
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030131,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_03_Wind = {
      ChangeColorByChar = true,
      EffectId = 1030214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_GroundWind02.NS_Claymore_Mod_GroundWind02",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_03_Wind",
      LocalOffset = {
        -3,
        180,
        2
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030132,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04_Knife = {
      ChangeColorByChar = true,
      EffectId = 1030214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_ModKnife_04.NS_Claymore_ModKnife_04",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04_Knife",
      LocalOffset = {
        0,
        36,
        80
      },
      LocalRotation = {
        120,
        0,
        0
      },
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030133,
      bTickEventWhenPaused = true
    },
    Mod01_Attack_04_Wind = {
      ChangeColorByChar = true,
      EffectId = 1030214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_GroundWind02.NS_Claymore_Mod_GroundWind02",
      FXPriorityType = 90,
      GroupName = "Mod01_Attack_04_Wind",
      LocalOffset = {
        -8,
        160,
        2
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030134,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_01 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_04.NS_Claymore_Mod_04",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "hook_arm_r",
      WeaponBlueprintId = 103,
      WeaponFXId = 1030135,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_02 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_06.NS_Claymore_Mod_06",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030136,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_03 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1030224,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_06.NS_Claymore_Mod_06",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_03",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = {
        2.5,
        2.5,
        2.5
      },
      WeaponBlueprintId = 103,
      WeaponFXId = 1030137,
      bTickEventWhenPaused = true
    },
    Mod01_HeavyAttack_04 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1030224,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Mod_07.NS_Claymore_Mod_07",
      FXPriorityType = 90,
      GroupName = "Mod01_HeavyAttack_04",
      LocalOffset = T.RT_21,
      LocalRotation = {
        -5,
        5,
        30
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030138,
      bTickEventWhenPaused = true
    },
    SlideAttack = {
      ChangeColorByChar = true,
      EffectId = 1030141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Claymore/NS_Claymore_Knife_01.NS_Claymore_Knife_01",
      FXPriorityType = 90,
      GroupName = "SlideAttack",
      LocalOffset = {
        -13,
        150,
        81.4
      },
      LocalRotation = {
        5,
        5,
        182
      },
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 103,
      WeaponFXId = 1030121,
      bTickEventWhenPaused = true
    }
  },
  [104] = {
    Attack_01_Knife1 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack01_Knife.NS_Dualblade_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Attack_01_Knife1",
      LocalOffset = T.RT_38,
      LocalRotation = {
        0,
        170,
        -30
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040108,
      bTickEventWhenPaused = true
    },
    Attack_01_Knife2 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack01_Knife.NS_Dualblade_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Attack_01_Knife2",
      LocalOffset = {
        -10,
        0,
        120
      },
      LocalRotation = {
        0,
        20,
        10
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040109,
      bTickEventWhenPaused = true
    },
    Attack_02_Knife1 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack01_Knife.NS_Dualblade_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Attack_02_Knife1",
      LocalOffset = {
        0,
        35,
        70
      },
      LocalRotation = {
        0,
        160,
        -30
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040110,
      bTickEventWhenPaused = true
    },
    Attack_02_Knife2 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack01_Knife.NS_Dualblade_RunAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "Attack_02_Knife2",
      LocalOffset = T.RT_34,
      LocalRotation = {
        -15,
        -35,
        10
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040111,
      bTickEventWhenPaused = true
    },
    Attack_03_Appear = {
      ChangeColorByChar = true,
      EffectId = 1040113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack03_Appear.NS_Dualblade_RunAttack03_Appear",
      FXPriorityType = 90,
      GroupName = "Attack_03_Appear",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040114,
      bTickEventWhenPaused = true
    },
    Attack_03_Rush = {
      ChangeColorByChar = true,
      EffectId = 1040113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack03_Rush.NS_Dualblade_RunAttack03_Rush",
      FXPriorityType = 90,
      GroupName = "Attack_03_Rush",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040112,
      bTickEventWhenPaused = true
    },
    Attack_03_Smoke = {
      ChangeColorByChar = true,
      EffectId = 1040113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack03_Smoke.NS_Dualblade_RunAttack03_Smoke",
      FXPriorityType = 90,
      GroupName = "Attack_03_Smoke",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040113,
      bTickEventWhenPaused = true
    },
    Attack_04_Burst = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack04_Burst.NS_Dualblade_RunAttack04_Burst",
      FXPriorityType = 90,
      GroupName = "Attack_04_Burst",
      LocalOffset = {
        0,
        -75,
        110
      },
      LocalRotation = {
        30,
        0,
        0
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040115,
      bTickEventWhenPaused = true
    },
    Attack_04_Flash = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack04_Flash.NS_Dualblade_RunAttack04_Flash",
      FXPriorityType = 90,
      GroupName = "Attack_04_Flash",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "spine_03",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040116,
      bTickEventWhenPaused = true
    },
    Attack_04_Knife = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack04_Knife.NS_Dualblade_RunAttack04_Knife",
      FXPriorityType = 90,
      GroupName = "Attack_04_Knife",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040117,
      bTickEventWhenPaused = true
    },
    Attack_04_Slash = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack04_Slash.NS_Dualblade_RunAttack04_Slash",
      FXPriorityType = 90,
      GroupName = "Attack_04_Slash",
      LocalOffset = T.RT_39,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040118,
      bTickEventWhenPaused = true
    },
    FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "FallAttack",
      LocalOffset = T.RT_13,
      LocalRotation = T.RT_1,
      NotBlocking = true,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040119,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Absorb = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack_Absorb.NS_Dualblade_HeavyAttack_Absorb",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Absorb",
      LocalOffset = T.RT_24,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040123,
      bTickEventWhenPaused = true
    },
    HeavyAttack_AbsorbSmoke = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack_AbsorbSmoke.NS_Dualblade_HeavyAttack_AbsorbSmoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_AbsorbSmoke",
      LocalOffset = T.RT_40,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040124,
      bTickEventWhenPaused = true
    },
    HeavyAttack_EndSmoke = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack_EndSmoke.NS_Dualblade_HeavyAttack_EndSmoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_EndSmoke",
      LocalOffset = T.RT_40,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040131,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Knife1 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack01_Knife.NS_Dualblade_HeavyAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Knife1",
      LocalOffset = T.RT_41,
      LocalRotation = {
        180,
        8,
        -214
      },
      PlayByChar = true,
      Scale = T.RT_32,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040125,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Knife2 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack01_Knife.NS_Dualblade_HeavyAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Knife2",
      LocalOffset = {
        0,
        80,
        100
      },
      LocalRotation = {
        358,
        10,
        -365
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040126,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Knife3 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack01_Knife.NS_Dualblade_HeavyAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Knife3",
      LocalOffset = {
        0,
        60,
        100
      },
      LocalRotation = {
        172,
        19,
        -216
      },
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040127,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Knife4 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack01_Knife.NS_Dualblade_HeavyAttack01_Knife",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Knife4",
      LocalOffset = T.RT_38,
      LocalRotation = {
        357,
        17,
        -365
      },
      PlayByChar = true,
      Scale = T.RT_32,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040128,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Slash1 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack_Slash02.NS_Dualblade_HeavyAttack_Slash02",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Slash1",
      LocalOffset = T.RT_24,
      LocalRotation = {
        -13,
        12,
        -7
      },
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040129,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Slash2 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_HeavyAttack_Slash02.NS_Dualblade_HeavyAttack_Slash02",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Slash2",
      LocalOffset = T.RT_24,
      LocalRotation = {
        -166,
        13,
        -172
      },
      PlayByChar = true,
      Scale = {
        1.6,
        1.6,
        1.6
      },
      WeaponBlueprintId = 104,
      WeaponFXId = 1040130,
      bTickEventWhenPaused = true
    },
    Hit = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_dir.NDC_knifehit_char_dir",
      FXPriorityType = 90,
      GroupName = "Hit",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040106,
      bTickEventWhenPaused = true
    },
    Hit1 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_normal.NDC_knifehit_char_normal",
      FXPriorityType = 90,
      GroupName = "Hit1",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040107,
      bTickEventWhenPaused = true
    },
    HitScene_Default = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_02.NS_Gun_HitGround_02",
      FXPriorityType = 90,
      GroupName = "HitScene_Default",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040101,
      bTickEventWhenPaused = true
    },
    HitScene_Mud = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Mud.NS_Gun_HitGround_Mud",
      FXPriorityType = 90,
      GroupName = "HitScene_Mud",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040102,
      bTickEventWhenPaused = true
    },
    HitScene_Sand = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Sand.NS_Gun_HitGround_Sand",
      FXPriorityType = 90,
      GroupName = "HitScene_Sand",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040104,
      bTickEventWhenPaused = true
    },
    HitScene_Snow = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Snow.NS_Gun_HitGround_Snow",
      FXPriorityType = 90,
      GroupName = "HitScene_Snow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040105,
      bTickEventWhenPaused = true
    },
    HitScene_Water = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Water.NS_Gun_HitGround_Water",
      FXPriorityType = 90,
      GroupName = "HitScene_Water",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040103,
      bTickEventWhenPaused = true
    },
    Mod01_Attack01_Slash = {
      ChangeColorByChar = true,
      EffectId = 1040211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Slash.NS_Dualblade_Mod01_RunAttack01_Slash",
      GroupName = "Mod01_Attack01_Slash",
      LocalOffset = {
        16.76,
        80,
        75
      },
      LocalRotation = {
        -179,
        10,
        -188.76
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040134,
      bTickEventWhenPaused = true
    },
    Mod01_Attack01_Smoke = {
      ChangeColorByChar = true,
      EffectId = 1040211,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Smoke.NS_Dualblade_Mod01_RunAttack01_Smoke",
      GroupName = "Mod01_Attack01_Smoke",
      LocalOffset = T.RT_42,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040133,
      bTickEventWhenPaused = true
    },
    Mod01_Attack02_Slash = {
      ChangeColorByChar = true,
      EffectId = 1040212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack02_Slash.NS_Dualblade_Mod01_RunAttack02_Slash",
      GroupName = "Mod01_Attack02_Slash",
      LocalOffset = {
        550,
        0,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_l",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040136,
      bTickEventWhenPaused = true
    },
    Mod01_Attack02_Smoke = {
      ChangeColorByChar = true,
      EffectId = 1040212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Smoke.NS_Dualblade_Mod01_RunAttack01_Smoke",
      GroupName = "Mod01_Attack02_Smoke",
      LocalOffset = T.RT_42,
      LocalRotation = T.RT_26,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040135,
      bTickEventWhenPaused = true
    },
    Mod01_Attack02_Wave = {
      ChangeColorByChar = true,
      EffectId = 1040212,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack02_Wave.NS_Dualblade_Mod01_RunAttack02_Wave",
      GroupName = "Mod01_Attack02_Wave",
      LocalOffset = {
        0,
        200,
        -10
      },
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040137,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_01 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Smoke02.NS_Dualblade_Mod01_RunAttack01_Smoke02",
      GroupName = "Mod01_Attack03_01",
      LocalOffset = {
        100,
        70,
        0
      },
      LocalRotation = T.RT_21,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040139,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_02 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Smoke02.NS_Dualblade_Mod01_RunAttack01_Smoke02",
      GroupName = "Mod01_Attack03_02",
      LocalOffset = {
        -100,
        80,
        0
      },
      LocalRotation = T.RT_21,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040140,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_03 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Smoke.NS_Dualblade_Mod01_RunAttack01_Smoke",
      GroupName = "Mod01_Attack03_03",
      LocalOffset = T.RT_42,
      LocalRotation = T.RT_43,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040141,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_04 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack02_Trail.NS_Dualblade_Mod01_RunAttack02_Trail",
      GroupName = "Mod01_Attack03_04",
      LocalOffset = T.RT_35,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040142,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_05 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack02_Trail.NS_Dualblade_Mod01_RunAttack02_Trail",
      GroupName = "Mod01_Attack03_05",
      LocalOffset = T.RT_44,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040143,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_06 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash01.NS_Dualblade_Mod01_RunAttack03_Slash01",
      GroupName = "Mod01_Attack03_06",
      LocalOffset = {
        -172.4,
        102.875,
        80.73
      },
      LocalRotation = {
        -19,
        9,
        -65.65
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040144,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_07 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash01.NS_Dualblade_Mod01_RunAttack03_Slash01",
      GroupName = "Mod01_Attack03_07",
      LocalOffset = {
        94,
        76.268,
        103.5
      },
      LocalRotation = {
        -194.9,
        -11,
        -288.88
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040145,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_08 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash01.NS_Dualblade_Mod01_RunAttack03_Slash01",
      GroupName = "Mod01_Attack03_08",
      LocalOffset = {
        -130.5,
        90.8,
        88.96
      },
      LocalRotation = {
        13.9,
        -10,
        131.2
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040146,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_09 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash01.NS_Dualblade_Mod01_RunAttack03_Slash01",
      GroupName = "Mod01_Attack03_09",
      LocalOffset = {
        89.78,
        113.94,
        130.6
      },
      LocalRotation = {
        -170.8,
        11,
        -483.2
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040147,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_10 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash03.NS_Dualblade_Mod01_RunAttack03_Slash03",
      GroupName = "Mod01_Attack03_10",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_45,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040148,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_11 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash03.NS_Dualblade_Mod01_RunAttack03_Slash03",
      GroupName = "Mod01_Attack03_11",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_16,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040149,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_12 = {
      ChangeColorByChar = true,
      EffectId = 1040213,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash03.NS_Dualblade_Mod01_RunAttack03_Slash03",
      GroupName = "Mod01_Attack03_12",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_45,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_l",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040150,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_13 = {
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash03.NS_Dualblade_Mod01_RunAttack03_Slash03",
      GroupName = "Mod01_Attack03_13",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_16,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_l",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040151,
      bTickEventWhenPaused = true
    },
    Mod01_Attack03_Line = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Line.NS_Dualblade_Mod01_RunAttack01_Line",
      GroupName = "Mod01_Attack03_Line",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040138,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_01 = {
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_RunAttack03_Disappear.NS_Dualblade_RunAttack03_Disappear",
      GroupName = "Mod01_Attack04_01",
      LocalOffset = T.RT_42,
      LocalRotation = T.RT_43,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040153,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_02 = {
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack04_FallAttack.NS_Dualblade_Mod01_RunAttack04_FallAttack",
      GroupName = "Mod01_Attack04_02",
      LocalOffset = {
        0,
        220,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040154,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_04 = {
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack04_Slash.NS_Dualblade_Mod01_RunAttack04_Slash",
      GroupName = "Mod01_Attack04_04",
      LocalOffset = {
        0,
        0,
        50
      },
      LocalRotation = {
        -90,
        75,
        -30
      },
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040155,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_05 = {
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack04_Slash02.NS_Dualblade_Mod01_RunAttack04_Slash02",
      GroupName = "Mod01_Attack04_05",
      LocalOffset = {
        10,
        80,
        180
      },
      LocalRotation = {
        15.66,
        -1.7,
        361.9
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040156,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_06 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack03_Slash02.NS_Dualblade_Mod01_RunAttack03_Slash02",
      GroupName = "Mod01_Attack04_06",
      LocalOffset = {
        -3.3,
        -33,
        113
      },
      LocalRotation = {
        -186.48,
        13,
        22
      },
      PlayByChar = true,
      Scale = {
        0.8,
        0.8,
        0.8
      },
      SocketName = "Root",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040157,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_07 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack04_Slash02.NS_Dualblade_Mod01_RunAttack04_Slash02",
      GroupName = "Mod01_Attack04_07",
      LocalOffset = {
        30,
        80,
        88.2
      },
      LocalRotation = {
        189.3,
        -11.17,
        188.57
      },
      PlayByChar = true,
      Scale = T.RT_32,
      SocketName = "Root",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040158,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_08 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1040214,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack04_FallAttackLine.NS_Dualblade_Mod01_RunAttack04_FallAttackLine",
      GroupName = "Mod01_Attack04_08",
      LocalOffset = T.RT_44,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "hook_arm_l",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040159,
      bTickEventWhenPaused = true
    },
    Mod01_Attack04_Line = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_Mod01_RunAttack01_Line.NS_Dualblade_Mod01_RunAttack01_Line",
      GroupName = "Mod01_Attack04_Line",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "root_hook_arm_r",
      WeaponBlueprintId = 104,
      WeaponFXId = 1040152,
      bTickEventWhenPaused = true
    },
    Mod01_SlideAttack_Rush = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040242,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_SlideAttack_Mod01_Rush.NS_Dualblade_SlideAttack_Mod01_Rush",
      FXPriorityType = 90,
      GroupName = "Mod01_SlideAttack_Rush",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040132,
      bTickEventWhenPaused = true
    },
    Mod01_SlideAttack_Slash1 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040242,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_SlideAttack_Mod01_Slash.NS_Dualblade_SlideAttack_Mod01_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_SlideAttack_Slash1",
      LocalOffset = T.RT_41,
      LocalRotation = {
        0,
        15,
        0
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040160,
      bTickEventWhenPaused = true
    },
    Mod01_SlideAttack_Slash2 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040242,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_SlideAttack_Mod01_Slash.NS_Dualblade_SlideAttack_Mod01_Slash",
      FXPriorityType = 90,
      GroupName = "Mod01_SlideAttack_Slash2",
      LocalOffset = T.RT_41,
      LocalRotation = {
        0,
        165,
        0
      },
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040161,
      bTickEventWhenPaused = true
    },
    SlideAttack_Knife = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_SlideAttack_Knife.NS_Dualblade_SlideAttack_Knife",
      FXPriorityType = 90,
      GroupName = "SlideAttack_Knife",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040121,
      bTickEventWhenPaused = true
    },
    SlideAttack_Slash = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_SlideAttack_Slash.NS_Dualblade_SlideAttack_Slash",
      FXPriorityType = 90,
      GroupName = "SlideAttack_Slash",
      LocalOffset = T.RT_39,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040122,
      bTickEventWhenPaused = true
    },
    SlideAttack_Smoke = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1040141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Dualblade/NS_Dualblade_SlideAttack_Smoke.NS_Dualblade_SlideAttack_Smoke",
      FXPriorityType = 90,
      GroupName = "SlideAttack_Smoke",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 104,
      WeaponFXId = 1040120,
      bTickEventWhenPaused = true
    }
  },
  [105] = {
    Attack_01 = {
      ChangeColorByChar = true,
      EffectId = 1010111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro",
      FXPriorityType = 90,
      GroupName = "Attack_01",
      LocalOffset = T.RT_4,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010134,
      bTickEventWhenPaused = true
    },
    Attack_02 = {
      ChangeColorByChar = true,
      EffectId = 1010112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro2.NS_Huipo_RunAttack01_dg_Pro2",
      FXPriorityType = 90,
      GroupName = "Attack_02",
      LocalOffset = T.RT_5,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010135,
      bTickEventWhenPaused = true
    },
    Attack_02_Ground = {
      ChangeColorByChar = true,
      EffectId = 1010112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack02_Ground.NS_Huipo_RunAttack02_Ground",
      FXPriorityType = 90,
      GroupName = "Attack_02_Ground",
      LocalOffset = T.RT_6,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010136,
      bTickEventWhenPaused = true
    },
    Attack_03 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1010113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack03_dg_2Pro.NS_Huipo_RunAttack03_dg_2Pro",
      FXPriorityType = 90,
      GroupName = "Attack_03",
      LocalOffset = T.RT_8,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010137,
      bTickEventWhenPaused = true
    },
    Attack_04 = {
      ChangeColorByChar = true,
      EffectId = 1010114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro",
      FXPriorityType = 90,
      GroupName = "Attack_04",
      LocalOffset = T.RT_9,
      LocalRotation = T.RT_10,
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010138,
      bTickEventWhenPaused = true
    },
    Attack_04_Ground = {
      ChangeColorByChar = true,
      EffectId = 1010114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack04_Ground.NS_Huipo_RunAttack04_Ground",
      FXPriorityType = 90,
      GroupName = "Attack_04_Ground",
      LocalOffset = T.RT_12,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010139,
      bTickEventWhenPaused = true
    },
    Attack_04_xuli = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack04_xuli.NS_Huipo_RunAttack04_xuli",
      FXPriorityType = 90,
      GroupName = "Attack_04_xuli",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010140,
      bTickEventWhenPaused = true
    },
    FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1010132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "FallAttack",
      LocalOffset = T.RT_13,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010145,
      bTickEventWhenPaused = true
    },
    HeavyAttack_End_01 = {
      ChangeColorByChar = true,
      EffectId = 1010222,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_End_1.NS_Zhuiyi_HeavyAttack_End_1",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_End_01",
      LocalOffset = T.RT_14,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010143,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Loop = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_Loop.NS_Zhuiyi_HeavyAttack_Loop",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Loop",
      LocalOffset = T.RT_15,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010144,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Start = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_Start.NS_Zhuiyi_HeavyAttack_Start",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Start",
      LocalOffset = T.RT_15,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010141,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Start_Wind = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Zhuiyi_HeavyAttack_Start_Wind.NS_Zhuiyi_HeavyAttack_Start_Wind",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Start_Wind",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010142,
      bTickEventWhenPaused = true
    },
    Hit = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_dir.NDC_knifehit_char_dir",
      FXPriorityType = 90,
      GroupName = "Hit",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050106,
      bTickEventWhenPaused = true
    },
    Hit1 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_normal.NDC_knifehit_char_normal",
      FXPriorityType = 90,
      GroupName = "Hit1",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050107,
      bTickEventWhenPaused = true
    },
    HitScene_Default = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_02.NS_Gun_HitGround_02",
      FXPriorityType = 90,
      GroupName = "HitScene_Default",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050101,
      bTickEventWhenPaused = true
    },
    HitScene_Mud = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Mud.NS_Gun_HitGround_Mud",
      FXPriorityType = 90,
      GroupName = "HitScene_Mud",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050102,
      bTickEventWhenPaused = true
    },
    HitScene_Sand = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Sand.NS_Gun_HitGround_Sand",
      FXPriorityType = 90,
      GroupName = "HitScene_Sand",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050104,
      bTickEventWhenPaused = true
    },
    HitScene_Snow = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Snow.NS_Gun_HitGround_Snow",
      FXPriorityType = 90,
      GroupName = "HitScene_Snow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050105,
      bTickEventWhenPaused = true
    },
    HitScene_Water = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Water.NS_Gun_HitGround_Water",
      FXPriorityType = 90,
      GroupName = "HitScene_Water",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050103,
      bTickEventWhenPaused = true
    },
    SlideAttack = {
      ChangeColorByChar = true,
      EffectId = 1010141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Sword/NS_Huipo_RunAttack01_dg_Pro.NS_Huipo_RunAttack01_dg_Pro",
      FXPriorityType = 90,
      GroupName = "SlideAttack",
      LocalOffset = T.RT_22,
      LocalRotation = T.RT_23,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1010146,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack01 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_01.NS_Swordwhip_Runattack_01",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050108,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack02 = {
      ChangeColorByChar = true,
      EffectId = 1050112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_02.NS_Swordwhip_Runattack_02",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050109,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack02_Wind = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_qiliu_01.NS_Swordwhip_Runattack_qiliu_01",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack02_Wind",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050110,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack03 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_03.NS_Swordwhip_Runattack_03",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack03",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050111,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack03_Wind = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_qiliu_02.NS_Swordwhip_Runattack_qiliu_02",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack03_Wind",
      LocalOffset = T.RT_7,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050112,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack04_01 = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_04.NS_Swordwhip_Runattack_04",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack04_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050113,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack04_02 = {
      ChangeColorByChar = true,
      EffectId = 1050114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_05.NS_Swordwhip_Runattack_05",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack04_02",
      LocalOffset = {
        20,
        -20,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050114,
      bTickEventWhenPaused = true
    },
    Swordwhip_Attack04_Wind = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_qiliu_03.NS_Swordwhip_Runattack_qiliu_03",
      FXPriorityType = 90,
      GroupName = "Swordwhip_Attack04_Wind",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050115,
      bTickEventWhenPaused = true
    },
    Swordwhip_HeavyAttack_Ground01 = {
      ChangeColorByChar = true,
      EffectId = 1050121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_Ground.NS_Swordwhip_Runattack_Ground",
      FXPriorityType = 90,
      GroupName = "Swordwhip_HeavyAttack_Ground01",
      LocalOffset = {
        0,
        500,
        0
      },
      LocalRotation = T.RT_46,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050117,
      bTickEventWhenPaused = true
    },
    Swordwhip_HeavyAttack_Ground02 = {
      ChangeColorByChar = true,
      EffectId = 1050121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_guang_02.NS_Swordwhip_Runattack_guang_02",
      FXPriorityType = 90,
      GroupName = "Swordwhip_HeavyAttack_Ground02",
      LocalOffset = {
        0,
        500,
        100
      },
      LocalRotation = T.RT_46,
      PlayByChar = true,
      Scale = T.RT_2,
      SoundID = 118,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050118,
      bTickEventWhenPaused = true
    },
    Swordwhip_HeavyAttack_Knife = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      EffectId = 1050121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_daogaung.NS_Swordwhip_Runattack_daogaung",
      FXPriorityType = 90,
      GroupName = "Swordwhip_HeavyAttack_Knife",
      LocalOffset = {
        0,
        -125,
        -120
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050116,
      bTickEventWhenPaused = true
    },
    Swordwhip_HeavyAttack_WP_Xuli = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_xuli_02.NS_Swordwhip_Runattack_xuli_02",
      FXPriorityType = 90,
      GroupName = "Swordwhip_HeavyAttack_WP_Xuli",
      LocalOffset = T.RT_47,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "root",
      WeaponBlueprintId = 105,
      WeaponFXId = 1050120,
      bTickEventWhenPaused = true
    },
    Swordwhip_HeavyAttack_Xuli = {
      Attach = true,
      ChangeColorByChar = true,
      DetachWhenSkillEnds = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Swordwhip/NS_Swordwhip_Runattack_xuli_01.NS_Swordwhip_Runattack_xuli_01",
      FXPriorityType = 90,
      GroupName = "Swordwhip_HeavyAttack_Xuli",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 105,
      WeaponFXId = 1050119,
      bTickEventWhenPaused = true
    }
  },
  [106] = {
    Attack01_01 = {
      ChangeColorByChar = true,
      EffectId = 1060111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack01_01",
      LocalOffset = T.RT_48,
      LocalRotation = {
        -24,
        -26.8,
        23
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060108,
      bTickEventWhenPaused = true
    },
    Attack01_02 = {
      ChangeColorByChar = true,
      EffectId = 1060111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack01_02",
      LocalOffset = T.RT_48,
      LocalRotation = {
        178.2,
        6.4,
        142.5
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060109,
      bTickEventWhenPaused = true
    },
    Attack01_03 = {
      ChangeColorByChar = true,
      EffectId = 1060111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack01_03",
      LocalOffset = T.RT_48,
      LocalRotation = {
        -160,
        -21.2,
        165
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060110,
      bTickEventWhenPaused = true
    },
    Attack01_04 = {
      ChangeColorByChar = true,
      EffectId = 1060111,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash02.NS_Katana_RunAttack_KnifeSlash02",
      FXPriorityType = 90,
      GroupName = "Attack01_04",
      LocalOffset = T.RT_3,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060111,
      bTickEventWhenPaused = true
    },
    Attack02_01 = {
      ChangeColorByChar = true,
      EffectId = 1060112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack02_01",
      LocalOffset = T.RT_48,
      LocalRotation = {
        0,
        0,
        13.6
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060112,
      bTickEventWhenPaused = true
    },
    Attack02_02 = {
      ChangeColorByChar = true,
      EffectId = 1060112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack02_02",
      LocalOffset = T.RT_48,
      LocalRotation = {
        -186,
        30,
        151
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060113,
      bTickEventWhenPaused = true
    },
    Attack02_03 = {
      ChangeColorByChar = true,
      EffectId = 1060112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack02_03",
      LocalOffset = T.RT_48,
      LocalRotation = {
        -9,
        34.4,
        17
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060114,
      bTickEventWhenPaused = true
    },
    Attack02_04 = {
      ChangeColorByChar = true,
      EffectId = 1060112,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash02.NS_Katana_RunAttack_KnifeSlash02",
      FXPriorityType = 90,
      GroupName = "Attack02_04",
      LocalOffset = T.RT_3,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060115,
      bTickEventWhenPaused = true
    },
    Attack03_01 = {
      ChangeColorByChar = true,
      EffectId = 1060113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack03_01",
      LocalOffset = T.RT_24,
      LocalRotation = {
        -2.3,
        29.6,
        10.9
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060116,
      bTickEventWhenPaused = true
    },
    Attack03_02 = {
      ChangeColorByChar = true,
      EffectId = 1060113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash01.NS_Katana_RunAttack_KnifeSlash01",
      FXPriorityType = 90,
      GroupName = "Attack03_02",
      LocalOffset = {
        0,
        80,
        80
      },
      LocalRotation = {
        182.4,
        20.6,
        144.5
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060117,
      bTickEventWhenPaused = true
    },
    Attack03_04 = {
      Attach = true,
      ChangeColorByChar = true,
      EffectId = 1060113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_Flash02.NS_Katana_RunAttack_Flash02",
      FXPriorityType = 90,
      GroupName = "Attack03_04",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      SocketName = "hand_l",
      WeaponBlueprintId = 106,
      WeaponFXId = 1060118,
      bTickEventWhenPaused = true
    },
    Attack03_slash = {
      ChangeColorByChar = true,
      EffectId = 1060113,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_KnifeSlash04.NS_Katana_RunAttack_KnifeSlash04",
      FXPriorityType = 90,
      GroupName = "Attack03_slash",
      LocalOffset = {
        0,
        210,
        100
      },
      LocalRotation = {
        -6.41,
        -7.1,
        -11.52
      },
      PlayByChar = true,
      Scale = T.RT_11,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060120,
      bTickEventWhenPaused = true
    },
    Attack03_smoke = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_Smoke03.NS_Katana_RunAttack_Smoke03",
      FXPriorityType = 90,
      GroupName = "Attack03_smoke",
      LocalOffset = T.RT_20,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060119,
      bTickEventWhenPaused = true
    },
    Attack04_01 = {
      ChangeColorByChar = true,
      EffectId = 1060114,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_Flash03.NS_Katana_RunAttack_Flash03",
      FXPriorityType = 90,
      GroupName = "Attack04_01",
      LocalOffset = {
        0,
        350,
        130
      },
      LocalRotation = {
        0,
        -10,
        0
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060121,
      bTickEventWhenPaused = true
    },
    Attack04_smoke = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_RunAttack_Smoke01.NS_Katana_RunAttack_Smoke01",
      FXPriorityType = 90,
      GroupName = "Attack04_smoke",
      LocalOffset = T.RT_20,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060122,
      bTickEventWhenPaused = true
    },
    FallAttack = {
      ChangeColorByChar = true,
      EffectId = 1060132,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/A_Common/NS_FallAttack.NS_FallAttack",
      FXPriorityType = 90,
      GroupName = "FallAttack",
      LocalOffset = T.RT_13,
      LocalRotation = T.RT_1,
      NotBlocking = true,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060123,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Absorb = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_HeavyAttack_Absorb.NS_Katana_HeavyAttack_Absorb",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Absorb",
      LocalOffset = {
        4.6,
        -25.96,
        61.3
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060129,
      bTickEventWhenPaused = true
    },
    HeavyAttack_AbsorbSmoke = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_HeavyAttack_AbsorbSmoke.NS_Katana_HeavyAttack_AbsorbSmoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_AbsorbSmoke",
      LocalOffset = {
        0,
        250,
        0
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_28,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060126,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Body = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_HeavyAttack_Body.NS_Katana_HeavyAttack_Body",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Body",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060130,
      bTickEventWhenPaused = true
    },
    HeavyAttack_DecalLaunch = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_HeavyAttack_DecalLaunch.NS_Katana_HeavyAttack_DecalLaunch",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_DecalLaunch",
      LocalOffset = T.RT_49,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060127,
      bTickEventWhenPaused = true
    },
    HeavyAttack_LineAttackLaunch = {
      ChangeColorByChar = true,
      EffectId = 1060121,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_HeavyAttack_LineAttackLaunch.NS_Katana_HeavyAttack_LineAttackLaunch",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_LineAttackLaunch",
      LocalOffset = T.RT_8,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060125,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_01 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_Absorb.NS_Katana_Mod01_Absorb",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_01",
      LocalOffset = T.RT_47,
      LocalRotation = T.RT_7,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060131,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_02 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_Sprint.NS_Katana_Mod01_Sprint",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_02",
      LocalOffset = {
        0,
        200,
        90
      },
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060132,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_03 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_Smoke.NS_Katana_Mod01_Smoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_03",
      LocalOffset = T.RT_49,
      LocalRotation = T.RT_7,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060133,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_04 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_JumpSmoke.NS_Katana_Mod01_JumpSmoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_04",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060134,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_05 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_JumpSmoke02.NS_Katana_Mod01_JumpSmoke02",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_05",
      LocalOffset = {
        -5,
        0,
        120
      },
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060135,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_06 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_Flash.NS_Katana_Mod01_Flash",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_06",
      LocalOffset = T.RT_49,
      LocalRotation = {
        0,
        90,
        0
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060136,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_07 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_Slash.NS_Katana_Mod01_Slash",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_07",
      LocalOffset = {
        0,
        200,
        50
      },
      LocalRotation = {
        -88,
        90,
        -90
      },
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060137,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_08 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_Decal.NS_Katana_Mod01_Decal",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_08",
      LocalOffset = T.RT_49,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060138,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Mod01_09 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Mod01_AbsorbSmoke.NS_Katana_Mod01_AbsorbSmoke",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Mod01_09",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      PlayByChar = true,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060139,
      bTickEventWhenPaused = true
    },
    HeavyAttack_Shine = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_Shine.NS_Katana_Shine",
      FXPriorityType = 90,
      GroupName = "HeavyAttack_Shine",
      LocalOffset = {
        15,
        0,
        0
      },
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060128,
      bTickEventWhenPaused = true
    },
    Hit = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_dir.NDC_knifehit_char_dir",
      FXPriorityType = 90,
      GroupName = "Hit",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060106,
      bTickEventWhenPaused = true
    },
    Hit1 = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Common/NPC/NDC_knifehit_char_normal.NDC_knifehit_char_normal",
      FXPriorityType = 90,
      GroupName = "Hit1",
      IsHitFx = true,
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060107,
      bTickEventWhenPaused = true
    },
    HitScene_Default = {
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_02.NS_Gun_HitGround_02",
      FXPriorityType = 90,
      GroupName = "HitScene_Default",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060101,
      bTickEventWhenPaused = true
    },
    HitScene_Mud = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Mud.NS_Gun_HitGround_Mud",
      FXPriorityType = 90,
      GroupName = "HitScene_Mud",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060102,
      bTickEventWhenPaused = true
    },
    HitScene_Sand = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Sand.NS_Gun_HitGround_Sand",
      FXPriorityType = 90,
      GroupName = "HitScene_Sand",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060104,
      bTickEventWhenPaused = true
    },
    HitScene_Snow = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Snow.NS_Gun_HitGround_Snow",
      FXPriorityType = 90,
      GroupName = "HitScene_Snow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060105,
      bTickEventWhenPaused = true
    },
    HitScene_Water = {
      FXAsset = "/Game/Asset/Effect/Niagara/Common/Scene/NS_Gun_HitGround_Water.NS_Gun_HitGround_Water",
      FXPriorityType = 90,
      GroupName = "HitScene_Water",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060103,
      bTickEventWhenPaused = true
    },
    SlideAttack = {
      ChangeColorByChar = true,
      EffectId = 1060141,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Katana/NS_Katana_SlideAttack_KnifeSlash.NS_Katana_SlideAttack_KnifeSlash",
      FXPriorityType = 90,
      GroupName = "SlideAttack",
      LocalOffset = {
        20,
        130,
        90
      },
      LocalRotation = {
        0,
        0,
        -20
      },
      PlayByChar = true,
      Scale = T.RT_37,
      WeaponBlueprintId = 106,
      WeaponFXId = 1060124,
      bTickEventWhenPaused = true
    }
  },
  [203] = {
    Muzzle_l = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Cannon/NS_Chixing_OpenFire.NS_Chixing_OpenFire",
      FXPriorityType = 90,
      GroupName = "Muzzle_l",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 203,
      WeaponFXId = 2030001,
      bTickEventWhenPaused = true
    }
  },
  [204] = {
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/NS_Shotgun_OpenFire.NS_Shotgun_OpenFire",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 204,
      WeaponFXId = 2040001,
      bTickEventWhenPaused = true
    }
  },
  [205] = {
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/NS_Shotgun_OpenFire.NS_Shotgun_OpenFire",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 205,
      WeaponFXId = 2050001,
      bTickEventWhenPaused = true
    }
  },
  [206] = {
    Absorb_01 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Absorb_01.NS_Bow_HeavyShooting_Absorb_01",
      FXPriorityType = 90,
      GroupName = "Absorb_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060107,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060101,
      bTickEventWhenPaused = true
    },
    Absorb_02 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Absorb_02.NS_Bow_HeavyShooting_Absorb_02",
      FXPriorityType = 90,
      GroupName = "Absorb_02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060108,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060102,
      bTickEventWhenPaused = true
    },
    Absorb_03 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Absorb_03.NS_Bow_HeavyShooting_Absorb_03",
      FXPriorityType = 90,
      GroupName = "Absorb_03",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060109,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060103,
      bTickEventWhenPaused = true
    },
    Absorb_04 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Absorb_04.NS_Bow_HeavyShooting_Absorb_04",
      FXPriorityType = 90,
      GroupName = "Absorb_04",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060110,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060103,
      bTickEventWhenPaused = true
    },
    GradeDown_01 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Down_01.NS_Bow_HeavyShooting_Down_01",
      FXPriorityType = 90,
      GroupName = "GradeDown_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060106,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060112,
      bTickEventWhenPaused = true
    },
    GradeUp_01 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Up_01.NS_Bow_HeavyShooting_Up_01",
      FXPriorityType = 90,
      GroupName = "GradeUp_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060104,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060111,
      bTickEventWhenPaused = true
    },
    GradeUp_02 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_HeavyShooting_Up_02.NS_Bow_HeavyShooting_Up_02",
      FXPriorityType = 90,
      GroupName = "GradeUp_02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060105,
      WeaponBlueprintId = 206,
      WeaponFXId = 2060112,
      bTickEventWhenPaused = true
    }
  },
  [2021] = {
    Muzzle_l = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Crossbow/NS_Chixing_Muzzle.NS_Chixing_Muzzle",
      FXPriorityType = 90,
      GroupName = "Muzzle_l",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 2021,
      WeaponFXId = 2020001,
      bTickEventWhenPaused = true
    }
  },
  [2022] = {
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Crossbow/NS_Chixing_Muzzle.NS_Chixing_Muzzle",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 2022,
      WeaponFXId = 2020002,
      bTickEventWhenPaused = true
    }
  },
  [7004] = {
    Attack01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Jt/NS_Jt_Tuji_Attack01_Wind.NS_Jt_Tuji_Attack01_Wind",
      FXPriorityType = 80,
      GroupName = "Attack01",
      LocalOffset = T.RT_47,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "hitcenter",
      WeaponBlueprintId = 7004,
      WeaponFXId = 700401
    }
  },
  [8513] = {
    Skill05_01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Kuxiu/NS_Kuxiu_Skill05_WeaponLine.NS_Kuxiu_Skill05_WeaponLine",
      FXPriorityType = 80,
      GroupName = "Skill05_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "hitcenter",
      WeaponBlueprintId = 8513,
      WeaponFXId = 851301
    },
    Skill06_01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Kuxiu/NS_Kuxiu_Skill06_WeaponLine.NS_Kuxiu_Skill06_WeaponLine",
      FXPriorityType = 80,
      GroupName = "Skill06_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "hitcenter",
      WeaponBlueprintId = 8513,
      WeaponFXId = 851302
    },
    Skill07_01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Kuxiu/NS_Kuxiu_Skill07_WeaponLine.NS_Kuxiu_Skill07_WeaponLine",
      FXPriorityType = 80,
      GroupName = "Skill07_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "hitcenter",
      WeaponBlueprintId = 8513,
      WeaponFXId = 851303
    }
  },
  [8514] = {
    Skill01_01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Shenpan/NS_Shenpan_Skill01_OpenFire.NS_Shenpan_Skill01_OpenFire",
      FXPriorityType = 80,
      GroupName = "Skill01_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 8514,
      WeaponFXId = 851401
    },
    Skill02_01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Shenpan/NS_Shenpan_Skill01_OpenFire.NS_Shenpan_Skill01_OpenFire",
      FXPriorityType = 80,
      GroupName = "Skill02_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 8514,
      WeaponFXId = 851402
    },
    Skill04_01 = {
      Attach = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Monster/Shenpan/NS_Shenpan_Skill01_OpenFire.NS_Shenpan_Skill01_OpenFire",
      FXPriorityType = 80,
      GroupName = "Skill04_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 8514,
      WeaponFXId = 851404
    }
  },
  [20304] = {
    Muzzle_l = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Qiege/NS_Qiege_Attact.NS_Qiege_Attact",
      FXPriorityType = 90,
      GroupName = "Muzzle_l",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 20304,
      WeaponFXId = 2030401,
      bTickEventWhenPaused = true
    }
  },
  [20305] = {
    Muzzle_l_Fast = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Cannon/yinbai/NS_Yinbai_OpenFire_Fast.NS_Yinbai_OpenFire_Fast",
      FXPriorityType = 90,
      GroupName = "Muzzle_l_Fast",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      SoundID = 2030502,
      WeaponBlueprintId = 20305,
      WeaponFXId = 2030502,
      bTickEventWhenPaused = true
    },
    Muzzle_l_Slow = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Cannon/yinbai/NS_Yinbai_OpenFire_Slow.NS_Yinbai_OpenFire_Slow",
      FXPriorityType = 90,
      GroupName = "Muzzle_l_Slow",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      SoundID = 2030501,
      WeaponBlueprintId = 20305,
      WeaponFXId = 2030501,
      bTickEventWhenPaused = true
    }
  },
  [20402] = {
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Banzi/NS_Banzi_Muzzle.NS_Banzi_Muzzle",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 20402,
      WeaponFXId = 2040002,
      bTickEventWhenPaused = true
    }
  },
  [20403] = {
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Shengcai/NS_Shengcai_Attack.NS_Shengcai_Attack",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 20403,
      WeaponFXId = 2040003,
      bTickEventWhenPaused = true
    }
  },
  [20405] = {
    Absorb_01 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Baopo/NS_Baopo_HeavyShooting_Absorb_01.NS_Baopo_HeavyShooting_Absorb_01",
      FXPriorityType = 90,
      GroupName = "Absorb_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      SoundID = 2040509,
      WeaponBlueprintId = 20405,
      WeaponFXId = 2040501,
      bTickEventWhenPaused = true
    },
    Absorb_02 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Baopo/NS_Baopo_HeavyShooting_Absorb_02.NS_Baopo_HeavyShooting_Absorb_02",
      FXPriorityType = 90,
      GroupName = "Absorb_02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      SoundID = 2040510,
      WeaponBlueprintId = 20405,
      WeaponFXId = 2040502,
      bTickEventWhenPaused = true
    },
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Baopo/NS_Baopo_HeavyShooting_OpenFire01.NS_Baopo_HeavyShooting_OpenFire01",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 20405,
      WeaponFXId = 2040503,
      bTickEventWhenPaused = true
    },
    Muzzle_r_02 = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Baopo/NS_Baopo_HeavyShooting_OpenFire02.NS_Baopo_HeavyShooting_OpenFire02",
      FXPriorityType = 90,
      GroupName = "Muzzle_r_02",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_50,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 20405,
      WeaponFXId = 2040504,
      bTickEventWhenPaused = true
    }
  },
  [20406] = {
    Muzzle_r = {
      Attach = true,
      ChangeColorByChar = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Shotgun/Qiege/NS_Qiege_Attact.NS_Qiege_Attact",
      FXPriorityType = 90,
      GroupName = "Muzzle_r",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "gunpoint_01",
      WeaponBlueprintId = 20406,
      WeaponFXId = 2040004,
      bTickEventWhenPaused = true
    }
  },
  [20603] = {
    Absorb_01 = {
      Attach = true,
      ChangeColorByChar = true,
      DestroyImmediately = true,
      FXAsset = "/Game/Asset/Effect/Niagara/Weapon/Bow/NS_Bow_ZimiaoAbsorb.NS_Bow_ZimiaoAbsorb",
      FXPriorityType = 90,
      GroupName = "Absorb_01",
      LocalOffset = T.RT_1,
      LocalRotation = T.RT_1,
      Scale = T.RT_2,
      SocketName = "ArrowPoint",
      SoundID = 2060306,
      WeaponBlueprintId = 20603,
      WeaponFXId = 2060301,
      bTickEventWhenPaused = true
    }
  }
})
