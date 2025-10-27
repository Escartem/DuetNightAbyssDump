local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModGuideBookArchiveTab", {
  [1] = {
    Name = "UI_Armory_Char",
    ReddotNode = "ModArchive_Archive_Char",
    TabId = 1
  },
  [2] = {
    Name = "UI_BAG_Meleeweapon",
    ReddotNode = "ModArchive_Archive_Melee",
    TabId = 2
  },
  [3] = {
    Name = "UI_BAG_Longrange",
    ReddotNode = "ModArchive_Archive_Range",
    TabId = 3
  },
  [4] = {
    Name = "UI_Armory_MeleeweaponUltra",
    ReddotNode = "ModArchive_Archive_MeleeUltra",
    TabId = 4
  },
  [5] = {
    Name = "UI_Armory_LongrangeUltra",
    ReddotNode = "ModArchive_Archive_RangeUltra",
    TabId = 5
  }
})
