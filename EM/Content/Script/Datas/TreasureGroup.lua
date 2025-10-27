local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TreasureGroup", {
  [101] = {
    ActivateNeed = {11101, 11201},
    BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_TreasureGroup_1.T_Rouge_TreasureGroup_1",
    GroupEffectDesc = "RLTreasureGroup_Desc_101",
    GroupId = 101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TreasureGroup_1_1.T_Rouge_TreasureGroup_1_1",
    Name = "RLTreasureGroup_Name_101"
  },
  [102] = {
    ActivateNeed = {
      12101,
      12102,
      12201
    },
    BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_TreasureGroup_2.T_Rouge_TreasureGroup_2",
    GroupEffectDesc = "RLTreasureGroup_Desc_102",
    GroupId = 102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TreasureGroup_2_1.T_Rouge_TreasureGroup_2_1",
    Name = "RLTreasureGroup_Name_102"
  },
  [103] = {
    ActivateNeed = {
      13101,
      13102,
      13103,
      13104
    },
    BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_TreasureGroup_3.T_Rouge_TreasureGroup_3",
    GroupEffectDesc = "RLTreasureGroup_Desc_103",
    GroupId = 103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TreasureGroup_3_1.T_Rouge_TreasureGroup_3_1",
    Name = "RLTreasureGroup_Name_103"
  },
  [104] = {
    ActivateNeed = {
      14101,
      14201,
      14202,
      14301
    },
    BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_TreasureGroup_4.T_Rouge_TreasureGroup_4",
    GroupEffectDesc = "RLTreasureGroup_Desc_104",
    GroupId = 104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TreasureGroup_4_1.T_Rouge_TreasureGroup_4_1",
    Name = "RLTreasureGroup_Name_104"
  },
  [105] = {
    ActivateNeed = {15101, 15201},
    BigIcon = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_TreasureGroup_5.T_Rouge_TreasureGroup_5",
    GroupEffectDesc = "RLTreasureGroup_Desc_105",
    GroupId = 105,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_TreasureGroup_5_1.T_Rouge_TreasureGroup_5_1",
    Name = "RLTreasureGroup_Name_105"
  }
})
