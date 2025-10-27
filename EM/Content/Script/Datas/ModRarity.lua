local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModRarity", {
  [1] = {
    LRSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Line_White.T_Armory_Line_White'",
    MidSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Circle_White.T_Armory_Circle_White'",
    Rarity = 1
  },
  [2] = {
    LRSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Line_Green.T_Armory_Line_Green'",
    MidSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Circle_Green.T_Armory_Circle_Green'",
    Rarity = 2
  },
  [3] = {
    LRSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Line_Blue.T_Armory_Line_Blue'",
    MidSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Circle_Blue.T_Armory_Circle_Blue'",
    Rarity = 3
  },
  [4] = {
    LRSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Line_Violet.T_Armory_Line_Violet'",
    MidSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Circle_Violet.T_Armory_Circle_Violet'",
    Rarity = 4
  },
  [5] = {
    LRSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Line_Yellow.T_Armory_Line_Yellow'",
    MidSlotBg = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Circle_Yellow.T_Armory_Circle_Yellow'",
    Rarity = 5
  }
})
