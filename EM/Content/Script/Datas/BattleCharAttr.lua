local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleCharAttr", {
  ATK_Dark = {
    AttrName = "ATK_Dark",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Default = {
    AttrName = "ATK_Default",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Fire = {
    AttrName = "ATK_Fire",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Light = {
    AttrName = "ATK_Light",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Slash = {
    AttrName = "ATK_Slash",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Smash = {
    AttrName = "ATK_Smash",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Spike = {
    AttrName = "ATK_Spike",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Thunder = {
    AttrName = "ATK_Thunder",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Water = {
    AttrName = "ATK_Water",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  ATK_Wind = {
    AttrName = "ATK_Wind",
    DefaultValue = 0,
    RoleAttrDisplay = "OnlyModified"
  },
  AvoidChargeCd = {
    AttrName = "AvoidChargeCd",
    DefaultValue = 1.8,
    RoleAttrDisplay = "AlwaysFalse"
  },
  BaseOverShield = {
    AttrName = "BaseOverShield",
    DefaultValue = 425,
    RoleAttrDisplay = "AlwaysFalse"
  },
  CollisionLevel = {
    AttrName = "CollisionLevel",
    DefaultValue = 100,
    RoleAttrDisplay = "AlwaysFalse"
  },
  DEF = {
    AttrName = "DEF",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysTrue"
  },
  DamageRate_Normal = {
    AttrName = "DamageRate_Normal",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysFalse"
  },
  DropDistance = {
    AttrName = "DropDistance",
    DefaultValue = 1000,
    RoleAttrDisplay = "AlwaysFalse"
  },
  ESRates = {
    AttrName = "ESRates",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysFalse"
  },
  ESRecoverRate = {
    AttrName = "ESRecoverRate",
    DefaultValue = 0.05,
    RoleAttrDisplay = "AlwaysFalse"
  },
  ESRecoverTime = {
    AttrName = "ESRecoverTime",
    DefaultValue = 2,
    RoleAttrDisplay = "AlwaysFalse"
  },
  ESRecoverValue = {
    AttrName = "ESRecoverValue",
    DefaultValue = 15,
    RoleAttrDisplay = "AlwaysFalse"
  },
  EnmityValue = {
    AttrName = "EnmityValue",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysTrue"
  },
  ExcelWeaponTag = {
    AttrName = "ExcelWeaponTag",
    RoleAttrDisplay = "AlwaysTrue"
  },
  HitMontageRate = {
    AttrName = "HitMontageRate",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysFalse"
  },
  HpRates = {
    AttrName = "HpRates",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysFalse"
  },
  InitSp = {
    AttrName = "InitSp",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysFalse"
  },
  MaxAvoidExecuteTimes = {
    AttrName = "MaxAvoidExecuteTimes",
    DefaultValue = 2,
    RoleAttrDisplay = "AlwaysFalse"
  },
  MaxES = {
    AttrName = "MaxES",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysTrue"
  },
  MaxHp = {
    AttrName = "MaxHp",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysTrue"
  },
  MaxSp = {
    AttrName = "MaxSp",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysTrue"
  },
  MaxTN = {
    AttrName = "MaxTN",
    DefaultValue = 100,
    RoleAttrDisplay = "AlwaysFalse"
  },
  MonsterDamageRate = {
    AttrName = "MonsterDamageRate",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysFalse"
  },
  OverShieldLevelGrow = {
    AttrName = "OverShieldLevelGrow",
    DefaultValue = 75,
    RoleAttrDisplay = "AlwaysFalse"
  },
  PlayerDamagedRate = {
    AttrName = "PlayerDamagedRate",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysFalse"
  },
  Positioning = {
    AttrName = "Positioning",
    RoleAttrDisplay = "AlwaysTrue"
  },
  SPD = {
    AttrName = "SPD",
    DefaultValue = 600,
    RoleAttrDisplay = "AlwaysFalse"
  },
  SkillEfficiency = {
    AttrName = "SkillEfficiency",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysTrue"
  },
  SkillIntensity = {
    AttrName = "SkillIntensity",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysTrue"
  },
  SkillRange = {
    AttrName = "SkillRange",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysTrue"
  },
  SkillSpeed = {
    AttrName = "SkillSpeed",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysFalse"
  },
  SkillSustain = {
    AttrName = "SkillSustain",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysTrue"
  },
  SpRate = {
    AttrName = "SpRate",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysFalse"
  },
  SpRecoverRate = {
    AttrName = "SpRecoverRate",
    DefaultValue = 0.005,
    RoleAttrDisplay = "AlwaysFalse"
  },
  SpRecoverTime = {
    AttrName = "SpRecoverTime",
    DefaultValue = 3,
    RoleAttrDisplay = "AlwaysFalse"
  },
  SpRecoverValue = {
    AttrName = "SpRecoverValue",
    DefaultValue = 2,
    RoleAttrDisplay = "AlwaysFalse"
  },
  StrongValue = {
    AttrName = "StrongValue",
    DefaultValue = 0,
    RoleAttrDisplay = "AlwaysTrue"
  },
  TN = {
    AttrName = "TN",
    DefaultValue = 100,
    RoleAttrDisplay = "AlwaysFalse"
  },
  TNRecoverS = {
    AttrName = "TNRecoverS",
    DefaultValue = 50,
    RoleAttrDisplay = "AlwaysFalse"
  },
  TNRecoverTimeB = {
    AttrName = "TNRecoverTimeB",
    DefaultValue = 5,
    RoleAttrDisplay = "AlwaysFalse"
  },
  TNRecoverTimeZ = {
    AttrName = "TNRecoverTimeZ",
    DefaultValue = 0.2,
    RoleAttrDisplay = "AlwaysFalse"
  },
  TNResistance = {
    AttrName = "TNResistance",
    DefaultValue = 1,
    RoleAttrDisplay = "AlwaysFalse"
  }
})
