local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AttrConfig", {
  ATK = {
    Id = "ATK",
    Name = "Attr_ATK_Name",
    ShowInInspector = true,
    SortIndex1 = 1,
    SortIndex2 = 1,
    SortIndex3 = 1,
    SortIndex4 = 1
  },
  ATK_Dark = {
    AttrDesc = "ATTR_DESC_ATK_Dark",
    Id = "ATK_Dark",
    Name = "Attr_ATK_Dark_Name",
    ShowInInspector = true,
    SortIndex1 = 5,
    SortIndex2 = 5,
    SortIndex3 = 5,
    SortIndex4 = 5
  },
  ATK_Fire = {
    AttrDesc = "ATTR_DESC_ATK_Fire",
    Id = "ATK_Fire",
    Name = "Attr_ATK_Fire_Name",
    ShowInInspector = true,
    SortIndex1 = 3,
    SortIndex2 = 3,
    SortIndex3 = 3,
    SortIndex4 = 3
  },
  ATK_Light = {
    AttrDesc = "ATTR_DESC_ATK_Light",
    Id = "ATK_Light",
    Name = "Attr_ATK_Light_Name",
    ShowInInspector = true,
    SortIndex1 = 6,
    SortIndex2 = 6,
    SortIndex3 = 6,
    SortIndex4 = 6
  },
  ATK_Slash = {
    AttrDesc = "ATTR_DESC_ATK_Slash",
    Id = "ATK_Slash",
    Name = "Attr_ATK_Slash_Name",
    ShowInInspector = true,
    SortIndex1 = 7,
    SortIndex2 = 7,
    SortIndex3 = 7,
    SortIndex4 = 7
  },
  ATK_Smash = {
    AttrDesc = "ATTR_DESC_ATK_Smash",
    Id = "ATK_Smash",
    Name = "Attr_ATK_Smash_Name",
    ShowInInspector = true,
    SortIndex1 = 9,
    SortIndex2 = 9,
    SortIndex3 = 9,
    SortIndex4 = 9
  },
  ATK_Spike = {
    AttrDesc = "ATTR_DESC_ATK_Spike",
    Id = "ATK_Spike",
    Name = "Attr_ATK_Spike_Name",
    ShowInInspector = true,
    SortIndex1 = 8,
    SortIndex2 = 8,
    SortIndex3 = 8,
    SortIndex4 = 8
  },
  ATK_Thunder = {
    AttrDesc = "ATTR_DESC_ATK_Thunder",
    Id = "ATK_Thunder",
    Name = "Attr_ATK_Thunder_Name",
    ShowInInspector = true,
    SortIndex1 = 4,
    SortIndex2 = 4,
    SortIndex3 = 4,
    SortIndex4 = 4
  },
  ATK_Water = {
    AttrDesc = "ATTR_DESC_ATK_Water",
    Id = "ATK_Water",
    Name = "Attr_ATK_Water_Name",
    ShowInInspector = true,
    SortIndex1 = 2,
    SortIndex2 = 2,
    SortIndex3 = 2,
    SortIndex4 = 2
  },
  ATK_Wind = {
    AttrDesc = "ATTR_DESC_ATK_Wind",
    Id = "ATK_Wind",
    Name = "Attr_ATK_Wind_Name",
    ShowInInspector = true,
    SortIndex1 = 4.5
  },
  AdditionalRecoverTime = {
    Id = "AdditionalRecoverTime",
    Name = "Attr_AdditionalRecoverTime_Name"
  },
  AttackRange_Bullet = {
    Id = "AttackRange_Bullet",
    Name = "Attr_AttackRange_Bullet_Name",
    NumCorrect = 0.01,
    ShowInInspector = true,
    SortIndex1 = 24,
    SortIndex2 = 24,
    SortIndex3 = 24,
    SortIndex4 = 24
  },
  AttackRange_Normal = {
    Id = "AttackRange_Normal",
    Name = "Attr_AttackRange_Name",
    NumCorrect = 0.01,
    ShowInInspector = true,
    SortIndex1 = 23,
    SortIndex2 = 23,
    SortIndex3 = 23,
    SortIndex4 = 23
  },
  AttackSpeed_FallAttack = {
    Id = "AttackSpeed_FallAttack",
    Name = "Attr_AttackSpeed_FallAttack_Name",
    ShowInInspector = true,
    SortIndex1 = 20.4,
    SortIndex2 = 20.4,
    SortIndex3 = 20.4,
    SortIndex4 = 20.4
  },
  AttackSpeed_HeavyAttack = {
    Id = "AttackSpeed_HeavyAttack",
    Name = "Attr_AttackSpeed_HeavyAttack_Name",
    ShowInInspector = true,
    SortIndex1 = 20.2,
    SortIndex2 = 20.2,
    SortIndex3 = 20.2,
    SortIndex4 = 20.2
  },
  AttackSpeed_Normal = {
    AttrLimit = "DefaultMaxAttackSpeed",
    BattleEvent = "AttackSpeedNormalChanged",
    Id = "AttackSpeed_Normal",
    Name = "Attr_AttackSpeed_Name",
    ShowInInspector = true,
    SortIndex1 = 20,
    SortIndex2 = 20,
    SortIndex3 = 20,
    SortIndex4 = 20
  },
  AttackSpeed_Reload = {
    Id = "AttackSpeed_Reload",
    Name = "Attr_AttackSpeed_Reload_Name",
    ShowInInspector = true,
    SortIndex1 = 21,
    SortIndex2 = 21,
    SortIndex3 = 21,
    SortIndex4 = 21
  },
  AttackSpeed_SlideAttack = {
    Id = "AttackSpeed_SlideAttack",
    Name = "Attr_AttackSpeed_SlideAttack_Name",
    ShowInInspector = true,
    SortIndex1 = 20.5,
    SortIndex2 = 20.5,
    SortIndex3 = 20.5,
    SortIndex4 = 20.5
  },
  BulletConver = {
    AttrDesc = "ATTR_DESC_BulletConver",
    Id = "BulletConver",
    IsPercent = true,
    Name = "Attr_BulletConver_Name",
    ShowInInspector = true,
    SortIndex1 = 28.5,
    SortIndex2 = 28.5,
    SortIndex3 = 28.5,
    SortIndex4 = 28.5
  },
  BulletJumpVelocityModifier = {
    Id = "BulletJumpVelocityModifier",
    IsPercent = true,
    Name = "Attr_BulletJumpVelocityModifier_Name"
  },
  BulletMax = {
    Id = "BulletMax",
    Name = "Attr_BulletMax_Name",
    ShowInInspector = true,
    SortIndex1 = 28,
    SortIndex2 = 28,
    SortIndex3 = 28,
    SortIndex4 = 28
  },
  BulletSpeed = {
    Id = "BulletSpeed",
    IsPercent = true,
    Name = "Attr_BulletSpeed_Name"
  },
  CRD = {
    Id = "CRD",
    IsPercent = true,
    Name = "Attr_CRD_Name",
    ShowInInspector = true,
    SortIndex1 = 19,
    SortIndex2 = 19,
    SortIndex3 = 19,
    SortIndex4 = 19
  },
  CRI = {
    AttrDesc = "ATTR_DESC_CRI",
    Id = "CRI",
    IsPercent = true,
    Name = "Attr_CRI_Name",
    ShowInInspector = true,
    SortIndex1 = 18,
    SortIndex2 = 18,
    SortIndex3 = 18,
    SortIndex4 = 18
  },
  ComboHoldTime = {
    Id = "ComboHoldTime",
    Name = "Attr_ComboHoldTime_Name",
    ShowInInspector = true,
    SortIndex1 = 25,
    SortIndex2 = 25,
    SortIndex3 = 25,
    SortIndex4 = 25
  },
  DEF = {
    Id = "DEF",
    Name = "Attr_DEF_Name",
    ShowInInspector = true,
    SortIndex1 = 12,
    SortIndex2 = 12,
    SortIndex3 = 12,
    SortIndex4 = 12
  },
  DamageRate = {
    Id = "DamageRate",
    IsPercent = true,
    Name = "Attr_DamageRate_Normal_Nmae",
    ShowInInspector = true,
    SortIndex1 = 9.5,
    SortIndex2 = 9.5,
    SortIndex3 = 9.5,
    SortIndex4 = 9.5
  },
  DropDistance = {
    Id = "DropDistance",
    Name = "Attr_DropDistance_Name",
    NumCorrect = 0.01
  },
  EnmityValue = {
    AttrDesc = "ATTR_DESC_EnmityValue",
    Id = "EnmityValue",
    IsPercent = true,
    Name = "Attr_EnmityValue_Name",
    ShowInInspector = true,
    SortIndex1 = 17.3,
    SortIndex2 = 17.3,
    SortIndex3 = 17.3,
    SortIndex4 = 17.3
  },
  ExcelWeaponTag = {
    AttrDesc = "ATTR_DESC_ExcelWeaponTag",
    Id = "ExcelWeaponTag",
    Name = "Attr_ExcelWeaponTag_Name",
    ShowInInspector = true,
    SortIndex1 = 14,
    SortIndex2 = 14,
    SortIndex3 = 14,
    SortIndex4 = 14
  },
  FallAttackRate = {
    Id = "FallAttackRate",
    IsPercent = true,
    Name = "Attr_FallAttackRate_Name"
  },
  HitMontageRate = {
    Id = "HitMontageRate",
    IsPercent = true,
    Name = "HitMontageRate_Name"
  },
  JumpVelocityModifier = {
    Id = "JumpVelocityModifier",
    IsPercent = true,
    Name = "Attr_JumpVelocityModifier_Name"
  },
  LevelLimit = {
    Id = "LevelLimit",
    Name = "Attr_LevelLimit_Name",
    ShowInInspector = true,
    SortIndex1 = 29,
    SortIndex2 = 29,
    SortIndex3 = 29,
    SortIndex4 = 29
  },
  MagazineCapacity = {
    Id = "MagazineCapacity",
    Name = "Attr_MagazineCapacity_Name",
    ShowInInspector = true,
    SortIndex1 = 27,
    SortIndex2 = 27,
    SortIndex3 = 27,
    SortIndex4 = 27
  },
  MaxAvoidExecuteTimes = {
    Id = "MaxAvoidExecuteTimes",
    Name = "Attr_MaxAvoidExecuteTimes_Name"
  },
  MaxES = {
    Id = "MaxES",
    Name = "Attr_ES_Name",
    ShowInInspector = true,
    SortIndex1 = 11,
    SortIndex2 = 11,
    SortIndex3 = 11,
    SortIndex4 = 11
  },
  MaxHp = {
    Id = "MaxHp",
    Name = "Attr_Hp_Name",
    ShowInInspector = true,
    SortIndex1 = 10,
    SortIndex2 = 10,
    SortIndex3 = 10,
    SortIndex4 = 10
  },
  MaxSp = {
    Id = "MaxSp",
    Name = "Attr_MaxSp_Name",
    ShowInInspector = true,
    SortIndex1 = 13,
    SortIndex2 = 13,
    SortIndex3 = 13,
    SortIndex4 = 13
  },
  ModSlotNum = {
    Id = "ModSlotNum",
    Name = "Attr_ModSlotNum_Name",
    ShowInInspector = true,
    SortIndex1 = 31,
    SortIndex2 = 31,
    SortIndex3 = 31,
    SortIndex4 = 31
  },
  ModVolume = {
    Id = "ModVolume",
    Name = "Attr_ModVolume_Name",
    ShowInInspector = true,
    SortIndex1 = 30,
    SortIndex2 = 30,
    SortIndex3 = 30,
    SortIndex4 = 30
  },
  MultiShoot = {
    AttrDesc = "ATTR_DESC_MultiShoot",
    Id = "MultiShoot",
    Name = "Attr_MultiShoot_Name",
    ShowInInspector = true,
    SortIndex1 = 26,
    SortIndex2 = 26,
    SortIndex3 = 26,
    SortIndex4 = 26
  },
  MultiShootModifierRate = {
    Id = "MultiShootModifierRate",
    IsPercent = true,
    Name = "Attr_MultiShootModifierRate_Name"
  },
  OnceDamagedPercent = {
    Id = "OnceDamagedPercent",
    IsPercent = true,
    Name = "Attr_OnceDamagedPercent_Name"
  },
  Positioning = {
    Id = "Positioning",
    Name = "Attr_Positioning",
    ShowInInspector = true,
    SortIndex1 = 0.5
  },
  RayLength = {
    Id = "RayLength",
    IsPercent = true,
    Name = "Attr_RayLength_Name"
  },
  ReloadBulletNoLoss = {
    Id = "ReloadBulletNoLoss",
    IsPercent = true,
    Name = "Attr_ReloadBulletNoLoss_Name"
  },
  SkillEfficiency = {
    AttrDesc = "ATTR_DESC_SkillEfficiency",
    AttrLimit = "MaxSkillEfficiency",
    Id = "SkillEfficiency",
    IsPercent = true,
    Name = "Attr_SkillEfficiency_Name",
    ShowInInspector = true,
    SortIndex1 = 17,
    SortIndex2 = 17,
    SortIndex3 = 17,
    SortIndex4 = 17
  },
  SkillIntensity = {
    AttrDesc = "ATTR_DESC_SkillIntensity",
    Id = "SkillIntensity",
    IsPercent = true,
    Name = "Attr_SkillIntensity_Name",
    ShowInInspector = true,
    SortIndex1 = 14.5,
    SortIndex2 = 14.5,
    SortIndex3 = 14.5,
    SortIndex4 = 14.5
  },
  SkillRange = {
    AttrDesc = "ATTR_DESC_SkillRange",
    AttrLimit = "MaxSkillRange",
    Id = "SkillRange",
    IsPercent = true,
    Name = "Attr_SkillRange_Name",
    ShowInInspector = true,
    SortIndex1 = 15,
    SortIndex2 = 15,
    SortIndex3 = 15,
    SortIndex4 = 15
  },
  SkillSustain = {
    AttrDesc = "ATTR_DESC_SkillSustain",
    AttrLimit = "MaxSkillSustain",
    Id = "SkillSustain",
    IsPercent = true,
    Name = "Attr_SkillSustain_Name",
    ShowInInspector = true,
    SortIndex1 = 16,
    SortIndex2 = 16,
    SortIndex3 = 16,
    SortIndex4 = 16
  },
  SlideAttackRate = {
    Id = "SlideAttackRate",
    IsPercent = true,
    Name = "Attr_SlideAttackRate_Name"
  },
  SlideFrictionModifier = {
    Id = "SlideFrictionModifier",
    IsPercent = true,
    Name = "Attr_SlideFrictionModifier_Name"
  },
  SpRecoverValue = {
    Id = "SpRecoverValue",
    Name = "Attr_SpRecoverValue_Name"
  },
  StrongValue = {
    AttrDesc = "ATTR_DESC_StrongValue",
    Id = "StrongValue",
    IsPercent = true,
    Name = "Attr_StrongValue_Name",
    ShowInInspector = true,
    SortIndex1 = 17.1,
    SortIndex2 = 17.1,
    SortIndex3 = 17.1,
    SortIndex4 = 17.1
  },
  TriggerEsRate = {
    Id = "TriggerEsRate",
    IsPercent = true,
    Name = "Attr_TriggerEsRate_Name"
  },
  TriggerHpRate = {
    Id = "TriggerHpRate",
    IsPercent = true,
    Name = "Attr_TriggerHpRate_Name"
  },
  TriggerProbModifierValue = {
    Id = "TriggerProbModifierValue",
    IsPercent = true,
    Name = "Attr_TriggerProbModifierValue_Name",
    ShowInInspector = true,
    SortIndex1 = 22.5,
    SortIndex2 = 22.5,
    SortIndex3 = 22.5,
    SortIndex4 = 22.5
  },
  TriggerProbability = {
    AttrDesc = "ATTR_DESC_TriggerProbability",
    Id = "TriggerProbability",
    IsPercent = true,
    Name = "Attr_TriggerProbability_Name",
    ShowInInspector = true,
    SortIndex1 = 22,
    SortIndex2 = 22,
    SortIndex3 = 22,
    SortIndex4 = 22
  },
  WeaponCRIModifierRate = {
    Id = "WeaponCRIModifierRate",
    IsPercent = true,
    Name = "Attr_WeaponCRIModifierRate_Name"
  },
  WeaponType = {
    Id = "WeaponType",
    Name = "UI_Weapon_Type",
    ShowInInspector = true,
    SortIndex2 = 0.5,
    SortIndex3 = 0.5,
    SortIndex4 = 0.5
  }
})
