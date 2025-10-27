local T = {}
T.RT_1 = {Count = "#1"}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GlobalPassiveData", {
  [1] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/BP_AbyssPassive_Test.BP_AbyssPassive_Test",
    Camp = "Monster",
    ID = 1,
    Vars = {GrowVar = "#1", TestVar = 30}
  },
  [20030] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HitCountBuff.BP_AbyssGP_HitCountBuff",
    Camp = "Player",
    ID = 20030,
    Vars = {
      Buff = 2010011,
      HitCount = 5,
      LastTime = 10
    }
  },
  [20100] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_BossLockHp.BP_AbyssGP_BossLockHp",
    Camp = "Monster",
    GameplayTag = "Mon.Boss",
    ID = 20100,
    Vars = {
      LastTime = 30,
      LockHpBuff = 2010001,
      LockHpRate = 0.5
    }
  },
  [20102] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_EsAddDamage.BP_AbyssGP_EsAddDamage",
    Camp = "Monster",
    ID = 20102,
    Vars = {DamageRate = 0.2}
  },
  [20201] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
    Camp = "Monster",
    ID = 20201,
    Vars = {Buff = 2010201}
  },
  [20202] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
    Camp = "Monster",
    ID = 20202,
    Vars = {Buff = 2010202, Condition = "Crit"}
  },
  [20203] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HittedRemoveBuff.BP_AbyssGP_HittedRemoveBuff",
    Camp = "Monster",
    ID = 20203,
    Vars = {
      Buff = 2010203,
      Condition = "Tag",
      DamageTag = "Ranged"
    }
  },
  [20301] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_HitCountBuff.BP_AbyssGP_HitCountBuff",
    Camp = "Player",
    ID = 20301,
    Vars = {
      Buff = 2010301,
      HitCount = 5,
      LastTime = 15
    }
  },
  [20302] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
    Camp = "Player",
    ID = 20302,
    Vars = {Buff = 2010302}
  },
  [20303] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_CritUpByBuff.BP_AbyssGP_CritUpByBuff",
    Camp = "Player",
    ID = 20303,
    Vars = {CritRate = 0.2}
  },
  [20304] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_SpAddBuff.BP_AbyssGP_SpAddBuff",
    ID = 20304,
    Vars = {
      Buff = 2010304,
      LastTime = 15,
      SpCost = 15
    }
  },
  [20401] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_AddBuff.BP_AbyssGP_AddBuff",
    Camp = "Monster",
    GameplayTag = "Mon.Elite",
    ID = 20401,
    Vars = {Buff = 2010101}
  },
  [20511] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_DmgExchange.BP_AbyssGP_DmgExchange",
    Camp = "Player",
    ID = 20511,
    Vars = {
      DownRate = -0.5,
      DownTag = "Dot",
      UpRate = 0.5,
      UpTag = "Weapon"
    }
  },
  [20512] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Abyss/BP_AbyssGP_SkillTrigger.BP_AbyssGP_SkillTrigger",
    Camp = "Player",
    ID = 20512,
    Vars = {Buff = 2010512, TriggerProb = 1}
  },
  [30100] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Raid/BP_RaidGP_Common.BP_RaidGP_Common",
    Camp = "Monster",
    ID = 30100
  },
  [40101] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_1.BP_EventGP_Wys_1",
    Camp = "Player",
    ID = 40101
  },
  [40102] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_2.BP_EventGP_Wys_2",
    Camp = "Player",
    ID = 40102
  },
  [40103] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_3.BP_EventGP_Wys_3",
    Camp = "Player",
    ID = 40103
  },
  [40104] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/Event/BP_EventGP_Wys_4.BP_EventGP_Wys_4",
    Camp = "Player",
    ID = 40104
  },
  [30101001] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30101001.BP_Rou_Contract_30101001",
    Camp = "Player",
    ID = 30101001,
    Vars = {HealRate = "#1"}
  },
  [30101002] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30101002.BP_Rou_Contract_30101002",
    Camp = "Player",
    ID = 30101002
  },
  [30102001] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102001.BP_Rou_Contract_30102001",
    Camp = "Monster",
    ID = 30102001
  },
  [30102002] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102002.BP_Rou_Contract_30102002",
    Camp = "Monster",
    ID = 30102002
  },
  [30102003] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102003.BP_Rou_Contract_30102003",
    Camp = "Monster",
    ID = 30102003,
    Vars = {DamagedRate = "#1"}
  },
  [30102004] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30102004.BP_Rou_Contract_30102004",
    Camp = "Monster",
    ID = 30102004
  },
  [30103001] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30103001.BP_Rou_Contract_30103001",
    Camp = "Player",
    ID = 30103001,
    Vars = T.RT_1
  },
  [30103002] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30103002.BP_Rou_Contract_30103002",
    Camp = "Player",
    ID = 30103002,
    Vars = T.RT_1
  },
  [30103003] = {
    BPPath = "/Game/BluePrints/Combat/PassiveEffect/DesignerBP/RougeLike/Contract/BP_Rou_Contract_30103003.BP_Rou_Contract_30103003",
    Camp = "Player",
    ID = 30103003,
    Vars = T.RT_1
  }
})
