local T = {}
T.RT_1 = {"Default"}
T.RT_2 = {
  DamageType = T.RT_1
}
T.RT_3 = {"Melee"}
T.RT_4 = {
  DamageTag = T.RT_3
}
T.RT_5 = {"Ranged"}
T.RT_6 = {
  DamageTag = T.RT_5
}
T.RT_7 = {LimitTime = 3}
T.RT_8 = {AllPhantom = 1}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleAchiTargetType", {
  [1] = {
    Id = 1,
    TargetType = "BluePrintTrigger"
  },
  [1001] = {
    Args = T.RT_2,
    Id = 1001,
    TargetType = "Heal"
  },
  [1010] = {
    Args = {
      DamageType = {"Light"}
    },
    Id = 1010,
    TargetType = "Damage"
  },
  [1011] = {
    Args = {
      DamageType = {"Dark"}
    },
    Id = 1011,
    TargetType = "Damage"
  },
  [1012] = {
    Args = {
      DamageType = {"Water"}
    },
    Id = 1012,
    TargetType = "Damage"
  },
  [1013] = {
    Args = {
      DamageType = {"Fire"}
    },
    Id = 1013,
    TargetType = "Damage"
  },
  [1014] = {
    Args = {
      DamageType = {"Thunder"}
    },
    Id = 1014,
    TargetType = "Damage"
  },
  [1015] = {
    Args = {
      DamageType = {"Wind"}
    },
    Id = 1015,
    TargetType = "Damage"
  },
  [1016] = {
    Args = {
      DamageType = {"Slash"}
    },
    Id = 1016,
    TargetType = "Damage"
  },
  [1017] = {
    Args = {
      DamageType = {"Spike"}
    },
    Id = 1017,
    TargetType = "Damage"
  },
  [1018] = {
    Args = {
      DamageType = {"Smash"}
    },
    Id = 1018,
    TargetType = "Damage"
  },
  [1021] = {
    Args = T.RT_2,
    Id = 1021,
    TargetType = "Heal"
  },
  [1022] = {
    Args = {
      DamageTag = {"Weapon"}
    },
    Id = 1022,
    TargetType = "Damage"
  },
  [1023] = {
    Args = {
      DamageTag = {"Skill"}
    },
    Id = 1023,
    TargetType = "Damage"
  },
  [1024] = {
    Args = T.RT_4,
    Id = 1024,
    TargetType = "Damage"
  },
  [1025] = {
    Args = T.RT_6,
    Id = 1025,
    TargetType = "Damage"
  },
  [1026] = {
    Args = {
      DamageTag = {"RouB105"}
    },
    Id = 1026,
    TargetType = "Damage"
  },
  [1027] = {
    Args = {
      DamageTag = {"RouB106"}
    },
    Id = 1027,
    TargetType = "Damage"
  },
  [1028] = {
    Args = {
      DamageTag = {"RouB104"}
    },
    Id = 1028,
    TargetType = "Damage"
  },
  [2000] = {
    Id = 2000,
    TargetType = "OnTargetKilled"
  },
  [2001] = {
    Args = {
      Tag = {"Mon.Gr"}
    },
    Id = 2001,
    TargetType = "OnTargetKilled"
  },
  [2002] = {
    Args = {
      Tag = {"Mon.Jt"}
    },
    Id = 2002,
    TargetType = "OnTargetKilled"
  },
  [2003] = {
    Args = {
      Tag = {"Mon.Jh"}
    },
    Id = 2003,
    TargetType = "OnTargetKilled"
  },
  [2004] = {
    Args = {
      Tag = {"Mon.Strong"}
    },
    Id = 2004,
    TargetType = "OnTargetKilled"
  },
  [2005] = {
    Args = {
      Tag = {"Mon.Sq"}
    },
    Id = 2005,
    TargetType = "OnTargetKilled"
  },
  [2006] = {
    Args = {
      Tag = {
        "Mon.Strong.Double"
      }
    },
    Id = 2006,
    TargetType = "OnTargetKilled"
  },
  [2007] = {
    Args = {
      Tag = {
        "Mon.Strong.Triple"
      }
    },
    Id = 2007,
    TargetType = "OnTargetKilled"
  },
  [2008] = {
    Args = {
      Tag = {
        "Mon.Treasure"
      }
    },
    Id = 2008,
    TargetType = "OnTargetKilled"
  },
  [2011] = {
    Args = T.RT_4,
    Id = 2011,
    TargetType = "OnTargetKilled"
  },
  [2012] = {
    Args = T.RT_6,
    Id = 2012,
    TargetType = "OnTargetKilled"
  },
  [2013] = {
    Args = {
      DamageTag = {"FallAttack"}
    },
    Id = 2013,
    TargetType = "OnTargetKilled"
  },
  [2014] = {
    Args = {
      DamageTag = {
        "HeavyAttack"
      }
    },
    Id = 2014,
    TargetType = "OnTargetKilled"
  },
  [2015] = {
    Args = {
      DamageTag = {
        "SlideAttack"
      }
    },
    Id = 2015,
    TargetType = "OnTargetKilled"
  },
  [2016] = {
    Args = {
      DamageTag = {"Ray"}
    },
    Id = 2016,
    TargetType = "OnTargetKilled"
  },
  [2017] = {
    Args = {
      DamageTag = {"Explode"}
    },
    Id = 2017,
    TargetType = "OnTargetKilled"
  },
  [2021] = {
    Args = T.RT_7,
    Id = 2021,
    TargetType = "LimitTimeKillMonster"
  },
  [2022] = {
    Args = T.RT_7,
    Id = 2022,
    TargetType = "LimitTimeUseNormalSkill"
  },
  [2023] = {
    Args = {LimitTime = 6},
    Id = 2023,
    TargetType = "LimitTimeUseUltraSkill"
  },
  [2024] = {
    Args = {
      BuffType = {
        101,
        102,
        103,
        104,
        105,
        106
      },
      LimitTime = 3
    },
    Id = 2024,
    TargetType = "LimitTimeAddBuff"
  },
  [2031] = {
    Id = 2031,
    TargetType = "PlayerUseNormalSkill"
  },
  [2032] = {
    Id = 2032,
    TargetType = "PlayerUseUltraSkill"
  },
  [2033] = {
    Id = 2033,
    TargetType = "PlayerUseSupportSkill"
  },
  [2041] = {
    Id = 2041,
    TargetType = "BluePrintTrigger"
  },
  [2042] = {
    Id = 2042,
    TargetType = "BluePrintTrigger"
  },
  [2043] = {
    Id = 2043,
    TargetType = "BluePrintTrigger"
  },
  [2044] = {
    Id = 2044,
    TargetType = "BluePrintTrigger"
  },
  [2045] = {
    Id = 2045,
    TargetType = "BluePrintTrigger"
  },
  [2046] = {
    Id = 2046,
    TargetType = "BluePrintTrigger"
  },
  [2047] = {
    Id = 2047,
    TargetType = "BluePrintTrigger"
  },
  [2051] = {
    Args = {
      UnitId = {70010051}
    },
    Id = 2051,
    TargetType = "OnTargetKilled"
  },
  [2052] = {
    Id = 2052,
    TargetType = "BluePrintTrigger"
  },
  [2053] = {
    Args = {
      BuffType = {203},
      CampFilter = "Monster"
    },
    Id = 2053,
    TargetType = "OnMonsterAddedBuff"
  },
  [2101] = {
    Id = 2101,
    TargetType = "BluePrintTrigger"
  },
  [2102] = {
    Id = 2102,
    TargetType = "BluePrintTrigger"
  },
  [2103] = {
    Id = 2103,
    TargetType = "BluePrintTrigger"
  },
  [2104] = {
    Id = 2104,
    TargetType = "BluePrintTrigger"
  },
  [2105] = {
    Id = 2105,
    TargetType = "BluePrintTrigger"
  },
  [2106] = {
    Id = 2106,
    TargetType = "BluePrintTrigger"
  },
  [2107] = {
    Id = 2107,
    TargetType = "BluePrintTrigger"
  },
  [2201] = {
    Args = {
      UnitId = {
        10004001,
        10004061,
        10004062
      }
    },
    Id = 2201,
    TargetType = "OnTargetKilled"
  },
  [2202] = {
    Args = {
      UnitId = {
        10001001,
        10001061,
        10001062,
        10002001
      }
    },
    Id = 2202,
    TargetType = "OnTargetKilled"
  },
  [2203] = {
    Args = {
      UnitId = {8510002}
    },
    Id = 2203,
    TargetType = "OnTargetKilled"
  },
  [2204] = {
    Args = {
      UnitId = {8518001}
    },
    Id = 2204,
    TargetType = "OnTargetKilled"
  },
  [2205] = {
    Args = {
      UnitId = {8517001}
    },
    Id = 2205,
    TargetType = "OnTargetKilled"
  },
  [3001] = {
    Args = {
      ExceptSkillType = {"Condemn"}
    },
    Id = 3001,
    TargetType = "DamageOnDefeated"
  },
  [3011] = {
    Id = 3011,
    TargetType = "AddOverEnergyShield"
  },
  [3012] = {
    Id = 3012,
    TargetType = "OnRecoverTeammate"
  },
  [3021] = {
    CombatConditionId = 34,
    Id = 3021,
    TargetType = "PlayerMove"
  },
  [3031] = {
    Args = {
      BuffType = {102},
      CampFilter = "Enemy"
    },
    Id = 3031,
    TargetType = "OnBuffRemovedFromTarget"
  },
  [3032] = {
    Args = {
      BuffType = {103},
      CampFilter = "Enemy"
    },
    Id = 3032,
    TargetType = "OnBuffRemovedFromTarget"
  },
  [3033] = {
    Args = {
      BuffType = {104},
      CampFilter = "Enemy"
    },
    Id = 3033,
    TargetType = "OnBuffRemovedFromTarget"
  },
  [3034] = {
    Args = {
      BuffType = {105},
      CampFilter = "Enemy"
    },
    Id = 3034,
    TargetType = "OnBuffRemovedFromTarget"
  },
  [3035] = {
    Args = {
      BuffType = {101},
      CampFilter = "Enemy"
    },
    Id = 3035,
    TargetType = "OnBuffRemovedFromTarget"
  },
  [3036] = {
    Args = {
      BuffType = {106},
      CampFilter = "Enemy"
    },
    Id = 3036,
    TargetType = "OnBuffRemovedFromTarget"
  },
  [3041] = {
    Id = 3041,
    TargetType = "OnAddPhantom"
  },
  [3042] = {
    Id = 3042,
    RoleIdConstraints = T.RT_8,
    TargetType = "Damage"
  },
  [3043] = {
    Args = T.RT_2,
    Id = 3043,
    RoleIdConstraints = T.RT_8,
    TargetType = "Heal"
  },
  [3044] = {
    Id = 3044,
    RoleIdConstraints = T.RT_8,
    TargetType = "Damaged"
  },
  [5001] = {
    Id = 5001,
    TargetType = "OnFinishHardBoss"
  },
  [5011] = {
    Id = 5011,
    TargetType = "OnDungeonEndWithoutPhantom"
  },
  [5021] = {
    Id = 5021,
    TargetType = "OnDungeonEndWithoutPhantom"
  },
  [5031] = {
    Id = 5031,
    TargetType = "OnTargetKilled",
    TopProgressLimit = true
  },
  [5041] = {
    Id = 5041,
    TargetType = "ClearWithoutPhantomAndDamaged"
  },
  [5051] = {
    Id = 5051,
    TargetType = "BluePrintTrigger"
  },
  [5052] = {
    Id = 5052,
    TargetType = "BluePrintTrigger"
  },
  [5053] = {
    Id = 5053,
    TargetType = "BluePrintTrigger"
  }
})
