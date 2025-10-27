local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AttributeType", {
  AttackRange = {
    Bullet = {
      ID = "AttackRange",
      Type = "Bullet"
    },
    Normal = {
      ID = "AttackRange",
      Type = "Normal"
    }
  },
  AttackRangeModifierRate = {
    Bullet = {
      ID = "AttackRangeModifierRate",
      Type = "Bullet"
    },
    Normal = {
      ID = "AttackRangeModifierRate",
      Type = "Normal"
    },
    Ultra = {
      ID = "AttackRangeModifierRate",
      Type = "Ultra"
    }
  },
  AttackRangeModifierValue = {
    Bullet = {
      ID = "AttackRangeModifierValue",
      Type = "Bullet"
    },
    Normal = {
      ID = "AttackRangeModifierValue",
      Type = "Normal"
    },
    Ultra = {
      ID = "AttackRangeModifierValue",
      Type = "Ultra"
    }
  },
  AttackSpeed = {
    FallAttack = {
      ID = "AttackSpeed",
      Type = "FallAttack"
    },
    HeavyAttack = {
      ID = "AttackSpeed",
      Type = "HeavyAttack"
    },
    Melee = {
      ID = "AttackSpeed",
      Type = "Melee"
    },
    Normal = {
      ID = "AttackSpeed",
      Type = "Normal"
    },
    Ranged = {
      ID = "AttackSpeed",
      Type = "Ranged"
    },
    Reload = {
      ID = "AttackSpeed",
      Type = "Reload"
    },
    SlideAttack = {
      ID = "AttackSpeed",
      Type = "SlideAttack"
    }
  },
  AttackSpeedModifierRate = {
    FallAttack = {
      ID = "AttackSpeedModifierRate",
      Type = "FallAttack"
    },
    HeavyAttack = {
      ID = "AttackSpeedModifierRate",
      Type = "HeavyAttack"
    },
    Melee = {
      ID = "AttackSpeedModifierRate",
      Type = "Melee"
    },
    Normal = {
      ID = "AttackSpeedModifierRate",
      Type = "Normal"
    },
    Ranged = {
      ID = "AttackSpeedModifierRate",
      Type = "Ranged"
    },
    Reload = {
      ID = "AttackSpeedModifierRate",
      Type = "Reload"
    },
    SlideAttack = {
      ID = "AttackSpeedModifierRate",
      Type = "SlideAttack"
    }
  },
  AttackSpeedModifierValue = {
    FallAttack = {
      ID = "AttackSpeedModifierValue",
      Type = "FallAttack"
    },
    HeavyAttack = {
      ID = "AttackSpeedModifierValue",
      Type = "HeavyAttack"
    },
    Melee = {
      ID = "AttackSpeedModifierValue",
      Type = "Melee"
    },
    Normal = {
      ID = "AttackSpeedModifierValue",
      Type = "Normal"
    },
    Ranged = {
      ID = "AttackSpeedModifierValue",
      Type = "Ranged"
    },
    Reload = {
      ID = "AttackSpeedModifierValue",
      Type = "Reload"
    },
    SlideAttack = {
      ID = "AttackSpeedModifierValue",
      Type = "SlideAttack"
    }
  },
  BonusDamage = {
    Dark = {
      ID = "BonusDamage",
      Type = "Dark"
    },
    FallAttack = {
      ID = "BonusDamage",
      Type = "FallAttack"
    },
    Fire = {
      ID = "BonusDamage",
      Type = "Fire"
    },
    Light = {
      ID = "BonusDamage",
      Type = "Light"
    },
    Thunder = {
      ID = "BonusDamage",
      Type = "Thunder"
    },
    Water = {
      ID = "BonusDamage",
      Type = "Water"
    },
    Wind = {
      ID = "BonusDamage",
      Type = "Wind"
    }
  },
  DamageRate = {
    BossDown = {ID = "DamageRate", Type = "BossDown"},
    Enmity = {ID = "DamageRate", Type = "Enmity"},
    HeavyAttack = {
      ID = "DamageRate",
      Type = "HeavyAttack"
    },
    Normal = {ID = "DamageRate", Type = "Normal"},
    Phantom = {ID = "DamageRate", Type = "Phantom"},
    Skill1 = {ID = "DamageRate", Type = "Skill1"},
    Skill2 = {ID = "DamageRate", Type = "Skill2"},
    Strong = {ID = "DamageRate", Type = "Strong"}
  },
  DamagedRate = {
    BossDown = {
      ID = "DamagedRate",
      Type = "BossDown"
    },
    Enmity = {
      ID = "DamagedRate",
      Type = "Enmity"
    },
    HeavyAttack = {
      ID = "DamagedRate",
      Type = "HeavyAttack"
    },
    Normal = {
      ID = "DamagedRate",
      Type = "Normal"
    },
    Phantom = {
      ID = "DamagedRate",
      Type = "Phantom"
    },
    Skill1 = {
      ID = "DamagedRate",
      Type = "Skill1"
    },
    Skill2 = {
      ID = "DamagedRate",
      Type = "Skill2"
    },
    Strong = {
      ID = "DamagedRate",
      Type = "Strong"
    }
  },
  MultiShootModifierRate = {
    Melee = {
      ID = "MultiShootModifierRate",
      Type = "Melee"
    },
    Normal = {
      ID = "MultiShootModifierRate",
      Type = "Normal"
    },
    Ranged = {
      ID = "MultiShootModifierRate",
      Type = "Ranged"
    }
  },
  MultiShootModifierValue = {
    Melee = {
      ID = "MultiShootModifierValue",
      Type = "Melee"
    },
    Normal = {
      ID = "MultiShootModifierValue",
      Type = "Normal"
    },
    Ranged = {
      ID = "MultiShootModifierValue",
      Type = "Ranged"
    }
  },
  TriggerProbModifierRate = {
    Melee = {
      ID = "TriggerProbModifierRate",
      Type = "Melee"
    },
    Normal = {
      ID = "TriggerProbModifierRate",
      Type = "Normal"
    },
    Ranged = {
      ID = "TriggerProbModifierRate",
      Type = "Ranged"
    },
    Ultra = {
      ID = "TriggerProbModifierRate",
      Type = "Ultra"
    }
  },
  TriggerProbModifierValue = {
    Melee = {
      ID = "TriggerProbModifierValue",
      Type = "Melee"
    },
    Normal = {
      ID = "TriggerProbModifierValue",
      Type = "Normal"
    },
    Ranged = {
      ID = "TriggerProbModifierValue",
      Type = "Ranged"
    },
    Ultra = {
      ID = "TriggerProbModifierValue",
      Type = "Ultra"
    }
  },
  WeaponCRDModifierRate = {
    Melee = {
      ID = "WeaponCRDModifierRate",
      Type = "Melee"
    },
    Normal = {
      ID = "WeaponCRDModifierRate",
      Type = "Normal"
    },
    Ranged = {
      ID = "WeaponCRDModifierRate",
      Type = "Ranged"
    }
  },
  WeaponCRDModifierValue = {
    Melee = {
      ID = "WeaponCRDModifierValue",
      Type = "Melee"
    },
    Normal = {
      ID = "WeaponCRDModifierValue",
      Type = "Normal"
    },
    Ranged = {
      ID = "WeaponCRDModifierValue",
      Type = "Ranged"
    }
  },
  WeaponCRIModifierRate = {
    Melee = {
      ID = "WeaponCRIModifierRate",
      Type = "Melee"
    },
    Normal = {
      ID = "WeaponCRIModifierRate",
      Type = "Normal"
    },
    Ranged = {
      ID = "WeaponCRIModifierRate",
      Type = "Ranged"
    }
  },
  WeaponCRIModifierValue = {
    Melee = {
      ID = "WeaponCRIModifierValue",
      Type = "Melee"
    },
    Normal = {
      ID = "WeaponCRIModifierValue",
      Type = "Normal"
    },
    Ranged = {
      ID = "WeaponCRIModifierValue",
      Type = "Ranged"
    }
  }
})
