local T = {}
T.RT_1 = {110355}
T.RT_2 = {
  0,
  0,
  1
}
T.RT_3 = {110356}
T.RT_4 = {
  SpawnSocket = "Player_Part_Mouth",
  UseLocation = "Char"
}
T.RT_5 = {"Bullet"}
T.RT_6 = {
  1,
  0,
  1
}
T.RT_7 = {
  SpawnSocket = "gunpoint_01",
  UseLocation = "Weapon"
}
T.RT_8 = {2050631}
T.RT_9 = {2050632}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RayCreature", {
  [110301] = {
    AimUpdateEndLoc = true,
    AllowSkillRangeModify = true,
    CreatureId = 110301,
    DamageSource = 1,
    EffectMultiple = false,
    HitEnemy = T.RT_1,
    HitOthers = T.RT_2,
    HitScene = T.RT_3,
    LifeTime = 0.5,
    Radius = 50,
    RayFXID = 110301,
    RayLength = 2000,
    SpawnSocket = T.RT_4,
    Tags = T.RT_5
  },
  [110311] = {
    AimUpdateEndLoc = true,
    AllowSkillRangeModify = true,
    CreatureId = 110311,
    DamageSource = 1,
    EffectMultiple = false,
    HitEnemy = T.RT_1,
    HitOthers = T.RT_2,
    HitScene = T.RT_3,
    LifeTime = 0.5,
    Radius = 50,
    RayFXID = 110312,
    RayLength = 2000,
    SpawnSocket = T.RT_4,
    Tags = T.RT_5
  },
  [110312] = {
    AllowSkillRangeModify = true,
    CreatureId = 110312,
    DamageSource = 1,
    EffectMultiple = false,
    HitEnemy = {110357},
    HitOthers = {
      1,
      0,
      0
    },
    LifeTime = 0.5,
    Radius = 50,
    RayLength = 2000,
    SpawnSocket = T.RT_4,
    Tags = T.RT_5
  },
  [2050211] = {
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050211,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = {2050213, 2050218},
    HitOthers = T.RT_6,
    HitScene = {2050217},
    RayLength = 2900,
    SkillEffectsDelayTime = 0.1,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050311] = {
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050311,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = {2050314},
    HitOthers = T.RT_2,
    Radius = 10,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050411] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050411,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = {2050431},
    HitOthers = T.RT_6,
    HitScene = {2050434},
    LifeTime = 1,
    RayFXID = 2050401,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050412] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050412,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = {2050432},
    HitOthers = T.RT_6,
    HitScene = {2050435},
    LifeTime = 1,
    RayFXID = 2050402,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050413] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050413,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = {2050433},
    HitOthers = T.RT_6,
    HitScene = {2050436},
    LifeTime = 1,
    RayFXID = 2050403,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050511] = {
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050511,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = {2050514},
    HitOthers = T.RT_6,
    HitScene = {2050518},
    SkillEffectsDelayTime = 0.1,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050611] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050611,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = T.RT_8,
    HitOthers = T.RT_2,
    HitScene = T.RT_9,
    LifeTime = 1,
    RayFXID = 2050401,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050612] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050612,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = T.RT_8,
    HitOthers = T.RT_2,
    HitScene = T.RT_9,
    LifeTime = 1,
    RayFXID = 2050401,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050613] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050613,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = T.RT_8,
    HitOthers = T.RT_2,
    HitScene = T.RT_9,
    LifeTime = 1,
    RayFXID = 2050401,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [2050614] = {
    AimUpdateEndLoc = true,
    AllowAttackRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 2050614,
    EffectMultiple = true,
    FixDistanceByWeapon = true,
    HitEnemy = T.RT_8,
    HitOthers = T.RT_2,
    HitScene = T.RT_9,
    LifeTime = 1,
    RayFXID = 2050401,
    RayLength = 2000,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [4010104] = {
    AimUpdateEndLoc = true,
    AllowSkillRangeModify = true,
    AttackRangeType = "RayLength",
    CreatureId = 4010104,
    DamageSource = 1,
    EffectMultiple = false,
    HitEnemy = T.RT_1,
    HitOthers = T.RT_2,
    HitScene = T.RT_3,
    LifeTime = 0.5,
    Radius = 50,
    RayFXID = 110301,
    RayLength = 2000,
    Tags = T.RT_5
  },
  [4200101] = {
    AttackRangeType = "RayLength",
    CreatureId = 4200101,
    EffectMultiple = false,
    HitEnemy = {4200102},
    HitOthers = T.RT_6,
    HitScene = {4200103},
    RayLength = 2900,
    SpawnSocket = T.RT_7,
    Tags = T.RT_5
  },
  [4200201] = {
    AttackRangeType = "RayLength",
    CreatureId = 4200201,
    EffectMultiple = false,
    HitEnemy = {4200202},
    HitOthers = T.RT_6,
    Radius = 25,
    RayLength = 2000,
    SpawnSocket = {
      EffectCreatureId = 42002,
      SpawnSocket = "Root",
      UseLocation = "EffectCreature"
    },
    Tags = T.RT_5
  }
})
