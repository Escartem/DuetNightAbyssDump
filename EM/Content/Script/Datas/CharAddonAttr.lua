local T = {}
T.RT_1 = {AttrName = "ATK", Rate = 0.2}
T.RT_2 = {AttrName = "ATK", Rate = 0.3}
T.RT_3 = {
  AttrName = "SkillEfficiency",
  Rate = 0.05
}
T.RT_4 = {
  AttrName = "SkillEfficiency",
  Rate = 0.075
}
T.RT_5 = {
  AttrName = "SkillSustain",
  Rate = 0.06
}
T.RT_6 = {
  AttrName = "SkillSustain",
  Rate = 0.09
}
T.RT_7 = {AttrName = "SkillRange", Rate = 0.12}
T.RT_8 = {AttrName = "SkillRange", Rate = 0.18}
T.RT_9 = {
  AttrName = "SkillIntensity",
  Rate = 0.08
}
T.RT_10 = {
  AttrName = "SkillIntensity",
  Rate = 0.12
}
T.RT_11 = {AttrName = "MaxHp", Rate = 0.2}
T.RT_12 = {AttrName = "MaxHp", Rate = 0.3}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharAddonAttr", {
  [110101] = {
    AddAttrs = T.RT_1,
    AttrId = 110101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110101_NAME"
  },
  [110102] = {
    AddAttrs = T.RT_2,
    AttrId = 110102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110102_NAME"
  },
  [110103] = {
    AddAttrs = T.RT_3,
    AttrId = 110103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110103_NAME"
  },
  [110104] = {
    AddAttrs = T.RT_4,
    AttrId = 110104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110104_NAME"
  },
  [110301] = {
    AddAttrs = T.RT_1,
    AttrId = 110301,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110301_NAME"
  },
  [110302] = {
    AddAttrs = T.RT_2,
    AttrId = 110302,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110302_NAME"
  },
  [110303] = {
    AddAttrs = T.RT_3,
    AttrId = 110303,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110303_NAME"
  },
  [110304] = {
    AddAttrs = T.RT_4,
    AttrId = 110304,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110304_NAME"
  },
  [150101] = {
    AddAttrs = T.RT_1,
    AttrId = 150101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150101_NAME"
  },
  [150102] = {
    AddAttrs = T.RT_2,
    AttrId = 150102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150102_NAME"
  },
  [150103] = {
    AddAttrs = T.RT_5,
    AttrId = 150103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_150103_NAME"
  },
  [150104] = {
    AddAttrs = T.RT_6,
    AttrId = 150104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_150104_NAME"
  },
  [150201] = {
    AddAttrs = T.RT_1,
    AttrId = 150201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150201_NAME"
  },
  [150202] = {
    AddAttrs = T.RT_2,
    AttrId = 150202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150202_NAME"
  },
  [150203] = {
    AddAttrs = T.RT_7,
    AttrId = 150203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_150203_NAME"
  },
  [150204] = {
    AddAttrs = T.RT_8,
    AttrId = 150204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_150204_NAME"
  },
  [150301] = {
    AddAttrs = T.RT_1,
    AttrId = 150301,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150301_NAME"
  },
  [150302] = {
    AddAttrs = T.RT_2,
    AttrId = 150302,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150302_NAME"
  },
  [150303] = {
    AddAttrs = {
      AttrName = "WeaponCRIModifierRate",
      Value = 0.2
    },
    AttrId = 150303,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
    Name = "ADDONATTR_150303_NAME"
  },
  [150304] = {
    AddAttrs = {
      AttrName = "WeaponCRIModifierRate",
      Value = 0.3
    },
    AttrId = 150304,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
    Name = "ADDONATTR_150304_NAME"
  },
  [160101] = {
    AddAttrs = T.RT_5,
    AttrId = 160101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_160101_NAME"
  },
  [160102] = {
    AddAttrs = T.RT_6,
    AttrId = 160102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_160102_NAME"
  },
  [160103] = {
    AddAttrs = T.RT_7,
    AttrId = 160103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_160103_NAME"
  },
  [160104] = {
    AddAttrs = T.RT_8,
    AttrId = 160104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_160104_NAME"
  },
  [180101] = {
    AddAttrs = T.RT_7,
    AttrId = 180101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_180101_NAME"
  },
  [180102] = {
    AddAttrs = T.RT_8,
    AttrId = 180102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_180102_NAME"
  },
  [180103] = {
    AddAttrs = T.RT_5,
    AttrId = 180103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_180103_NAME"
  },
  [180104] = {
    AddAttrs = T.RT_6,
    AttrId = 180104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_180104_NAME"
  },
  [210101] = {
    AddAttrs = T.RT_1,
    AttrId = 210101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_210101_NAME"
  },
  [210102] = {
    AddAttrs = T.RT_2,
    AttrId = 210102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_210102_NAME"
  },
  [210103] = {
    AddAttrs = T.RT_7,
    AttrId = 210103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_210103_NAME"
  },
  [210104] = {
    AddAttrs = T.RT_8,
    AttrId = 210104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_210104_NAME"
  },
  [230101] = {
    AddAttrs = T.RT_1,
    AttrId = 230101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_230101_NAME"
  },
  [230102] = {
    AddAttrs = T.RT_2,
    AttrId = 230102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_230102_NAME"
  },
  [230103] = {
    AddAttrs = T.RT_5,
    AttrId = 230103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_230103_NAME"
  },
  [230104] = {
    AddAttrs = T.RT_6,
    AttrId = 230104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_230104_NAME"
  },
  [240101] = {
    AddAttrs = T.RT_5,
    AttrId = 240101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_240101_NAME"
  },
  [240102] = {
    AddAttrs = T.RT_6,
    AttrId = 240102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_240102_NAME"
  },
  [240103] = {
    AddAttrs = T.RT_9,
    AttrId = 240103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_240103_NAME"
  },
  [240104] = {
    AddAttrs = T.RT_10,
    AttrId = 240104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_240104_NAME"
  },
  [310101] = {
    AddAttrs = T.RT_1,
    AttrId = 310101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_310101_NAME"
  },
  [310102] = {
    AddAttrs = T.RT_2,
    AttrId = 310102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_310102_NAME"
  },
  [310103] = {
    AddAttrs = T.RT_5,
    AttrId = 310103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_310103_NAME"
  },
  [310104] = {
    AddAttrs = T.RT_6,
    AttrId = 310104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_310104_NAME"
  },
  [310201] = {
    AddAttrs = T.RT_1,
    AttrId = 310201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_310201_NAME"
  },
  [310202] = {
    AddAttrs = T.RT_2,
    AttrId = 310202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_310202_NAME"
  },
  [310203] = {
    AddAttrs = {
      AttrName = "MultiShootModifierRate",
      Value = 0.15
    },
    AttrId = 310203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_06",
    Name = "ADDONATTR_310203_NAME"
  },
  [310204] = {
    AddAttrs = {
      AttrName = "MultiShootModifierRate",
      Value = 0.225
    },
    AttrId = 310204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_06",
    Name = "ADDONATTR_310204_NAME"
  },
  [310301] = {
    AddAttrs = T.RT_1,
    AttrId = 310301,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_310301_NAME"
  },
  [310302] = {
    AddAttrs = T.RT_2,
    AttrId = 310302,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_310302_NAME"
  },
  [310303] = {
    AddAttrs = T.RT_9,
    AttrId = 310303,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_310303_NAME"
  },
  [310304] = {
    AddAttrs = T.RT_10,
    AttrId = 310304,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_310304_NAME"
  },
  [320101] = {
    AddAttrs = T.RT_11,
    AttrId = 320101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
    Name = "ADDONATTR_320101_NAME"
  },
  [320102] = {
    AddAttrs = T.RT_12,
    AttrId = 320102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
    Name = "ADDONATTR_320102_NAME"
  },
  [320103] = {
    AddAttrs = T.RT_5,
    AttrId = 320103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_320103_NAME"
  },
  [320104] = {
    AddAttrs = T.RT_6,
    AttrId = 320104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_320104_NAME"
  },
  [320201] = {
    AddAttrs = T.RT_1,
    AttrId = 320201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_320201_NAME"
  },
  [320202] = {
    AddAttrs = T.RT_2,
    AttrId = 320202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_320202_NAME"
  },
  [320203] = {
    AddAttrs = T.RT_9,
    AttrId = 320203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_320203_NAME"
  },
  [320204] = {
    AddAttrs = T.RT_10,
    AttrId = 320204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_320204_NAME"
  },
  [330101] = {
    AddAttrs = T.RT_1,
    AttrId = 330101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_330101_NAME"
  },
  [330102] = {
    AddAttrs = T.RT_2,
    AttrId = 330102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_330102_NAME"
  },
  [330103] = {
    AddAttrs = T.RT_7,
    AttrId = 330103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_330103_NAME"
  },
  [330104] = {
    AddAttrs = T.RT_8,
    AttrId = 330104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_330104_NAME"
  },
  [410101] = {
    AddAttrs = T.RT_1,
    AttrId = 410101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_410101_NAME"
  },
  [410102] = {
    AddAttrs = T.RT_2,
    AttrId = 410102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_410102_NAME"
  },
  [410103] = {
    AddAttrs = T.RT_7,
    AttrId = 410103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_410103_NAME"
  },
  [410104] = {
    AddAttrs = T.RT_8,
    AttrId = 410104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_410104_NAME"
  },
  [410201] = {
    AddAttrs = {
      AttrName = "StrongValue",
      Value = 0.06
    },
    AttrId = 410201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_02",
    Name = "ADDONATTR_410201_NAME"
  },
  [410202] = {
    AddAttrs = {
      AttrName = "StrongValue",
      Value = 0.09
    },
    AttrId = 410202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_02",
    Name = "ADDONATTR_410202_NAME"
  },
  [410203] = {
    AddAttrs = T.RT_9,
    AttrId = 410203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_410203_NAME"
  },
  [410204] = {
    AddAttrs = T.RT_10,
    AttrId = 410204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_410204_NAME"
  },
  [420101] = {
    AddAttrs = T.RT_1,
    AttrId = 420101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_420101_NAME"
  },
  [420102] = {
    AddAttrs = T.RT_2,
    AttrId = 420102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_420102_NAME"
  },
  [420103] = {
    AddAttrs = T.RT_9,
    AttrId = 420103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
    Name = "ADDONATTR_420103_NAME"
  },
  [420104] = {
    AddAttrs = T.RT_10,
    AttrId = 420104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
    Name = "ADDONATTR_420104_NAME"
  },
  [420201] = {
    AddAttrs = {AttrName = "DEF", Rate = 0.2},
    AttrId = 420201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_07",
    Name = "ADDONATTR_420201_NAME"
  },
  [420202] = {
    AddAttrs = {AttrName = "DEF", Rate = 0.3},
    AttrId = 420202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_07",
    Name = "ADDONATTR_420202_NAME"
  },
  [420203] = {
    AddAttrs = T.RT_5,
    AttrId = 420203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_420203_NAME"
  },
  [420204] = {
    AddAttrs = T.RT_6,
    AttrId = 420204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_420204_NAME"
  },
  [430101] = {
    AddAttrs = T.RT_11,
    AttrId = 430101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
    Name = "ADDONATTR_430101_NAME"
  },
  [430102] = {
    AddAttrs = T.RT_12,
    AttrId = 430102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
    Name = "ADDONATTR_430102_NAME"
  },
  [430103] = {
    AddAttrs = T.RT_9,
    AttrId = 430103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_430103_NAME"
  },
  [430104] = {
    AddAttrs = T.RT_10,
    AttrId = 430104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_430104_NAME"
  },
  [510101] = {
    AddAttrs = T.RT_11,
    AttrId = 510101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
    Name = "ADDONATTR_510101_NAME"
  },
  [510102] = {
    AddAttrs = T.RT_12,
    AttrId = 510102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
    Name = "ADDONATTR_510102_NAME"
  },
  [510103] = {
    AddAttrs = T.RT_5,
    AttrId = 510103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_510103_NAME"
  },
  [510104] = {
    AddAttrs = T.RT_6,
    AttrId = 510104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_510104_NAME"
  },
  [510201] = {
    AddAttrs = T.RT_1,
    AttrId = 510201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_510201_NAME"
  },
  [510202] = {
    AddAttrs = T.RT_2,
    AttrId = 510202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_510202_NAME"
  },
  [510203] = {
    AddAttrs = T.RT_5,
    AttrId = 510203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_510203_NAME"
  },
  [510204] = {
    AddAttrs = T.RT_6,
    AttrId = 510204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_510204_NAME"
  },
  [530101] = {
    AddAttrs = {
      AttrName = "EnmityValue",
      Value = 0.02
    },
    AttrId = 530101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_05",
    Name = "ADDONATTR_530101_NAME"
  },
  [530102] = {
    AddAttrs = {
      AttrName = "EnmityValue",
      Value = 0.03
    },
    AttrId = 530102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_05",
    Name = "ADDONATTR_530102_NAME"
  },
  [530103] = {
    AddAttrs = T.RT_9,
    AttrId = 530103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_530103_NAME"
  },
  [530104] = {
    AddAttrs = T.RT_10,
    AttrId = 530104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
    Name = "ADDONATTR_530104_NAME"
  },
  [540101] = {
    AddAttrs = T.RT_1,
    AttrId = 540101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_540101_NAME"
  },
  [540102] = {
    AddAttrs = T.RT_2,
    AttrId = 540102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_540102_NAME"
  },
  [540103] = {
    AddAttrs = T.RT_7,
    AttrId = 540103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_540103_NAME"
  },
  [540104] = {
    AddAttrs = T.RT_8,
    AttrId = 540104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_540104_NAME"
  }
})
