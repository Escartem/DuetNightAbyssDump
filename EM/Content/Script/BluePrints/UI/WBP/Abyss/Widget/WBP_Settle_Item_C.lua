require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetIcon(Icon)
  if not Icon then
    DebugPrint("thy   \233\129\147\229\133\183\230\161\134\231\188\186\229\176\145Icon")
    return
  end
  local IconDynaMaterial = self.Icon_Item:GetDynamicMaterial()
  if IsValid(IconDynaMaterial) then
    if not IsValid(Icon) then
      DebugPrint("thy     \232\175\183\229\175\185\229\186\148\231\179\187\231\187\159\230\163\128\230\159\165Icon\230\152\175\229\144\166\230\173\163\231\161\174")
    else
      IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    end
  else
    DebugPrint("thy    IconDynaMaterial\228\184\141\229\144\136\230\179\149")
  end
end

function M:OnListItemObjectSet(Content)
  self.Index = Content.Index
  self.Type = Content.Type
  if not Content.Icon or Content.Icon == "" then
    self.Icon_Item:SetVisibility(ESlateVisibility.Collapsed)
    self.Icon_Empty_Melee:SetVisibility(ESlateVisibility.Visible)
    self:SetEmptyIcon()
  else
    self.Icon_Item:SetVisibility(ESlateVisibility.Visibie)
    self.Icon_Empty_Melee:SetVisibility(ESlateVisibility.Collapsed)
    self:SetIcon(Content.Icon)
  end
end

function M:SetEmptyIcon()
  local IconDynaMaterial = self.Icon_Empty_Melee:GetDynamicMaterial()
  local EmptyIcon
  if 1 == self.Index or 3 == self.Index then
    EmptyIcon = self.Empty_PhantomHead
  else
    EmptyIcon = self.Empty_PhantomWeapon
  end
  self.Icon_Empty_Melee:SetBrush(EmptyIcon)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.Type == "Role" then
    AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_role", nil, nil)
  elseif self.Type == "Weapon" then
    AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_weapon", nil, nil)
  elseif self.Type == "Pet" then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_select_pet", nil, nil)
  else
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  end
end

return M
