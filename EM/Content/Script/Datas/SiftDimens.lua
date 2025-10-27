local T = {}
T.RT_1 = {"0", "1"}
T.RT_2 = {
  "1",
  "2",
  "3",
  "4",
  "5"
}
T.RT_3 = {"Rarity"}
T.RT_4 = {
  "WeaponRarity"
}
T.RT_5 = {"WeaponTag"}
T.RT_6 = {
  "Tag_Hp",
  "Tag_DEF",
  "Tag_ES",
  "Tag_Dmg",
  "Tag_DmgReducion",
  "Tag_ATK",
  "Tag_ATK_Attr",
  "Tag_CRI",
  "Tag_CRD",
  "Tag_SP",
  "Tag_SPReduce",
  "Tag_SkillRange",
  "Tag_SkillSustain",
  "Tag_SkillEfficiency",
  "Tag_SkillIntensity",
  "Tag_StrongValue",
  "Tag_EnmityValue",
  "Tag_BonusDmg",
  "Tag_MoveSpeed",
  "Tag_ModEnhance",
  "Tag_Combo",
  "Tag_AttackSpeed",
  "Tag_HeavyAttack",
  "Tag_FallAttack",
  "Tag_SlideAttack",
  "Tag_AttackSpeed_Reload",
  "Tag_AttackRange",
  "Tag_AttackRange_Bullet",
  "Tag_TriggerProbability",
  "Tag_MultiShoot",
  "Tag_MagazineCapacity",
  "Tag_BulletMax",
  "Tag_BulletConver",
  "Tag_AtkMode",
  "Tag_SpecialEffect",
  "Tag_Stackable"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SiftDimens", {
  [1] = {
    HasSelectAll = false,
    Id = 1,
    SelectionDatas = T.RT_1,
    SelectionField = {"Level"},
    SelectionText = {
      "ModFilter_HasLeveledUp",
      "ModFilter_NotLeveledUp"
    },
    Title = "ModFilter_SubTitle_IsLeveledUp"
  },
  [2] = {
    HasSelectAll = true,
    Id = 2,
    SelectionDatas = T.RT_2,
    SelectionField = T.RT_3,
    SelectionText = {
      "ModFilter_Rarity1",
      "ModFilter_Rarity2",
      "ModFilter_Rarity3",
      "ModFilter_Rarity4",
      "ModFilter_Rarity5"
    },
    Title = "ModFilter_SubTitle_Rarity"
  },
  [3] = {
    HasSelectAll = true,
    Id = 3,
    SelectionDatas = T.RT_6,
    SelectionField = {"FilterTag"},
    SelectionText = T.RT_6,
    Title = "ModFilter_SubTitle_Attr"
  },
  [4] = {
    HasSelectAll = true,
    Id = 4,
    SelectionDatas = {
      "MOD_Type_Name_Phoenix01",
      "MOD_Type_Name_Pan01",
      "MOD_Type_Name_Siren01",
      "MOD_Type_Name_Sphinx01",
      "MOD_Type_Name_Griffin01",
      "MOD_Type_Name_Typhon01",
      "MOD_Type_Name_Mephisto01",
      "MOD_Type_Name_Anubis01",
      "MOD_Type_Name_Bahamut01",
      "MOD_Type_Name_Ifrit01",
      "MOD_Type_Name_Summanus01",
      "MOD_Type_Name_Hastur01",
      "MOD_Type_Name_Yatagarasu01",
      "MOD_Type_Name_Cerberus01",
      "MOD_Type_Name_Jormungand01",
      "MOD_Type_Name_Fenrir01",
      "MOD_Type_Name_Lilith01",
      "MOD_Type_Name_FeatheredSnake01",
      "MOD_Type_Name_Fafnir01",
      "MOD_Type_Name_Cerberus02",
      "MOD_Type_Name_Lilith02"
    },
    SelectionField = {"TypeName"},
    SelectionText = {
      "MOD_Tag_Type_Name_Phoenix01",
      "MOD_Tag_Type_Name_Pan01",
      "MOD_Tag_Type_Name_Siren01",
      "MOD_Tag_Type_Name_Sphinx01",
      "MOD_Tag_Type_Name_Griffin01",
      "MOD_Tag_Type_Name_Typhon01",
      "MOD_Tag_Type_Name_Mephisto01",
      "MOD_Tag_Type_Name_Anubis01",
      "MOD_Tag_Type_Name_Bahamut01",
      "MOD_Tag_Type_Name_Ifrit01",
      "MOD_Tag_Type_Name_Summanus01",
      "MOD_Tag_Type_Name_Hastur01",
      "MOD_Tag_Type_Name_Yatagarasu01",
      "MOD_Tag_Type_Name_Cerberus01",
      "MOD_Tag_Type_Name_Jormungand01",
      "MOD_Tag_Type_Name_Fenrir01",
      "MOD_Tag_Type_Name_Lilith01",
      "MOD_Tag_Type_Name_FeatheredSnake01",
      "MOD_Tag_Type_Name_Fafnir01",
      "MOD_Tag_Type_Name_Cerberus02",
      "MOD_Tag_Type_Name_Lilith02"
    },
    Title = "ModFilter_SubTitle_TypeName"
  },
  [5] = {
    HasSelectAll = false,
    IconPaths = {
      "nil",
      "/Game/UI/Texture/Static/Atlas/Battle/T_Battle_Invincible.T_Battle_Invincible"
    },
    Id = 5,
    SelectionDatas = T.RT_1,
    SelectionField = {"bAura"},
    SelectionText = {
      "ModFilter_NotSlot9",
      "ModFilter_IsSlot9"
    },
    Title = "ModFilter_SubTitle_SlotType"
  },
  [100101] = {
    HasSelectAll = true,
    Id = 100101,
    SelectionDatas = T.RT_2,
    SelectionField = T.RT_3,
    SelectionText = {
      "BackpackResource_Rarity1",
      "BackpackResource_Rarity2",
      "BackpackResource_Rarity3",
      "BackpackResource_Rarity4",
      "BackpackResource_Rarity5"
    },
    Title = "BackpackResource_SubTitle_Rarity"
  },
  [100301] = {
    HasSelectAll = true,
    Id = 100301,
    SelectionDatas = T.RT_2,
    SelectionField = T.RT_4,
    SelectionText = {
      "BackpackMeele_Rarity1",
      "BackpackMeele_Rarity2",
      "BackpackMeele_Rarity3",
      "BackpackMeele_Rarity4",
      "BackpackMeele_Rarity5"
    },
    Title = "BackpackMeele_SubTitle_Rarity"
  },
  [100302] = {
    HasSelectAll = true,
    Id = 100302,
    SelectionDatas = {
      "Sword",
      "Swordwhip",
      "Polearm",
      "Claymore",
      "Katana",
      "Dualblade"
    },
    SelectionField = T.RT_5,
    SelectionText = {
      "WeaponType_Sword",
      "WeaponType_Swordwhip",
      "WeaponType_Polearm",
      "WeaponType_Claymore",
      "WeaponType_Katana",
      "WeaponType_Dualblade"
    },
    Title = "BackpackMeele_SubTitle_WeaponTag"
  },
  [100401] = {
    HasSelectAll = true,
    Id = 100401,
    SelectionDatas = T.RT_2,
    SelectionField = T.RT_4,
    SelectionText = {
      "BackpackRanged_Rarity1",
      "BackpackRanged_Rarity2",
      "BackpackRanged_Rarity3",
      "BackpackRanged_Rarity4",
      "BackpackRanged_Rarity5"
    },
    Title = "BackpackRanged_SubTitle_Rarity"
  },
  [100402] = {
    HasSelectAll = true,
    Id = 100402,
    SelectionDatas = {
      "Crossbow",
      "Cannon",
      "Shotgun",
      "Machinegun",
      "Bow",
      "Pistol"
    },
    SelectionField = T.RT_5,
    SelectionText = {
      "WeaponType_Crossbow",
      "WeaponType_Cannon",
      "WeaponType_Shotgun",
      "WeaponType_Machinegun",
      "WeaponType_Bow",
      "WeaponType_Pistol"
    },
    Title = "BackpackRanged_SubTitle_WeaponTag"
  },
  [100601] = {
    HasSelectAll = true,
    Id = 100601,
    SelectionDatas = {
      "4",
      "3",
      "2",
      "1"
    },
    SelectionField = {
      "PetEntryNum"
    },
    SelectionText = {
      "Four",
      "Three",
      "Two",
      "One"
    },
    Title = "Pet_Filter_Title1"
  },
  [100602] = {
    HasSelectAll = true,
    Id = 100602,
    SelectionDatas = {"2", "1"},
    SelectionField = {"PetType"},
    SelectionText = {"Pet_Type2", "Pet_Type1"},
    Title = "Pet_Filter_Title2"
  },
  [100603] = {
    HasSelectAll = true,
    Id = 100603,
    SelectionDatas = {
      "2",
      "3",
      "4",
      "5"
    },
    SelectionField = T.RT_3,
    SelectionText = {
      "ModFilter_Rarity2",
      "ModFilter_Rarity3",
      "ModFilter_Rarity4",
      "ModFilter_Rarity5"
    },
    Title = "Pet_Filter_Title3"
  },
  [100604] = {
    HasSelectAll = true,
    Id = 100604,
    SelectionDatas = {
      "1001",
      "1002",
      "1003",
      "1004",
      "1005",
      "1006",
      "1007",
      "1008",
      "1009",
      "1010",
      "1011",
      "1012",
      "1013",
      "1014",
      "1015",
      "1016"
    },
    SelectionField = {"PetEntry"},
    SelectionText = {
      "UI_PetEntry_Title01",
      "UI_PetEntry_Title02",
      "UI_PetEntry_Title03",
      "UI_PetEntry_Title04",
      "UI_PetEntry_Title05",
      "UI_PetEntry_Title06",
      "UI_PetEntry_Title07",
      "UI_PetEntry_Title08",
      "UI_PetEntry_Title09",
      "UI_PetEntry_Title10",
      "UI_PetEntry_Title11",
      "UI_PetEntry_Title12",
      "UI_PetEntry_Title13",
      "UI_PetEntry_Title14",
      "UI_PetEntry_Title15",
      "UI_PetEntry_Title16"
    },
    Title = "Pet_Filter_Title4"
  }
})
