local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleWeaponAttr", {
  ATK_Dark = {
    AttrName = "ATK_Dark",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Default = {
    AttrName = "ATK_Default",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Fire = {
    AttrName = "ATK_Fire",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Light = {
    AttrName = "ATK_Light",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Slash = {
    AttrName = "ATK_Slash",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Smash = {
    AttrName = "ATK_Smash",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Spike = {
    AttrName = "ATK_Spike",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Thunder = {
    AttrName = "ATK_Thunder",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Water = {
    AttrName = "ATK_Water",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  ATK_Wind = {
    AttrName = "ATK_Wind",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  AttackRange_Bullet = {
    AttrName = "AttackRange_Bullet",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  AttackRange_Normal = {
    AttrName = "AttackRange_Normal",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "AlwaysFalse",
    UltraWeaponInherit = 1
  },
  AttackSpeed_FallAttack = {
    AttrName = "AttackSpeed_FallAttack",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  AttackSpeed_HeavyAttack = {
    AttrName = "AttackSpeed_HeavyAttack",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  AttackSpeed_Normal = {
    AttrName = "AttackSpeed_Normal",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "AlwaysTrue",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  },
  AttackSpeed_Reload = {
    AttrName = "AttackSpeed_Reload",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  AttackSpeed_SlideAttack = {
    AttrName = "AttackSpeed_SlideAttack",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  BulletConver = {
    AttrName = "BulletConver",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  },
  BulletInit = {
    AttrName = "BulletInit",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse",
    UltraWeaponInherit = 1
  },
  BulletMax = {
    AttrName = "BulletMax",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "OnlyModified",
    UltraWeaponInherit = 1
  },
  BulletSpeed = {
    AttrName = "BulletSpeed",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  CRD = {
    AttrName = "CRD",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysTrue",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  },
  CRI = {
    AttrName = "CRI",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysTrue",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  },
  ComboHoldTime = {
    AttrName = "ComboHoldTime",
    DefaultValue = 10,
    MeleeWeaponAttrDisplay = "OnlyModified",
    RangedWeaponAttrDisplay = "AlwaysFalse",
    UltraWeaponInherit = 1
  },
  ExplodeBulletRate = {
    AttrName = "ExplodeBulletRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  ExtraComboLevel = {
    AttrName = "ExtraComboLevel",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  ExtraComboProb = {
    AttrName = "ExtraComboProb",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  FallAttackRate = {
    AttrName = "FallAttackRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  GrRate = {
    AttrName = "GrRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  JhRate = {
    AttrName = "JhRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  JtRate = {
    AttrName = "JtRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  MagazineCapacity = {
    AttrName = "MagazineCapacity",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  },
  MaxComboCount = {
    AttrName = "MaxComboCount",
    DefaultValue = 120,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse",
    UltraWeaponInherit = 1
  },
  MultiShoot = {
    AttrName = "MultiShoot",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  },
  RayCreatureRate = {
    AttrName = "RayCreatureRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  RayLength = {
    AttrName = "RayLength",
    DefaultValue = 1,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  SlideAttackRate = {
    AttrName = "SlideAttackRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  SqRate = {
    AttrName = "SqRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  TriggerEsRate = {
    AttrName = "TriggerEsRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  TriggerHpRate = {
    AttrName = "TriggerHpRate",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysFalse",
    RangedWeaponAttrDisplay = "AlwaysFalse"
  },
  TriggerProbability = {
    AttrName = "TriggerProbability",
    DefaultValue = 0,
    MeleeWeaponAttrDisplay = "AlwaysTrue",
    RangedWeaponAttrDisplay = "AlwaysTrue",
    UltraWeaponInherit = 1
  }
})
