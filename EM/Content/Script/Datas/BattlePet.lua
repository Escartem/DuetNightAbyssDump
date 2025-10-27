local T = {}
T.RT_1 = {
  AttrName = "JumpVelocityModifier",
  Value = "#1"
}
T.RT_2 = {AttrName = "ATK", Rate = "#1"}
T.RT_3 = {AttrName = "ATK_Dark", Rate = "#1"}
T.RT_4 = {AttrName = "MaxHp", Rate = "#2"}
T.RT_5 = {AttrName = "ATK_Water", Rate = "#1"}
T.RT_6 = {AttrName = "ATK_Fire", Rate = "#1"}
T.RT_7 = {
  AttrName = "ATK_Thunder",
  Rate = "#1"
}
T.RT_8 = {AttrName = "ATK_Wind", Rate = "#1"}
T.RT_9 = {AttrName = "ATK_Light", Rate = "#1"}
T.RT_10 = {
  [1] = T.RT_3
}
T.RT_11 = {Normal = "#2"}
T.RT_12 = {
  [1] = T.RT_5
}
T.RT_13 = {
  [1] = T.RT_6
}
T.RT_14 = {
  [1] = T.RT_7
}
T.RT_15 = {
  [1] = T.RT_8
}
T.RT_16 = {
  [1] = T.RT_9
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattlePet", {
  [401] = {
    AddAttrs = {
      [1] = T.RT_3,
      [2] = T.RT_4
    },
    EffectCreatureId = 4011,
    PassiveEffectDesc = "PET_401_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[401].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[401].AddAttrs[2].Rate*100$%"
    },
    PetId = 401,
    PetType = "Pet",
    SupportSkillId = 401
  },
  [402] = {
    AddAttrs = {
      [1] = T.RT_5,
      [2] = T.RT_4
    },
    EffectCreatureId = 4021,
    PassiveEffectDesc = "PET_402_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[402].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[402].AddAttrs[2].Rate*100$%"
    },
    PetId = 402,
    PetType = "Pet",
    SupportSkillId = 402
  },
  [403] = {
    AddAttrs = {
      [1] = T.RT_6,
      [2] = T.RT_4
    },
    EffectCreatureId = 4031,
    PassiveEffectDesc = "PET_403_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[403].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[403].AddAttrs[2].Rate*100$%"
    },
    PetId = 403,
    PetType = "Pet",
    SupportSkillId = 403
  },
  [404] = {
    AddAttrs = {
      [1] = T.RT_7,
      [2] = T.RT_4
    },
    EffectCreatureId = 4041,
    PassiveEffectDesc = "PET_404_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[404].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[404].AddAttrs[2].Rate*100$%"
    },
    PetId = 404,
    PetType = "Pet",
    SupportSkillId = 404
  },
  [405] = {
    AddAttrs = {
      [1] = T.RT_8,
      [2] = T.RT_4
    },
    EffectCreatureId = 4051,
    PassiveEffectDesc = "PET_405_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[405].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[405].AddAttrs[2].Rate*100$%"
    },
    PetId = 405,
    PetType = "Pet",
    SupportSkillId = 405
  },
  [406] = {
    AddAttrs = {
      [1] = T.RT_9,
      [2] = T.RT_4
    },
    EffectCreatureId = 4061,
    PassiveEffectDesc = "PET_406_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[406].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[406].AddAttrs[2].Rate*100$%"
    },
    PetId = 406,
    PetType = "Pet",
    SupportSkillId = 406
  },
  [407] = {
    AddAttrs = {
      [1] = {
        AttrName = "DropDistance",
        Value = 2000
      }
    },
    BonusRateOffset = "#1",
    EffectCreatureId = 4071,
    ExpRate = {AttrName = "ExpRate", Value = "#2"},
    PassiveEffectDesc = "PET_407_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[407].BonusRateOffset*100$%",
      [2] = "$#BattlePet[407].ExpRate.Value*100$%",
      [3] = "$#BattlePet[407].AddAttrs[1].Value/100$"
    },
    PetId = 407,
    PetType = "Pet",
    SupportSkillId = 407
  },
  [408] = {
    AddAttrs = {
      [1] = T.RT_1,
      [2] = {
        AttrName = "BulletJumpVelocityModifier",
        Value = "#2"
      },
      [3] = {
        AttrName = "SlideFrictionModifier",
        Value = "#3"
      }
    },
    EffectCreatureId = 4081,
    PassiveEffectDesc = "PET_408_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[408].AddAttrs[1].Value*100$%",
      [2] = "$#BattlePet[408].AddAttrs[2].Value*100$%",
      [3] = "$-#BattlePet[408].AddAttrs[3].Value*100$%"
    },
    PetId = 408,
    PetType = "Pet",
    SupportSkillId = 408
  },
  [409] = {
    AddAttrs = {
      [1] = T.RT_2,
      [2] = T.RT_4,
      [3] = {AttrName = "Def", Rate = "#3"}
    },
    EffectCreatureId = 4091,
    PassiveEffectDesc = "PET_409_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[409].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[409].AddAttrs[2].Rate*100$%",
      [3] = "$#BattlePet[409].AddAttrs[3].Rate*100$%"
    },
    PetId = 409,
    PetType = "Pet",
    SupportSkillId = 409
  },
  [411] = {
    AddAttrs = T.RT_10,
    AddModMultiplier = T.RT_11,
    EffectCreatureId = 4111,
    PassiveEffectDesc = "PET_411_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[411].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[411].AddModMultiplier.Normal*100$%"
    },
    PetId = 411,
    PetType = "Pet",
    SupportSkillId = 411
  },
  [412] = {
    AddAttrs = T.RT_12,
    AddModMultiplier = T.RT_11,
    EffectCreatureId = 4121,
    PassiveEffectDesc = "PET_412_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[412].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[412].AddModMultiplier.Normal*100$%"
    },
    PetId = 412,
    PetType = "Pet",
    SupportSkillId = 412
  },
  [413] = {
    AddAttrs = T.RT_13,
    AddModMultiplier = T.RT_11,
    EffectCreatureId = 4131,
    PassiveEffectDesc = "PET_413_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[413].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[413].AddModMultiplier.Normal*100$%"
    },
    PetId = 413,
    PetType = "Pet",
    SupportSkillId = 413
  },
  [414] = {
    AddAttrs = T.RT_14,
    AddModMultiplier = T.RT_11,
    EffectCreatureId = 4141,
    PassiveEffectDesc = "PET_414_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[414].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[414].AddModMultiplier.Normal*100$%"
    },
    PetId = 414,
    PetType = "Pet",
    SupportSkillId = 414
  },
  [415] = {
    AddAttrs = T.RT_15,
    AddModMultiplier = T.RT_11,
    EffectCreatureId = 4151,
    PassiveEffectDesc = "PET_415_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[415].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[415].AddModMultiplier.Normal*100$%"
    },
    PetId = 415,
    PetType = "Pet",
    SupportSkillId = 415
  },
  [416] = {
    AddAttrs = T.RT_16,
    AddModMultiplier = T.RT_11,
    EffectCreatureId = 4161,
    PassiveEffectDesc = "PET_416_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[416].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[416].AddModMultiplier.Normal*100$%"
    },
    PetId = 416,
    PetType = "Pet",
    SupportSkillId = 416
  },
  [421] = {
    AddAttrs = T.RT_10,
    AddModMultiplier = {Dark = "#2"},
    EffectCreatureId = 4211,
    PassiveEffectDesc = "PET_421_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[421].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[421].AddModMultiplier.Dark*100$%"
    },
    PetId = 421,
    PetType = "Pet",
    SupportSkillId = 421
  },
  [422] = {
    AddAttrs = T.RT_12,
    AddModMultiplier = {Water = "#2"},
    EffectCreatureId = 4221,
    PassiveEffectDesc = "PET_422_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[422].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[422].AddModMultiplier.Water*100$%"
    },
    PetId = 422,
    PetType = "Pet",
    SupportSkillId = 422
  },
  [423] = {
    AddAttrs = T.RT_13,
    AddModMultiplier = {Fire = "#2"},
    EffectCreatureId = 4231,
    PassiveEffectDesc = "PET_423_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[423].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[423].AddModMultiplier.Fire*100$%"
    },
    PetId = 423,
    PetType = "Pet",
    SupportSkillId = 423
  },
  [424] = {
    AddAttrs = T.RT_14,
    AddModMultiplier = {Thunder = "#2"},
    EffectCreatureId = 4241,
    PassiveEffectDesc = "PET_424_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[424].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[424].AddModMultiplier.Thunder*100$%"
    },
    PetId = 424,
    PetType = "Pet",
    SupportSkillId = 424
  },
  [425] = {
    AddAttrs = T.RT_15,
    AddModMultiplier = {Wind = "#2"},
    EffectCreatureId = 4251,
    PassiveEffectDesc = "PET_425_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[425].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[425].AddModMultiplier.Wind*100$%"
    },
    PetId = 425,
    PetType = "Pet",
    SupportSkillId = 425
  },
  [426] = {
    AddAttrs = T.RT_16,
    AddModMultiplier = {Light = "#2"},
    EffectCreatureId = 4261,
    PassiveEffectDesc = "PET_426_PASSIVE",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[426].AddAttrs[1].Rate*100$%",
      [2] = "$#BattlePet[426].AddModMultiplier.Light*100$%"
    },
    PetId = 426,
    PetType = "Pet",
    SupportSkillId = 426
  },
  [491] = {
    EffectCreatureId = 4911,
    PetId = 491,
    PetType = "Pet"
  },
  [492] = {
    EffectCreatureId = 4921,
    PetId = 492,
    PetType = "Pet"
  },
  [493] = {
    EffectCreatureId = 4931,
    PetId = 493,
    PetType = "Pet"
  },
  [494] = {
    EffectCreatureId = 4932,
    PetId = 494,
    PetType = "Pet"
  },
  [495] = {
    EffectCreatureId = 4933,
    PetId = 495,
    PetType = "Pet"
  },
  [496] = {
    EffectCreatureId = 4934,
    PetId = 496,
    PetType = "Pet"
  },
  [601] = {
    EffectCreatureId = 6011,
    PetId = 601,
    PetType = "Pet",
    SupportSkillId = 601
  },
  [602] = {
    EffectCreatureId = 6021,
    PetId = 602,
    PetType = "Pet",
    SupportSkillId = 602
  },
  [603] = {
    EffectCreatureId = 6031,
    PetId = 603,
    PetType = "Pet",
    SupportSkillId = 603
  },
  [604] = {
    EffectCreatureId = 6041,
    PetId = 604,
    PetType = "Pet",
    SupportSkillId = 604
  },
  [901] = {
    EffectCreatureId = 9011,
    PetId = 901,
    PetType = "Pet",
    SupportSkillId = 901
  },
  [1001] = {
    AddAttrs = {
      [1] = {
        AttrName = "DropDistance",
        Value = "#1"
      }
    },
    PassiveEffectDesc = "AFFIX_1001_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1001].AddAttrs[1].Value/100$"
    },
    PetId = 1001,
    PetType = "Affix"
  },
  [1002] = {
    BonusRateOffset = "#1",
    PassiveEffectDesc = "AFFIX_1002_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1002].BonusRateOffset*100$%"
    },
    PetId = 1002,
    PetType = "Affix"
  },
  [1003] = {
    ExpRate = {AttrName = "ExpRate", Value = "#1"},
    PassiveEffectDesc = "AFFIX_1003_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1003].ExpRate.Value*100$%"
    },
    PetId = 1003,
    PetType = "Affix"
  },
  [1004] = {
    AddAttrs = {
      [1] = {
        AttrName = "AdditionalRecoverTime",
        Value = 1
      }
    },
    PassiveEffectDesc = "AFFIX_1004_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1004].AddAttrs[1].Value$"
    },
    PetId = 1004,
    PetType = "Affix"
  },
  [1005] = {
    AddAttrs = {
      [1] = {
        AttrName = "WalkSpeedModifier",
        Value = "#1"
      }
    },
    PassiveEffectDesc = "AFFIX_1005_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1005].AddAttrs[1].Value*100$%"
    },
    PetId = 1005,
    PetType = "Affix"
  },
  [1006] = {
    AddAttrs = {
      [1] = T.RT_1
    },
    PassiveEffectDesc = "AFFIX_1006_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1006].AddAttrs[1].Value*100$%"
    },
    PetId = 1006,
    PetType = "Affix"
  },
  [1007] = {
    AddAttrs = {
      [1] = {
        AttrName = "BulletJumpVelocityModifier",
        Value = "#1"
      }
    },
    PassiveEffectDesc = "AFFIX_1007_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1007].AddAttrs[1].Value*100$%"
    },
    PetId = 1007,
    PetType = "Affix"
  },
  [1008] = {
    AddAttrs = {
      [1] = {
        AttrName = "SlideFrictionModifier",
        Value = "#1"
      }
    },
    PassiveEffectDesc = "AFFIX_1008_DESC",
    PassiveEffectDescParameter = {
      [1] = "$-#BattlePet[1008].AddAttrs[1].Value*100$%"
    },
    PetId = 1008,
    PetType = "Affix"
  },
  [1009] = {
    AddAttrs = {
      [1] = {
        AttrName = "AvoidChargeCd",
        Rate = "#1"
      }
    },
    PassiveEffectDesc = "AFFIX_1009_DESC",
    PassiveEffectDescParameter = {
      [1] = "$-#BattlePet[1009].AddAttrs[1].Rate*100$%"
    },
    PetId = 1009,
    PetType = "Affix"
  },
  [1010] = {
    AddAttrs = {
      [1] = T.RT_2
    },
    PassiveEffectDesc = "AFFIX_1010_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1010].AddAttrs[1].Rate*100$%"
    },
    PetId = 1010,
    PetType = "Affix"
  },
  [1011] = {
    AddAttrs = {
      [1] = {AttrName = "Def", Rate = "#1"}
    },
    PassiveEffectDesc = "AFFIX_1011_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1011].AddAttrs[1].Rate*100$%"
    },
    PetId = 1011,
    PetType = "Affix"
  },
  [1012] = {
    AddAttrs = {
      [1] = {AttrName = "MaxHp", Rate = "#1"}
    },
    PassiveEffectDesc = "AFFIX_1012_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1012].AddAttrs[1].Rate*100$%"
    },
    PetId = 1012,
    PetType = "Affix"
  },
  [1013] = {
    AddAttrs = {
      [1] = {AttrName = "MaxES", Rate = "#1"}
    },
    PassiveEffectDesc = "AFFIX_1013_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1013].AddAttrs[1].Rate*100$%"
    },
    PetId = 1013,
    PetType = "Affix"
  },
  [1014] = {
    AddAttrs = {
      [1] = {
        AttrName = "SupportSkillCD",
        Rate = "#1"
      }
    },
    PassiveEffectDesc = "AFFIX_1014_DESC",
    PassiveEffectDescParameter = {
      [1] = "$-#BattlePet[1014].AddAttrs[1].Rate*100$%"
    },
    PetId = 1014,
    PetType = "Affix"
  },
  [1015] = {
    ConsumeExpFix = "#1",
    PassiveEffectDesc = "AFFIX_1015_DESC",
    PassiveEffectDescParameter = {
      [1] = "$#BattlePet[1015].ConsumeExpFix*100$%"
    },
    PetId = 1015,
    PetType = "Affix"
  },
  [1016] = {
    CanDecode = true,
    PassiveEffectDesc = "AFFIX_1016_DESC",
    PetId = 1016,
    PetType = "Affix"
  },
  [1017] = {
    CanAutoFishing = true,
    PassiveEffectDesc = "AFFIX_1017_DESC",
    PetId = 1017,
    PetType = "Affix"
  }
})
