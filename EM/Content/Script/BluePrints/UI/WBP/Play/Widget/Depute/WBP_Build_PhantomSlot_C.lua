require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetCharIcon(IconPath, ...)
  self.CharIconPath = IconPath
  self:PlayAnimation(self.Normal)
  self.WidgetSwitcher_Head:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.WidgetSwitcher_Head:SetActiveWidgetIndex(0)
  self.Img_Avatar:SetBrushResourceObject(LoadObject(IconPath))
end

function M:SetWeaponIcon(IconPath, ...)
  self:PlayAnimation(self.Normal)
  self.WidgetSwitcher_Head:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.WidgetSwitcher_Head:SetActiveWidgetIndex(1)
  local IconDynaMaterial = self.Img_Weapon:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(IconPath))
  end
end

function M:SetEmptyIcon(IconPath, ...)
  self:StopAllAnimations()
  local Type = (...)
  if "Phantom" == Type then
    self.WidgetSwitcher_Head:SetActiveWidgetIndex(2)
  elseif "Weapon" == Type then
    self.WidgetSwitcher_Head:SetActiveWidgetIndex(3)
  end
  self:PlayAnimation(self.Normal)
end

function M:SetDeficiencyIcon()
  self:StopAllAnimations()
  self:PlayAnimation(self.FlashRed)
end

function M:CharIconGray()
  self.WidgetSwitcher_Head:SetActiveWidgetIndex(4)
  local IconDynaMaterial = self.Head_Phantom_Lack:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("MainTex", LoadObject(self.CharIconPath))
  end
end

return M
