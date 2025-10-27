local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DamageType", {
  Dark = {
    AdditionalBuff = {BuffId = 101, LastTime = 6},
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Dark02.T_Battle_Type_Dark02",
    ID = "Dark",
    ParticipationTrigger = true,
    ShildCalPriority = 2,
    WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Light.T_Armory_Light",
    WeaknessTypeID = 1
  },
  Default = {
    ID = "Default",
    ShildCalPriority = 2,
    WeaknessTypeID = 0
  },
  EsDamage = {
    DisableAddColor = 1,
    ID = "EsDamage",
    IgnoreHp = 1,
    ShildCalPriority = 2
  },
  Fire = {
    AdditionalBuff = {BuffId = 103, LastTime = 6},
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Fire02.T_Battle_Type_Fire02",
    DamageTypeUIIndex = 2,
    ID = "Fire",
    ParticipationTrigger = true,
    ShildCalPriority = 2,
    WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Wind.T_Armory_Wind",
    WeaknessTypeID = 3
  },
  HpConsume = {
    DisableAddColor = 1,
    DisablePassiveEffect = true,
    DisableUIEffect = 1,
    ID = "HpConsume",
    IgnoreDamageRate = true,
    IgnoreEnergyShield = true,
    IgnoreInvincible = true,
    ShildCalPriority = 2
  },
  Light = {
    AdditionalBuff = {BuffId = 106, LastTime = 6},
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Light02.T_Battle_Type_Light02",
    ID = "Light",
    ParticipationTrigger = true,
    ShildCalPriority = 2,
    WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Dark.T_Armory_Dark",
    WeaknessTypeID = 6
  },
  SaiqiHpConsume = {
    DisableAddColor = 1,
    DisableUIEffect = 1,
    ID = "SaiqiHpConsume",
    IgnoreDamageRate = true,
    IgnoreEnergyShield = true,
    IgnoreInvincible = true,
    ShildCalPriority = 2
  },
  Slash = {
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Slash02.T_Battle_Type_Slash02",
    DamageTypeUIIndex = 5,
    ESRate = 1,
    ID = "Slash",
    ParticipationTrigger = true,
    ShildCalPriority = 1
  },
  Smash = {
    CutToughnessRate = 1,
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Smash02.T_Battle_Type_Smash02",
    DamageTypeUIIndex = 7,
    ID = "Smash",
    ParticipationTrigger = true,
    ShildCalPriority = 2
  },
  Spike = {
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Spike02.T_Battle_Type_Spike02",
    DamageTypeUIIndex = 6,
    HpRate = 0.5,
    ID = "Spike",
    ParticipationTrigger = true,
    ShildCalPriority = 3
  },
  Thunder = {
    AdditionalBuff = {BuffId = 104, LastTime = 6},
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Thunder02.T_Battle_Type_Thunder02",
    DamageTypeUIIndex = 3,
    ID = "Thunder",
    ParticipationTrigger = true,
    ShildCalPriority = 2,
    WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Water.T_Armory_Water",
    WeaknessTypeID = 4
  },
  TrueDamage = {
    DisableAddColor = 1,
    DisablePassiveEffect = true,
    ID = "TrueDamage",
    IgnoreDamageRate = true,
    IgnoreEnergyShield = true,
    ShildCalPriority = 2
  },
  Water = {
    AdditionalBuff = {BuffId = 102, LastTime = 6},
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Water02.T_Battle_Type_Water02",
    DamageTypeUIIndex = 4,
    ID = "Water",
    ParticipationTrigger = true,
    ShildCalPriority = 2,
    WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Fire.T_Armory_Fire",
    WeaknessTypeID = 2
  },
  Wind = {
    AdditionalBuff = {BuffId = 105, LastTime = 6},
    DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Wind02.T_Battle_Type_Wind02",
    DamageTypeUIIndex = 1,
    ID = "Wind",
    ParticipationTrigger = true,
    ShildCalPriority = 2,
    WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Thunder.T_Armory_Thunder",
    WeaknessTypeID = 5
  }
})
