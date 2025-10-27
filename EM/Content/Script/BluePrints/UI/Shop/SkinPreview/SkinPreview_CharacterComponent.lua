local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = {}

function M:UpdateSkinParams(SkinInfo)
  local SkinData = DataMgr.Skin[SkinInfo.TypeId]
  if not SkinData then
    return nil
  end
  local CharInfo = DataMgr.Char[SkinData.CharId]
  if not CharInfo then
    return nil
  end
  local Params = {
    Type = "Char",
    SkinId = SkinData.SkinId
  }
  return Params
end

function M:UpdateCharSkinDescription(SkinInfo)
  local SkinData = DataMgr.Skin[SkinInfo.TypeId]
  if not SkinData then
    return
  end
  local CharInfo = DataMgr.Char[SkinData.CharId]
  if not CharInfo then
    return
  end
  self.Text_CharName:SetText(GText(CharInfo.CharName))
  self.Text_SkinName:SetText(GText(SkinData.SkinName))
  self.Text_Info:SetText(GText(SkinData.SkinDescribe))
  self.Tag_Quality:Init(SkinData.Rarity)
  self:UpdateSkinNameFontByRarity(SkinData.Rarity)
  self:HideZoomKey(false)
  self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.HorizontalBox_Color:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Tab_Change:SetVisibility(ESlateVisibility.Collapsed)
  local ElementType = DataMgr.BattleChar[SkinData.CharId].Attribute
  if ElementType then
    local IconName = "Armory_" .. ElementType
    local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
    self.Image_Element:SetBrushResourceObject(AttributeIcon)
    self.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.Avatar:CheckCharEnough({
    [SkinData.CharId] = 1
  }) then
    self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    self.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:UpdateCharAccessoryParams(SkinInfo, Avatar)
  local AccessoryData = DataMgr.CharAccessory[SkinInfo.TypeId]
  if not AccessoryData then
    DebugPrint("AccessoryData is nil, TypeId:", SkinInfo.TypeId)
    return nil
  end
  local Char = Avatar.Chars[Avatar.CurrentChar]
  local Params = {
    Type = "Char",
    SkinId = Char.AppearanceSuits[Char.CurrentAppearanceIndex].SkinId,
    AccessoryId = AccessoryData.AccessoryId,
    AccessoryType = AccessoryData.AccessoryType
  }
  return Params
end

function M:UpdateCharAccessoryDescription(SkinInfo)
  local AccessoryData = DataMgr.CharAccessory[SkinInfo.TypeId]
  if not AccessoryData then
    return
  end
  self.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap[AccessoryData.AccessoryType]))
  self.Text_SkinName:SetText(GText(AccessoryData.Name))
  self.Text_Info:SetText(GText(AccessoryData.Des))
  self.Tag_Quality:Init(AccessoryData.Rarity)
  self:UpdateSkinNameFontByRarity(AccessoryData.Rarity)
  self:HideZoomKey(false)
  self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.HorizontalBox_Color:SetVisibility(ESlateVisibility.Collapsed)
  self.Tab_Change:SetVisibility(ESlateVisibility.Collapsed)
  local AccessoryIconPath = ArmoryUtils:GetCharNoneAccessoryIconPaths()[AccessoryData.AccessoryType]
  if AccessoryIconPath then
    local AccessoryIcon = LoadObject(AccessoryIconPath)
    self.Image_Element:SetBrushResourceObject(AccessoryIcon)
    self.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:UpdateCharGestureParams(SkinInfo, Avatar)
  local Char = Avatar.Chars[Avatar.CurrentChar]
  local Params = {
    Type = "Char",
    SkinId = Char.AppearanceSuits[Char.CurrentAppearanceIndex].SkinId
  }
  return Params
end

function M:UpdateCharGestureDescription(SkinInfo)
  local GestureData = DataMgr.Resource[SkinInfo.TypeId]
  if not GestureData or GestureData.ResourceSType ~= "GestureItem" then
    return
  end
  self.Text_CharName:SetText(GText("UI_Preview_GestureItem"))
  self.Text_SkinName:SetText(GText(GestureData.ResourceName))
  self.Text_Info:SetText(GText(GestureData.DetailDes))
  self.Tag_Quality:Init(GestureData.Rarity)
  self:UpdateSkinNameFontByRarity(GestureData.Rarity)
  self:HideZoomKey(false)
  self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.HorizontalBox_Color:SetVisibility(ESlateVisibility.Collapsed)
  self.Tab_Change:SetVisibility(ESlateVisibility.Collapsed)
  self.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
end

return M
