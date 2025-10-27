local T = {}
T.RT_1 = {Rate = 0.01}
T.RT_2 = {
  [1] = 11
}
T.RT_3 = {Value = 1}
T.RT_4 = {
  [1] = "Invincible"
}
T.RT_5 = {
  [1] = 40,
  [2] = 41
}
T.RT_6 = {Rate = 0.5}
T.RT_7 = {Rate = 1}
T.RT_8 = {AttrName = "MaxES", Rate = "#1"}
T.RT_9 = {AttrName = "DEF", Rate = "#2"}
T.RT_10 = {AttrName = "MaxHp", Rate = "#3"}
T.RT_11 = {
  AttrName = "WeaponCRIModifierRate",
  Value = 1
}
T.RT_12 = {
  [1] = T.RT_11
}
T.RT_13 = {
  [1] = 206
}
T.RT_14 = {
  AttrName = "EnmityValue",
  Value = 1
}
T.RT_15 = {
  [1] = T.RT_14
}
T.RT_16 = {
  AttrName = "SkillIntensity",
  Rate = 1
}
T.RT_17 = {
  [1] = T.RT_16
}
T.RT_18 = {AttrName = "ATK", Rate = 1}
T.RT_19 = {
  [1] = T.RT_18
}
T.RT_20 = {
  [1] = 21
}
T.RT_21 = {
  AttrName = "DarkDamagedRate",
  Value = 4
}
T.RT_22 = {
  AttrName = "WindDamagedRate",
  Value = 4
}
T.RT_23 = {
  AttrName = "FireDamagedRate",
  Value = 4
}
T.RT_24 = {
  [1] = 530102
}
T.RT_25 = {AttrName = "ATK", Rate = 0.5}
T.RT_26 = {
  [1] = T.RT_25
}
T.RT_27 = {AttrName = "ATK", Rate = 0.4}
T.RT_28 = {
  [1] = T.RT_27
}
T.RT_29 = {
  [1] = 5000010
}
T.RT_30 = {
  [1] = "Hot"
}
T.RT_31 = {
  AttrName = "AlmightyDamageRate",
  Value = 0.55
}
T.RT_32 = {
  [1] = T.RT_31
}
T.RT_33 = {
  [1] = 11,
  [2] = 10101101
}
T.RT_34 = {AttrName = "ATK", Rate = "#1"}
T.RT_35 = {
  [1] = T.RT_34
}
T.RT_36 = {
  AttrName = "DamageRate",
  RateZone = "Rouge",
  Value = 0.75
}
T.RT_37 = {
  [1] = T.RT_36
}
T.RT_38 = {
  [1] = 10
}
T.RT_39 = {AttrName = "ATK", Rate = 0.3}
T.RT_40 = {
  [1] = T.RT_39
}
T.RT_41 = {
  [1] = 999
}
T.RT_42 = {
  [1] = 180120
}
T.RT_43 = {
  AttrName = "DamageRate",
  RateZone = "Normal",
  Value = "#1"
}
T.RT_44 = {
  [1] = T.RT_43
}
T.RT_45 = {
  [1] = 150409
}
T.RT_46 = {
  AttrName = "TriggerProbModifierRate",
  Stackable = 1,
  Type = "Ranged",
  Value = "#2"
}
T.RT_47 = {
  AttrName = "DamageRate",
  DamageTag = "Ranged",
  RateZone = "Normal",
  Stackable = 1,
  Value = "#1"
}
T.RT_48 = {
  [1] = T.RT_47,
  [2] = T.RT_46
}
T.RT_49 = {
  AttrName = "TriggerProbModifierRate",
  Stackable = 1,
  Type = "Melee",
  Value = "#2"
}
T.RT_50 = {
  AttrName = "DamageRate",
  DamageTag = "Melee",
  RateZone = "Normal",
  Stackable = 1,
  Value = "#1"
}
T.RT_51 = {
  [1] = T.RT_50,
  [2] = T.RT_49
}
T.RT_52 = {
  [1] = 150311
}
T.RT_53 = {
  [1] = 150312
}
T.RT_54 = {
  AttrName = "AttackSpeedModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_55 = {
  [1] = T.RT_54
}
T.RT_56 = {
  [100] = 150306
}
T.RT_57 = {Value = -0.3}
T.RT_58 = {
  [150321] = T.RT_57
}
T.RT_59 = {
  [100] = 150305
}
T.RT_60 = {
  [150302] = T.RT_57
}
T.RT_61 = {Value = -20}
T.RT_62 = {
  [1] = 10503
}
T.RT_63 = {
  [1] = 10503001
}
T.RT_64 = {
  [1] = 104
}
T.RT_65 = {
  AttrName = "MoveSpeedAddRate",
  Value = 1
}
T.RT_66 = {
  [1] = T.RT_65
}
T.RT_67 = {
  AttrName = "EnmityValue",
  Value = "#1"
}
T.RT_68 = {
  [1] = T.RT_67
}
T.RT_69 = {
  AttrName = "WeaponCRDModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_70 = {
  [1] = T.RT_69
}
T.RT_71 = {
  AttrName = "WeaponCRIModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_72 = {
  [1] = T.RT_71
}
T.RT_73 = {
  AttrName = "SkillIntensity",
  Rate = "#1"
}
T.RT_74 = {
  [1] = T.RT_73
}
T.RT_75 = {
  AttrName = "TriggerProbModifierRate",
  Type = "Melee",
  Value = "#1"
}
T.RT_76 = {
  [1] = T.RT_75
}
T.RT_77 = {
  Interval = 3,
  Type = "SpChange",
  Value = "#1"
}
T.RT_78 = {
  [1] = T.RT_77
}
T.RT_79 = {
  AttrName = "StrongValue",
  Value = "#1"
}
T.RT_80 = {
  [1] = T.RT_79
}
T.RT_81 = {
  AttrName = "DamageRate",
  RateZone = "Almighty",
  Value = "#1"
}
T.RT_82 = {
  [1] = T.RT_81
}
T.RT_83 = {
  AttrName = "MultiShootModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_84 = {
  [1] = T.RT_83
}
T.RT_85 = {
  AttrName = "TriggerProbModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_86 = {
  [1] = T.RT_85
}
T.RT_87 = {
  AttrName = "WeaponCRDModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_88 = {
  [1] = T.RT_87
}
T.RT_89 = {
  AttrName = "WeaponCRIModifierRate",
  Type = "Ranged",
  Value = "#1"
}
T.RT_90 = {
  [1] = T.RT_89
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PureLogicBuff", {
  [1] = {
    BuffId = 1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [2] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Phantom",
        Value = -0.5
      }
    },
    BuffId = 2,
    DeadNotRemove = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [97] = {
    BuffId = 97,
    DeadNotRemove = true,
    ExpRate = -0.9999,
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [99] = {
    BuffId = 99,
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        Interval = 0.5,
        Type = "SpChange",
        Value = 5
      }
    },
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [304] = {
    BuffId = 304,
    DeadNotRemove = true,
    IsAvatarBuff = true,
    LockHp = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [306] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        IndividualRateZone = 1,
        Value = 0
      }
    },
    BuffId = 306,
    IsAvatarBuff = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [801] = {
    AddAttrs = {
      [1] = T.RT_8
    },
    BuffId = 801,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [802] = {
    AddAttrs = {
      [1] = T.RT_9,
      [2] = T.RT_8
    },
    BuffId = 802,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [803] = {
    AddAttrs = {
      [1] = T.RT_10,
      [2] = T.RT_9,
      [3] = T.RT_8
    },
    BuffId = 803,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [804] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = "#4"},
      [2] = T.RT_10,
      [3] = T.RT_9,
      [4] = T.RT_8
    },
    BuffId = 804,
    CombatConditionId = 502,
    IsAvatarBuff = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [903] = {
    AllowSkillSustainModify = true,
    BuffId = 903,
    DeadNotRemove = true,
    LockHp = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1315] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "BossDown",
        Value = "#1"
      }
    },
    BuffId = 1315,
    BuffType = {
      [1] = 6000206
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1316] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        Rate = "#1",
        Stackable = 1
      }
    },
    BuffId = 1316,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1430] = {
    BuffId = 1430,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 1430001,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1440] = {
    BuffId = 1440,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 1440001,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1523] = {
    BuffId = 1523,
    LockHp = T.RT_3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1800] = {
    AddAttrs = T.RT_44,
    BuffId = 1800,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [1961] = {
    BuffId = 1961,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 1961001,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1962] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        RateUseValue = 1,
        SupLimitRate = "#1"
      }
    },
    BuffId = 1962,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6111] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Dark",
        Value = 1
      }
    },
    AddPassiveEffect = {
      [1] = 201
    },
    BuffId = 6111,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6113] = {
    BuffId = 6113,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6114,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6114] = {
    AddAttrs = T.RT_12,
    BuffId = 6114,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6121] = {
    AddAttrs = T.RT_19,
    BuffId = 6121,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6123] = {
    BuffId = 6123,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6124,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6124] = {
    AddAttrs = T.RT_17,
    BuffId = 6124,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6131] = {
    AddAttrs = T.RT_19,
    BuffId = 6131,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6133] = {
    BuffId = 6133,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6134,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6134] = {
    AddAttrs = T.RT_17,
    BuffId = 6134,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6141] = {
    AddAttrs = T.RT_17,
    BuffId = 6141,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6143] = {
    BuffId = 6143,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6144,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6144] = {
    AddAttrs = T.RT_15,
    BuffId = 6144,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6151] = {
    AddAttrs = T.RT_17,
    BuffId = 6151,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6153] = {
    BuffId = 6153,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6154,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6154] = {
    AddAttrs = T.RT_15,
    BuffId = 6154,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6161] = {
    AddAttrs = {
      [1] = {
        AttrName = "BonusDamage",
        Type = "Light",
        Value = 1
      }
    },
    AddPassiveEffect = T.RT_13,
    BuffId = 6161,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6163] = {
    BuffId = 6163,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 6164,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [6164] = {
    AddAttrs = T.RT_12,
    BuffId = 6164,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10503] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackRangeModifierValue",
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_64,
    BuffId = 10503,
    BuffType = T.RT_62,
    DisperseBuffType = T.RT_63,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100001] = {
    BuffId = 100001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100002] = {
    AddAttrs = T.RT_28,
    BuffId = 100002,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100003] = {
    BuffId = 100003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100004] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = 0.08
      }
    },
    BuffId = 100004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100005] = {
    BuffId = 100005,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100006,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100006] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Weapon",
        RateZone = "Normal",
        Value = 0.08
      }
    },
    BuffId = 100006,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100007] = {
    BuffId = 100007,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100008,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100008] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", Rate = 0.4}
    },
    BuffId = 100008,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [100009] = {
    BuffId = 100009,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 100010,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [100010] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Value = 0.4
      }
    },
    BuffId = 100010,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110001] = {
    BuffId = 110001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 110002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110002] = {
    AddAttrs = T.RT_28,
    BuffId = 110002,
    CombatConditionId = 1001,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110003] = {
    BuffId = 110003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 110004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110004] = {
    AddAttrs = T.RT_26,
    BuffId = 110004,
    CombatConditionId = 1001,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [110112] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        Rate = 0.2,
        Stackable = 1
      }
    },
    BuffId = 110112,
    MaxLayer = 4,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110204] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRDModifierRate",
        DamageTag = "Melee",
        Value = 0.5
      }
    },
    BuffId = 110204,
    BuffType = T.RT_38,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110223] = {
    BuffId = 110223,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110303] = {
    AddAttrs = {
      [1] = {
        AttrName = "ATK",
        BaseUseValue = 1,
        Rate = "#1",
        SupLimitValue = 315
      },
      [2] = {
        AttrName = "WalkSpeedModifier",
        Value = 0.5
      },
      [3] = {
        AttrName = "JumpVelocityModifier",
        Value = 0.1
      }
    },
    BuffId = 110303,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110304] = {
    BuffDamagedRate = {Value = -0.25},
    BuffId = 110304,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [110401] = {
    BuffId = 110401,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [120231] = {
    BuffId = 120231,
    BuffType = T.RT_2,
    ChangeWeaponNotClearCombo = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150001] = {
    BuffId = 150001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 150002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150002] = {
    AddAttrs = T.RT_28,
    BuffId = 150002,
    CombatConditionId = 1006,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [150003] = {
    BuffId = 150003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 150004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150004] = {
    AddAttrs = T.RT_26,
    BuffId = 150004,
    CombatConditionId = 1006,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [150222] = {
    AddAttrs = {
      [1] = {AttrName = "SkillRange", ValueUseValue = 1}
    },
    AllowSkillSustainModify = true,
    BuffId = 150222,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150223] = {
    AllowSkillSustainModify = true,
    BuffId = 150223,
    BuffType = T.RT_2,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150231] = {
    AddAttrs = {
      [1] = {AttrName = "SpRate", Value = 0.25}
    },
    BuffId = 150231,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150301] = {
    AddAttrs = T.RT_51,
    BuffId = 150301,
    BuffSpModify = T.RT_60,
    LayerExtraBuff = T.RT_59,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150302] = {
    AddAttrs = T.RT_48,
    BuffId = 150302,
    BuffSpModify = T.RT_58,
    LayerExtraBuff = T.RT_56,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150305] = {
    BuffId = 150305,
    BuffSpModify = {
      [150302] = T.RT_61
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150306] = {
    BuffId = 150306,
    BuffSpModify = {
      [150321] = T.RT_61
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150307] = {
    AddAttrs = T.RT_51,
    BuffId = 150307,
    BuffSpModify = T.RT_60,
    LayerExtraBuff = T.RT_59,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150308] = {
    AddAttrs = T.RT_48,
    BuffId = 150308,
    BuffSpModify = T.RT_58,
    LayerExtraBuff = T.RT_56,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150311] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackSpeedModifierRate",
        Type = "Ranged",
        Value = "#1"
      }
    },
    BuffId = 150311,
    BuffType = T.RT_52,
    DisperseBuffType = T.RT_53,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150312] = {
    AddAttrs = T.RT_55,
    BuffId = 150312,
    BuffType = T.RT_53,
    DisperseBuffType = T.RT_52,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [150331] = {
    BuffId = 150331,
    BuffType = {
      [1] = 150331
    },
    DisperseBuffType = {
      [1] = 150332,
      [2] = 150333,
      [3] = 150334
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503104] = 1503202
    }
  },
  [150332] = {
    BuffId = 150332,
    BuffType = {
      [1] = 150332
    },
    DisperseBuffType = {
      [1] = 150331,
      [2] = 150333,
      [3] = 150334
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503104] = 1503203
    }
  },
  [150333] = {
    BuffId = 150333,
    BuffType = {
      [1] = 150333
    },
    DisperseBuffType = {
      [1] = 150331,
      [2] = 150332,
      [3] = 150334
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503104] = 1503204
    }
  },
  [150341] = {
    BuffId = 150341,
    BuffType = {
      [1] = 150341
    },
    DisperseBuffType = {
      [1] = 150342,
      [2] = 150343,
      [3] = 150344
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503124] = 1503201
    }
  },
  [150342] = {
    BuffId = 150342,
    BuffType = {
      [1] = 150342
    },
    DisperseBuffType = {
      [1] = 150341,
      [2] = 150343,
      [3] = 150344
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503124] = 1503203
    }
  },
  [150343] = {
    BuffId = 150343,
    BuffType = {
      [1] = 150343
    },
    DisperseBuffType = {
      [1] = 150341,
      [2] = 150342,
      [3] = 150344
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503124] = 1503204
    }
  },
  [150351] = {
    BuffId = 150351,
    BuffType = {
      [1] = 150351
    },
    DisperseBuffType = {
      [1] = 150352,
      [2] = 150353,
      [3] = 150354
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503144] = 1503201
    }
  },
  [150352] = {
    BuffId = 150352,
    BuffType = {
      [1] = 150352
    },
    DisperseBuffType = {
      [1] = 150351,
      [2] = 150353,
      [3] = 150354
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503144] = 1503202
    }
  },
  [150353] = {
    BuffId = 150353,
    BuffType = {
      [1] = 150353
    },
    DisperseBuffType = {
      [1] = 150351,
      [2] = 150352,
      [3] = 150354
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503144] = 1503204
    }
  },
  [150361] = {
    BuffId = 150361,
    BuffType = {
      [1] = 150361
    },
    DisperseBuffType = {
      [1] = 150362,
      [2] = 150363,
      [3] = 150364
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503164] = 1503201
    }
  },
  [150362] = {
    BuffId = 150362,
    BuffType = {
      [1] = 150362
    },
    DisperseBuffType = {
      [1] = 150361,
      [2] = 150363,
      [3] = 150364
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503164] = 1503202
    }
  },
  [150363] = {
    BuffId = 150363,
    BuffType = {
      [1] = 150363
    },
    DisperseBuffType = {
      [1] = 150361,
      [2] = 150362,
      [3] = 150364
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    ReplaceSkillNodes = {
      [1503164] = 1503203
    }
  },
  [150371] = {
    AddAttrs = T.RT_51,
    BuffId = 150371,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150372] = {
    AddAttrs = T.RT_48,
    BuffId = 150372,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150373] = {
    AddAttrs = T.RT_51,
    BuffId = 150373,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150374] = {
    AddAttrs = T.RT_48,
    BuffId = 150374,
    MaxLayer = 100,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150409] = {
    BuffId = 150409,
    BuffType = T.RT_45,
    DotDatas = {
      [1] = {
        DotDelay = 1,
        Interval = 0.1,
        Type = "SecondSpChange",
        Value = 1
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150410] = {
    BuffId = 150410,
    BuffType = T.RT_45,
    DotDatas = {
      [1] = {
        DotDelay = 1,
        Interval = 0.1,
        Type = "SecondSpChange",
        Value = 2
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [150421] = {
    BuffId = 150421,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [180101] = {
    AddAttrs = {
      [1] = {
        AllowSkillIntensity = 1,
        AttrName = "BonusDamage",
        Type = "Light",
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_13,
    BuffId = 180101,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180121] = {
    BuffId = 180121,
    BuffType = T.RT_42,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180122,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180123] = {
    BuffId = 180123,
    BuffType = T.RT_42,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180124,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180125] = {
    BuffId = 180125,
    BuffType = T.RT_42,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180126,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180127] = {
    BuffId = 180127,
    BuffType = T.RT_42,
    HaloDatas = {
      [1] = {
        AllowSkillRange = 1,
        AuraRange = 1000,
        BuffId = 180128,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180191] = {
    BuffId = 180191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 180192,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [180192] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Weapon",
        RateZone = "Normal",
        Value = 0.1
      }
    },
    BuffId = 180192,
    CombatConditionId = 1031,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [201021] = {
    AddAttrs = T.RT_40,
    BuffId = 201021,
    BuffType = T.RT_38,
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        DamageTag = T.RT_30,
        DefaultHealFX = 1,
        Interval = 1,
        Rate = 0.5,
        Type = "Hot"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210001] = {
    BuffId = 210001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 210002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210002] = {
    AddAttrs = T.RT_28,
    BuffId = 210002,
    CombatConditionId = 1002,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [210003] = {
    BuffId = 210003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 210004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [210004] = {
    AddAttrs = T.RT_26,
    BuffId = 210004,
    CombatConditionId = 1002,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [210203] = {
    BuffId = 210203,
    BuffType = T.RT_2,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 210204,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [230122] = {
    BuffId = 230122,
    BuffType = {
      [1] = 21,
      [2] = 41
    },
    DotDatas = {
      [1] = {
        DamageTag = {
          [1] = "Dot",
          [2] = "Skill"
        },
        DamageType = "Water",
        Immediately = 1,
        Interval = 2,
        Rate = 2.8,
        Type = "Dot"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240131] = {
    BuffId = 240131,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 240132,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240132] = {
    AddPassiveEffect = {
      [1] = 240103
    },
    BuffId = 240132,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [240152] = {
    BuffId = 240152,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240153] = {
    BuffId = 240153,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240191] = {
    BuffId = 240191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 240192,
        Camp = "Friend",
        Condition = 1007
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [240192] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        DamageTag = "Skill",
        RateZone = "Normal",
        Value = 0.1
      }
    },
    BuffId = 240192,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [310001] = {
    BuffId = 310001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 310002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310002] = {
    AddAttrs = T.RT_28,
    BuffId = 310002,
    CombatConditionId = 1003,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [310003] = {
    BuffId = 310003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 310004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310004] = {
    AddAttrs = T.RT_26,
    BuffId = 310004,
    CombatConditionId = 1003,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [310123] = {
    BuffId = 310123,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310124] = {
    AddAttrs = {
      [1] = {
        AttrName = "AttackSpeedModifierRate",
        Stackable = 1,
        Value = 0.03
      }
    },
    BuffId = 310124,
    MaxLayer = 35,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310206] = {
    AddAttrs = T.RT_32,
    AllowSkillSustainModify = true,
    BuffId = 310206,
    DotDatas = {
      [1] = {
        DotDelay = 0.5,
        Interval = 1,
        Type = "SpChange",
        Value = -15
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    RemoveWhenSpZero = true
  },
  [310302] = {
    BuffId = 310302,
    HaloDatas = {
      [1] = {
        AuraRange = 1500,
        BuffId = 310321,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [310311] = {
    BuffId = 310311,
    ForbidBuffType = {
      [1] = 10,
      [2] = 11,
      [3] = 12,
      [4] = 20,
      [5] = 21,
      [6] = 22,
      [7] = 30,
      [8] = 40,
      [9] = 41,
      [10] = 42,
      [11] = 43,
      [12] = 44,
      [13] = 49,
      [14] = 60,
      [15] = 61,
      [16] = 62,
      [17] = 63
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320102] = {
    BuffId = 320102,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 320103,
        Camp = "OtherFriend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320103] = {
    AddPassiveEffect = {
      [1] = 320103
    },
    BuffId = 320103,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320122] = {
    BuffId = 320122,
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320204] = {
    BuffDamagedRate = {Value = -0.03},
    BuffId = 320204,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [320206] = {
    AddPassiveEffect = {
      [1] = 320204
    },
    BuffId = 320206,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330131] = {
    BuffId = 330131,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 330132,
        Camp = "OtherFriend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330132] = {
    AddPassiveEffect = {
      [1] = 330103
    },
    BuffId = 330132,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [330141] = {
    BuffId = 330141,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 330142,
        Camp = "OtherFriend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410001] = {
    BuffId = 410001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410002] = {
    AddAttrs = T.RT_28,
    BuffId = 410002,
    CombatConditionId = 1004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [410003] = {
    BuffId = 410003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410004] = {
    AddAttrs = T.RT_26,
    BuffId = 410004,
    CombatConditionId = 1004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [410101] = {
    BuffId = 410101,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410211] = {
    BuffId = 410211,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 410212,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410212] = {
    AddPassiveEffect = {
      [1] = 410212
    },
    BuffId = 410212,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410242] = {
    AddAttrs = T.RT_32,
    BuffId = 410242,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [410252] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = -0.6
      }
    },
    BuffId = 410252,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [420114] = {
    BuffId = 420114,
    MaxLayer = 6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420122] = {
    BuffId = 420122,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420123] = {
    BuffId = 420123,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 420124,
        Camp = "Friend"
      },
      [2] = {
        AuraRange = -1,
        BuffId = 420131,
        Camp = "Enemy"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420191] = {
    BuffId = 420191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 420192,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [420192] = {
    AddAttrs = {
      [1] = {
        AttrName = "StrongValue",
        Value = 0.15
      }
    },
    BuffId = 420192,
    CombatConditionId = 1004,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [420200] = {
    AddAttrs = {
      [1] = {
        AttrName = "OverShieldLevelGrow",
        Value = 50
      }
    },
    BuffId = 420200,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [430112] = {
    BuffId = 430112,
    BuffType = T.RT_20,
    DotDatas = {
      [1] = {
        BaseAttr = "MaxHp",
        Condition = 2,
        DamageTag = T.RT_30,
        DefaultHealFX = 0,
        Interval = 1,
        Rate = 0.1,
        Type = "Hot"
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [430123] = {
    BuffId = 430123,
    ForbidBuffType = {
      [1] = 10,
      [2] = 11,
      [3] = 12,
      [4] = 20,
      [5] = 21,
      [6] = 22,
      [7] = 30,
      [8] = 40,
      [9] = 41,
      [10] = 42,
      [11] = 43,
      [12] = 44,
      [13] = 49,
      [14] = 60,
      [15] = 61,
      [16] = 62,
      [17] = 63,
      [18] = 999
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510001] = {
    BuffId = 510001,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 510002,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510002] = {
    AddAttrs = T.RT_28,
    BuffId = 510002,
    CombatConditionId = 1005,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [510003] = {
    BuffId = 510003,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 510004,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510004] = {
    AddAttrs = T.RT_26,
    BuffId = 510004,
    CombatConditionId = 1005,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [510191] = {
    BuffId = 510191,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 510192,
        Camp = "Friend",
        Condition = 1007
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [510192] = {
    AddAttrs = {
      [1] = {
        AttrName = "EnmityValue",
        Value = 0.05
      }
    },
    BuffId = 510192,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [530111] = {
    BuffId = 530111,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530113] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Almighty",
        Value = 0.5
      }
    },
    BuffId = 530113,
    BuffType = T.RT_24,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [530122] = {
    BuffId = 530122,
    BuffType = T.RT_24,
    DotDatas = {
      [1] = {
        DotDelay = 2.7,
        EffectId = 530142,
        Interval = 5,
        Type = "SkillEffect"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540200] = {
    BuffId = 540200,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540206] = {
    BuffId = 540206,
    MaxLayer = 20,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540231] = {
    BuffId = 540231,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 540232,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [540241] = {
    BuffId = 540241,
    HaloDatas = {
      [1] = {
        AuraRange = -1,
        BuffId = 540242,
        Camp = "Friend"
      }
    },
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [700221] = {
    BuffId = 700221,
    ForbidBuffType = {
      [1] = 41,
      [2] = 43
    },
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850001] = {
    BuffId = 850001,
    LockHp = T.RT_6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850002] = {
    BuffId = 850002,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_5,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_4
  },
  [850201] = {
    BuffId = 850201,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850203] = {
    BuffId = 850203,
    MaxLayer = 3,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850205] = {
    BuffDamagedRate = {Value = -0.5},
    BuffId = 850205,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850301] = {
    BuffId = 850301,
    InitialEffect = {
      [1] = 850324
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850303] = {
    BuffId = 850303,
    CannotBeCutTN = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850304] = {
    BuffId = 850304,
    LockHp = {Rate = 0.1},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850306] = {
    BuffId = 850306,
    LockHp = T.RT_7,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850308] = {
    BuffId = 850308,
    BuffType = T.RT_2,
    CannotBeCutTN = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850309] = {
    BuffId = 850309,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_5,
    LockHp = T.RT_7,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    SpecialEffect = T.RT_4
  },
  [850311] = {
    BuffId = 850311,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    LockHp = T.RT_1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850401] = {
    BuffId = 850401,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [850403] = {
    BuffId = 850403,
    BuffType = T.RT_2,
    CannotBeCutTN = true,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850901] = {
    BuffId = 850901,
    LockHp = T.RT_6,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [850902] = {
    BuffId = 850902,
    LockHp = {Rate = 0.8},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851203] = {
    BuffId = 851203,
    BuffType = T.RT_2,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_5,
    LockHp = {Rate = 0.61},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851204] = {
    BuffId = 851204,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851209] = {
    BuffId = 851209,
    LockHp = {Rate = 0.49},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851210] = {
    BuffId = 851210,
    LockHp = {Rate = 0.2},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851211] = {
    BuffDamagedRate = {Value = -0.99},
    BuffId = 851211,
    LockHp = {Rate = 0.48},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851213] = {
    BuffId = 851213,
    BuffType = T.RT_2,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_5,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851214] = {
    BuffId = 851214,
    BuffType = T.RT_2,
    CannotBeCutTN = true,
    CannotBeHitted = true,
    ForbidBuffType = T.RT_5,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    NotEnterTarget = true,
    SpecialEffect = T.RT_4
  },
  [851502] = {
    BuffId = 851502,
    LockHp = {Rate = 0.35},
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [851901] = {
    BuffId = 851901,
    LockHp = T.RT_1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [900602] = {
    BuffId = 900602,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge",
    Priority = 1001,
    SpecialEffect = {
      [1] = "Invisible"
    }
  },
  [950101] = {
    AddAttrs = {
      [1] = {AttrName = "SkillSpeed", Rate = 0.4}
    },
    BuffId = 950101,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [950401] = {
    BuffId = 950401,
    ForbidBuffType = {
      [1] = 41,
      [2] = 42,
      [3] = 43
    },
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [950403] = {
    BuffId = 950403,
    LockHp = T.RT_1,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1030111] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = -0.4
      }
    },
    BuffId = 1030111,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1030222] = {
    AddAttrs = T.RT_66,
    BuffId = 1030222,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1040141] = {
    AddAttrs = T.RT_66,
    BuffId = 1040141,
    BuffType = T.RT_2,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1060202] = {
    BuffId = 1060202,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1311001] = {
    BuffDamagedRate = {Value = "#1"},
    BuffId = 1311001,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [1430001] = {
    AddAttrs = {
      [1] = {
        AttrName = "SpRecoverValue",
        Value = "#1"
      }
    },
    BuffId = 1430001,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [1440001] = {
    AddAttrs = T.RT_44,
    BuffId = 1440001,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010001] = {
    BuffId = 2010001,
    BuffType = T.RT_2,
    LockHp = T.RT_6,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010035] = {
    AddAttrs = {
      [1] = T.RT_23,
      [2] = T.RT_22
    },
    BuffId = 2010035,
    BuffType = T.RT_41,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2010051] = {
    AddAttrs = {
      [1] = T.RT_22,
      [2] = T.RT_21
    },
    BuffId = 2010051,
    BuffType = T.RT_41,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [2050501] = {
    BuffId = 2050501,
    MaxLayer = 10,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [4010009] = {
    AddAttrs = {
      [1] = {
        AttrName = "SupportSkillCD",
        Rate = -0.5
      }
    },
    BuffId = 4010009,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [5000006] = {
    BuffId = 5000006,
    DeadNotRemove = true,
    DotDatas = {
      [1] = {
        AllowSkillIntensity = 1,
        DamageTag = {
          [1] = "Dot"
        },
        Interval = 0.2,
        Rate = 1,
        Type = "Dot"
      }
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [5000012] = {
    BuffId = 5000012,
    BuffType = T.RT_29,
    HaloDatas = {
      [1] = {
        AuraRange = 4000,
        BuffId = 5000011,
        Camp = "OtherFriend"
      }
    },
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [5000014] = {
    BuffId = 5000014,
    BuffType = T.RT_29,
    HaloDatas = {
      [1] = {
        AuraRange = 4000,
        BuffId = 5000013,
        Camp = "OtherFriend"
      }
    },
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [5000016] = {
    BuffId = 5000016,
    BuffType = T.RT_29,
    HaloDatas = {
      [1] = {
        AuraRange = 4000,
        BuffId = 5000015,
        Camp = "OtherFriend"
      }
    },
    MaxLayer = 5,
    MergeRule1 = "Personal",
    MergeRule2 = "NewFree"
  },
  [5000017] = {
    BuffId = 5000017,
    LockHp = T.RT_7,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [5000304] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Normal",
        Value = 2
      }
    },
    AddPassiveEffect = {
      [1] = 5000304
    },
    BuffId = 5000304,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000011] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000011,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000013] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000013,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Water"
  },
  [6000014] = {
    AddAttrs = {
      [1] = {
        AttrName = "WaterDamagedRate",
        Value = 4
      }
    },
    BuffId = 6000014,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Water"
  },
  [6000021] = {
    AddAttrs = {
      [1] = {
        AttrName = "FireDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000021,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000023] = {
    AddAttrs = {
      [1] = {
        AttrName = "FireDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000023,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Fire"
  },
  [6000024] = {
    AddAttrs = {
      [1] = T.RT_23
    },
    BuffId = 6000024,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Fire"
  },
  [6000031] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000031,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000033] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000033,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Thunder"
  },
  [6000034] = {
    AddAttrs = {
      [1] = {
        AttrName = "ThunderDamagedRate",
        Value = 4
      }
    },
    BuffId = 6000034,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Thunder"
  },
  [6000041] = {
    AddAttrs = {
      [1] = {
        AttrName = "WindDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000041,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000043] = {
    AddAttrs = {
      [1] = {
        AttrName = "WindDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000043,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Wind"
  },
  [6000044] = {
    AddAttrs = {
      [1] = T.RT_22
    },
    BuffId = 6000044,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Wind"
  },
  [6000051] = {
    AddAttrs = {
      [1] = {
        AttrName = "DarkDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000051,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000052] = {
    AddAttrs = {
      [1] = {
        AttrName = "DarkDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000052,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000053] = {
    AddAttrs = {
      [1] = {
        AttrName = "DarkDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000053,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Dark"
  },
  [6000054] = {
    AddAttrs = {
      [1] = T.RT_21
    },
    BuffId = 6000054,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Dark"
  },
  [6000061] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = -0.5
      }
    },
    BuffId = 6000061,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000062] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = -0.25
      }
    },
    BuffId = 6000062,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000063] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = 0.5
      }
    },
    BuffId = 6000063,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Light"
  },
  [6000064] = {
    AddAttrs = {
      [1] = {
        AttrName = "LightDamagedRate",
        Value = 4
      }
    },
    BuffId = 6000064,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    WeaknessType = "Light"
  },
  [6000071] = {
    BuffId = 6000071,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000072] = {
    BuffId = 6000072,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000073] = {
    BuffId = 6000073,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000074] = {
    BuffId = 6000074,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000075] = {
    BuffId = 6000075,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000076] = {
    BuffId = 6000076,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000077] = {
    BuffId = 6000077,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000078] = {
    BuffId = 6000078,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000079] = {
    BuffId = 6000079,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000080] = {
    BuffId = 6000080,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000081] = {
    BuffId = 6000081,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000082] = {
    BuffId = 6000082,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000204] = {
    BuffId = 6000204,
    CannotBeCutTN = true,
    ForbidBuffType = {
      [1] = 41
    },
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    SpecialEffect = T.RT_4
  },
  [6000207] = {
    BuffId = 6000207,
    BuffType = T.RT_2,
    CannotBeCutTN = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000208] = {
    BuffId = 6000208,
    BuffType = T.RT_2,
    ForbidBuffType = {
      [1] = 44
    },
    ForbidCatch = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [6000209] = {
    BuffId = 6000209,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    NotEnterTarget = true
  },
  [10101202] = {
    BuffId = 10101202,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10101991] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Type = "Melee",
        Value = 0.15
      },
      [2] = {
        AttrName = "WeaponCRDModifierRate",
        Stackable = 1,
        Type = "Melee",
        Value = 0.1
      }
    },
    BuffId = 10101991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102104] = {
    AddAttrs = {
      [1] = {
        AttrName = "DropDistance",
        Value = 750
      }
    },
    BuffId = 10102104,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102107] = {
    BattlePetCdRate = -0.3,
    BuffId = 10102107,
    BuffType = T.RT_33,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102108] = {
    BattlePetCdRate = -0.5,
    BuffId = 10102108,
    BuffType = T.RT_33,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102109] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 0.15}
    },
    BuffId = 10102109,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102110] = {
    AddAttrs = T.RT_40,
    BuffId = 10102110,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10102991] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Stackable = 1,
        Type = "Ranged",
        Value = 0.15
      },
      [2] = {
        AttrName = "WeaponCRDModifierRate",
        Stackable = 1,
        Type = "Ranged",
        Value = 0.1
      }
    },
    BuffId = 10102991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103106] = {
    AddAttrs = {
      [1] = {AttrName = "SkillSpeed", Rate = "#1"}
    },
    BuffId = 10103106,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10103991] = {
    AddAttrs = {
      [1] = {
        AttrName = "MaxES",
        Rate = 0.15,
        Stackable = 1
      }
    },
    BuffId = 10103991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10104302] = {
    AddAttrs = T.RT_35,
    BuffId = 10104302,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10104991] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Stackable = 1,
        Value = 0.15
      }
    },
    BuffId = 10104991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105301] = {
    AddAttrs = {
      [1] = {AttrName = "MaxSp", RateUseValue = 1}
    },
    BuffId = 10105301,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105303] = {
    AddAttrs = {
      [1] = {
        AttrName = "WeaponCRIModifierRate",
        Value = "#1"
      }
    },
    BuffId = 10105303,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105901] = {
    AddAttrs = {
      [1] = {AttrName = "ATK", Rate = 0.01}
    },
    BuffId = 10105901,
    BuffType = T.RT_2,
    MaxLayer = 60,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [10105903] = {
    BuffId = 10105903,
    BuffType = T.RT_2,
    DotDatas = {
      [1] = {
        Immediately = 1,
        Interval = 1,
        Type = "SpChange",
        Value = 2
      }
    },
    MaxLayer = 6,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10105991] = {
    AddAttrs = {
      [1] = {
        AttrName = "MaxSp",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 10105991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106101] = {
    AddAttrs = T.RT_90,
    BuffId = 10106101,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106102] = {
    AddAttrs = T.RT_90,
    BuffId = 10106102,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106103] = {
    AddAttrs = T.RT_88,
    BuffId = 10106103,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106104] = {
    AddAttrs = T.RT_88,
    BuffId = 10106104,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106105] = {
    AddAttrs = T.RT_86,
    BuffId = 10106105,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106106] = {
    AddAttrs = T.RT_86,
    BuffId = 10106106,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106107] = {
    AddAttrs = T.RT_84,
    BuffId = 10106107,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106108] = {
    AddAttrs = T.RT_84,
    BuffId = 10106108,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106110] = {
    AddAttrs = T.RT_82,
    BuffId = 10106110,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106111] = {
    AddAttrs = T.RT_82,
    BuffId = 10106111,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106112] = {
    AddAttrs = T.RT_80,
    BuffId = 10106112,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106113] = {
    AddAttrs = T.RT_80,
    BuffId = 10106113,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10106991] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillRange",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 10106991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107101] = {
    BuffId = 10107101,
    BuffType = T.RT_2,
    DotDatas = T.RT_78,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107102] = {
    BuffId = 10107102,
    BuffType = T.RT_2,
    DotDatas = T.RT_78,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107103] = {
    AddAttrs = T.RT_76,
    BuffId = 10107103,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107104] = {
    AddAttrs = T.RT_76,
    BuffId = 10107104,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107106] = {
    AddAttrs = T.RT_74,
    BuffId = 10107106,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107107] = {
    AddAttrs = T.RT_74,
    BuffId = 10107107,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107108] = {
    AddAttrs = T.RT_72,
    BuffId = 10107108,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107109] = {
    AddAttrs = T.RT_72,
    BuffId = 10107109,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107110] = {
    AddAttrs = T.RT_70,
    BuffId = 10107110,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107111] = {
    AddAttrs = T.RT_70,
    BuffId = 10107111,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107113] = {
    AddAttrs = T.RT_55,
    BuffId = 10107113,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107114] = {
    AddAttrs = T.RT_55,
    BuffId = 10107114,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107115] = {
    AddAttrs = T.RT_68,
    BuffId = 10107115,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107116] = {
    AddAttrs = T.RT_68,
    BuffId = 10107116,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107125] = {
    BuffId = 10107125,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge",
    OverrideAttrs = {AttrName = "FakeHpRate", Value = 0.4}
  },
  [10107126] = {
    AddAttrs = {
      [1] = {AttrName = "DEF", ValueUseValue = 1}
    },
    BuffId = 10107126,
    BuffType = T.RT_2,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10107991] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillSustain",
        Rate = 0.1,
        Stackable = 1
      }
    },
    BuffId = 10107991,
    BuffType = T.RT_2,
    MaxLayer = 20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [10503001] = {
    AddAttrs = {
      [1] = {
        AttrName = "TriggerProbModifierRate",
        Value = "#1"
      }
    },
    AddPassiveEffect = T.RT_64,
    BuffId = 10503001,
    BuffType = T.RT_63,
    DisperseBuffType = T.RT_62,
    MergeRule1 = "Personal",
    MergeRule2 = "Merge"
  },
  [20119001] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamageRate",
        RateZone = "Almighty",
        Value = 0.1
      }
    },
    BuffId = 20119001,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MaxLayer = 7,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  },
  [20151001] = {
    AddAttrs = {
      [1] = {
        AttrName = "SkillEfficiency",
        Rate = -0.5
      },
      [2] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Value = 0.5
      }
    },
    BuffId = 20151001,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20152001] = {
    AddAttrs = T.RT_37,
    BuffId = 20152001,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20153001] = {
    AddAttrs = T.RT_37,
    BuffId = 20153001,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20154001] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Normal",
        Value = 0.5
      },
      [2] = {
        AttrName = "DamageRate",
        RateZone = "Rouge",
        Value = 1
      }
    },
    BuffId = 20154001,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20156001] = {
    AddAttrs = {
      [1] = {
        AttrName = "CutTNModify",
        Value = 1
      }
    },
    BuffId = 20156001,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [20156002] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "BossDown",
        Value = 1
      }
    },
    BuffId = 20156002,
    BuffType = T.RT_20,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30101002] = {
    AddAttrs = T.RT_35,
    BuffId = 30101002,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30102001] = {
    AddAttrs = {
      [1] = {AttrName = "MaxHp", Rate = "#1"}
    },
    BuffId = 30102001,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [30102002] = {
    AddAttrs = T.RT_35,
    BuffId = 30102002,
    BuffType = T.RT_33,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101001] = {
    BuffId = 40101001,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101002] = {
    BuffId = 40101002,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101003] = {
    BuffId = 40101003,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101004] = {
    BuffId = 40101004,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101005] = {
    BuffId = 40101005,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101006] = {
    AddAttrs = {
      [1] = {
        AttrName = "DamagedRate",
        RateZone = "Level",
        Value = 0.5
      }
    },
    BuffId = 40101006,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101008] = {
    BuffId = 40101008,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101009] = {
    BuffId = 40101009,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101010] = {
    BuffId = 40101010,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101011] = {
    BuffId = 40101011,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101012] = {
    BuffId = 40101012,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101013] = {
    BuffId = 40101013,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101014] = {
    BuffId = 40101014,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [40101015] = {
    BuffId = 40101015,
    BuffType = T.RT_2,
    DeadNotRemove = true,
    MergeRule1 = "Global",
    MergeRule2 = "Merge"
  },
  [99999999] = {
    AddAttrs = {
      [1] = {
        AttrName = "MoveSpeedAddRate",
        Value = -0.5
      }
    },
    BuffId = 99999999,
    MaxLayer = 2,
    MergeRule1 = "Global",
    MergeRule2 = "NewFree"
  }
})
