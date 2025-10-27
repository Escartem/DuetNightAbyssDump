local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PersonalUniqueDetails", {
  Collection_Char = {
    DataType = "Int,Percent",
    Des = "UI_Armory_Char",
    Event = "Collection_Char",
    Sort = 1
  },
  Collection_CharAccessory = {
    DataType = "Int,Percent",
    Des = "UI_Char_Accessory",
    Event = "Collection_CharAccessory",
    Sort = 6
  },
  Collection_Melee = {
    DataType = "Int,Percent",
    Des = "UI_Armory_Meleeweapon",
    Event = "Collection_Melee",
    Sort = 2
  },
  Collection_Mod = {
    DataType = "Int,Percent",
    Des = "UI_Armory_Mod",
    Event = "Collection_Mod",
    Sort = 8
  },
  Collection_Pet = {
    DataType = "Int,Percent",
    Des = "MAIN_UI_PET",
    Event = "Collection_Pet",
    Sort = 9
  },
  Collection_Range = {
    DataType = "Int,Percent",
    Des = "UI_Armory_Longrange",
    Event = "Collection_Range",
    Sort = 3
  },
  Collection_Skin = {
    DataType = "Int,Percent",
    Des = "UI_Char_Skin",
    Event = "Collection_Skin",
    Sort = 4
  },
  Collection_WeaponAccessory = {
    DataType = "Int,Percent",
    Des = "UI_Weapon_Accessory",
    Event = "Collection_WeaponAccessory",
    Sort = 7
  },
  Collection_WeaponSkin = {
    DataType = "Int,Percent",
    Des = "UI_Weapon_Skin",
    Event = "Collection_WeaponSkin",
    Sort = 5
  }
})
