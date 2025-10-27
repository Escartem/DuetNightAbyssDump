require("UnLua")
local G = Class("BluePrints.UI.BP_UIState_C")

function G:Construct()
end

function G:Init(TargetType, TargetId)
  local Rarity, TargetName, TargetProperty
  if "Char" == TargetType then
    Rarity = DataMgr.Char[TargetId].CharRarity
    TargetName = DataMgr.Char[TargetId].CharName
    TargetProperty = DataMgr.BattleChar[TargetId].Attribute
  elseif "Weapon" == TargetType then
    Rarity = DataMgr.Weapon[TargetId].WeaponRarity
    TargetName = DataMgr.Weapon[TargetId].WeaponName
    TargetProperty = DataMgr.BattleWeapon[TargetId].Attribute
  end
  self.Role_Name:SetText(GText(TargetName))
  for i = 1, DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue do
    self["Star0" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for i = 1, Rarity do
    self["Star0" .. i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if nil == TargetProperty then
    self.Property:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Property:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local IconName = "Armory_" .. TargetProperty
    local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
    self.Property:SetBrushResourceObject(AttributeIcon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Default.T_Armory_Default"))
  end
end

return G
