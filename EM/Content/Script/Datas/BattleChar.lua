local T = {}
T.RT_1 = {
  MaxAccelerationRun = 2048,
  MaxAccelerationWalk = 2048,
  MaxSpeedRun = 500,
  MaxSpeedWalk = 100
}
T.RT_2 = {"Girl"}
T.RT_3 = {45, 200}
T.RT_4 = {
  Crouch = T.RT_3,
  OriHalfHeight = 80,
  OriRadius = 20,
  Slide = T.RT_3
}
T.RT_5 = {1, 11}
T.RT_6 = {
  "DPS",
  "Uweapon",
  "WeaponDPS"
}
T.RT_7 = {"Sword", "Pistol"}
T.RT_8 = {"Man"}
T.RT_9 = {
  Crouch = T.RT_3,
  OriHalfHeight = 96.5,
  OriRadius = 20,
  Slide = T.RT_3
}
T.RT_10 = {"Claymore", "Shotgun"}
T.RT_11 = {110301}
T.RT_12 = {"DPS", "SkillDPS"}
T.RT_13 = {1103}
T.RT_14 = {
  110391,
  110302,
  110303
}
T.RT_15 = {110302}
T.RT_16 = {"Sword"}
T.RT_17 = {1, 16}
T.RT_18 = {
  10001,
  10002,
  10003
}
T.RT_19 = {"Boy"}
T.RT_20 = {
  10004,
  10005,
  10003
}
T.RT_21 = {"Sword", "Machinegun"}
T.RT_22 = {
  120101,
  120102,
  120103
}
T.RT_23 = {"Loli"}
T.RT_24 = {
  Crouch = T.RT_3,
  OriHalfHeight = 65,
  OriRadius = 20,
  Slide = T.RT_3
}
T.RT_25 = {"Woman"}
T.RT_26 = {
  Crouch = T.RT_3,
  OriHalfHeight = 87,
  OriRadius = 20,
  Slide = T.RT_3
}
T.RT_27 = {"Katana", "Pistol"}
T.RT_28 = {
  "ATK_Light",
  "SkillIntensity",
  "SkillEfficiency",
  "SkillRange"
}
T.RT_29 = {
  150301,
  150302,
  150303,
  150304
}
T.RT_30 = {
  [1] = "GRADEUP_1503_01",
  [2] = "GRADEUP_1503_02",
  [3] = "GRADEUP_1503_03",
  [4] = "GRADEUP_1503_04",
  [5] = "GRADEUP_1503_05",
  [6] = "GRADEUP_1503_06"
}
T.RT_31 = {"Almighty"}
T.RT_32 = {"DPS", "WeaponDPS"}
T.RT_33 = {
  150301,
  150302,
  150303,
  150304,
  150003
}
T.RT_34 = {
  ExtraLv = 2,
  Grade = 3,
  SkillId = 150301
}
T.RT_35 = {
  ExtraLv = 2,
  Grade = 5,
  SkillId = 150302
}
T.RT_36 = {
  ExtraLv = 1,
  Grade = 3,
  SkillId = 150303
}
T.RT_37 = {
  ExtraLv = 1,
  Grade = 5,
  SkillId = 150303
}
T.RT_38 = {
  T.RT_34,
  T.RT_35,
  T.RT_36,
  T.RT_37
}
T.RT_39 = {
  MaxAccelerationFly = 2048,
  MaxAccelerationRun = 2048,
  MaxAccelerationWalk = 2048,
  MaxSpeedFly = 800,
  MaxSpeedRun = 500,
  MaxSpeedWalk = 100
}
T.RT_40 = {"Polearm", "Machinegun"}
T.RT_41 = {1, 15}
T.RT_42 = {
  160101,
  160102,
  160103,
  160104
}
T.RT_43 = {
  [1] = "GRADEUP_1601_01",
  [2] = "GRADEUP_1601_02",
  [3] = "GRADEUP_1601_03",
  [4] = "GRADEUP_1601_04",
  [5] = "GRADEUP_1601_05",
  [6] = "GRADEUP_1601_06"
}
T.RT_44 = {
  [1] = "$#PassiveEffect[160101].Vars.AddDamageRate*100$%",
  [2] = "$#SkillCreature[160103].TimeLife$",
  [3] = "$#Buff[160102].AddAttrs[1].Value*(-100)$%",
  [4] = "$#Buff[160103].AddAttrs[1].Value*100$%",
  [5] = "$#PassiveEffect[160101].Vars.BuffLastTime$",
  [6] = "$#Buff[160103].MaxLayer$",
  [7] = "$#Buff[160104].AddAttrs[1].Value*100$%"
}
T.RT_45 = {"Support"}
T.RT_46 = {
  "ATK_Light",
  "SkillIntensity",
  "SkillSustain",
  "SkillRange"
}
T.RT_47 = {
  160101,
  160102,
  160103,
  160104,
  100005
}
T.RT_48 = {
  ExtraLv = 2,
  Grade = 3,
  SkillId = 160101
}
T.RT_49 = {
  ExtraLv = 2,
  Grade = 5,
  SkillId = 160102
}
T.RT_50 = {
  ExtraLv = 1,
  Grade = 3,
  SkillId = 160103
}
T.RT_51 = {
  ExtraLv = 1,
  Grade = 5,
  SkillId = 160103
}
T.RT_52 = {
  T.RT_48,
  T.RT_49,
  T.RT_50,
  T.RT_51
}
T.RT_53 = {
  "MaxSp",
  "SkillEfficiency",
  "SkillSustain",
  "SkillRange"
}
T.RT_54 = {1}
T.RT_55 = {
  [1] = "GRADEUP_4101_01",
  [2] = "GRADEUP_4101_02",
  [3] = "GRADEUP_4101_03",
  [4] = "GRADEUP_4101_04",
  [5] = "GRADEUP_4101_05",
  [6] = "GRADEUP_4101_06"
}
T.RT_56 = {
  [1] = "$#PassiveEffect[410101].Vars.Grade4Per*100$%"
}
T.RT_57 = {"Katana", "Machinegun"}
T.RT_58 = {1, 14}
T.RT_59 = {
  410101,
  410102,
  410103,
  410104,
  410001
}
T.RT_60 = {
  ExtraLv = 2,
  Grade = 3,
  SkillId = 410101
}
T.RT_61 = {
  ExtraLv = 2,
  Grade = 5,
  SkillId = 410102
}
T.RT_62 = {
  ExtraLv = 1,
  Grade = 3,
  SkillId = 410103
}
T.RT_63 = {
  ExtraLv = 1,
  Grade = 5,
  SkillId = 410103
}
T.RT_64 = {
  T.RT_60,
  T.RT_61,
  T.RT_62,
  T.RT_63
}
T.RT_65 = {
  [1] = "GRADEUP_4201_01",
  [2] = "GRADEUP_4201_02",
  [3] = "GRADEUP_4201_03",
  [4] = "GRADEUP_4201_04",
  [5] = "GRADEUP_4201_05",
  [6] = "GRADEUP_4201_06"
}
T.RT_66 = {
  420101,
  420102,
  420103,
  420104,
  420191
}
T.RT_67 = {420101}
T.RT_68 = {
  ExtraLv = 2,
  Grade = 3,
  SkillId = 420101
}
T.RT_69 = {
  ExtraLv = 2,
  Grade = 5,
  SkillId = 420102
}
T.RT_70 = {
  ExtraLv = 1,
  Grade = 3,
  SkillId = 420103
}
T.RT_71 = {
  ExtraLv = 1,
  Grade = 5,
  SkillId = 420103
}
T.RT_72 = {
  T.RT_68,
  T.RT_69,
  T.RT_70,
  T.RT_71
}
T.RT_73 = {"Polearm", "Cannon"}
T.RT_74 = {1, 12}
T.RT_75 = {
  "DPS",
  "Minion",
  "SkillDPS"
}
T.RT_76 = {
  "ATK_Water",
  "SkillIntensity",
  "SkillEfficiency",
  "SkillSustain",
  "SkillRange"
}
T.RT_77 = {
  [1] = "GRADEUP_2401_01",
  [2] = "GRADEUP_2401_02",
  [3] = "GRADEUP_2401_03",
  [4] = "GRADEUP_2401_04",
  [5] = "GRADEUP_2401_05",
  [6] = "GRADEUP_2401_06"
}
T.RT_78 = {"Swordwhip", "Bow"}
T.RT_79 = {
  240101,
  240102,
  240103,
  240104,
  240191
}
T.RT_80 = {240101}
T.RT_81 = {
  ExtraLv = 2,
  Grade = 3,
  SkillId = 240101
}
T.RT_82 = {
  ExtraLv = 2,
  Grade = 5,
  SkillId = 240102
}
T.RT_83 = {
  ExtraLv = 1,
  Grade = 3,
  SkillId = 240103
}
T.RT_84 = {
  ExtraLv = 1,
  Grade = 5,
  SkillId = 240103
}
T.RT_85 = {
  T.RT_81,
  T.RT_82,
  T.RT_83,
  T.RT_84
}
T.RT_86 = {"Claymore", "Crossbow"}
T.RT_87 = {1, 13}
T.RT_88 = {
  "DPS",
  "SkillDPS",
  "WeaponDPS"
}
T.RT_89 = {
  "ATK_Fire",
  "SkillIntensity",
  "SkillEfficiency",
  "SkillRange"
}
T.RT_90 = {
  "DPS",
  "HP",
  "SkillDPS"
}
T.RT_91 = {
  "MaxHp",
  "SkillIntensity",
  "SkillEfficiency",
  "SkillSustain",
  "SkillRange"
}
T.RT_92 = {"Swordwhip", "Pistol"}
T.RT_93 = {
  "ATK_Thunder",
  "SkillIntensity",
  "SkillEfficiency",
  "SkillSustain",
  "SkillRange"
}
T.RT_94 = {510101}
T.RT_95 = {530101}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleChar", {
  [10] = {
    ATK = 24,
    ATKLevelGrow = "ATKA",
    Attribute = "Default",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_DUNGEON_HOSTAGE",
    DEF = 300,
    DEFLevelGrow = "DEFA",
    GuideIconImg = "Rescue_Hostage",
    MaxES = 100,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 100,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModelId = 10,
    RoleId = 10,
    Sp = 0,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [111] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_Nvzhu",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 101,
    RoleId = 111,
    SkillList = T.RT_18,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [112] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_19,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_Nanzhu",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 102,
    RoleId = 112,
    SkillList = T.RT_20,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [113] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_102",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_WeitaM",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 103,
    RoleId = 113,
    SkillList = {
      10006,
      10007,
      10003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [114] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_19,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_102",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_WeitaF",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 104,
    RoleId = 114,
    SkillList = {
      10008,
      10009,
      10003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [201] = {
    ATK = 40,
    ATKLevelGrow = "ATKA",
    Attribute = "Default",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharName = "UI_Npc_Name_Aware",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_Awa",
    MaxES = 200,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 200,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 120,
    ModApplicationType = T.RT_54,
    ModelId = 201,
    RoleId = 201,
    SkillList = {20101, 20102},
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [202] = {
    ATK = 40,
    ATKLevelGrow = "ATKA",
    Attribute = "Default",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_4,
    CharName = "UI_Npc_Name_Dafu",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_Dafu",
    MaxES = 200,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 200,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 120,
    ModApplicationType = T.RT_54,
    ModelId = 5401,
    RoleId = 202,
    SkillList = {
      540101,
      540102,
      540103
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [205] = {
    ATK = 120,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_Nvzhu",
    MaxES = 330,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 330,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 101,
    RoleId = 205,
    SkillList = T.RT_18,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [206] = {
    ATK = 120,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_19,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_16,
    GuideIconImg = "Mini_Nanzhu",
    MaxES = 330,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 330,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 102,
    RoleId = 206,
    SkillList = T.RT_20,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [207] = {
    ATK = 120,
    ATKLevelGrow = "ATKS",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_26,
    CharGradeDescription = T.RT_55,
    CharGradeParameter = T.RT_56,
    CharName = "UI_CHAR_NAME_4101",
    CondemnWeapon = 30,
    DEF = 276,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_57,
    GuideIconImg = "Mini_Lise",
    MaxES = 300,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 300,
    MaxHpLevelGrow = "MaxHpS",
    MaxSecondSp = 150,
    MaxSp = 300,
    ModApplicationType = T.RT_58,
    ModelId = 4101,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_lise_Client.BP_lise_Client'",
    RangedWeapon = 20201,
    RoleId = 207,
    SkillList = T.RT_59,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_64,
    WeaponId = 10101
  },
  [210] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Yuming/BT_TestAI_Yuming.BT_TestAI_Yuming",
    ATK = 22,
    ATKLevelGrow = "ATKS",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 4201,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharGradeDescription = T.RT_65,
    CharName = "UI_CHAR_NAME_4201",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_40,
    GuideIconImg = "Mini_Yuming",
    MaxES = 50,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 165,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 200,
    ModApplicationType = T.RT_58,
    ModelId = 4201,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Yuming_Client.BP_Yuming_Client'",
    RangedWeapon = 20201,
    RoleId = 210,
    SkillList = T.RT_66,
    Sp = -1,
    SummonId = T.RT_67,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_72,
    WeaponId = 10203
  },
  [211] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Baiheng/BT_TestAI_Baiheng.BT_TestAI_Baiheng",
    ATK = 23,
    ATKLevelGrow = "ATKS",
    Attribute = "Water",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 2401,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharGradeDescription = T.RT_77,
    CharName = "UI_CHAR_NAME_2401",
    CondemnWeapon = 30,
    DEF = 315,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_78,
    GuideIconImg = "Mini_Baiheng",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_74,
    ModelId = 2401,
    RangedWeapon = 20201,
    RoleId = 211,
    SkillList = T.RT_79,
    Sp = -1,
    SummonId = T.RT_80,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_85,
    WeaponId = 10101
  },
  [212] = {
    ATK = 25,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1503,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharGradeDescription = T.RT_30,
    CharName = "UI_CHAR_NAME_1503",
    CondemnWeapon = 30,
    DEF = 315,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_31,
    GuideIconImg = "Mini_Kezhou",
    MaxES = 145,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 145,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_17,
    ModelId = 1503,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Kezhou_Client.BP_Kezhou_Client'",
    RangedWeapon = 20201,
    RoleId = 212,
    SkillList = T.RT_33,
    Sp = -1,
    UltraWeapon = T.RT_29,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_38,
    WeaponId = 10101
  },
  [1101] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Heitao/BT_TestAI_Heitao.BT_TestAI_Heitao",
    ATK = 20,
    ATKLevelGrow = "ATKA",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = {
      110101,
      110102,
      110103,
      110104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_1101_01",
      [2] = "GRADEUP_1101_02",
      [3] = "GRADEUP_1101_03",
      [4] = "GRADEUP_1101_04",
      [5] = "GRADEUP_1101_05",
      [6] = "GRADEUP_1101_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[110111].AddAttrs[1].Value*100$%",
      [2] = "$#PassiveEffect[110101].Vars.Grade1LastTime$",
      [3] = "$#PassiveEffect[110101].Vars.Grade2BuffRate*100$%",
      [4] = "$#Buff[110112].AddAttrs[1].Rate*100$%",
      [5] = "$#PassiveEffect[110101].Vars.Grade6Rate*100$%"
    },
    CharName = "UI_CHAR_NAME_1101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Sword", "Crossbow"},
    GuideIconImg = "Mini_Heitao",
    MaxES = 100,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 100,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 150,
    ModApplicationType = T.RT_5,
    ModelId = 1101,
    Positioning = T.RT_6,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Dark",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain",
      "SkillRange"
    },
    RoleId = 1101,
    SkillList = {
      110101,
      110102,
      110103,
      110104,
      110001
    },
    Sp = -1,
    UltraWeapon = {110101},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 110101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 110102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 110103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 110103
      }
    },
    WeaponId = 10101
  },
  [1102] = {
    ATK = 20,
    ATKLevelGrow = "ATKA",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1102,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_1102",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_7,
    GuideIconImg = "Mini_Fuluo",
    MaxES = 100,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 100,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 120,
    ModApplicationType = T.RT_5,
    ModelId = 1102,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Fuluo_Client.BP_Fuluo_Client'",
    RangedWeapon = 20201,
    RoleId = 1102,
    SkillList = {
      110201,
      110202,
      110203,
      110204,
      110003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10101
  },
  [1103] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1103,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharAddonAttr = {
      110301,
      110302,
      110303,
      110304
    },
    CharGradeDescription = {
      [1] = "GRADEUP_1103_01",
      [2] = "GRADEUP_1103_02",
      [3] = "GRADEUP_1103_03",
      [4] = "GRADEUP_1103_04",
      [5] = "GRADEUP_1103_05",
      [6] = "GRADEUP_1103_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[110301].Vars.Grade1MspOnHit*100$%",
      [2] = "$#Buff[110304].BuffDamagedRate.Value*(-100)$%",
      [3] = "$#PassiveEffect[110301].Vars.Grade4ExtraRate*100$%",
      [4] = "$#Buff[110341].AddAttrs[2].Value*100$%"
    },
    CharName = "UI_CHAR_NAME_1103",
    CharUIId = 18,
    CondemnWeapon = 30,
    DEF = 330,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_10,
    ExtraModelIds = T.RT_11,
    GuideIconImg = "Mini_Tuosi",
    MaxES = 130,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 130,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_5,
    ModelId = 1103,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Tuosi_Client.BP_Tuosi_Client'",
    Positioning = T.RT_12,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Dark",
      "MaxSp",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillRange"
    },
    RoleId = 1103,
    SkillList = {
      110301,
      110302,
      110303,
      110304,
      110003
    },
    Sp = -1,
    UltraWeapon = T.RT_11,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 110301
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 110302
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 110303
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 110303
      }
    },
    WeaponId = 10203
  },
  [1201] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_21,
    GuideIconImg = "Mini_Nvzhu",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 1201,
    RangedWeapon = 20201,
    RoleId = 1201,
    SkillList = T.RT_22,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [1202] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_1202",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_10,
    GuideIconImg = "Mini_Heitao",
    MaxES = 100,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 150,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_5,
    ModelId = 1101,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Falu_Client.BP_Falu_Client'",
    RangedWeapon = 20201,
    RoleId = 1202,
    SkillList = {
      120201,
      120202,
      120203,
      120204
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10101
  },
  [1501] = {
    ATK = 24,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_23,
    CapsuleInfo = T.RT_24,
    CharAddonAttr = {
      150101,
      150102,
      150103,
      150104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_1501_01",
      [2] = "GRADEUP_1501_02",
      [3] = "GRADEUP_1501_03",
      [4] = "GRADEUP_1501_04",
      [5] = "GRADEUP_1501_05",
      [6] = "GRADEUP_1501_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[150141].AddAttrs[1].Rate*100$%",
      [2] = "$#PassiveEffect[150101].Vars.Grade1LastTime$",
      [3] = "$#PassiveEffect[150101].Vars.Grade2Prob*100$%",
      [4] = "$#PassiveEffect[150101].Vars.Grade4Combo$",
      [5] = "$#Buff[150104].AddAttrs[1].Value*100$%",
      [6] = "$#PassiveEffect[150101].Vars.Grade6LastTime$"
    },
    CharName = "UI_CHAR_NAME_1501",
    CharUIId = 28,
    CondemnWeapon = 30,
    DEF = 240,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_10,
    GuideIconImg = "Mini_Baonu",
    MaxES = 90,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 90,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_17,
    ModelId = 1501,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Baonu_Client.BP_Baonu_Client'",
    Positioning = T.RT_6,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Light",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain"
    },
    RoleId = 1501,
    SkillList = {
      150101,
      150102,
      150103,
      150104,
      150001
    },
    Sp = -1,
    UltraWeapon = {150101},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 150101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 150102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 150103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 150103
      }
    },
    WeaponId = 10101
  },
  [1502] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1502,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      150201,
      150202,
      150203,
      150204
    },
    CharGradeDescription = {
      [1] = "GRADEUP_1502_01",
      [2] = "GRADEUP_1502_02",
      [3] = "GRADEUP_1502_03",
      [4] = "GRADEUP_1502_04",
      [5] = "GRADEUP_1502_05",
      [6] = "GRADEUP_1502_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[150201].Vars.Grade1BaseRate*100$%",
      [2] = "$#PassiveEffect[150201].Vars.Grade2Skill01Rate*100$%",
      [3] = "$#PassiveEffect[150201].Vars.Grade4HealedRate*100$%",
      [4] = "$#Buff[150231].AddAttrs[1].Value*100$%",
      [5] = "$#PassiveEffect[150201].Vars.Grade6PropRate*100$%",
      [6] = "$#PassiveEffect[150201].Vars.Grade1MaxRate*100$%"
    },
    CharName = "UI_CHAR_NAME_1502",
    CondemnWeapon = 30,
    DEF = 255,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_27,
    GuideIconImg = "Mini_Nifu",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_17,
    ModelId = 1502,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Nifu_Client.BP_Nifu_Client'",
    Positioning = T.RT_12,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_28,
    RoleId = 1502,
    SkillList = {
      150201,
      150202,
      150203,
      150204,
      150003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 150201
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 150202
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 150203
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 150203
      }
    },
    WeaponId = 10101
  },
  [1503] = {
    ATK = 25,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1503,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharAddonAttr = T.RT_29,
    CharGradeDescription = T.RT_30,
    CharGradeParameter = {
      [1] = "$#Buff[150307].AddAttrs[1].Value*100-#Buff[150301].AddAttrs[1].Value*100$%",
      [2] = "$#PassiveEffect[150301].Vars.Grade2AddSp$",
      [3] = "$#PassiveEffect[150301].Vars.Grade2CDTime$",
      [4] = "$#Buff[150327].BuffDamagedRate.Value*(-100)$%",
      [5] = "$#SkillEffects[150325].TaskEffects[3].LastTime$",
      [6] = "$#Buff[150328].AddAttrs[1].Value*100$%",
      [7] = "$#PassiveEffect[150301].Vars.Grade6BuffTime$",
      [8] = "$#Buff[150326].AddAttrs[1].Value*100$%",
      [9] = "$#PassiveEffect[150301].Vars.Grade2BuffTime$"
    },
    CharName = "UI_CHAR_NAME_1503",
    CharUIId = 21,
    CondemnWeapon = 30,
    DEF = 315,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_31,
    GuideIconImg = "Mini_Kezhou",
    MaxES = 145,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 145,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_17,
    ModelId = 1503,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Kezhou_Client.BP_Kezhou_Client'",
    Positioning = T.RT_32,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Light",
      "SkillEfficiency",
      "SkillSustain"
    },
    RoleId = 1503,
    SkillList = T.RT_33,
    Sp = -1,
    UltraWeapon = T.RT_29,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_38,
    WeaponId = 10101
  },
  [1504] = {
    ATK = 28,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_39,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_1504",
    CondemnWeapon = 30,
    DEF = 252,
    DEFLevelGrow = "DEFS",
    EnableAnimFly = true,
    EnableJetJump = true,
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_40,
    GuideIconImg = "Mini_Saiqi",
    MaxES = 140,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 70,
    MaxHpLevelGrow = "MaxHpS",
    MaxSecondSp = 150,
    MaxSp = 150,
    ModApplicationType = T.RT_41,
    ModelId = 1504,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Suyi_Client.BP_Suyi_Client'",
    RangedWeapon = 20201,
    RoleId = 1504,
    SecondSp = 150,
    SkillList = {
      150401,
      150402,
      150403
    },
    Sp = -1,
    UltraWeapon = {150401},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10204
  },
  [1505] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharName = "\232\142\137\229\133\185\232\180\157\229\176\148",
    CondemnWeapon = 30,
    DEF = 255,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_27,
    GuideIconImg = "Mini_Nifu",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_17,
    ModelId = 3201,
    Positioning = T.RT_6,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_28,
    RoleId = 1505,
    SkillList = {
      150501,
      150502,
      150503
    },
    Sp = -1,
    UltraWeapon = {150501},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10101
  },
  [1601] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1601,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = T.RT_42,
    CharGradeDescription = T.RT_43,
    CharGradeParameter = T.RT_44,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_21,
    GuideIconImg = "Mini_Nvzhu",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 101,
    Positioning = T.RT_45,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_46,
    RoleId = 1601,
    SkillList = T.RT_47,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_52,
    WeaponId = 10101
  },
  [1801] = {
    ATK = 22,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1801,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = {
      180101,
      180102,
      180103,
      180104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_1801_01",
      [2] = "GRADEUP_1801_02",
      [3] = "GRADEUP_1801_03",
      [4] = "GRADEUP_1801_04",
      [5] = "GRADEUP_1801_05",
      [6] = "GRADEUP_1801_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[180135].AddAttrs[2].Value*100$%",
      [2] = "$#Buff[180114].AddAttrs[2].Value*100$%",
      [3] = "$#Buff[180114].AddAttrs[3].Value*100$%",
      [4] = "$#PassiveEffect[180101].Vars.Grade6CritRate*100$%"
    },
    CharName = "UI_CHAR_NAME_1801",
    CharUIId = 12,
    CondemnWeapon = 30,
    DEF = 315,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_21,
    GuideIconImg = "Mini_Feina",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 160,
    ModApplicationType = T.RT_17,
    ModelId = 1801,
    Positioning = T.RT_45,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_53,
    RoleId = 1801,
    SkillList = {
      180101,
      180102,
      180103,
      180104,
      180191
    },
    Sp = -1,
    SummonId = {180101},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 180101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 180102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 180103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 180103
      }
    },
    WeaponId = 10101
  },
  [2101] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Shuimu/BT_TestAI_Shuimu.BT_TestAI_Shuimu",
    ATK = 25,
    ATKLevelGrow = "ATKS",
    Attribute = "Water",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      210101,
      210102,
      210103,
      210104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_2101_01",
      [2] = "GRADEUP_2101_02",
      [3] = "GRADEUP_2101_03",
      [4] = "GRADEUP_2101_04",
      [5] = "GRADEUP_2101_05",
      [6] = "GRADEUP_2101_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[210101].Vars.Grade4DamagedRate*100$%",
      [2] = "$#Buff[210121].AddAttrs[1].Rate*100$%",
      [3] = "$#Buff[210121].MaxLayer$",
      [4] = "$#PassiveEffect[210101].Vars.Grade6LastTime$"
    },
    CharName = "UI_CHAR_NAME_2101",
    CharUIId = 1,
    CondemnWeapon = 30,
    DEF = 252,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_73,
    GuideIconImg = "Mini_Shuimu",
    MaxES = 100,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 100,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_74,
    ModelId = 2101,
    Positioning = T.RT_75,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_76,
    RoleId = 2101,
    SkillList = {
      210101,
      210102,
      210103,
      210104,
      210003
    },
    Sp = -1,
    SummonId = {210101},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 210101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 210102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 210103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 210103
      }
    },
    WeaponId = 10201
  },
  [2102] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Shuimu/BT_TestAI_Shuimu.BT_TestAI_Shuimu",
    ATK = 25,
    ATKLevelGrow = "ATKS",
    Attribute = "Water",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_26,
    CharName = "UI_CHAR_NAME_2101",
    CharUIId = 1,
    CondemnWeapon = 30,
    DEF = 252,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_73,
    GuideIconImg = "Mini_Shuimu",
    MaxES = 100,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 100,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 200,
    ModApplicationType = T.RT_74,
    ModelId = 2101,
    Positioning = T.RT_75,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_76,
    RoleId = 2102,
    SkillList = {
      210201,
      210202,
      210203,
      210204,
      210003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10201
  },
  [2301] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Zhangyu/BT_TestAI_Zhangyu.BT_TestAI_Zhangyu",
    ATK = 17,
    ATKLevelGrow = "ATKS",
    Attribute = "Water",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_23,
    CapsuleInfo = T.RT_24,
    CharAddonAttr = {
      230101,
      230102,
      230103,
      230104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_2301_01",
      [2] = "GRADEUP_2301_02",
      [3] = "GRADEUP_2301_03",
      [4] = "GRADEUP_2301_04",
      [5] = "GRADEUP_2301_05",
      [6] = "GRADEUP_2301_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[230102].Vars.Grade2TriggerProb*100$%",
      [2] = "$#Buff[230121].AddAttrs[1].Value*100$%",
      [3] = "$#Buff[230122].DotDatas[1].Rate*100$%"
    },
    CharName = "UI_CHAR_NAME_2301",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Sword", "Bow"},
    GuideIconImg = "Mini_Zhangyu",
    MaxES = 115,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 115,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_74,
    ModelId = 2301,
    Positioning = {
      "Support",
      "Minion",
      "Control"
    },
    RangedWeapon = 20301,
    RecommendAttr = {
      "MaxSp",
      "SkillEfficiency",
      "SkillSustain"
    },
    RoleId = 2301,
    SkillList = {
      230101,
      230102,
      230103,
      230104,
      100003
    },
    Sp = -1,
    SummonId = {230101},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 230101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 230102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 230103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 230103
      }
    },
    WeaponId = 10102
  },
  [2401] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Baiheng/BT_TestAI_Baiheng.BT_TestAI_Baiheng",
    ATK = 23,
    ATKLevelGrow = "ATKS",
    Attribute = "Water",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 2401,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      240101,
      240102,
      240103,
      240104
    },
    CharGradeDescription = T.RT_77,
    CharGradeParameter = {
      [1] = "$#PassiveEffect[240104].Vars.Rate*100$%",
      [2] = "$#SkillEffects[240112].TaskEffects[1].MaxSummonCount$",
      [3] = "$#Buff[240134].MaxLayer$",
      [4] = "$#Buff[240124].AddAttrs[2].Value*100$%",
      [5] = "$#Buff[240134].AddAttrs[1].Rate*100-#Buff[240133].AddAttrs[1].Rate*100$%"
    },
    CharName = "UI_CHAR_NAME_2401",
    CharUIId = 14,
    CondemnWeapon = 30,
    DEF = 315,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_78,
    GuideIconImg = "Mini_Baiheng",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_74,
    ModelId = 2401,
    Positioning = {
      "Support",
      "SPRecover",
      "Heal"
    },
    RangedWeapon = 20201,
    RecommendAttr = {
      "MaxSp",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain",
      "SkillRange"
    },
    RoleId = 2401,
    SkillList = T.RT_79,
    Sp = -1,
    SummonId = T.RT_80,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_85,
    WeaponId = 10101
  },
  [3101] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Linen/BT_Phantom_Linen.BT_Phantom_Linen",
    ATK = 23,
    ATKLevelGrow = "ATKA",
    Attribute = "Fire",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      310101,
      310102,
      310103,
      310104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_3101_01",
      [2] = "GRADEUP_3101_02",
      [3] = "GRADEUP_3101_03",
      [4] = "GRADEUP_3101_04",
      [5] = "GRADEUP_3101_05",
      [6] = "GRADEUP_3101_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[310121].BuffDamagedRate.Value*(-100)$%",
      [2] = "$#PassiveEffect[310101].Vars.Grade4HpBelow*100$%",
      [3] = "$#PassiveEffect[310101].Vars.Grade4BuffRate*100$%",
      [4] = "$#Buff[310141].AddAttrs[1].Value*100$%",
      [5] = "$#PassiveEffect[310101].Vars.Grade1LastTime$",
      [6] = "$#PassiveEffect[310101].Vars.Grade6DebuffLastTime$"
    },
    CharName = "UI_CHAR_NAME_3101",
    CharUIId = 4,
    CondemnWeapon = 30,
    DEF = 240,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_86,
    GuideIconImg = "Mini_Linen",
    MaxES = 105,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 150,
    ModApplicationType = T.RT_87,
    ModelId = 3101,
    Positioning = T.RT_6,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Fire",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain"
    },
    RoleId = 3101,
    SkillList = {
      310101,
      310102,
      310103,
      310104,
      310003
    },
    Sp = -1,
    UltraWeapon = {310101},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 310101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 310102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 310103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 310103
      }
    },
    WeaponId = 10101
  },
  [3102] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Xier/BT_TestAI_Xier.BT_TestAI_Xier",
    ATK = 27,
    ATKLevelGrow = "ATKA",
    Attribute = "Fire",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 3102,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      310201,
      310202,
      310203,
      310204
    },
    CharGradeDescription = {
      [1] = "GRADEUP_3102_01",
      [2] = "GRADEUP_3102_02",
      [3] = "GRADEUP_3102_03",
      [4] = "GRADEUP_3102_04",
      [5] = "GRADEUP_3102_05",
      [6] = "GRADEUP_3102_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[310205].BuffDamageRate.Value*(-100)$%",
      [2] = "$#PassiveEffect[310201].Vars.Skill2DeDamageLastTime$",
      [3] = "$#PassiveEffect[310201].Vars.Grade2InDamageRate*100$%",
      [4] = "$#PassiveEffect[310202].Vars.Skill1IncreaseDamageLastTime$",
      [5] = "$#Buff[310206].AddAttrs[1].Value*100$%"
    },
    CharName = "UI_CHAR_NAME_3102",
    CharUIId = 20,
    CondemnWeapon = 30,
    DEF = 265,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Dualblade", "Cannon"},
    GuideIconImg = "Mini_Xier",
    MaxES = 90,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 90,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 200,
    ModApplicationType = T.RT_87,
    ModelId = 3102,
    Positioning = T.RT_88,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Fire",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain",
      "SkillRange"
    },
    RoleId = 3102,
    SkillList = {
      310201,
      310202,
      310203,
      310204,
      310003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 310201
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 310202
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 310203
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 310203
      }
    },
    WeaponId = 10101
  },
  [3103] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Fire",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 3103,
    BattleCharTag = T.RT_19,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = {
      310301,
      310302,
      310303,
      310304
    },
    CharGradeDescription = {
      [1] = "GRADEUP_3103_01",
      [2] = "GRADEUP_3103_02",
      [3] = "GRADEUP_3103_03",
      [4] = "GRADEUP_3103_04",
      [5] = "GRADEUP_3103_05",
      [6] = "GRADEUP_3103_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[310301].Vars.ReturnSpSmall$",
      [2] = "$#PassiveEffect[310301].Vars.ReturnSpLarge$",
      [3] = "$-#Buff[310323].AddAttrs[1].Value*100$%",
      [4] = "$#PassiveEffect[310301].Vars.Grade4Prob*100$%"
    },
    CharName = "UI_CHAR_NAME_3103",
    CondemnWeapon = 30,
    DEF = 288,
    DEFLevelGrow = "DEFS",
    EnableAnimFly = true,
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Sword", "Shotgun"},
    GuideIconImg = "Mini_Yeer",
    MaxES = 96,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 96,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_87,
    ModelId = 3103,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Yeer_Client.BP_Yeer_Client'",
    Positioning = T.RT_12,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_89,
    RoleId = 3103,
    SkillList = {
      310301,
      310302,
      310303,
      310304,
      310001
    },
    Sp = -1,
    SummonId = {310301, 310302},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 310301
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 310302
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 310303
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 310303
      }
    },
    WeaponId = 10101
  },
  [3201] = {
    ATK = 15,
    ATKLevelGrow = "ATKA",
    Attribute = "Fire",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 3201,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      320101,
      320102,
      320103,
      320104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_3201_01",
      [2] = "GRADEUP_3201_02",
      [3] = "GRADEUP_3201_03",
      [4] = "GRADEUP_3201_04",
      [5] = "GRADEUP_3201_05",
      [6] = "GRADEUP_3201_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[320101].Vars.Grade1BuffRate*100$%",
      [2] = "$#Buff[320100].DotDatas[1].Rate*100$%",
      [3] = "$#PassiveEffect[320101].Vars.Grade6CD$"
    },
    CharName = "UI_CHAR_NAME_3201",
    CondemnWeapon = 30,
    DEF = 345,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Claymore", "Cannon"},
    GuideIconImg = "Mini_Haier",
    MaxES = 0,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 183,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 120,
    ModApplicationType = T.RT_87,
    ModelId = 3201,
    Positioning = T.RT_90,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_91,
    RoleId = 3201,
    SkillList = {
      320101,
      320102,
      320103,
      320104,
      310001
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 320101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 320102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 320103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 320103
      }
    },
    WeaponId = 10301
  },
  [3202] = {
    ATK = 13,
    ATKLevelGrow = "ATKS",
    Attribute = "Fire",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharGradeDescription = {
      [1] = "GRADEUP_3202_01",
      [2] = "GRADEUP_3202_02",
      [3] = "GRADEUP_3202_03",
      [4] = "GRADEUP_3202_04",
      [5] = "GRADEUP_3202_05",
      [6] = "GRADEUP_3202_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[320201].Vars.Grade1Prob*100$%",
      [2] = "$#Buff[320204].BuffDamagedRate.Value*(-100)$%",
      [3] = "$#PassiveEffect[320201].Vars.Grade4InDamage*100$%"
    },
    CharName = "UI_CHAR_NAME_3202",
    CharUIId = 10,
    CondemnWeapon = 30,
    DEF = 345,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_92,
    GuideIconImg = "Mini_Xibi",
    MaxES = 120,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 185,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 200,
    ModApplicationType = T.RT_87,
    ModelId = 3202,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Kami_Client.BP_Kami_Client'",
    RangedWeapon = 20201,
    RoleId = 3202,
    SkillList = {
      320201,
      320202,
      320203,
      320204,
      310001
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 320201
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 320202
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 320203
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 320203
      }
    },
    WeaponId = 10101
  },
  [3301] = {
    ATK = 21,
    ATKLevelGrow = "ATKA",
    Attribute = "Fire",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 3301,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = {
      330101,
      330102,
      330103,
      330104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_3301_01",
      [2] = "GRADEUP_3301_02",
      [3] = "GRADEUP_3301_03",
      [4] = "GRADEUP_3301_04",
      [5] = "GRADEUP_3301_05",
      [6] = "GRADEUP_3301_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[330101].Vars.Grade1PropReturn*100$%",
      [2] = "$#PassiveEffect[330101].Vars.Skill01AddRate*100$%",
      [3] = "$#SkillCreature[330115].TimeLife$",
      [4] = "$#PassiveEffect[330101].Vars.Grade6LastTime$",
      [5] = "$#PassiveEffect[330101].Vars.Grade6DamageRate*100$%"
    },
    CharName = "UI_CHAR_NAME_3301",
    CondemnWeapon = 30,
    DEF = 264,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Polearm", "Shotgun"},
    GuideIconImg = "Mini_Maer",
    MaxES = 83,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 83,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 160,
    ModApplicationType = T.RT_87,
    ModelId = 3301,
    Positioning = {
      "DPS",
      "Control",
      "SkillDPS"
    },
    RangedWeapon = 20201,
    RecommendAttr = T.RT_89,
    RoleId = 3301,
    SkillList = {
      330101,
      330102,
      330103,
      330104,
      100001
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 330101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 330102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 330103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 330103
      }
    },
    WeaponId = 10101
  },
  [4101] = {
    ATK = 22,
    ATKLevelGrow = "ATKS",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      410101,
      410102,
      410103,
      410104
    },
    CharGradeDescription = T.RT_55,
    CharGradeParameter = T.RT_56,
    CharName = "UI_CHAR_NAME_4101",
    CharUIId = 16,
    CondemnWeapon = 30,
    DEF = 276,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_57,
    GuideIconImg = "Mini_Lise",
    MaxES = 94,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 94,
    MaxHpLevelGrow = "MaxHpS",
    MaxSecondSp = 150,
    MaxSp = 150,
    ModApplicationType = T.RT_58,
    ModelId = 4101,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_lise_Client.BP_lise_Client'",
    Positioning = T.RT_12,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_93,
    RoleId = 4101,
    SkillList = T.RT_59,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_64,
    WeaponId = 10101
  },
  [4102] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Linen/BT_Phantom_Linen.BT_Phantom_Linen",
    ATK = 24,
    ATKLevelGrow = "ATKA",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 4102,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      410201,
      410202,
      410203,
      410204
    },
    CharGradeDescription = {
      [1] = "GRADEUP_4102_01",
      [2] = "GRADEUP_4102_02",
      [3] = "GRADEUP_4102_03",
      [4] = "GRADEUP_4102_04",
      [5] = "GRADEUP_4102_05",
      [6] = "GRADEUP_4102_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[410201].Vars.Grade1ExpandBuff$",
      [2] = "$-#Buff[410243].DotDatas[1].Value$",
      [3] = "$#Buff[410241].AddAttrs[1].Rate*100$%",
      [4] = "$#SkillEffects[410251].TaskEffects[1].LastTime$",
      [5] = "$#Buff[410242].AddAttrs[1].Value*100$%"
    },
    CharName = "UI_CHAR_NAME_4102",
    CharUIId = 19,
    CondemnWeapon = 30,
    DEF = 252,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_86,
    GuideIconImg = "Mini_Zhiliu",
    MaxES = 140,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 80,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 240,
    ModApplicationType = T.RT_58,
    ModelId = 4102,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Zhiliu_Client.BP_Zhiliu_Client'",
    Positioning = T.RT_12,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_93,
    RoleId = 4102,
    SkillList = {
      410201,
      410202,
      410203,
      410204,
      410003
    },
    Sp = -1,
    SummonId = {410201},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 410201
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 410202
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 410203
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 410203
      }
    },
    WeaponId = 10101
  },
  [4201] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Yuming/BT_TestAI_Yuming.BT_TestAI_Yuming",
    ATK = 22,
    ATKLevelGrow = "ATKS",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 4201,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharAddonAttr = {
      420101,
      420102,
      420103,
      420104
    },
    CharGradeDescription = T.RT_65,
    CharGradeParameter = {
      [1] = "$#Buff[420113].AddAttrs[2].Value/100$",
      [2] = "$#Buff[420113].AddAttrs[1].Rate*100$%",
      [3] = "$#SkillEffects[420142].TaskEffects[2].LastTime$",
      [4] = "$#PassiveEffect[420101].Vars.Grade4BonusRate*100$%",
      [5] = "$#Buff[420104].AddAttrs[1].SupLimitValue*100$%",
      [6] = "$#PassiveEffect[420101].Vars.Grade6DmgRate*100$%",
      [7] = "$#SkillEffects[420145].TaskEffects[1].Rate*100$%",
      [8] = "$#SkillEffects[420124].TaskEffects[1].Rate/#SkillEffects[420123].TaskEffects[1].Rate*100$%"
    },
    CharName = "UI_CHAR_NAME_4201",
    CharUIId = 6,
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_40,
    GuideIconImg = "Mini_Yuming",
    MaxES = 50,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 165,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 200,
    ModApplicationType = T.RT_58,
    ModelId = 4201,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Yuming_Client.BP_Yuming_Client'",
    Positioning = T.RT_88,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_93,
    RoleId = 4201,
    SkillList = T.RT_66,
    Sp = -1,
    SummonId = T.RT_67,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_72,
    WeaponId = 10203
  },
  [4202] = {
    ATK = 14,
    ATKLevelGrow = "ATKS",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharAddonAttr = {
      420201,
      420202,
      420203,
      420204
    },
    CharGradeDescription = {
      [1] = "GRADEUP_4202_01",
      [2] = "GRADEUP_4202_02",
      [3] = "GRADEUP_4202_03",
      [4] = "GRADEUP_4202_04",
      [5] = "GRADEUP_4202_05",
      [6] = "GRADEUP_4202_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[420200].AddAttrs[1].Value$",
      [2] = "$#PassiveEffect[420201].Vars.Grade6DamageRate*100$%"
    },
    CharName = "UI_CHAR_NAME_4202",
    CondemnWeapon = 30,
    DEF = 510,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_7,
    GuideIconImg = "Mini_Landi",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 120,
    ModApplicationType = T.RT_58,
    ModelId = 4202,
    Positioning = {
      "Support",
      "DEF",
      "ES"
    },
    RangedWeapon = 20201,
    RecommendAttr = {
      "DEF",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain",
      "SkillRange"
    },
    RoleId = 4202,
    SkillList = {
      420201,
      420202,
      420203,
      420204,
      100007
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 420201
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 420202
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 420203
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 420203
      }
    },
    WeaponId = 10104
  },
  [4301] = {
    ATK = 13,
    ATKLevelGrow = "ATKS",
    Attribute = "Thunder",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_26,
    CharAddonAttr = {
      430101,
      430102,
      430103,
      430104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_4301_01",
      [2] = "GRADEUP_4301_02",
      [3] = "GRADEUP_4301_03",
      [4] = "GRADEUP_4301_04",
      [5] = "GRADEUP_4301_05",
      [6] = "GRADEUP_4301_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[430101].Vars.DamageAddRateGrade2*100$%",
      [2] = "$#PassiveEffect[430101].Vars.LinkAddGrade2*100$%",
      [3] = "$#PassiveEffect[430101].Vars.Skill02LinkAddedRate*100$%",
      [4] = "$#SkillEffects[430155].TaskEffects[1].Rate*100$%",
      [5] = "$#SkillEffects[430155].TaskEffects[1].Value$",
      [6] = "$#PassiveEffect[430101].Vars.Grade4Rate*100$%"
    },
    CharName = "UI_CHAR_NAME_4301",
    CharUIId = 10,
    CondemnWeapon = 30,
    DEF = 345,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_92,
    GuideIconImg = "Mini_Xibi",
    MaxES = 120,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 185,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 200,
    ModApplicationType = T.RT_58,
    ModelId = 4301,
    Positioning = T.RT_90,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_91,
    RoleId = 4301,
    SkillList = {
      430101,
      430102,
      430103,
      430104,
      410003
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 430101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 430102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 430103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 430103
      }
    },
    WeaponId = 10101
  },
  [5101] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Songlu/BT_TestAI_Songlu.BT_TestAI_Songlu",
    ATK = 12,
    ATKLevelGrow = "ATKS",
    Attribute = "Wind",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 5101,
    BattleCharTag = T.RT_23,
    CapsuleInfo = T.RT_24,
    CharAddonAttr = {
      510101,
      510102,
      510103,
      510104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_5101_01",
      [2] = "GRADEUP_5101_02",
      [3] = "GRADEUP_5101_03",
      [4] = "GRADEUP_5101_04",
      [5] = "GRADEUP_5101_05",
      [6] = "GRADEUP_5101_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[510101].Vars.Grade2AddAtk*100$%",
      [2] = "$#PassiveEffect[510101].Vars.Grade2BuffTime$",
      [3] = "$#Buff[510105].AddAttrs[1].Rate*100$%",
      [4] = "$#PassiveEffect[510101].Vars.Grade6LastTime$",
      [5] = "$#Buff[510104].AddAttrs[1].SupLimitValue$",
      [6] = "$#Buff[510105].MaxLayer$"
    },
    CharName = "UI_CHAR_NAME_5101",
    CharUIId = 5,
    CondemnWeapon = 30,
    DEF = 310,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Polearm", "Bow"},
    GuideIconImg = "Mini_Songlu",
    MaxES = 150,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 185,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 120,
    ModApplicationType = T.RT_41,
    ModelId = 5101,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Songlu_PassiveClient.BP_Songlu_PassiveClient'",
    Positioning = {
      "Support",
      "HP",
      "Heal"
    },
    RangedWeapon = 20201,
    RecommendAttr = {
      "MaxHp",
      "MaxSp",
      "SkillEfficiency",
      "SkillSustain"
    },
    RoleId = 5101,
    SkillList = {
      510101,
      510102,
      510103,
      510106,
      510191
    },
    Sp = -1,
    SummonId = T.RT_94,
    UltraWeapon = T.RT_94,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 510101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 510102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 510103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 510103
      }
    },
    WeaponId = 10204
  },
  [5102] = {
    ATK = 20,
    ATKLevelGrow = "ATKA",
    Attribute = "Wind",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 5102,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharAddonAttr = {
      510201,
      510202,
      510203,
      510204
    },
    CharGradeDescription = {
      [1] = "GRADEUP_5102_01",
      [2] = "GRADEUP_5102_02",
      [3] = "GRADEUP_5102_03",
      [4] = "GRADEUP_5102_04",
      [5] = "GRADEUP_5102_05",
      [6] = "GRADEUP_5102_06"
    },
    CharGradeParameter = {
      [1] = "$#Buff[510212].AddAttrs[1].Value*100$%",
      [2] = "$#PassiveEffect[510201].Vars.Grade2Rate*100$%",
      [3] = "$#PassiveEffect[510201].Vars.Grade1LastTime$",
      [4] = "$#Buff[510213].AddAttrs[1].Value*100$%",
      [5] = "$#Buff[510222].AddAttrs[3].Value*100$%"
    },
    CharName = "UI_CHAR_NAME_5102",
    CondemnWeapon = 30,
    DEF = 285,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Dualblade", "Crossbow"},
    GuideIconImg = "Mini_Aote",
    MaxES = 195,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 85,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 120,
    ModApplicationType = T.RT_41,
    ModelId = 5102,
    Positioning = T.RT_32,
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Wind",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillSustain",
      "EnmityValue"
    },
    RoleId = 5102,
    SkillList = {
      510201,
      510202,
      510203,
      510204,
      510001
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 510201
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 510202
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 510203
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 510203
      }
    },
    WeaponId = 10101
  },
  [5301] = {
    AIBTPath = "/Game/AssetDesign/AI/Player/Saiqi/BT_TestAI_Saiqi.BT_TestAI_Saiqi",
    ATK = 28,
    ATKLevelGrow = "ATKS",
    Attribute = "Wind",
    BTMotionParams = T.RT_39,
    BattleCharBuffUI = 5301,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = {
      530101,
      530102,
      530103,
      530104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_5301_01",
      [2] = "GRADEUP_5301_02",
      [3] = "GRADEUP_5301_03",
      [4] = "GRADEUP_5301_04",
      [5] = "GRADEUP_5301_05",
      [6] = "GRADEUP_5301_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[530102].Vars.Grade2TriggerProb*100$%",
      [2] = "$#Buff[530121].AddAttrs[1].Value*100$%",
      [3] = "$#SkillEffects[530141].TaskEffects[1].Rate*100$%",
      [4] = "$#SkillEffects[530141].TaskEffects[2].LastTime$",
      [5] = "$#Buff[530112].BuffDamagedRate.Value*(-100)$%",
      [6] = "$#Buff[530113].AddAttrs[1].Value*100$%",
      [7] = "$#Buff[530122].DotDatas[1].Interval$"
    },
    CharName = "UI_CHAR_NAME_5301",
    CondemnWeapon = 30,
    DEF = 252,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_40,
    GuideIconImg = "Mini_Saiqi",
    MaxES = 140,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 70,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_41,
    ModelId = 5301,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Saiqi_Client.BP_Saiqi_Client'",
    Positioning = {
      "DPS",
      "Uweapon",
      "WeaponDPS",
      "SkillDPS"
    },
    RangedWeapon = 20201,
    RecommendAttr = {
      "ATK_Wind",
      "SkillIntensity",
      "SkillEfficiency",
      "SkillRange",
      "EnmityValue"
    },
    RoleId = 5301,
    SkillList = {
      530101,
      530102,
      530103,
      530104,
      510003
    },
    Sp = -1,
    SummonId = T.RT_95,
    UltraWeapon = T.RT_95,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 530101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 530102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 530103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 530103
      }
    },
    WeaponId = 10204
  },
  [5401] = {
    ATK = 19,
    ATKLevelGrow = "ATKA",
    Attribute = "Wind",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 5401,
    BattleCharTag = T.RT_25,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = {
      540101,
      540102,
      540103,
      540104
    },
    CharGradeDescription = {
      [1] = "GRADEUP_5401_01",
      [2] = "GRADEUP_5401_02",
      [3] = "GRADEUP_5401_03",
      [4] = "GRADEUP_5401_04",
      [5] = "GRADEUP_5401_05",
      [6] = "GRADEUP_5401_06"
    },
    CharGradeParameter = {
      [1] = "$#PassiveEffect[540101].Vars.Grade1AddLayer$",
      [2] = "$#PassiveEffect[540101].Vars.Grade2AddSp$",
      [3] = "$#Buff[540114].AddAttrs[1].Value*100$%",
      [4] = "$#Buff[540123].AddAttrs[1].Value*100$%",
      [5] = "$#PassiveEffect[540102].Vars.G6BuffLastTime$",
      [6] = "$#Buff[540123].MaxLayer$"
    },
    CharName = "UI_CHAR_NAME_5401",
    CondemnWeapon = 30,
    DEF = 285,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = {"Swordwhip", "Machinegun"},
    GuideIconImg = "Mini_Dafu",
    MaxES = 100,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 100,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 160,
    ModApplicationType = T.RT_41,
    ModelId = 5401,
    Positioning = {
      "Support",
      "Control",
      "Heal"
    },
    RangedWeapon = 20101,
    RecommendAttr = T.RT_53,
    RoleId = 5401,
    SkillList = {
      540101,
      540102,
      540103,
      540104,
      100009
    },
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = {
      {
        ExtraLv = 2,
        Grade = 3,
        SkillId = 540101
      },
      {
        ExtraLv = 2,
        Grade = 5,
        SkillId = 540102
      },
      {
        ExtraLv = 1,
        Grade = 3,
        SkillId = 540103
      },
      {
        ExtraLv = 1,
        Grade = 5,
        SkillId = 540103
      }
    },
    WeaponId = 10101
  },
  [5402] = {
    ATK = 28,
    ATKLevelGrow = "ATKS",
    Attribute = "Wind",
    BTMotionParams = T.RT_39,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_5402",
    CondemnWeapon = 30,
    DEF = 252,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_40,
    GuideIconImg = "Mini_Lilikou",
    MaxES = 140,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 70,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 150,
    ModApplicationType = T.RT_41,
    ModelId = 5301,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Lilikou_Client.BP_Lilikou_Client'",
    RangedWeapon = 20201,
    RoleId = 5402,
    SkillList = {
      540201,
      540231,
      540203
    },
    Sp = -1,
    UltraWeapon = {540201},
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10204
  },
  [103010] = {
    ATK = 22,
    ATKLevelGrow = "ATKS",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_1801",
    DEF = 315,
    DEFLevelGrow = "DEFS",
    GuideIconImg = "Mini_Feina",
    MaxES = 105,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 105,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 160,
    ModelId = 1801,
    RoleId = 103010,
    SkillList = {18011, 18012},
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [110301] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharName = "Cp2CharacterName03",
    CondemnWeapon = 30,
    DEF = 330,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_10,
    ExtraModelIds = T.RT_13,
    GuideIconImg = "Mini_Common",
    MaxES = 130,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 130,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_5,
    ModelId = 110301,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Tuosi_Client.BP_Tuosi_Client'",
    RoleId = 110301,
    SkillList = {
      110311,
      110302,
      110303
    },
    Sp = -1,
    UltraWeapon = T.RT_11,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [110302] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharName = "UI_Npc_Name_Bulu",
    CondemnWeapon = 30,
    DEF = 330,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_10,
    ExtraModelIds = T.RT_13,
    GuideIconImg = "Mini_Common",
    MaxES = 130,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 130,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_5,
    ModelId = 110302,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Tuosi_Client.BP_Tuosi_Client'",
    RoleId = 110302,
    SkillList = T.RT_14,
    Sp = -1,
    UltraWeapon = T.RT_15,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [110303] = {
    ATK = 21,
    ATKLevelGrow = "ATKS",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_8,
    CapsuleInfo = T.RT_9,
    CharName = "UI_Npc_Name_Bulu",
    CondemnWeapon = 30,
    DEF = 330,
    DEFLevelGrow = "DEFS",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_10,
    ExtraModelIds = T.RT_13,
    GuideIconImg = "Mini_Common",
    MaxES = 130,
    MaxESLevelGrow = "MaxESS",
    MaxHp = 130,
    MaxHpLevelGrow = "MaxHpS",
    MaxSp = 180,
    ModApplicationType = T.RT_5,
    ModelId = 110303,
    PassiveEffectClient = "Blueprint'/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Client/BP_Tuosi_Client.BP_Tuosi_Client'",
    RoleId = 110303,
    SkillList = T.RT_14,
    Sp = -1,
    UltraWeapon = T.RT_15,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"
  },
  [120101] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Dark",
    BTMotionParams = T.RT_1,
    BattleCharTag = T.RT_2,
    CapsuleInfo = T.RT_4,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_21,
    GuideIconImg = "Mini_Nvzhu",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 101,
    RangedWeapon = 20201,
    RoleId = 120101,
    SkillList = T.RT_22,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    WeaponId = 10103
  },
  [160101] = {
    ATK = 22,
    ATKLevelGrow = "ATKA",
    Attribute = "Light",
    BTMotionParams = T.RT_1,
    BattleCharBuffUI = 1601,
    BattleCharTag = T.RT_19,
    CapsuleInfo = T.RT_4,
    CharAddonAttr = T.RT_42,
    CharGradeDescription = T.RT_43,
    CharGradeParameter = T.RT_44,
    CharName = "UI_CHAR_NAME_101",
    CondemnWeapon = 30,
    DEF = 300,
    DEFLevelGrow = "DEFA",
    ExcelWeaponRate = 0.2,
    ExcelWeaponTags = T.RT_21,
    GuideIconImg = "Mini_Nanzhu",
    MaxES = 120,
    MaxESLevelGrow = "MaxESA",
    MaxHp = 120,
    MaxHpLevelGrow = "MaxHpA",
    MaxSp = 100,
    ModApplicationType = T.RT_17,
    ModelId = 102,
    Positioning = T.RT_45,
    RangedWeapon = 20201,
    RecommendAttr = T.RT_46,
    RoleId = 160101,
    SkillList = T.RT_47,
    Sp = -1,
    UnitBPPath = "/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C",
    UpgradeSkillExtraLevel = T.RT_52,
    WeaponId = 10101
  }
})
