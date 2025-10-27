local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeContract", {
  [101] = {
    Desc = "RLContract_Desc_101",
    DescValues = {
      [1] = "$math.ceil(#GlobalPassiveData[30101001].Vars.HealRate*100)$%"
    },
    GlobalPassiveId = 30101001,
    HeatValue = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Char_HealDown.T_Rou_Contract_Char_HealDown",
    Id = 101,
    MaxLevel = 5,
    Name = "RLContract_Name_101"
  },
  [102] = {
    Desc = "RLContract_Desc_102",
    DescValues = {
      [1] = "$math.ceil(-#Buff[30101002].AddAttrs[1].Rate*100)$%"
    },
    GlobalPassiveId = 30101002,
    HeatValue = 2,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Char_SpDown.T_Rou_Contract_Char_SpDown",
    Id = 102,
    MaxLevel = 5,
    Name = "RLContract_Name_102"
  },
  [103] = {
    Desc = "RLContract_Desc_103",
    DescValues = {
      [1] = "$math.ceil(#Buff[30102001].AddAttrs[1].Rate*100)$%"
    },
    GlobalPassiveId = 30102001,
    HeatValue = 2,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mon_HpUp.T_Rou_Contract_Mon_HpUp",
    Id = 103,
    MaxLevel = 5,
    Name = "RLContract_Name_103"
  },
  [104] = {
    Desc = "RLContract_Desc_104",
    DescValues = {
      [1] = "$math.ceil(#Buff[30102002].AddAttrs[1].Rate*100)$%"
    },
    GlobalPassiveId = 30102002,
    HeatValue = 2,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mon__AtkUp.T_Rou_Contract_Mon__AtkUp",
    Id = 104,
    MaxLevel = 5,
    Name = "RLContract_Name_104"
  },
  [105] = {
    Desc = "RLContract_Desc_105",
    DescValues = {
      [1] = "$math.ceil(#GlobalPassiveData[30102003].Vars.DamagedRate*100)$%"
    },
    GlobalPassiveId = 30102003,
    HeatValue = 2,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mon_HpUp.T_Rou_Contract_Mon_HpUp",
    Id = 105,
    MaxLevel = 5,
    Name = "RLContract_Name_105"
  },
  [106] = {
    Desc = "RLContract_Desc_106",
    ExplanationId = {
      "Term_Rou_Contract_106_Blast"
    },
    GlobalPassiveId = 30102004,
    HeatValue = 3,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mon_Explode.T_Rou_Contract_Mon_Explode",
    Id = 106,
    MaxLevel = 1,
    Name = "RLContract_Name_106"
  },
  [107] = {
    Desc = "RLContract_Desc_107",
    DescValues = {
      [1] = "$#GlobalPassiveData[30103001].Vars.Count$"
    },
    GlobalPassiveId = 30103001,
    HeatValue = 5,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Room_ExtraStrong.T_Rou_Contract_Room_ExtraStrong",
    Id = 107,
    MaxLevel = 3,
    Name = "RLContract_Name_107",
    RoomType = {1, 6},
    UnitId = {
      6001011,
      6001012,
      6001014,
      6002015,
      6001016,
      6001017,
      6001018,
      6001019,
      6001020,
      6001021,
      6002022,
      6001023,
      6001024,
      7001011,
      7002012,
      7002014,
      7001015,
      7001016,
      7001017,
      7001018,
      7001019,
      7002020,
      7001021,
      7001022,
      7001023,
      7001024
    },
    UnitNum = {
      1,
      2,
      3
    },
    UnitType = "Monster"
  },
  [108] = {
    Desc = "RLContract_Desc_108",
    DescValues = {
      [1] = "$#GlobalPassiveData[30103002].Vars.Count$"
    },
    GlobalPassiveId = 30103002,
    HeatValue = 3,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Room_ExtraElite.T_Rou_Contract_Room_ExtraElite",
    Id = 108,
    MaxLevel = 2,
    Name = "RLContract_Name_108",
    RoomType = {2},
    UnitId = {
      9901051,
      9901052,
      9901053
    },
    UnitNum = {1, 2},
    UnitType = "Monster"
  },
  [109] = {
    Desc = "RLContract_Desc_109",
    DescValues = {
      [1] = "$#GlobalPassiveData[30103003].Vars.Count$"
    },
    GlobalPassiveId = 30103003,
    HeatValue = 1,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Room_ExtraMech.T_Rou_Contract_Room_ExtraMech",
    Id = 109,
    MaxLevel = 1,
    Name = "RLContract_Name_109",
    RoomType = {
      1,
      2,
      5,
      6
    },
    UnitId = {39002, 39004},
    UnitNum = {1},
    UnitType = "Mechanism"
  },
  [110] = {
    Desc = "RLContract_Desc_110",
    HeatValue = 10,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mechanics_CostUp.T_Rou_Contract_Mechanics_CostUp",
    Id = 110,
    MaxLevel = 1,
    Name = "RLContract_Name_110",
    ServerBuild = {
      [1] = {12}
    }
  },
  [111] = {
    Desc = "RLContract_Desc_111",
    HeatValue = 5,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mechanics_LessChoice.T_Rou_Contract_Mechanics_LessChoice",
    Id = 111,
    MaxLevel = 1,
    Name = "RLContract_Name_111",
    ServerBuild = {
      [1] = {13}
    }
  },
  [112] = {
    Desc = "RLContract_Desc_112",
    HeatValue = 15,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rou_Contract_Mechanics_RandomChoice.T_Rou_Contract_Mechanics_RandomChoice",
    Id = 112,
    MaxLevel = 1,
    Name = "RLContract_Name_112",
    ServerBuild = {
      [1] = {14}
    }
  }
})
