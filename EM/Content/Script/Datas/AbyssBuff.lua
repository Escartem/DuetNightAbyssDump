local T = {}
T.RT_1 = {
  [1] = "$(#Buff[2010001].LockHp.Rate)*100$%",
  [2] = "$#GlobalPassiveData[20100].Vars.LastTime$",
  [3] = "$(#Buff[2010003].AddAttrs[1].Value)*100$%",
  [4] = "$#Buff[2010003].MaxLayer$"
}
T.RT_2 = {
  [1] = "$(#Buff[2010201].MaxLayer)*(#Buff[2010201].BuffDamagedRate.Value)*-100$%",
  [2] = "$(#Buff[2010201].BuffDamagedRate.Value)*-100$%"
}
T.RT_3 = {2010201}
T.RT_4 = {
  BuffList = T.RT_3
}
T.RT_5 = {80}
T.RT_6 = {40}
T.RT_7 = {1}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AbyssBuff", {
  [10] = {
    AbyssBuffDes = "Buff_Content_100",
    AbyssBuffID = 10,
    AbyssBuffName = "Buff_Title_100",
    AbyssBuffParameter = T.RT_1,
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_NormalBuffLockToast_2",
    GlobalPassiveId = 20100,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Boss.T_Abyss_Buff_Mon_Boss"
  },
  [20] = {
    AbyssBuffDes = "Buff_Content_201",
    AbyssBuffID = 20,
    AbyssBuffName = "Buff_Title_201",
    AbyssBuffParameter = T.RT_2,
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_NormalBuffLockToast_1",
    GlobalPassiveId = 20201,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
    MonsterBuff = T.RT_4,
    MonsterBuffLayer = T.RT_5
  },
  [30] = {
    AbyssBuffDes = "Buff_Content_30",
    AbyssBuffID = 30,
    AbyssBuffName = "Buff_Title_30",
    AbyssBuffParameter = {
      [1] = "$#GlobalPassiveData[20030].Vars.HitCount$",
      [2] = "$(#Buff[2010011].AddAttrs[1].Rate)*100$%",
      [3] = "$#GlobalPassiveData[20030].Vars.LastTime$",
      [4] = "$#Buff[2010011].MaxLayer$"
    },
    AbyssBuffType = 1,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20030,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Common.T_Abyss_Buff_Common"
  },
  [100] = {
    AbyssBuffDes = "Buff_Content_100",
    AbyssBuffID = 100,
    AbyssBuffName = "Buff_Title_100",
    AbyssBuffParameter = T.RT_1,
    AbyssBuffType = 2,
    GlobalPassiveId = 20100,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Boss.T_Abyss_Buff_Mon_Boss"
  },
  [201] = {
    AbyssBuffDes = "Buff_Content_201",
    AbyssBuffID = 201,
    AbyssBuffName = "Buff_Title_201",
    AbyssBuffParameter = T.RT_2,
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20201,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
    MonsterBuff = T.RT_4,
    MonsterBuffLayer = T.RT_5
  },
  [202] = {
    AbyssBuffDes = "Buff_Content_202",
    AbyssBuffID = 202,
    AbyssBuffName = "Buff_Title_202",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010202].MaxLayer)*(#Buff[2010202].BuffDamagedRate.Value)*-100$%",
      [2] = "$(#Buff[2010202].BuffDamagedRate.Value)*-100$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20202,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
    MonsterBuff = {
      BuffList = {2010202}
    },
    MonsterBuffLayer = T.RT_6
  },
  [203] = {
    AbyssBuffDes = "Buff_Content_203",
    AbyssBuffID = 203,
    AbyssBuffName = "Buff_Title_203",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010203].MaxLayer)*(#Buff[2010203].BuffDamagedRate.Value)*-100$%",
      [2] = "$(#Buff[2010203].BuffDamagedRate.Value)*-100$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20203,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
    MonsterBuff = {
      BuffList = {2010203}
    },
    MonsterBuffLayer = T.RT_6
  },
  [211] = {
    AbyssBuffDes = "Buff_Content_211",
    AbyssBuffID = 211,
    AbyssBuffName = "Buff_Title_211",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010211].DotDatas[1].Rate)*100$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive02.T_Abyss_Buff_Mon_Survive02",
    MonsterBuff = {
      BuffList = {2010211}
    },
    MonsterBuffLayer = T.RT_7
  },
  [301] = {
    AbyssBuffDes = "Buff_Content_301",
    AbyssBuffID = 301,
    AbyssBuffName = "Buff_Title_301",
    AbyssBuffParameter = {
      [1] = "$#GlobalPassiveData[20301].Vars.HitCount$",
      [2] = "$(#Buff[2010301].AddAttrs[1].Rate)*100$%",
      [3] = "$#GlobalPassiveData[20301].Vars.LastTime$",
      [4] = "$#Buff[2010301].MaxLayer$"
    },
    AbyssBuffType = 1,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20301,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Skill.T_Abyss_Buff_Skill"
  },
  [302] = {
    AbyssBuffDes = "Buff_Content_302",
    AbyssBuffID = 302,
    AbyssBuffName = "Buff_Title_302",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010302].AddAttrs[1].Value)*100$%"
    },
    AbyssBuffType = 1,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20302,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Range.T_Abyss_Buff_Range"
  },
  [303] = {
    AbyssBuffDes = "Buff_Content_303",
    AbyssBuffID = 303,
    AbyssBuffName = "Buff_Title_303",
    AbyssBuffParameter = {
      [1] = "$#GlobalPassiveData[20303].Vars.CritRate*100$%"
    },
    AbyssBuffType = 1,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20303,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Common.T_Abyss_Buff_Common"
  },
  [304] = {
    AbyssBuffDes = "Buff_Content_304",
    AbyssBuffID = 304,
    AbyssBuffName = "Buff_Title_304",
    AbyssBuffParameter = {
      [1] = "$#GlobalPassiveData[20304].Vars.SpCost$",
      [2] = "$(#Buff[2010304].AddAttrs[1].Rate)*100$%",
      [3] = "$#GlobalPassiveData[20304].Vars.LastTime$",
      [4] = "$#Buff[2010304].MaxLayer$"
    },
    AbyssBuffType = 1,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20304,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Skill.T_Abyss_Buff_Skill"
  },
  [401] = {
    AbyssBuffDes = "Buff_Content_401",
    AbyssBuffID = 401,
    AbyssBuffName = "Buff_Title_401",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010102].BuffDamagedRate.Value)*(-100)$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20401,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Aura.T_Abyss_Buff_Mon_Aura"
  },
  [402] = {
    AbyssBuffDes = "Buff_Content_402",
    AbyssBuffID = 402,
    AbyssBuffName = "Buff_Title_402",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010402].AddAttrs[1].Value)*-100$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Mon_Survive01.T_Abyss_Buff_Mon_Survive01",
    MonsterBuff = {
      BuffList = {2010402}
    },
    MonsterBuffLayer = T.RT_7
  },
  [511] = {
    AbyssBuffDes = "Buff_Content_511",
    AbyssBuffID = 511,
    AbyssBuffName = "Buff_Title_511",
    AbyssBuffParameter = {
      [1] = "$#GlobalPassiveData[20511].Vars.DownRate*-100$%",
      [2] = "$#GlobalPassiveData[20511].Vars.UpRate*100$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20511,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange"
  },
  [512] = {
    AbyssBuffDes = "Buff_Content_512",
    AbyssBuffID = 512,
    AbyssBuffName = "Buff_Title_512",
    AbyssBuffParameter = {
      [1] = "$(#Buff[2010512].AddAttrs[1].Value)*-100$%",
      [2] = "$#GlobalPassiveData[20512].Vars.TriggerProb*100$%"
    },
    AbyssBuffType = 2,
    BuffLockToast = "Abyss_InfiniteLockToast_1",
    GlobalPassiveId = 20512,
    GlobalPassiveLv = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange"
  },
  [935] = {
    AbyssBuffDes = "Buff_Content_935",
    AbyssBuffID = 935,
    AbyssBuffName = "Buff_Title_935",
    AbyssBuffType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
    MonsterBuff = {
      BuffList = {2010035}
    },
    MonsterBuffLayer = T.RT_7
  },
  [951] = {
    AbyssBuffDes = "Buff_Content_951",
    AbyssBuffID = 951,
    AbyssBuffName = "Buff_Title_951",
    AbyssBuffType = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Abyss/T_Abyss_Buff_Exchange.T_Abyss_Buff_Exchange",
    MonsterBuff = {
      BuffList = {2010051}
    },
    MonsterBuffLayer = T.RT_7
  }
})
