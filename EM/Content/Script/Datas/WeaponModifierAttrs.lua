local T = {}
T.RT_1 = {
  "AttackRange_Bullet"
}
T.RT_2 = {
  "AttackRange_Normal"
}
T.RT_3 = {
  "AttackSpeed_FallAttack"
}
T.RT_4 = {
  "AttackSpeed_HeavyAttack"
}
T.RT_5 = {
  "AttackSpeed_Normal",
  "AttackSpeed_Reload",
  "AttackSpeed_FallAttack",
  "AttackSpeed_HeavyAttack",
  "AttackSpeed_SlideAttack"
}
T.RT_6 = {
  "AttackSpeed_Normal"
}
T.RT_7 = {
  "AttackSpeed_Reload"
}
T.RT_8 = {
  "AttackSpeed_SlideAttack"
}
T.RT_9 = {"MultiShoot"}
T.RT_10 = {
  "TriggerProbability"
}
T.RT_11 = {"CRD"}
T.RT_12 = {"CRI"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeaponModifierAttrs", {
  AttackRangeModifierRate_Bullet = {
    AttrNames = T.RT_1,
    RateAttr = "AttackRangeModifierRate_Bullet",
    ValueAttr = "AttackRangeModifierValue_Bullet",
    WeaponModifierAttr = "AttackRangeModifierRate_Bullet"
  },
  AttackRangeModifierRate_Normal = {
    AttrNames = T.RT_2,
    RateAttr = "AttackRangeModifierRate_Normal",
    ValueAttr = "AttackRangeModifierValue_Normal",
    WeaponModifierAttr = "AttackRangeModifierRate_Normal"
  },
  AttackRangeModifierRate_Ultra = {
    AttrNames = T.RT_2,
    RateAttr = "AttackRangeModifierRate_Ultra",
    ValueAttr = "AttackRangeModifierValue_Ultra",
    WeaponModifierAttr = "AttackRangeModifierRate_Ultra",
    WeaponTag = "Ultra"
  },
  AttackRangeModifierValue_Bullet = {
    AttrNames = T.RT_1,
    RateAttr = "AttackRangeModifierRate_Bullet",
    ValueAttr = "AttackRangeModifierValue_Bullet",
    WeaponModifierAttr = "AttackRangeModifierValue_Bullet"
  },
  AttackRangeModifierValue_Normal = {
    AttrNames = T.RT_2,
    RateAttr = "AttackRangeModifierRate_Normal",
    ValueAttr = "AttackRangeModifierValue_Normal",
    WeaponModifierAttr = "AttackRangeModifierValue_Normal"
  },
  AttackRangeModifierValue_Ultra = {
    AttrNames = T.RT_2,
    RateAttr = "AttackRangeModifierRate_Ultra",
    ValueAttr = "AttackRangeModifierValue_Ultra",
    WeaponModifierAttr = "AttackRangeModifierValue_Ultra",
    WeaponTag = "Ultra"
  },
  AttackSpeedModifierRate_FallAttack = {
    AttrNames = T.RT_3,
    RateAttr = "AttackSpeedModifierRate_FallAttack",
    ValueAttr = "AttackSpeedModifierValue_FallAttack",
    WeaponModifierAttr = "AttackSpeedModifierRate_FallAttack"
  },
  AttackSpeedModifierRate_HeavyAttack = {
    AttrNames = T.RT_4,
    RateAttr = "AttackSpeedModifierRate_HeavyAttack",
    ValueAttr = "AttackSpeedModifierValue_HeavyAttack",
    WeaponModifierAttr = "AttackSpeedModifierRate_HeavyAttack"
  },
  AttackSpeedModifierRate_Melee = {
    AttrNames = T.RT_5,
    RateAttr = "AttackSpeedModifierRate_Melee",
    ValueAttr = "AttackSpeedModifierValue_Melee",
    WeaponModifierAttr = "AttackSpeedModifierRate_Melee",
    WeaponTag = "Melee"
  },
  AttackSpeedModifierRate_Normal = {
    AttrNames = T.RT_6,
    RateAttr = "AttackSpeedModifierRate_Normal",
    ValueAttr = "AttackSpeedModifierValue_Normal",
    WeaponModifierAttr = "AttackSpeedModifierRate_Normal"
  },
  AttackSpeedModifierRate_Ranged = {
    AttrNames = T.RT_5,
    RateAttr = "AttackSpeedModifierRate_Ranged",
    ValueAttr = "AttackSpeedModifierValue_Ranged",
    WeaponModifierAttr = "AttackSpeedModifierRate_Ranged",
    WeaponTag = "Ranged"
  },
  AttackSpeedModifierRate_Reload = {
    AttrNames = T.RT_7,
    RateAttr = "AttackSpeedModifierRate_Reload",
    ValueAttr = "AttackSpeedModifierValue_Reload",
    WeaponModifierAttr = "AttackSpeedModifierRate_Reload"
  },
  AttackSpeedModifierRate_SlideAttack = {
    AttrNames = T.RT_8,
    RateAttr = "AttackSpeedModifierRate_SlideAttack",
    ValueAttr = "AttackSpeedModifierValue_SlideAttack",
    WeaponModifierAttr = "AttackSpeedModifierRate_SlideAttack"
  },
  AttackSpeedModifierValue_FallAttack = {
    AttrNames = T.RT_3,
    RateAttr = "AttackSpeedModifierRate_FallAttack",
    ValueAttr = "AttackSpeedModifierValue_FallAttack",
    WeaponModifierAttr = "AttackSpeedModifierValue_FallAttack"
  },
  AttackSpeedModifierValue_HeavyAttack = {
    AttrNames = T.RT_4,
    RateAttr = "AttackSpeedModifierRate_HeavyAttack",
    ValueAttr = "AttackSpeedModifierValue_HeavyAttack",
    WeaponModifierAttr = "AttackSpeedModifierValue_HeavyAttack"
  },
  AttackSpeedModifierValue_Melee = {
    AttrNames = T.RT_5,
    RateAttr = "AttackSpeedModifierRate_Melee",
    ValueAttr = "AttackSpeedModifierValue_Melee",
    WeaponModifierAttr = "AttackSpeedModifierValue_Melee",
    WeaponTag = "Melee"
  },
  AttackSpeedModifierValue_Normal = {
    AttrNames = T.RT_6,
    RateAttr = "AttackSpeedModifierRate_Normal",
    ValueAttr = "AttackSpeedModifierValue_Normal",
    WeaponModifierAttr = "AttackSpeedModifierValue_Normal"
  },
  AttackSpeedModifierValue_Ranged = {
    AttrNames = T.RT_5,
    RateAttr = "AttackSpeedModifierRate_Ranged",
    ValueAttr = "AttackSpeedModifierValue_Ranged",
    WeaponModifierAttr = "AttackSpeedModifierValue_Ranged",
    WeaponTag = "Ranged"
  },
  AttackSpeedModifierValue_Reload = {
    AttrNames = T.RT_7,
    RateAttr = "AttackSpeedModifierRate_Reload",
    ValueAttr = "AttackSpeedModifierValue_Reload",
    WeaponModifierAttr = "AttackSpeedModifierValue_Reload"
  },
  AttackSpeedModifierValue_SlideAttack = {
    AttrNames = T.RT_8,
    RateAttr = "AttackSpeedModifierRate_SlideAttack",
    ValueAttr = "AttackSpeedModifierValue_SlideAttack",
    WeaponModifierAttr = "AttackSpeedModifierValue_SlideAttack"
  },
  MultiShootModifierRate_Melee = {
    AttrNames = T.RT_9,
    RateAttr = "MultiShootModifierRate_Melee",
    ValueAttr = "MultiShootModifierValue_Melee",
    WeaponModifierAttr = "MultiShootModifierRate_Melee",
    WeaponTag = "Melee"
  },
  MultiShootModifierRate_Normal = {
    AttrNames = T.RT_9,
    RateAttr = "MultiShootModifierRate_Normal",
    ValueAttr = "MultiShootModifierValue_Normal",
    WeaponModifierAttr = "MultiShootModifierRate_Normal"
  },
  MultiShootModifierRate_Ranged = {
    AttrNames = T.RT_9,
    RateAttr = "MultiShootModifierRate_Ranged",
    ValueAttr = "MultiShootModifierValue_Ranged",
    WeaponModifierAttr = "MultiShootModifierRate_Ranged",
    WeaponTag = "Ranged"
  },
  MultiShootModifierValue_Melee = {
    AttrNames = T.RT_9,
    RateAttr = "MultiShootModifierRate_Melee",
    ValueAttr = "MultiShootModifierValue_Melee",
    WeaponModifierAttr = "MultiShootModifierValue_Melee",
    WeaponTag = "Melee"
  },
  MultiShootModifierValue_Normal = {
    AttrNames = T.RT_9,
    RateAttr = "MultiShootModifierRate_Normal",
    ValueAttr = "MultiShootModifierValue_Normal",
    WeaponModifierAttr = "MultiShootModifierValue_Normal"
  },
  MultiShootModifierValue_Ranged = {
    AttrNames = T.RT_9,
    RateAttr = "MultiShootModifierRate_Ranged",
    ValueAttr = "MultiShootModifierValue_Ranged",
    WeaponModifierAttr = "MultiShootModifierValue_Ranged",
    WeaponTag = "Ranged"
  },
  TriggerProbModifierRate_Melee = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Melee",
    ValueAttr = "TriggerProbModifierValue_Melee",
    WeaponModifierAttr = "TriggerProbModifierRate_Melee",
    WeaponTag = "Melee"
  },
  TriggerProbModifierRate_Normal = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Normal",
    ValueAttr = "TriggerProbModifierValue_Normal",
    WeaponModifierAttr = "TriggerProbModifierRate_Normal"
  },
  TriggerProbModifierRate_Ranged = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Ranged",
    ValueAttr = "TriggerProbModifierValue_Ranged",
    WeaponModifierAttr = "TriggerProbModifierRate_Ranged",
    WeaponTag = "Ranged"
  },
  TriggerProbModifierRate_Ultra = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Ultra",
    ValueAttr = "TriggerProbModifierValue_Ultra",
    WeaponModifierAttr = "TriggerProbModifierRate_Ultra",
    WeaponTag = "Ultra"
  },
  TriggerProbModifierValue_Melee = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Melee",
    ValueAttr = "TriggerProbModifierValue_Melee",
    WeaponModifierAttr = "TriggerProbModifierValue_Melee",
    WeaponTag = "Melee"
  },
  TriggerProbModifierValue_Normal = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Normal",
    ValueAttr = "TriggerProbModifierValue_Normal",
    WeaponModifierAttr = "TriggerProbModifierValue_Normal"
  },
  TriggerProbModifierValue_Ranged = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Ranged",
    ValueAttr = "TriggerProbModifierValue_Ranged",
    WeaponModifierAttr = "TriggerProbModifierValue_Ranged",
    WeaponTag = "Ranged"
  },
  TriggerProbModifierValue_Ultra = {
    AttrNames = T.RT_10,
    RateAttr = "TriggerProbModifierRate_Ultra",
    ValueAttr = "TriggerProbModifierValue_Ultra",
    WeaponModifierAttr = "TriggerProbModifierValue_Ultra",
    WeaponTag = "Ultra"
  },
  WeaponATKModifierRate = {
    AttrNames = {
      "ATK_Default",
      "ATK_Water",
      "ATK_Fire",
      "ATK_Wind",
      "ATK_Thunder",
      "ATK_Slash",
      "ATK_Spike",
      "ATK_Smash"
    },
    RateAttr = "WeaponATKModifierRate",
    ValueAttr = "WeaponATKModifierValue",
    WeaponModifierAttr = "WeaponATKModifierRate"
  },
  WeaponCRDModifierRate_Melee = {
    AttrNames = T.RT_11,
    RateAttr = "WeaponCRDModifierRate_Melee",
    ValueAttr = "WeaponCRDModifierValue_Melee",
    WeaponModifierAttr = "WeaponCRDModifierRate_Melee",
    WeaponTag = "Melee"
  },
  WeaponCRDModifierRate_Normal = {
    AttrNames = T.RT_11,
    RateAttr = "WeaponCRDModifierRate_Normal",
    ValueAttr = "WeaponCRDModifierValue_Normal",
    WeaponModifierAttr = "WeaponCRDModifierRate_Normal"
  },
  WeaponCRDModifierRate_Ranged = {
    AttrNames = T.RT_11,
    RateAttr = "WeaponCRDModifierRate_Ranged",
    ValueAttr = "WeaponCRDModifierValue_Ranged",
    WeaponModifierAttr = "WeaponCRDModifierRate_Ranged",
    WeaponTag = "Ranged"
  },
  WeaponCRDModifierValue_Melee = {
    AttrNames = T.RT_11,
    RateAttr = "WeaponCRDModifierRate_Melee",
    ValueAttr = "WeaponCRDModifierValue_Melee",
    WeaponModifierAttr = "WeaponCRDModifierValue_Melee",
    WeaponTag = "Melee"
  },
  WeaponCRDModifierValue_Normal = {
    AttrNames = T.RT_11,
    RateAttr = "WeaponCRDModifierRate_Normal",
    ValueAttr = "WeaponCRDModifierValue_Normal",
    WeaponModifierAttr = "WeaponCRDModifierValue_Normal"
  },
  WeaponCRDModifierValue_Ranged = {
    AttrNames = T.RT_11,
    RateAttr = "WeaponCRDModifierRate_Ranged",
    ValueAttr = "WeaponCRDModifierValue_Ranged",
    WeaponModifierAttr = "WeaponCRDModifierValue_Ranged",
    WeaponTag = "Ranged"
  },
  WeaponCRIModifierRate_Melee = {
    AttrNames = T.RT_12,
    RateAttr = "WeaponCRIModifierRate_Melee",
    ValueAttr = "WeaponCRIModifierValue_Melee",
    WeaponModifierAttr = "WeaponCRIModifierRate_Melee",
    WeaponTag = "Melee"
  },
  WeaponCRIModifierRate_Normal = {
    AttrNames = T.RT_12,
    RateAttr = "WeaponCRIModifierRate_Normal",
    ValueAttr = "WeaponCRIModifierValue_Normal",
    WeaponModifierAttr = "WeaponCRIModifierRate_Normal"
  },
  WeaponCRIModifierRate_Ranged = {
    AttrNames = T.RT_12,
    RateAttr = "WeaponCRIModifierRate_Ranged",
    ValueAttr = "WeaponCRIModifierValue_Ranged",
    WeaponModifierAttr = "WeaponCRIModifierRate_Ranged",
    WeaponTag = "Ranged"
  },
  WeaponCRIModifierValue_Melee = {
    AttrNames = T.RT_12,
    RateAttr = "WeaponCRIModifierRate_Melee",
    ValueAttr = "WeaponCRIModifierValue_Melee",
    WeaponModifierAttr = "WeaponCRIModifierValue_Melee",
    WeaponTag = "Melee"
  },
  WeaponCRIModifierValue_Normal = {
    AttrNames = T.RT_12,
    RateAttr = "WeaponCRIModifierRate_Normal",
    ValueAttr = "WeaponCRIModifierValue_Normal",
    WeaponModifierAttr = "WeaponCRIModifierValue_Normal"
  },
  WeaponCRIModifierValue_Ranged = {
    AttrNames = T.RT_12,
    RateAttr = "WeaponCRIModifierRate_Ranged",
    ValueAttr = "WeaponCRIModifierValue_Ranged",
    WeaponModifierAttr = "WeaponCRIModifierValue_Ranged",
    WeaponTag = "Ranged"
  }
})
