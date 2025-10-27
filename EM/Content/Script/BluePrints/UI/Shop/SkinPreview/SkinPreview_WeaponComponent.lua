local M = {}

function M:UpdateWeaponSkinParams(SkinInfo)
  local WeaponSkinData = DataMgr.WeaponSkin[SkinInfo.TypeId]
  if not WeaponSkinData then
    DebugPrint("WeaponSkinData is nil, TypeId:", SkinInfo.TypeId)
    return nil
  end
  local Params = {
    Type = "Weapon",
    SkinId = WeaponSkinData.SkinID
  }
  return Params
end

function M:UpdateWeaponSkinDescription(SkinInfo)
  local WeaponSkinData = DataMgr.WeaponSkin[SkinInfo.TypeId]
  if not WeaponSkinData then
    return
  end
  self.Text_SkinName:SetText(GText(WeaponSkinData.Name))
  self.Text_Info:SetText(GText(WeaponSkinData.Dec))
  self.Tag_Quality:Init(WeaponSkinData.Rarity)
  self:UpdateSkinNameFontByRarity(WeaponSkinData.Rarity)
  self:HideZoomKey(true)
  self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.HorizontalBox_Color:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Tab_Change:SetVisibility(ESlateVisibility.Collapsed)
  local WeaponTypeInfo = DataMgr.WeaponTypeContrast[WeaponSkinData.ApplicationType]
  if not WeaponTypeInfo then
    return
  end
  self.Text_CharName:SetText(string.format(GText("UI_SkinPreview_WeaponType"), GText(WeaponTypeInfo.WeaponTagTextmap)))
  if WeaponTypeInfo.Icon then
    local TagIcon = LoadObject(WeaponTypeInfo.Icon)
    self.Image_Element:SetBrushResourceObject(TagIcon)
    self.Image_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateWeaponAccessoryParams(SkinInfo, Avatar)
  local WeaponAccessoryData = DataMgr.WeaponAccessory[SkinInfo.TypeId]
  if not WeaponAccessoryData then
    DebugPrint("WeaponAccessoryData is nil, TypeId:", SkinInfo.TypeId)
    return nil
  end
  local MeleeWeaponInfo = Avatar.Weapons[Avatar.MeleeWeapon]
  local Params = {
    Type = "Weapon",
    AccessoryId = WeaponAccessoryData.WeaponAccessoryId,
    AccessoryType = WeaponAccessoryData.AccessoryType
  }
  Params.SkinId = nil
  if MeleeWeaponInfo then
    local currentSkinId = MeleeWeaponInfo:GetCurrentSkin().SkinId
    if currentSkinId ~= MeleeWeaponInfo.WeaponId then
      Params.SkinId = currentSkinId
    end
  end
  return Params
end

function M:UpdateWeaponAccessoryDescription(SkinInfo)
  local WeaponAccessoryData = DataMgr.WeaponAccessory[SkinInfo.TypeId]
  if not WeaponAccessoryData then
    return
  end
  self.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap[SkinInfo.ItemType]))
  self.Text_SkinName:SetText(GText(WeaponAccessoryData.Name))
  self.Text_Info:SetText(GText(WeaponAccessoryData.Des))
  self.Tag_Quality:Init(WeaponAccessoryData.Rarity)
  self:UpdateSkinNameFontByRarity(WeaponAccessoryData.Rarity)
  self:HideZoomKey(true)
  self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  self.HorizontalBox_Color:SetVisibility(ESlateVisibility.Collapsed)
  self.Tab_Change:SetVisibility(ESlateVisibility.Visible)
end

return M
