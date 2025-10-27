local T = {}
T.RT_1 = {
  X = -75,
  Y = 0,
  Z = -150
}
T.RT_2 = {
  ActiveCommonUI = 1,
  Offset = T.RT_1,
  ScaleRateX = 2,
  ScaleRateY = 1.5,
  ShowLevel = false
}
T.RT_3 = {ActiveCommonUI = 0}
T.RT_4 = {ActiveCommonUI = 1, HeightOffset = 100}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MechanismSummon", {
  [1] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/BP_MechanismSummon_Test1.BP_MechanismSummon_Test1",
    UnitId = 1
  },
  [10001] = {
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Nvzhu_Summon.BP_Nvzhu_Summon",
    UnitId = 10001
  },
  [110202] = {
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Fuluo_Skill02Ring.BP_Fuluo_Skill02Ring",
    UnitId = 110202
  },
  [150302] = {
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/Bp_Kezhou_ShadowSword_Control.Bp_Kezhou_ShadowSword_Control",
    UnitId = 150302
  },
  [310201] = {
    BluePrintParams = {
      AddValue = 0.2,
      BaseValue = 0.3,
      FunnelClass = 0,
      Grade6BuffDamageRate = 1.6,
      InfoLaserLength = 1000
    },
    DisableBuff = true,
    ModelId = 310201,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Xier_Funnel.BP_Xier_Funnel",
    UnitId = 310201
  },
  [310202] = {
    BluePrintParams = {
      AddValue = 0.2,
      BaseValue = 0.3,
      FunnelClass = 1,
      Grade6BuffDamageRate = 1.6,
      InfoLaserLength = 1000
    },
    DisableBuff = true,
    ModelId = 310202,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Xier_Funnel.BP_Xier_Funnel",
    UnitId = 310202
  },
  [310303] = {
    DamageSource = true,
    DelayDestroyTime = 1,
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Yeer_Summoned02.BP_Yeer_Summoned02",
    UnitId = 310303
  },
  [420201] = {
    BattleRoleId = 420201,
    DelayDestroyTime = 1,
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Landi_Skill01_Summon.BP_Landi_Skill01_Summon",
    UnitId = 420201
  },
  [600101] = {
    BluePrintParams = {
      BuffId = 600101,
      SkillEffectIdEnter = 600106,
      SkillEffectIdExit = 600107
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_6Jichong_Skill01.BP_6Jichong_Skill01",
    UnitId = 600101
  },
  [600501] = {
    BluePrintParams = {SkillEffectId = 600505},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Gr_Longcao_Field01.BP_Gr_Longcao_Field01",
    UnitId = 600501
  },
  [850061] = {
    BluePrintParams = {DamageInterval = 0.25, SkillEffectId = 8500168},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Xibi_Skill06_Field02.BP_Boss_Xibi_Skill06_Field02",
    UnitId = 850061
  },
  [850062] = {
    BluePrintParams = {DamageInterval = 0.25, SkillEffectId = 8500169},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Xibi_Skill06_Field03.BP_Boss_Xibi_Skill06_Field03",
    UnitId = 850062
  },
  [850063] = {
    BluePrintParams = {DamageInterval = 0.25, SkillEffectId = 8500195},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Xibi_Skill06_Field04.BP_Boss_Xibi_Skill06_Field04",
    UnitId = 850063
  },
  [850064] = {
    BluePrintParams = {DamageInterval = 0.25, SkillEffectId = 8500197},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Xibi_Skill06_Field05.BP_Boss_Xibi_Skill06_Field05",
    UnitId = 850064
  },
  [850065] = {
    BluePrintParams = {DamageInterval = 0.25, SkillEffectId = 8500199},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Xibi_Skill06_Field06.BP_Boss_Xibi_Skill06_Field06",
    UnitId = 850065
  },
  [850201] = {
    BluePrintParams = {
      Speed = 600,
      TargetFilter = "BossSaiqi_Skill23_Cylinder_3500_1000_360",
      TotalTime = 19
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Rouge_Wind.BP_Rouge_Wind",
    UnitId = 850201
  },
  [850281] = {
    BluePrintParams = {
      BuffId = 850204,
      SkillEffectIdEnter = 8502125,
      SkillEffectIdExit = 8502126
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Saiqi_Skill08.BP_Boss_Saiqi_Skill08",
    UnitId = 850281
  },
  [850291] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Saiqi_Shield.BP_Boss_Saiqi_Shield",
    UnitId = 850291
  },
  [850311] = {
    BattleRoleId = 8503011,
    BloodUIParmas = T.RT_2,
    IsShowJumpWord = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Shijingzhe_JointFoot_L.BP_Boss_Shijingzhe_JointFoot_L",
    UnitId = 850311
  },
  [850312] = {
    BattleRoleId = 8503011,
    BloodUIParmas = {
      ActiveCommonUI = 1,
      Offset = {
        X = -70,
        Y = -50,
        Z = -150
      },
      ScaleRateX = 2,
      ScaleRateY = 1.5,
      ShowLevel = false
    },
    IsShowJumpWord = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Shijingzhe_JointArm_L.BP_Boss_Shijingzhe_JointArm_L",
    UnitId = 850312
  },
  [850313] = {
    BattleRoleId = 8503011,
    BloodUIParmas = T.RT_2,
    IsShowJumpWord = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Shijingzhe_JointFoot_R.BP_Boss_Shijingzhe_JointFoot_R",
    UnitId = 850313
  },
  [850314] = {
    BattleRoleId = 8503011,
    BloodUIParmas = {
      ActiveCommonUI = 1,
      Offset = {
        X = -70,
        Y = 50,
        Z = -150
      },
      ScaleRateX = 2,
      ScaleRateY = 1.5,
      ShowLevel = false
    },
    IsShowJumpWord = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Shijingzhe_JointArm_R.BP_Boss_Shijingzhe_JointArm_R",
    UnitId = 850314
  },
  [850315] = {
    BattleRoleId = 8503011,
    BloodUIParmas = T.RT_3,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Shijingzhe_Skill15Sign.BP_Boss_Shijingzhe_Skill15Sign",
    UnitId = 850315
  },
  [850316] = {
    BattleRoleId = 8503012,
    BloodUIParmas = T.RT_3,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Shijingzhe_Skill15Pillar.BP_Boss_Shijingzhe_Skill15Pillar",
    UnitId = 850316
  },
  [850401] = {
    BluePrintParams = {
      BuffId = 850404,
      SkillEffectIdEnter = 850433,
      SkillEffectIdExit = 850434
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Saiqi02_Skill13.BP_Boss_Saiqi02_Skill13",
    UnitId = 850401
  },
  [850402] = {
    BattleRoleId = 40004,
    BloodUIParmas = T.RT_4,
    IsShowJumpWord = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Saiqi02_Standing.BP_Boss_Saiqi02_Standing",
    UnitId = 850402
  },
  [850403] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Saiqi02_Shield.BP_Boss_Saiqi02_Shield",
    UnitId = 850403
  },
  [850404] = {
    BluePrintParams = {Yaw = 180},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Saiqi02_Shield.BP_Boss_Saiqi02_Shield",
    UnitId = 850404
  },
  [850501] = {
    BluePrintParams = {DamageInterval = 0.25, SkillEffectId = 850537},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Lianhuo_Skill08_Field.BP_Boss_Lianhuo_Skill08_Field",
    UnitId = 850501
  },
  [850502] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Lianhuo_Skill03.BP_Boss_Lianhuo_Skill03",
    UnitId = 850502
  },
  [850901] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Tuosi_Skill08_Field01.BP_Boss_Tuosi_Skill08_Field01",
    UnitId = 850901
  },
  [851001] = {
    BloodUIParmas = T.RT_4,
    IsSeekEnemyEnable = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Heilong_FireBall.BP_Boss_Heilong_FireBall",
    UnitId = 851001
  },
  [851002] = {UnitId = 851002},
  [851101] = {
    BloodUIParmas = T.RT_4,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Bailong_IceBall.BP_Boss_Bailong_IceBall",
    UnitId = 851101
  },
  [851201] = {
    BattleRoleId = 8512021,
    BloodUIParmas = {
      ActiveCommonUI = 1,
      ScaleRateX = 2,
      ScaleRateY = 1.5,
      ShowLevel = false
    },
    DelayDestroyTime = 0.5,
    DisableBuff = true,
    IsShowJumpWord = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_AirShield.BP_Boss_Linen_AirShield",
    UnitId = 851201
  },
  [851202] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {Skill09Funnel = 1},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPFunnel_1.BP_Boss_Linen_SPFunnel_1",
    UnitId = 851202
  },
  [851203] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {Skill09Funnel = 2},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPFunnel_1.BP_Boss_Linen_SPFunnel_1",
    UnitId = 851203
  },
  [851204] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {Skill09Funnel = 3},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPFunnel_1.BP_Boss_Linen_SPFunnel_1",
    UnitId = 851204
  },
  [851205] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 1},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851205
  },
  [851206] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 2},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851206
  },
  [851207] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 3},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851207
  },
  [851208] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 4},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851208
  },
  [851209] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 5},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851209
  },
  [851210] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 6},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851210
  },
  [851211] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 7},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851211
  },
  [851212] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {SPLaser = 8},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPLaser_1.BP_Boss_Linen_SPLaser_1",
    UnitId = 851212
  },
  [851213] = {
    BloodUIParmas = T.RT_3,
    BluePrintParams = {Skill09Funnel = 4},
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Linen_SPFunnel_1.BP_Boss_Linen_SPFunnel_1",
    UnitId = 851213
  },
  [851501] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Jushi_Skill07_Field01.BP_Boss_Jushi_Skill07_Field01",
    UnitId = 851501
  },
  [851801] = {
    BluePrintParams = {Yaw = 30},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Robot__Creature.BP_Boss_Robot__Creature",
    UnitId = 851801
  },
  [851802] = {
    BluePrintParams = {Yaw = -30},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Robot__Creature02.BP_Boss_Robot__Creature02",
    UnitId = 851802
  },
  [851901] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Lieche_Skill07_Field01.BP_Boss_Lieche_Skill07_Field01",
    UnitId = 851901
  },
  [851902] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_Lieche_Skill04_Field01.BP_Boss_Lieche_Skill04_Field01",
    UnitId = 851902
  },
  [851903] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_LiecheCore_Skill02_Field01.BP_Boss_LiecheCore_Skill02_Field01",
    UnitId = 851903
  },
  [851904] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Boss_LiecheCore_Skill05_Field01.BP_Boss_LiecheCore_Skill05_Field01",
    UnitId = 851904
  },
  [900001] = {
    BattleRoleId = 39005,
    DelayDestroyTime = 2,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Bomb_Field.BP_Bomb_Field",
    UnitId = 900001
  },
  [900301] = {
    BluePrintParams = {SkillEffectId = 600000302},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Strong_Poison_FieldCreature.BP_Strong_Poison_FieldCreature",
    UnitId = 900301
  },
  [900501] = {
    BluePrintParams = {
      SkillEffectId = 600000502,
      SkillEffectId2 = 600000503,
      SkillEffectId3 = 600000504
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Strong_Blood_FieldCreature.BP_Strong_Blood_FieldCreature",
    UnitId = 900501
  },
  [900701] = {
    BluePrintParams = {SkillEffectId = 600000702, SkillEffectId2 = 600000703},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Strong_Shield_Creature.BP_Strong_Shield_Creature",
    UnitId = 900701
  },
  [900901] = {
    BluePrintParams = {
      PreFXColorIndex = 0,
      PreFXRadius = 700,
      SkillEffectId = 600000902,
      SkillEffectId2 = 600000903,
      SkillEffectId3 = 600000904,
      SpeedDownTime = 2.5
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Strong_IceOrb_FieldCreature.BP_Strong_IceOrb_FieldCreature",
    UnitId = 900901
  },
  [901201] = {
    BluePrintParams = {SkillEffectId = 600001202, SkillEffectId2 = 600001203},
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Strong_ThunderLaser_FieldCreature.BP_Strong_ThunderLaser_FieldCreature",
    UnitId = 901201
  },
  [10105900] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Rou_10105900.BP_Rou_10105900",
    UnitId = 10105900
  },
  [10105901] = {
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Rou_10105901.BP_Rou_10105901",
    UnitId = 10105901
  },
  [10106001] = {
    DisableBuff = true,
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Player/BP_Rou_10106001.BP_Rou_10106001",
    UnitId = 10106001
  },
  [10106002] = {
    BluePrintParams = {
      TargetFilter = "BossLianhuo_Skill03_Cylinder"
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Rouge_Wind.BP_Rouge_Wind",
    UnitId = 10106002
  },
  [40101001] = {
    BluePrintParams = {
      BuffId = 850204,
      SkillEffectIdEnter = 401020015,
      SkillEffectIdExit = 401020016
    },
    UnitBPPath = "/Game/BluePrints/Combat/MechanismSummon/Monster/BP_Activity_Paotai_SlowDown.BP_Activity_Paotai_SlowDown",
    UnitId = 40101001
  }
})
