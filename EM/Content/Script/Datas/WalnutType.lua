local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WalnutType", {
  [1] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Icon_Random_Box_01.T_Icon_Random_Box_01",
    IpDes = "UI_Walnut_Des",
    Name = "UI_Walnut_Type_Name_1",
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Fashion_Head.T_Tab_Fashion_Head",
    TypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Avatar.T_Walnut_Avatar",
    WalnutType = 1
  },
  [2] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Icon_Random_Box_02.T_Icon_Random_Box_02",
    IpDes = "UI_Walnut_Des",
    Name = "UI_Walnut_Type_Name_2",
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Weapon.T_Tab_Weapon",
    TypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Weapon.T_Walnut_Weapon",
    WalnutType = 2
  },
  [3] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Icon_Random_Box_03.T_Icon_Random_Box_03",
    IpDes = "UI_Walnut_Des",
    Name = "UI_Walnut_Type_Name_3",
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Mod.T_Tab_Mod",
    TypeIcon = "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Mod.T_Walnut_Mod",
    WalnutType = 3
  }
})
